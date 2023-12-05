CREATE TABLE Restaurants (
    RestaurantID INT PRIMARY KEY,
    RestaurantName VARCHAR(100),
    Address VARCHAR(255),
    Email VARCHAR(100),
    Telephone VARCHAR(20)
);

CREATE TABLE MenuItems (
    ItemID INT PRIMARY KEY,
    RestaurantID INT,
    Description VARCHAR(255),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Vegetarian BIT,
    Vegan BIT,
    ContainsNuts BIT,
    GlutenFree BIT,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    Email VARCHAR(100),
    Mobile VARCHAR(20)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    RestaurantID INT,
    OrderDate DATE,
    DeliveryAddressID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID),
    FOREIGN KEY (DeliveryAddressID) REFERENCES DeliveryDetails(DeliveryAddressID)
);

CREATE TABLE DeliveryDetails (
    DeliveryAddressID INT PRIMARY KEY,
    CustomerID INT,
    AddressDetails VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Restaurants (RestaurantID, RestaurantName, Address, Email, Telephone)
VALUES
    (1, 'Tropical Island Desserts', '10 Fruit Street, Durian, Cheshire, UK', 'Tropical.Islands@DragonFruit.com', '01244 354 2234'),
    (2, 'Cheesy Cheeseria', '45 Brie Avenue, Stilton, Merseyside, UK', 'Cheesy.Cheese@Rockfort.co.uk', '0151 339 0232'),
    (3, 'Carrot Top', '626 Legume Road, Brussels, Belgium', NULL, NULL);

INSERT INTO Customers (CustomerID, Name, Address, Email, Mobile)
VALUES
	(1, 'Eric Wimp', '29, Acacia Road, Nutty town', 'BananaMad@Dandy.com', '07845 263 374'),
	(2, 'William Benn', '52 Festive Road, London', 'MrBenn@fancydress.com', '07326 629 551'),
	(3,	'Dougal Dog', '36 Magic Garden, Magic Roundabout', 'Dougal@Magic.com', '05638 384 938');

-- Insert data into other tables similarly..