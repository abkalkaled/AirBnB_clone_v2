#!/usr/bin/python3
""" State Module for HBNB project """

from models.base_model import BaseModel, Base
import models
from os import getenv
import sqlachemy
from sqlalchemy import Column, String
from sqlalchmey.orm import relationship


class Amenity(BaseModel):
    name = ""
     __tablename__ = "amenities"
    name = Column(String(128), nullable=False)
    place_amenities = relationship("Place", secondary=place_amenity)
