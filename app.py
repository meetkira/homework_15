import sqlite3

from flask import Flask, jsonify
from utils import serialize_row
import requests

app = Flask(__name__)


# http://127.0.0.1:5000/A684346
@app.route("/<string:itemid>")
def search_by_id(itemid):
    """Поиск животного по id"""

    conn: sqlite3.Connection = app.config["db"]
    cursor = conn.cursor()
    cursor.execute(requests.SEARCH_BY_ID_REQUEST, (itemid,))
    row = cursor.fetchone()

    cursor.close()

    return jsonify(serialize_row(row))


if __name__ == "__main__":
    connection = sqlite3.connect('animal.db', check_same_thread=False)
    connection.row_factory = sqlite3.Row
    app.config["db"] = connection
    app.run()
