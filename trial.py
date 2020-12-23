from utils import *


try:
    # Connect to the database
    connection = dbConnection()
    cur = connection.cursor()
    # name = "a"
    # email = "as"
    # password = "asdfa"
    # cur.execute(
    #     f"""
    #                 INSERT INTO Users (name,email,password)
    #                 VALUES('{name}','{email}','{password}')
    #                 """
    # )
    cur.execute("SET GLOBAL max_user_connections = 10;")
    print(cur.fetchall())

except Exception as error:
    print("Exception", error)
finally:
    connection.close()
