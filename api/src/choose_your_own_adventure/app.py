from typing import Optional

from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()


class Item(BaseModel):
    name: str
    description: Optional[str] = None
    price: float
    tax: Optional[float] = None


@app.get("/")
def read_root() -> dict[str, str]:
    return {"message": "Hello, World!"}


@app.post("/items/")
def create_item(item: Item) -> dict[str, Item]:
    return {"item": item}
