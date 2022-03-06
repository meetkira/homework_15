import sqlite3


def serialize_row(row: sqlite3.Row):
    """Сериализация данных"""

    return {key: row[key] for key in row.keys()}
