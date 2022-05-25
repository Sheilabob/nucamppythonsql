from flask import Blueprint, jsonify, abort, request
from ..models import BackgroundInfo, Arch, db

bp = Blueprint('background_infos', __name__, url_prefix='/background_infos')


@bp.route('', methods=['GET'])  # decorator takes path and list of HTTP verbs
def index():
    background_infos = BackgroundInfo.query.all()  # ORM performs SELECT query
    result = []
    for b in background_infos:
        result.append(b.serialize())  # build list of Tweets as dictionaries
    return jsonify(result)  # return JSON response
