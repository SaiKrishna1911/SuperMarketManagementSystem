from utils import dbConnection


try:
    # Connect to the database
    connection = dbConnection()
    cursor = connection.cursor()
    cursor.execute("Select version();")
    print(cursor.fetchone())
    connection.close()
except Exception as error:
    print("Exception", error)
