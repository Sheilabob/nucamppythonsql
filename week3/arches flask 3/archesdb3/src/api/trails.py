from flask import Blueprint, jsonify, abort, request
from ..models import Map, Trail, db

bp = Blueprint('trails', __name__, url_prefix='/trails')


@bp.route('', methods=['GET'])  # decorator takes path and list of HTTP verbs
def index():
    trails = Trail.query.all()  # ORM performs SELECT query
    result = []
    for t in trails:
        result.append(t.serialize())  # build list of Tweets as dictionaries
    return jsonify(result)  # return JSON response
