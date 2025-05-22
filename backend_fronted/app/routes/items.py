from fastapi import APIRouter, Depends, File, Form, UploadFile, HTTPException
from sqlalchemy.orm import Session
from .. import models, schemas
from ..database import get_db
from fastapi.responses import StreamingResponse
from io import BytesIO

router = APIRouter(prefix="/api/items", tags=["items"])

@router.post("/", response_model=schemas.Item)
async def create_item(
    name: str = Form(...),
    price: float = Form(...),
    image: UploadFile = File(...),
    db: Session = Depends(get_db)
):
    image_data = await image.read()

    db_item = models.Item(name=name, price=price, image=image_data)
    db.add(db_item)
    db.commit()
    db.refresh(db_item)

    return {
        "id": db_item.id,
        "name": db_item.name,
        "price": db_item.price,
        "image_url": f"/api/items/{db_item.id}/image"
    }

@router.get("/", response_model=list[schemas.Item])
def get_items(db: Session = Depends(get_db)):
    items = db.query(models.Item).all()
    return [
        {
            "id": item.id,
            "name": item.name,
            "price": item.price,
            "image_url": f"/api/items/{item.id}/image"
        }
        for item in items
    ]

@router.get("/{item_id}/image")
def get_image(item_id: int, db: Session = Depends(get_db)):
    item = db.query(models.Item).filter(models.Item.id == item_id).first()
    if not item or not item.image:
        raise HTTPException(status_code=404, detail="Image not found")

    return StreamingResponse(BytesIO(item.image), media_type="image/jpeg")
