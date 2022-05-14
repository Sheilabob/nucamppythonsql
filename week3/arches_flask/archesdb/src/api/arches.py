from flask import Blueprint, jsonify, abort, request
from ..models import Arch, Trail, Map, Report, BackgroundInfo, Picture, db

bp = Blueprint('arches', __name__, url_prefix='/arches')


@bp.route('', methods=['GET'])  # decorator takes path and list of HTTP verbs
def index():
    arches = Arch.query.all()  # ORM performs SELECT query
    result = []
    for a in arches:
        result.append(a.serialize())  # build list of Tweets as dictionaries
    return jsonify(result)  # return JSON response
