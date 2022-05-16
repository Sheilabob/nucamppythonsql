import datetime
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()
# Reference:
# https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/
# https://docs.sqlalchemy.org/en/14/core/metadata.html#sqlalchemy.schema.Column
# https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/#many-to-many-relationships


class Arch(db.Model):
    __tablename__ = 'arches'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    gps_point_ew = db.Column(db.Numeric, nullable=False)
    gps_point_ns = db.Column(db.Numeric, nullable=False)
    size_gad = db.Column(db.Integer, nullable=False)
    size_lad = db.Column(db.Numeric)
    name = db.Column(db.String(128), unique=True, nullable=False)
    rating = db.Column(db.Integer)
    type = db.Column(db.String(128))
    trail_id = db.Column(db.Integer, db.ForeignKey('trails.id'))
    map_id = db.Column(db.Integer, db.ForeignKey('maps.id'),
                       unique=True, nullable=False, default=0)
    picture_id = db.Column(
        db.Integer, db.ForeignKey('pictures.id'), unique=True)
    arches_bginfo_table = db.relationship(
        'BackgroundInfo', backref='arch', cascade="all, delete")

    def __init__(self, gps_point_ew: int, gps_point_ns: int, size_gad: int, size_lad: int, name: str, rating: int, type: str, trail_id: int, map_id: int, picture_id: int):
        self.gps_point_ew = gps_point_ew
        self.gps_point_ns = gps_point_ns
        self.size_gad = size_gad
        self.size_lad = size_lad
        self.name = name
        self.rating = rating
        self.type = type
        self.trail_id = trail_id
        self.map_id = map_id
        self.picture_id = picture_id

    def serialize(self):
        return {
            'id': self.id,
            'gps_point_ew': self.gps_point_ew,
            'gps_point_ns': self.gps_point_ns,
            'size_gad': self.size_gad,
            'size_lad': self.size_lad,
            'name': self.name,
            'rating': self.rating,
            'type': self.type,
            'trail_id': self.trail_id,
            'map_id': self.map_id,
            'picture_id': self.picture_id
        }


class Trail(db.Model):
    __tablename__ = 'trails'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(128), unique=True, nullable=False)
    difficulty_level = db.Column(db.String(256))
    map_id = db.Column(db.Integer, db.ForeignKey(
        'maps.id'), nullable=False, default=0)


class Map(db.Model):
    __tablename__ = 'maps'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(128), unique=True, nullable=False)
    location = db.Column(db.String(128))


class Report(db.Model):
    __tablename__ = 'reports'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    type = db.Column(db.String(128))
    author = db.Column(db.String(128), nullable=False)
    date = db.Column(db.DateTime, nullable=False,
                     default=datetime.datetime.utcnow)
    arch_id = db.Column(db.Integer, db.ForeignKey('arches.id'), nullable=False)


arches_bginfo_table = db.Table(
    'bginfo',
    db.Column(
        'arch_id', db.Integer,
        db.ForeignKey('arches.id'),
        primary_key=True
    ),

    db.Column(
        'bginfo_id', db.Integer,
        db.ForeignKey('background_info.id'),
        primary_key=True
    ),
)


class BackgroundInfo(db.Model):
    __tablename__ = 'background_info'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    original_reporter = db.Column(db.String(128))
    references_sources = db.Column(db.String(256))
    arches = db.relationship('Arch', secondary=arches_bginfo_table,
                             lazy='subquery', backref=db.backref('background_info', lazy=True))


class Picture(db.Model):
    __tablename__ = 'pictures'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    date = db.Column(db.DateTime)
    photographer = db.Column(db.String(128))
    link_to_db = db.Column(db.String(128), unique=True, nullable=False)
    arch_id = db.Column(db.Integer, db.ForeignKey('arches.id'), nullable=False)
