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
    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS Orders(
            id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
            customerId int,
            orderDate datetime DEFAULT CURRENT_TIMESTAMP,
            amount float,
            status int DEFAULT 0,
            FOREIGN KEY (customerId) REFERENCES Users(id)
        );
        """
    )
    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS OrderDetails(
            id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
            orderId int,
            itemId int,
            quantity int DEFAULT 1,
            FOREIGN KEY (orderId) REFERENCES Orders(id),
            FOREIGN KEY (itemId) REFERENCES Items(id)
        );
        """
    )
    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS Cart(
            customerId int,
            itemId int,
            quantity int DEFAULT 1,
            FOREIGN KEY (itemId) REFERENCES Items(id),
            FOREIGN KEY (customerId) REFERENCES Users(id)
        );
        """
    )
    cursor.execute(
        """
        CREATE OR REPLACE VIEW BabyCare AS
        SELECT *
        FROM Items
        WHERE categoryId = (SELECT id FROM Categories WHERE category = "Baby Care");
        """
    )
    cursor.execute(
        """
        CREATE OR REPLACE VIEW Food AS
        SELECT *
        FROM Items
        WHERE categoryId = (SELECT id FROM Categories WHERE category = "Food");
        """
    )
    cursor.execute(
        """
        CREATE OR REPLACE VIEW Utensils AS
        SELECT *
        FROM Items
        WHERE categoryId = (SELECT id FROM Categories WHERE category = "Utensils");
        """
    )
    connection.close()
except Exception as error:
    connection.close()
    print("Exception", error)
