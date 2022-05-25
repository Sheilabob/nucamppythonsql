from flask import Blueprint
from ..models import Map, db

bp = Blueprint('maps', __name__, url_prefix='/maps')


@bp.route('', methods=['GET'])  # decorator takes path and list of HTTP verbs
def index():
    maps = Map.query.all()  # ORM performs SELECT query
    result = []
    for m in maps:
        result.append(m.serialize())  # build list of Tweets as dictionaries
    return jsonify(result)  # return JSON response
