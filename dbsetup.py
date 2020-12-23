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
    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS Categories(
            id int NOT NULL AUTO_INCREMENT,
            category varchar(50) UNIQUE,
            Primary key(id)
        );
        """
    )

    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS Brands(
            id int NOT NULL AUTO_INCREMENT,
            brand varchar(50) UNIQUE,
            Primary key(id)
        );
        """
    )

    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS Items(
            id int NOT NULL AUTO_INCREMENT,
            categoryId int,
            brandId int,
            name varchar(50),
            mrp float,
            sale_rate float, 
            Primary key(id),
            FOREIGN KEY (categoryId) REFERENCES Categories(id),
            FOREIGN KEY (brandId) REFERENCES Brands(id)
        );
        """
    )
    connection.close()
except Exception as error:
    print("Exception", error)
