from sqlalchemy import Column, Integer, String, Float, LargeBinary
from .database import Base

class Item(Base):
    __tablename__ = "items"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(255), index=True, unique=True)
    price = Column(Float)
    image = Column(LargeBinary)