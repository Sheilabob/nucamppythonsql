from flask import Blueprint
from ..models import Arch, BackgroundInfo, db

bp = Blueprint('bg_info', __name__, url_prefix='/bg_info')


@bp.route('', methods=['GET'])  # decorator takes path and list of HTTP verbs
def index():
    bg_info = BackgroundInfo.query.all()  # ORM performs SELECT query
    result = []
    for b in bg_info:
        result.append(b.serialize())  # build list of Tweets as dictionaries
    return jsonify(result)  # return JSON response
