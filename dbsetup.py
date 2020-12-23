from utils import dbConnection

try:
    # Connect to the database
    connection = dbConnection()
    cursor = connection.cursor()
    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS Users(
            id int NOT NULL AUTO_INCREMENT,
            name varchar(50),
            email varchar(100),
            password varchar(128),
            Primary key(id)
        );
        """
    )
    if (cursor.fetchall()):
        print("he")
    connection.close()
except Exception as error:
    print("Exception", error)
