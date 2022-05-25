import datetime
import simplejson
import decimal
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# Reference:
# https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/
# https://docs.sqlalchemy.org/en/14/core/metadata.html#sqlalchemy.schema.Column
# https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/#many-to-many-relationships


class Map(db.Model):
    __tablename__ = "maps"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(128), unique=True, nullable=False)
    location = db.Column(db.String(128))

    def __init__(self, name: str, location: str):
        self.name = name
        self.location = location

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'location': self.location
        }


class Trail(db.Model):
    __tablename__ = "trails"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(128), unique=True, nullable=False)
    difficulty_level = db.Column(db.String(256))
    map_id = db.Column(db.Integer, db.ForeignKey(
        "maps.id"), nullable=False, default=0)

    def __init__(self, name: str, difficulty_level: str, map_id: int):
        self.name = name
        self.difficulty_level = difficulty_level
        self.map_id = map_id

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'difficulty_level': self.difficulty_level,
            'map_id': self.map_id
        }


class Arch(db.Model):
    __tablename__ = "arches"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    gps_point_ew = db.Column(db.Numeric, nullable=False)
    gps_point_ns = db.Column(db.Numeric, nullable=False)
    size_gad = db.Column(db.Integer, nullable=False)
    size_lad = db.Column(db.Numeric)
    name = db.Column(db.String(128), unique=True, nullable=False)
    rating = db.Column(db.Integer)
    type = db.Column(db.String(128))
    trail_id = db.Column(db.Integer, db.ForeignKey("trails.id"))
    map_id = db.Column(db.Integer, db.ForeignKey("maps.id"))
    # picture_id = db.Column(
    #     db.Integer, db.ForeignKey("pictures.id"), unique=True)

    def __init__(self, gps_point_ew: str, gps_point_ns: str, size_gad: int, size_lad: str, name: str, rating: int, trail_id: int, map_id: int):
        self.gps_point_ew = gps_point_ew
        self.gps_point_ns = gps_point_ns
        self.size_gad = size_gad
        self.size_lad = size_lad
        self.name = name
        self.rating = rating
        self.trail_id = trail_id
        self.map_id = map_id

    def serialize(self):
        return {
            'id': self.id,
            'gps_point_ew': simplejson.dumps(decimal.Decimal(self.gps_point_ew)),
            'gps_point_ns': simplejson.dumps(decimal.Decimal(self.gps_point_ns)),
            'size_gad': self.size_gad,
            'size_lad': simplejson.dumps(decimal.Decimal(self.size_lad)),
            'name': self.name,
            'rating': self.rating,
            'trail_id': self.trail_id,
            'map_id': self.map_id
        }
