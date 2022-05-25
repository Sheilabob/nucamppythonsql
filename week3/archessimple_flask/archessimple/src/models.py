from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# Reference:
# https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/
# https://docs.sqlalchemy.org/en/14/core/metadata.html#sqlalchemy.schema.Column
# https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/#many-to-many-relationships

arches_background_infos_table = db.Table(
    'arches_background_infos',
    db.Column(
        'arch_id',
        db.Integer,
        db.ForeignKey('arches.id'),
        primary_key=True
    ),
    db.Column(
        'background_info_id',
        db.Integer,
        db.ForeignKey('background_infos.id'),
        primary_key=True
    )
)


class Arch(db.Model):
    __tablename__ = 'arches'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(128), unique=True, nullable=False)
    background_infos = db.relationship(
        'BackgroundInfo',
        secondary=arches_background_infos_table,
    )

    def __init__(self, name: str):
        self.name = name

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
        }


class BackgroundInfo(db.Model):
    __tablename__ = 'background_infos'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    original_reporter = db.Column(db.String(128))
    arches = db.relationship(
        'Arch',
        secondary=arches_background_infos_table,
    )

    def __init__(self, original_reporter: str):
        self.original_reporter = original_reporter

    def serialize(self):
        return {
            'id': self.id,
            'original_reporter': self.original_reporter,
        }
