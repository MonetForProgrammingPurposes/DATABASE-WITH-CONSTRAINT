-- Connect to MySQL
mysql -u root -p


-- Create database
CREATE DATABASE EcommerceDb;
USE EcommerceDb;

-- Create the USER table
CREATE TABLE USER (
    User_ID INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Address TEXT,
    Phone VARCHAR(15),
    Role VARCHAR(50),
    Created_Datetime DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create the PRODUCTS table
CREATE TABLE PRODUCTS (
    Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Brand VARCHAR(255),
    Description TEXT,
    Price DECIMAL(10,2),
    Stock INT,
    Category VARCHAR(255),
    SKU VARCHAR(100),
    Image_URL TEXT,
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create the REVIEWS table
CREATE TABLE REVIEWS (
    Review_ID INT AUTO_INCREMENT PRIMARY KEY,
    User_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (User_ID) REFERENCES USER(User_ID),
    FOREIGN KEY (Product_ID) REFERENCES PRODUCTS(Product_ID)
);

-- Create the ORDERS table
CREATE TABLE ORDERS (
    Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    User_ID INT NOT NULL,
    Total_Amount DECIMAL(10,2),
    Status VARCHAR(50),
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (User_ID) REFERENCES USER(User_ID)
);

-- Create the ORDER_ITEMS table
CREATE TABLE ORDER_ITEMS (
    Order_Item_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (Order_ID) REFERENCES ORDERS(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES PRODUCTS(Product_ID)
);

-- Insert users
INSERT INTO USER (Email, Password, Name, Address, Phone, Role)
VALUES
('johan@liebert.com', 'password123', 'Johan Liebert', 'Wisteria, New York', '1234567890', 'Admin'),
('miyagi@ryouta.com', 'password123', 'Miyagi Ryouta', '456 Tokyo, Japan', '9876543210', 'Customer'),
('vincent@vangogh.com', 'password123', 'Vincent Van Gogh', 'Arles, France', '5551112222', 'Customer'),
('god@usopp.com', 'password123', 'God Usopp', 'Grand Line', '5553334444', 'Customer'),
('levi@ackerman.com', 'password123', 'Levi Ackerman', 'Shiganshina District', '5556667777', 'Customer'),
('son@goku.com', 'password123', 'Son Goku', 'Mount Paozu', '5558889999', 'Customer'),
('andrew@garfield.com', 'password123', 'Andrew Garfield', 'Queens, NY', '1231231234', 'Customer'),
('bumble@bee.com', 'password123', 'Bumble Bee', 'Detroit, MI', '4564564567', 'Customer'),
('erwin@smith.com', 'password123', 'Erwin Smith', 'Wall Rose', '7897897890', 'Customer'),
('elsa@ex.com', 'password123', 'Elsa', 'Arendelle', '9879879876', 'Customer'),
('steph@curry.com', 'password123', 'Stephen Curry', 'Oakland, CA', '6546546543', 'Customer'),
('albert@einstein.com', 'password123', 'Albert Einstein', 'Princeton, NJ', '3213213212', 'Customer'),
('saitama@sensei.com', 'password123', 'Saitama Sensei', 'Z-City', '1239876543', 'Customer'),
('legolas@pogii.com', 'password123', 'Legolas Greenleaf', '666 Woodland Ave, Middle-earth', '4563217890', 'Customer'),
('naruto@uzumaki.com', 'password123', 'Naruto Uzumaki', 'Konoha Village', '7896541230', 'Customer'),
('rukawa@kaede.com', 'password123', 'Rukawa Kaede', 'Kanagawa, Japan', '3217896540', 'Customer'),
('megan@fox.com', 'password123', 'Megan Fox', 'Los Angeles, CA', '6541239870', 'Customer'),
('peter@parker.com', 'password123', 'Peter Parker', 'Manhattan, NY', '9874563210', 'Customer'),
('bruno@mars', 'password123', 'Bruno Mars', 'Honolulu, HI', '6549873210', 'Customer'),
('thir@dy.com', 'password123', 'Thirdy Gayares', 'Manila, Philippines', '3216549870', 'Admin'),
('roy@mustang.com', 'password123', 'Roy Mustang', 'Amestris', '9873216540', 'Customer'),
('kenshin@himura.com', 'password123', 'Kenshin Himura', 'Kyoto, Japan', '6547891230', 'Customer'),
('stephen@strange.com', 'password123', 'Stephen Strange', '606 Mystic Blvd, Greenwich Village, NY', '3214569870', 'Customer'),
('chris@evans.com', 'password123', 'Chris Evans', 'Boston, MA', '9876541230', 'Customer'),
('jack@sparrow.com', 'password123', 'Jack Sparrow', 'Tortuga', '4561239870', 'Customer'),
('bruce@wayne.com', 'password123', 'Bruce Wayne', 'Gotham City', '7893216540', 'Customer'),
('clark@kent.com', 'password123', 'Clark Kent', '101 Metropolis Ln, Metropolis', '6547893210', 'Customer'),
('zoro@roronoa.com', 'password123', 'Roronoa Zoro', 'East Blue', '1234567890', 'Customer'),
('akashi@seijuro.com', 'password123', 'Akashi Seijuro', 'Kyoto, Japan', '5551234567', 'Customer'),
('gollum@myprecious.com', 'password123', 'Gollum', 'Mordor', '5559876543', 'Customer'),
('fed@nicolas', 'password123', 'Fedelina Nicolas', 'Philippines', '5556549876', 'Customer'),
('tony@stark.com', 'password123', 'Tony Stark', 'Malibu, CA', '5553216549', 'Customer'),
('claude@monet.com', 'password123', 'Claude Monet', 'Giverny, France', '5557891234', 'Customer'),
('sharlom@ex.com', 'password123', 'Shalom Harlow', 'New York, NY', '5551237890', 'Customer'),
('kyrie@irving.com', 'password123', 'Kyrie Irving', 'Brooklyn, NY', '5556543210', 'Customer'),
('light@yagami.com', 'password123', 'Light Yagami', 'Tokyo, Japan', '5559871234', 'Admin'),
('jennifer@lawrence.com', 'password123', 'Jennifer Lawrence', 'Louisville, KY', '5553219876', 'Customer'),
('zayn@malik.com', 'password123', 'Zayn Malik', 'Bradford, UK', '5557896543', 'Customer'),
('kyle@ex.com', 'password123', 'Kyle Kuzma', 'Flint, MI', '5551236547', 'Customer'),
('giannis@ex.com', 'password123', 'Giannis Antetokounmpo', 'Athens, Greece', '5554567890', 'Customer'),
('lolo@santis.com', 'password123', 'Lolo Santis', 'Manila, Philippines', '5556549873', 'Customer'),
('tomas@edison.com', 'password123', 'Thomas Edison', 'Milan, OH', '5557893210', 'Customer'),
('griffith@ex.com', 'password123', 'Griffith', 'Midland', '5553214567', 'Customer'),
('guts@ex.com', 'password123', 'Guts', 'Midland', '5559876542', 'Customer'),
('thor@finn.com', 'password123', 'Thorfinn', 'Kattegat', '5556541239', 'Customer'),
('ella@johnson.com', 'password123', 'Ella Johnson', '202 Maplewood Dr, Seattle, WA', '5551234568', 'Customer'),
('jake@turner.com', 'password123', 'Jake Turner', '303 Sunset Blvd, Miami, FL', '5559873210', 'Customer'),
('sophia@lee.com', 'password123', 'Sophia Lee', '404 Central Ave, San Francisco, CA', '5556547890', 'Customer'),
('mason@harris.com', 'password123', 'Mason Harris', '505 Oakwood St, Chicago, IL', '5557896547', 'Customer'),
('lily@adams.com', 'password123', 'Lily Adams', '606 Rosewood Blvd, Austin, TX', '5551237896', 'Customer');


-- Insert products
INSERT INTO PRODUCTS (Name, Brand, Description, Price, Stock, Category, SKU, Image_URL) 
VALUES
('Smartphone X1', 'TechNova', 'High-performance smartphone with 128GB storage', 599.99, 25, 'Electronics', 'SKU1001', 'http://image.url/smartphone1'),
('Laptop Pro 15', 'ByteGear', '15-inch laptop with 16GB RAM and 512GB SSD', 1299.99, 15, 'Computers', 'SKU1002', 'http://image.url/laptop1'),
('Wireless Earbuds', 'SoundMax', 'Noise-cancelling wireless earbuds', 79.99, 50, 'Audio', 'SKU1003', 'http://image.url/earbuds1'),
('Gaming Mouse', 'ClickMaster', 'Ergonomic mouse with RGB lighting', 49.99, 40, 'Peripherals', 'SKU1004', 'http://image.url/mouse1'),
('4K Smart TV', 'VisionView', '55-inch 4K UHD Smart TV with HDR', 799.99, 10, 'Home Entertainment', 'SKU1005', 'http://image.url/tv1'),
('Fitness Tracker', 'HealthSync', 'Fitness tracker with heart rate monitor', 99.99, 30, 'Wearables', 'SKU1006', 'http://image.url/tracker1'),
('Electric Kettle', 'KitchenPro', '1.7L stainless steel electric kettle', 29.99, 60, 'Home Appliances', 'SKU1007', 'http://image.url/kettle1'),
('Air Fryer', 'CrispyChef', '5L digital air fryer with touch controls', 119.99, 20, 'Kitchen', 'SKU1008', 'http://image.url/airfryer1'),
('Yoga Mat', 'FlexFit', 'Non-slip yoga mat with carrying strap', 25.99, 35, 'Fitness', 'SKU1009', 'http://image.url/yogamat1'),
('Water Bottle', 'AquaPure', 'Insulated stainless steel water bottle, 1L', 19.99, 70, 'Outdoor', 'SKU1010', 'http://image.url/waterbottle1'),
('Gaming Chair', 'SitPro', 'Ergonomic gaming chair with lumbar support', 299.99, 12, 'Furniture', 'SKU1011', 'http://image.url/chair1'),
('Bluetooth Speaker', 'BassBoost', 'Portable speaker with deep bass', 59.99, 45, 'Audio', 'SKU1012', 'http://image.url/speaker1'),
('Wireless Charger', 'PowerDock', 'Fast charging dock for smartphones', 39.99, 50, 'Accessories', 'SKU1013', 'http://image.url/charger1'),
('Graphic Tablet', 'DrawPro', '10-inch graphic tablet for digital artists', 199.99, 18, 'Peripherals', 'SKU1014', 'http://image.url/tablet1'),
('Smart Watch', 'TimeSync', 'Smart watch with health tracking features', 149.99, 25, 'Wearables', 'SKU1015', 'http://image.url/smartwatch1'),
('Gaming Console', 'GameSphere', 'Next-gen console with 1TB storage', 499.99, 8, 'Gaming', 'SKU1016', 'http://image.url/console1'),
('Desk Lamp', 'BrightSpace', 'Adjustable LED desk lamp with USB port', 34.99, 40, 'Lighting', 'SKU1017', 'http://image.url/lam1'),
('Electric Scooter', 'ZoomRide', 'Foldable electric scooter with 20km range', 349.99, 5, 'Transportation', 'SKU1018', 'http://image.url/scooter1'),
('Wireless Keyboard', 'KeyFlow', 'Compact wireless keyboard with backlight', 49.99, 50, 'Peripherals', 'SKU1019', 'http://image.url/keyboard1'),
('Digital Camera', 'PhotoMaster', '20MP compact camera with 4K recording', 399.99, 15, 'Photography', 'SKU1020', 'http://image.url/camera1'),
('Backpack', 'PackBuddy', 'Durable 30L backpack with laptop compartment', 49.99, 60, 'Travel', 'SKU1021', 'http://image.url/backpack1'),
('Smart Thermostat', 'TempControl', 'Wi-Fi enabled thermostat with app control', 199.99, 12, 'Home Automation', 'SKU1022', 'http://image.url/thermostat1'),
('Electric Toothbrush', 'BrightSmile', 'Rechargeable electric toothbrush with 3 modes', 69.99, 30, 'Personal Care', 'SKU1023', 'http://image.url/toothbrush1'),
('Noise-Canceling Headphones', 'SilentTune', 'Over-ear headphones with active noise canceling', 199.99, 20, 'Audio', 'SKU1024', 'http://image.url/headphones1'),
('Drone', 'SkyExplorer', 'Drone with 4K camera and GPS', 799.99, 8, 'Hobby', 'SKU1025', 'http://image.url/drone1'),
('Electric Grill', 'GrillMaster', 'Portable electric grill with non-stick plates', 79.99, 25, 'Kitchen', 'SKU1026', 'http://image.url/grill1'),
('VR Headset', 'VirtuReal', 'Virtual reality headset with motion tracking', 299.99, 10, 'Gaming', 'SKU1027', 'http://image.url/vr1'),
('Smart Bulb', 'LightWave', 'Color-changing smart bulb with voice control', 29.99, 80, 'Lighting', 'SKU1028', 'http://image.url/smartbulb1'),
('Camping Tent', 'OutdoorGear', '2-person waterproof camping tent', 99.99, 20, 'Outdoor', 'SKU1029', 'http://image.url/tent1'),
('Gaming Monitor', 'UltraVision', '27-inch 144Hz gaming monitor', 399.99, 10, 'Computers', 'SKU1030', 'http://image.url/monitor1'),
('Coffee Maker', 'BrewPro', '12-cup coffee maker with programmable timer', 79.99, 35, 'Kitchen', 'SKU1031', 'http://image.url/coffeemaker1'),
('E-Reader', 'BookMate', '6-inch e-reader with glare-free screen', 129.99, 18, 'Electronics', 'SKU1032', 'http://image.url/ereader1'),
('Smart Lock', 'SecureSmart', 'Wi-Fi enabled door lock with app access', 199.99, 10, 'Home Automation', 'SKU1033', 'http://image.url/lock1'),
('Electric Guitar', 'StrumMaster', 'Electric guitar with 3 single-coil pickups', 299.99, 5, 'Music', 'SKU1034', 'http://image.url/guitar1'),
('Office Chair', 'ComfortSit', 'Ergonomic office chair with adjustable height', 149.99, 20, 'Furniture', 'SKU1035', 'http://image.url/officechair1'),
('Bluetooth Tracker', 'FindIt', 'Compact tracker for locating lost items', 19.99, 75, 'Accessories', 'SKU1036', 'http://image.url/tracker1'),
('Outdoor Grill', 'BBQKing', 'Charcoal grill with adjustable heat settings', 149.99, 8, 'Outdoor', 'SKU1037', 'http://image.url/grill2'),
('Portable Projector', 'CinemaLite', 'Mini projector with 1080p resolution', 249.99, 12, 'Electronics', 'SKU1038', 'http://image.url/projector1'),
('Sleeping Bag', 'CampComfort', 'Lightweight sleeping bag for 3 seasons', 49.99, 30, 'Outdoor', 'SKU1039', 'http://image.url/sleepingbag1'),
('Tablet', 'TechPad', '10-inch tablet with 64GB storage and LTE', 299.99, 25, 'Electronics', 'SKU1040', 'http://image.url/tablet2'),
('Action Camera', 'AdventureCam', '4K action camera with waterproof case', 199.99, 20, 'Photography', 'SKU1041', 'http://image.url/actioncam1'),
('Electric Fan', 'CoolBreeze', 'Oscillating tower fan with remote control', 79.99, 35, 'Home Appliances', 'SKU1042', 'http://image.url/fan1'),
('Wireless Router', 'NetSpeed', 'Dual-band Wi-Fi router with 1Gbps speed', 129.99, 18, 'Networking', 'SKU1043', 'http://image.url/router1'),
('Board Game', 'FunTimes', 'Family board game for 2-6 players', 39.99, 50, 'Toys', 'SKU1044', 'http://image.url/boardgame1'),
('Smart Scale', 'HealthMate', 'Body composition scale with Bluetooth', 59.99, 25, 'Health', 'SKU1045', 'http://image.url/scale1'),
('Pressure Cooker', 'QuickCook', '6-quart electric pressure cooker', 99.99, 15, 'Kitchen', 'SKU1046', 'http://image.url/pressurecooker1'),
('Digital Piano', 'KeyPlayer', '88-key digital piano with weighted keys', 499.99, 5, 'Music', 'SKU1047', 'http://image.url/piano1'),
('Electric Bike', 'EcoRide', 'Electric bike with pedal assist', 999.99, 3, 'Transportation', 'SKU1048', 'http://image.url/bike1'),
('Microwave Oven', 'HeatWave', '700W microwave oven with turntable', 79.99, 25, 'Kitchen', 'SKU1049', 'http://image.url/microwave1'),
('Home Gym Set', 'FitMax', 'All-in-one home gym equipment', 499.99, 2, 'Fitness', 'SKU1050', 'http://image.url/homegym1');



-- Insert reviews
INSERT INTO REVIEWS (User_ID, Product_ID, Rating, Comment)
VALUES
(1, 1, 5, 'Excellent product!'),
(2, 1, 4, 'Good value for money.'),
(3, 2, 3, 'It’s okay, but not great.'),
(4, 2, 5, 'Loved it, highly recommend!'),
(5, 3, 4, 'Great quality for the price.'),
(6, 3, 2, 'Did not meet my expectations.'),
(7, 4, 5, 'Amazing, works perfectly.'),
(8, 4, 3, 'Average performance, could be better.'),
(9, 5, 4, 'Very satisfied with this purchase.'),
(10, 5, 3, 'Not bad, but not amazing either.'),
(11, 6, 5, 'Perfect for my needs!'),
(12, 6, 4, 'Good, but delivery was delayed.'),
(13, 7, 2, 'Disappointed with the quality.'),
(14, 7, 5, 'Exceeded my expectations!'),
(15, 8, 3, 'Decent product, nothing special.'),
(16, 8, 4, 'Happy with this purchase.'),
(17, 9, 5, 'Fantastic! Worth every penny.'),
(18, 9, 3, 'It’s alright, but could be improved.'),
(19, 10, 4, 'Does the job well.'),
(20, 10, 2, 'Not what I expected.'),
(21, 11, 5, 'Highly recommend this product!'),
(22, 11, 3, 'It’s fine, but there are better options.'),
(23, 12, 4, 'Good product, meets expectations.'),
(24, 12, 1, 'Terrible, would not buy again.'),
(25, 13, 5, 'Awesome, love using this!'),
(26, 13, 3, 'It’s okay, but I wouldn’t buy it again.'),
(27, 14, 4, 'Solid build and great features.'),
(28, 14, 2, 'Had issues after a few uses.'),
(29, 15, 5, 'A must-have item!'),
(30, 15, 4, 'Very good, but a bit pricey.'),
(31, 16, 3, 'Average quality, could be better.'),
(32, 16, 5, 'Absolutely love it!'),
(33, 17, 4, 'Nice product, works as expected.'),
(34, 17, 2, 'Not satisfied with this purchase.'),
(35, 18, 5, 'Top-notch product!'),
(36, 18, 3, 'It’s okay, does the job.'),
(37, 19, 4, 'Good quality for the price.'),
(38, 19, 2, 'Disappointed with the performance.'),
(39, 20, 5, 'Amazing, would buy again!'),
(40, 20, 3, 'It’s decent but has some flaws.'),
(41, 21, 4, 'Happy with the quality.'),
(42, 21, 2, 'Broke after a few uses.'),
(43, 22, 5, 'Best product I’ve ever used!'),
(44, 22, 3, 'It’s okay, nothing special.'),
(45, 23, 4, 'Worth the money.'),
(46, 23, 1, 'Terrible experience with this.'),
(47, 24, 5, 'Highly recommend to everyone!'),
(48, 24, 3, 'Not bad, but room for improvement.'),
(49, 25, 4, 'Satisfied with this purchase.'),
(50, 25, 2, 'Had higher expectations for this.');


-- Insert orders
INSERT INTO ORDERS (User_ID, Total_Amount, Status)
VALUES
(1, 199.98, 'Pending'),
(2, 49.99, 'Completed'),
(3, 89.50, 'Completed'),
(4, 150.00, 'Pending'),
(5, 65.99, 'Completed'),
(6, 120.75, 'Pending'),
(7, 250.00, 'Shipped'),
(8, 199.99, 'Pending'),
(9, 45.50, 'Completed'),
(10, 300.00, 'Shipped'),
(11, 125.00, 'Pending'),
(12, 35.99, 'Completed'),
(13, 220.00, 'Shipped'),
(14, 180.00, 'Pending'),
(15, 145.75, 'Completed'),
(16, 99.99, 'Pending'),
(17, 55.00, 'Shipped'),
(18, 500.00, 'Pending'),
(19, 80.00, 'Completed'),
(20, 65.99, 'Shipped'),
(21, 112.50, 'Pending'),
(22, 90.00, 'Completed'),
(23, 275.00, 'Shipped'),
(24, 60.50, 'Pending'),
(25, 130.00, 'Completed'),
(26, 200.00, 'Shipped'),
(27, 40.99, 'Completed'),
(28, 95.00, 'Pending'),
(29, 350.00, 'Shipped'),
(30, 110.00, 'Completed'),
(31, 250.99, 'Shipped'),
(32, 180.00, 'Completed'),
(33, 99.00, 'Pending'),
(34, 45.75, 'Shipped'),
(35, 120.50, 'Completed'),
(36, 60.00, 'Pending'),
(37, 130.25, 'Shipped'),
(38, 70.00, 'Completed'),
(39, 220.00, 'Shipped'),
(40, 160.00, 'Completed'),
(41, 50.00, 'Pending'),
(42, 105.00, 'Shipped'),
(43, 170.00, 'Completed'),
(44, 250.99, 'Pending'),
(45, 60.00, 'Shipped'),
(46, 300.00, 'Completed'),
(47, 85.00, 'Pending'),
(48, 135.00, 'Shipped'),
(49, 200.00, 'Completed'),
(50, 75.99, 'Pending');


-- Insert order items
INSERT INTO ORDER_ITEMS (Order_ID, Product_ID, Quantity, Price)
VALUES
(1, 1, 2, 99.99),
(1, 2, 1, 49.99),
(2, 3, 3, 89.50),
(2, 4, 1, 150.00),
(3, 5, 2, 65.99),
(3, 6, 1, 120.75),
(4, 7, 5, 50.00),
(4, 8, 1, 199.99),
(5, 9, 2, 45.50),
(5, 10, 3, 100.00),
(6, 11, 1, 125.00),
(6, 12, 1, 35.99),
(7, 13, 4, 55.00),
(7, 14, 2, 220.00),
(8, 15, 1, 180.00),
(8, 16, 3, 45.75),
(9, 17, 1, 99.99),
(9, 18, 2, 500.00),
(10, 19, 3, 80.00),
(10, 20, 1, 65.99),
(11, 21, 2, 112.50),
(11, 22, 1, 90.00),
(12, 23, 4, 275.00),
(12, 24, 1, 60.50),
(13, 25, 2, 130.00),
(13, 26, 1, 200.00),
(14, 27, 3, 40.99),
(14, 28, 2, 95.00),
(15, 29, 4, 350.00),
(15, 30, 2, 110.00),
(16, 31, 3, 250.99),
(16, 32, 2, 180.00),
(17, 33, 1, 99.00),
(17, 34, 3, 45.75),
(18, 35, 2, 120.50),
(18, 36, 1, 60.00),
(19, 37, 2, 130.25),
(19, 38, 1, 70.00),
(20, 39, 3, 220.00),
(20, 40, 2, 160.00),
(21, 41, 1, 130.00),
(21, 42, 3, 75.00),
(22, 43, 2, 65.99),
(22, 44, 4, 99.50),
(23, 45, 3, 150.00),
(23, 46, 1, 90.75),
(24, 47, 2, 95.99),
(24, 48, 1, 125.50),
(25, 49, 3, 99.99),
(25, 50, 2, 180.00);


-- Select all data from the USER table
SELECT * FROM USER;

-- Select all data from the PRODUCTS table
SELECT * FROM PRODUCTS;

-- Select all data from the REVIEWS table
SELECT * FROM REVIEWS;

-- Select all data from the ORDERS table
SELECT * FROM ORDERS;

-- Select all data from the ORDER_ITEMS table
SELECT * FROM ORDER_ITEMS;

