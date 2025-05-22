from pydantic import BaseModel
from typing import Optional

class ItemBase(BaseModel):
    name: str
    price: float

class ItemCreate(ItemBase):
    pass

class Item(ItemBase):
    id: int
    image_url: Optional[str] = None

    class Config:
        from_attributes = True