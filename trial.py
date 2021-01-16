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
    # cur.execute(
    #     f"SELECT * FROM Items LEFT JOIN (SELECT * FROM Cart WHERE customerId = (SELECT id FROM Users WHERE email = 'vakshaynayak@gmail.co') ) AS T ON Items.id=T.itemId ;")
    # print(cur.fetchall())
    # print(len(cur.fetchall()))
    # cur.execute(
    #     f"SELECT * from Cart WHERE customerId = (SELECT id FROM Users WHERE email = 'vakshaynayak@gmail.co')")
    # print(cur.fetchall())
    # cur.execute(
    #     f"SELECT * from Cart WHERE customerId = (SELECT id FROM Users WHERE email = 'vakshaynayak@gmail.co')")
    # print(cur.fetchall())
    # cur.execute(
    #     f"""SELECT * FROM Cart
    #     LEFT JOIN Items
    #     ON Cart.itemId = Items.id
    #     WHERE Cart.customerId = (SELECT id FROM Users WHERE email = 'vakshaynayak@gmail.co')
    #     """
    # )
    # cur.execute(
    #     f"""
    #     INSERT INTO Orders (customerId)
    #     SELECT id FROM Users
    #     WHERE Users.email='vakshaynayak@gmail.co';
    #     """
    # )
    email = "vakshaynayak@gmail.co"
    cur.execute(
        f"""SELECT *
            FROM BabyCare
            LEFT JOIN(SELECT * FROM Cart WHERE customerId=(SELECT id FROM Users WHERE email='{email}')) AS T
            ON {category}.id=T.itemId;
            """)
    print(cur.fetcall())
except Exception as error:
    print("Exception", error)
finally:
    connection.close()
