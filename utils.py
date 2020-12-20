import pymysql.cursors


def dbConnection():
    connection = pymysql.connect(
        host="localhost",
        user="root",
        password="akshay00000",
        db="mini_project",
        charset="utf8mb4",
        autocommit=True,
    )
    return connection