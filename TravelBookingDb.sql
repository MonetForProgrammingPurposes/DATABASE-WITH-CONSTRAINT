-- Connect to MySQL
mysql -u root -p


-- Create Database


CREATE DATABASE travelbookingdbs;
USE travelbookingdbs;
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password_hash VARCHAR(255),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    user_role ENUM('ADMIN', 'USERS'),
    created_at DATETIME,
    updated_at DATETIME,
    deleted_at DATETIME
);


CREATE TABLE Tours (
    tour_id INT AUTO_INCREMENT PRIMARY KEY,
    tour_name VARCHAR(100),
    description TEXT,
    price DECIMAL(10,2),
    start_date DATE,
    end_date DATE,
    seats_available INT,
    image_url VARCHAR(255),
    created_at DATETIME,
    updated_at DATETIME,
    deleted_at DATETIME
);


CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    tour_id INT,
    booking_date DATETIME,
    travel_date DATE,
    seats_booked INT,
    total_amount DECIMAL(10,2),
    payment_status ENUM('SUCCESS', 'FAILED'),
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (tour_id) REFERENCES Tours(tour_id) ON DELETE CASCADE
);


CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    payment_date DATETIME,
    amount DECIMAL(10,2),
    payment_method ENUM('GCASH'),
    payment_status ENUM('SUCCESS', 'FAILED'),
    transaction_id VARCHAR(100),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id) ON DELETE CASCADE
);


CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    tour_id INT,
    rating INT,
    comment TEXT,
    created_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (tour_id) REFERENCES Tours(tour_id) ON DELETE CASCADE
);


CREATE TABLE AdminLogs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    admin_id INT,
    action_type ENUM('ADD', 'DELETE', 'UPDATE'),
    description TEXT,
    timestamp DATETIME,
    FOREIGN KEY (admin_id) REFERENCES User(user_id) ON DELETE CASCADE
);


-- Insert Dummy Records
--


INSERT INTO User (username, password_hash, email, phone_number, first_name, last_name, user_role, created_at, updated_at, deleted_at) VALUES
('user1', 'hashed_password1', 'user1@example.com', '1234567890', 'John', 'Doe', 'USERS', NOW(), NOW(), NULL),
('user2', 'hashed_password2', 'user2@example.com', '1234567891', 'Jane', 'Doe', 'USERS', NOW(), NOW(), NULL),
('user3', 'hashed_password3', 'user3@example.com', '1234567892', 'Bob', 'Smith', 'USERS', NOW(), NOW(), NULL),
('user4', 'hashed_password4', 'user4@example.com', '1234567893', 'Alice', 'Johnson', 'USERS', NOW(), NOW(), NULL),
('user5', 'hashed_password5', 'user5@example.com', '1234567894', 'Charlie', 'Brown', 'USERS', NOW(), NOW(), NULL),
('user6', 'hashed_password6', 'user6@example.com', '1234567895', 'David', 'Williams', 'USERS', NOW(), NOW(), NULL),
('user7', 'hashed_password7', 'user7@example.com', '1234567896', 'Eve', 'Davis', 'USERS', NOW(), NOW(), NULL),
('user8', 'hashed_password8', 'user8@example.com', '1234567897', 'Frank', 'Miller', 'USERS', NOW(), NOW(), NULL),
('user9', 'hashed_password9', 'user9@example.com', '1234567898', 'Grace', 'Wilson', 'USERS', NOW(), NOW(), NULL),
('user10', 'hashed_password10', 'user10@example.com', '1234567899', 'Henry', 'Moore', 'USERS', NOW(), NOW(), NULL),
('user11', 'hashed_password11', 'user11@example.com', '1234567800', 'Ivy', 'Taylor', 'USERS', NOW(), NOW(), NULL),
('user12', 'hashed_password12', 'user12@example.com', '1234567801', 'Jack', 'Anderson', 'USERS', NOW(), NOW(), NULL),
('user13', 'hashed_password13', 'user13@example.com', '1234567802', 'Karen', 'Thomas', 'USERS', NOW(), NOW(), NULL),
('user14', 'hashed_password14', 'user14@example.com', '1234567803', 'Leo', 'Jackson', 'USERS', NOW(), NOW(), NULL),
('user15', 'hashed_password15', 'user15@example.com', '1234567804', 'Mia', 'White', 'USERS', NOW(), NOW(), NULL),
('user16', 'hashed_password16', 'user16@example.com', '1234567805', 'Nate', 'Harris', 'USERS', NOW(), NOW(), NULL),
('user17', 'hashed_password17', 'user17@example.com', '1234567806', 'Olivia', 'Clark', 'USERS', NOW(), NOW(), NULL),
('user18', 'hashed_password18', 'user18@example.com', '1234567807', 'Paul', 'Lewis', 'USERS', NOW(), NOW(), NULL),
('user19', 'hashed_password19', 'user19@example.com', '1234567808', 'Quincy', 'Young', 'USERS', NOW(), NOW(), NULL),
('user20', 'hashed_password20', 'user20@example.com', '1234567809', 'Rachel', 'King', 'USERS', NOW(), NOW(), NULL),
('user21', 'hashed_password21', 'user21@example.com', '1234567810', 'Sam', 'Scott', 'USERS', NOW(), NOW(), NULL),
('user22', 'hashed_password22', 'user22@example.com', '1234567811', 'Tina', 'Adams', 'USERS', NOW(), NOW(), NULL),
('user23', 'hashed_password23', 'user23@example.com', '1234567812', 'Ursula', 'Baker', 'USERS', NOW(), NOW(), NULL),
('user24', 'hashed_password24', 'user24@example.com', '1234567813', 'Victor', 'Nelson', 'USERS', NOW(), NOW(), NULL),
('user25', 'hashed_password25', 'user25@example.com', '1234567814', 'Wendy', 'Carter', 'USERS', NOW(), NOW(), NULL),
('user26', 'hashed_password26', 'user26@example.com', '1234567815', 'Xander', 'Mitchell', 'USERS', NOW(), NOW(), NULL),
('user27', 'hashed_password27', 'user27@example.com', '1234567816', 'Yara', 'Perez', 'USERS', NOW(), NOW(), NULL),
('user28', 'hashed_password28', 'user28@example.com', '1234567817', 'Zane', 'Roberts', 'USERS', NOW(), NOW(), NULL),
('user29', 'hashed_password29', 'user29@example.com', '1234567818', 'Adam', 'Phillips', 'USERS', NOW(), NOW(), NULL),
('user30', 'hashed_password30', 'user30@example.com', '1234567819', 'Brooke', 'Evans', 'USERS', NOW(), NOW(), NULL),
('user31', 'hashed_password31', 'user31@example.com', '1234567820', 'Chris', 'Gonzalez', 'USERS', NOW(), NOW(), NULL),
('user32', 'hashed_password32', 'user32@example.com', '1234567821', 'Diana', 'Hernandez', 'USERS', NOW(), NOW(), NULL),
('user33', 'hashed_password33', 'user33@example.com', '1234567822', 'Evan', 'King', 'USERS', NOW(), NOW(), NULL),
('user34', 'hashed_password34', 'user34@example.com', '1234567823', 'Fiona', 'Lee', 'USERS', NOW(), NOW(), NULL),
('user35', 'hashed_password35', 'user35@example.com', '1234567824', 'Greg', 'Martinez', 'USERS', NOW(), NOW(), NULL),
('user36', 'hashed_password36', 'user36@example.com', '1234567825', 'Helen', 'Moore', 'USERS', NOW(), NOW(), NULL),
('user37', 'hashed_password37', 'user37@example.com', '1234567826', 'Ian', 'Parker', 'USERS', NOW(), NOW(), NULL),
('user38', 'hashed_password38', 'user38@example.com', '1234567827', 'Judy', 'Roberts', 'USERS', NOW(), NOW(), NULL),
('user39', 'hashed_password39', 'user39@example.com', '1234567828', 'Kurt', 'Taylor', 'USERS', NOW(), NOW(), NULL),
('user40', 'hashed_password40', 'user40@example.com', '1234567829', 'Laura', 'Wright', 'USERS', NOW(), NOW(), NULL),
('user41', 'hashed_password41', 'user41@example.com', '1234567830', 'Mandy', 'Baker', 'USERS', NOW(), NOW(), NULL),
('user42', 'hashed_password42', 'user42@example.com', '1234567831', 'Noah', 'Carter', 'USERS', NOW(), NOW(), NULL),
('user43', 'hashed_password43', 'user43@example.com', '1234567832', 'Oscar', 'Davis', 'USERS', NOW(), NOW(), NULL),
('user44', 'hashed_password44', 'user44@example.com', '1234567833', 'Penny', 'Evans', 'USERS', NOW(), NOW(), NULL),
('user45', 'hashed_password45', 'user45@example.com', '1234567834', 'Quinn', 'Hall', 'USERS', NOW(), NOW(), NULL),
('user46', 'hashed_password46', 'user46@example.com', '1234567835', 'Riley', 'Johnson', 'USERS', NOW(), NOW(), NULL),
('user47', 'hashed_password47', 'user47@example.com', '1234567836', 'Sasha', 'Lee', 'USERS', NOW(), NOW(), NULL),
('user48', 'hashed_password48', 'user48@example.com', '1234567837', 'Tony', 'Miller', 'USERS', NOW(), NOW(), NULL),
('user49', 'hashed_password49', 'user49@example.com', '1234567838', 'Ulysses', 'Nelson', 'USERS', NOW(), NOW(), NULL),
('user50', 'hashed_password50', 'user50@example.com', '1234567839', 'Vera', 'Connor', 'USERS', NOW(), NOW(), NULL);



INSERT INTO Tours (tour_name, description, price, start_date, end_date, seats_available, image_url, created_at, updated_at, deleted_at) VALUES
('Grand Paris Tour', 'Explore the city of lights with a 5-day guided tour.', 1200.00, '2024-06-01', '2024-06-05', 50, 'paris.jpg', NOW(), NOW(), NULL),
('Swiss Alps Adventure', 'A scenic 7-day hiking trip through the Swiss Alps.', 2000.00, '2024-07-01', '2024-07-07', 30, 'swiss_alps.jpg', NOW(), NOW(), NULL),
('Rome and Florence Escape', 'Discover the best of Italy with a 10-day tour.', 1500.00, '2024-08-01', '2024-08-10', 40, 'italy_tour.jpg', NOW(), NOW(), NULL),
('Thailand Beach Vacation', 'Relax on the beaches of Thailand for 8 days.', 1800.00, '2024-09-01', '2024-09-08', 70, 'thailand_beach.jpg', NOW(), NOW(), NULL),
('Dubai City Lights', 'Experience the modern marvels of Dubai on a 5-day trip.', 2200.00, '2024-10-01', '2024-10-05', 60, 'dubai.jpg', NOW(), NOW(), NULL),
('Great Wall of China', 'Travel to Beijing for a historical journey to the Great Wall.', 1300.00, '2024-11-01', '2024-11-05', 50, 'china_wall.jpg', NOW(), NOW(), NULL),
('Tokyo Highlights', 'Explore Tokyo’s rich culture and modern attractions.', 1400.00, '2024-12-01', '2024-12-05', 60, 'tokyo.jpg', NOW(), NOW(), NULL),
('Maldives Getaway', 'A luxury 7-day vacation in the Maldives.', 2500.00, '2025-01-01', '2025-01-07', 40, 'maldives.jpg', NOW(), NOW(), NULL),
('Australian Wildlife Safari', 'Visit Australia’s top wildlife destinations for 12 days.', 3000.00, '2025-02-01', '2025-02-12', 35, 'australia_safari.jpg', NOW(), NOW(), NULL),
('Greek Islands Cruise', 'A 9-day cruise through the beautiful Greek Islands.', 1700.00, '2025-03-01', '2025-03-09', 50, 'greek_islands.jpg', NOW(), NOW(), NULL),
('Egyptian Wonders', 'A 7-day adventure to explore Egypt’s ancient monuments.', 2200.00, '2025-04-01', '2025-04-07', 50, 'egypt_wonders.jpg', NOW(), NOW(), NULL),
('Alaskan Cruise', 'A luxury cruise through the wilds of Alaska for 10 days.', 2600.00, '2025-05-01', '2025-05-10', 55, 'alaska_cruise.jpg', NOW(), NOW(), NULL),
('Kenya Safari Adventure', 'Explore the stunning safaris of Kenya for 8 days.', 2100.00, '2025-06-01', '2025-06-08', 40, 'kenya_safari.jpg', NOW(), NOW(), NULL),
('New York City Tour', 'A 7-day trip to explore New York City’s iconic landmarks.', 1500.00, '2025-07-01', '2025-07-07', 60, 'new_york.jpg', NOW(), NOW(), NULL),
('New Zealand Adventure', 'Discover New Zealand’s breathtaking landscapes for 9 days.', 2200.00, '2025-12-01', '2025-12-09', 30, 'new_zealand.jpg', NOW(), NOW(), NULL),
('Icelandic Wonders', 'A 10-day road trip exploring the stunning natural beauty of Iceland.', 2400.00, '2025-08-01', '2025-08-10', 35, 'iceland.jpg', NOW(), NOW(), NULL),
('Hawaiian Paradise', 'A tropical 6-day getaway to Hawaii’s best beaches and volcanoes.', 2100.00, '2025-06-01', '2025-06-06', 50, 'hawaii.jpg', NOW(), NOW(), NULL),
('South African Safari', 'Embark on an unforgettable safari through South Africa for 14 days.', 3000.00, '2025-04-01', '2025-04-14', 40, 'south_africa.jpg', NOW(), NOW(), NULL),
('Peruvian Andes Trek', 'A thrilling 8-day trek through the Andes Mountains and Machu Picchu.', 1900.00, '2025-10-01', '2025-10-08', 30, 'peru_trek.jpg', NOW(), NOW(), NULL),
('Polar Bear Expedition', 'Witness polar bears in the Arctic Circle on a 12-day adventure.', 3500.00, '2025-11-01', '2025-11-12', 20, 'polar_bears.jpg', NOW(), NOW(), NULL),
('Cuban Cultural Escape', 'Explore the vibrant culture of Cuba with a 6-day tour.', 1300.00, '2025-03-01', '2025-03-06', 50, 'cuba.jpg', NOW(), NOW(), NULL),
('Machu Picchu & Sacred Valley', 'A 9-day tour of Peru’s most famous ancient sites and Machu Picchu.', 2000.00, '2025-05-01', '2025-05-09', 40, 'machu_picchu.jpg', NOW(), NOW(), NULL),
('Antarctic Cruise', 'An extraordinary 14-day journey to the South Pole.', 5000.00, '2025-01-01', '2025-01-14', 30, 'antarctic_cruise.jpg', NOW(), NOW(), NULL),
('Canadian Rockies Exploration', 'A 10-day tour through the majestic Canadian Rockies.', 2300.00, '2025-07-01', '2025-07-10', 40, 'canada_rockies.jpg', NOW(), NOW(), NULL),
('Lapland Northern Lights', 'A winter adventure in Lapland to see the Northern Lights.', 2200.00, '2025-12-01', '2025-12-05', 30, 'lapland.jpg', NOW(), NOW(), NULL),
('Indochina Discovery', 'A fascinating 12-day tour through Vietnam, Laos, and Cambodia.', 2100.00, '2025-08-01', '2025-08-12', 45, 'indochina.jpg', NOW(), NOW(), NULL),
('Czech Republic Castles', 'A 7-day journey through the magical castles of the Czech Republic.', 1700.00, '2025-09-01', '2025-09-07', 40, 'czech_castles.jpg', NOW(), NOW(), NULL),
('Amazon Rainforest Expedition', 'Explore the Amazon Jungle on an exhilarating 10-day expedition.', 2600.00, '2025-10-01', '2025-10-10', 25, 'amazon.jpg', NOW(), NOW(), NULL),
('Norwegian Fjords Cruise', 'Sail through Norway’s stunning fjords for 8 days.', 2400.00, '2025-06-01', '2025-06-08', 50, 'norwegian_fjords.jpg', NOW(), NOW(), NULL),
('Costa Rica Eco Tour', 'A 9-day eco-tour through Costa Rica’s most beautiful nature reserves.', 2200.00, '2025-05-01', '2025-05-09', 50, 'costa_rica.jpg', NOW(), NOW(), NULL),
('Marrakech & Sahara Desert', 'A 7-day tour from Marrakech to the Sahara Desert.', 1800.00, '2025-07-01', '2025-07-07', 40, 'marrakech.jpg', NOW(), NOW(), NULL),
('Zanzibar Beach & Culture', 'Discover the exotic island of Zanzibar for 7 days.', 2300.00, '2025-06-01', '2025-06-07', 45, 'zanzibar.jpg', NOW(), NOW(), NULL),
('Bali & Beyond', 'A luxurious 10-day journey through Bali’s culture, beaches, and temples.', 2700.00, '2025-08-01', '2025-08-10', 50, 'bali.jpg', NOW(), NOW(), NULL),
('Patagonia Adventure', 'An 11-day trek through the wild landscapes of Patagonia.', 2900.00, '2025-09-01', '2025-09-11', 35, 'patagonia.jpg', NOW(), NOW(), NULL),
('Bordeaux Wine Tour', 'A 5-day wine-tasting journey through the Bordeaux region of France.', 1600.00, '2025-05-01', '2025-05-05', 30, 'bordeaux_wine.jpg', NOW(), NOW(), NULL),
('Sri Lanka Discovery', 'A cultural and natural exploration of Sri Lanka for 9 days.', 2000.00, '2025-04-01', '2025-04-09', 40, 'sri_lanka.jpg', NOW(), NOW(), NULL),
('Berlin & Prague City Break', 'A 7-day city break exploring Berlin and Prague.', 1400.00, '2025-10-01', '2025-10-07', 50, 'berlin_prague.jpg', NOW(), NOW(), NULL),
('Patagonia Glacier Trek', 'A 10-day adventure through the glaciers of Patagonia.', 2600.00, '2025-12-01', '2025-12-10', 30, 'patagonia_glacier.jpg', NOW(), NOW(), NULL),
('Dubai & Abu Dhabi Extravaganza', 'A luxury 7-day trip to Dubai and Abu Dhabi.', 3000.00, '2025-07-01', '2025-07-07', 50, 'dubai_abu_dhabi.jpg', NOW(), NOW(), NULL),
('Galapagos Islands Expedition', 'A 12-day wildlife and nature adventure in the Galapagos Islands.', 3500.00, '2025-09-01', '2025-09-12', 20, 'galapagos.jpg', NOW(), NOW(), NULL),
('Spanish Culture & Flamenco', 'A 6-day exploration of Spain’s rich culture and flamenco dancing.', 1600.00, '2025-03-01', '2025-03-06', 50, 'spain.jpg', NOW(), NOW(), NULL),
('Scotland Highlands & Islands', 'A 9-day journey through the scenic highlands and islands of Scotland.', 2200.00, '2025-11-01', '2025-11-09', 45, 'scotland_highlands.jpg', NOW(), NOW(), NULL),
('Tanzania Safari & Zanzibar', 'Explore Tanzania’s national parks and relax in Zanzibar for 12 days.', 2800.00, '2025-04-01', '2025-04-12', 30, 'tanzania_zanzibar.jpg', NOW(), NOW(), NULL),
('South Korea Cultural Tour', 'Discover South Korea’s culture, history, and cuisine for 8 days.', 1900.00, '2025-07-01', '2025-07-08', 50, 'south_korea.jpg', NOW(), NOW(), NULL),
('Swiss Chocolate & Cheese Tour', 'A delectable 7-day tour of Switzerland’s chocolate and cheese regions.', 2100.00, '2025-10-01', '2025-10-07', 50, 'swiss_chocolate.jpg', NOW(), NOW(), NULL),
('Chilean Wine & Andes Mountains', 'A 9-day wine and adventure tour through Chile’s vineyards and the Andes.', 2400.00, '2025-05-01', '2025-05-09', 35, 'chile_wine.jpg', NOW(), NOW(), NULL)
('Sahara Desert Camel Trek', 'An exhilarating 7-day camel trek across the Sahara Desert.', 1800.00, '2025-11-01', '2025-11-07', 40, 'sahara_desert.jpg', NOW(), NOW(), NULL),
('Borneo Wildlife Expedition', 'Explore Borneo’s unique wildlife on a 10-day adventure.', 2500.00, '2025-06-01', '2025-06-10', 30, 'borneo_wildlife.jpg', NOW(), NOW(), NULL),
('Peru Rainforest Adventure', 'A 9-day expedition into the Amazon Rainforest of Peru.', 2300.00, '2025-07-01', '2025-07-09', 35, 'peru_rainforest.jpg', NOW(), NOW(), NULL),
('Nepal Himalayan Trek', 'A 12-day trek through Nepal’s stunning Himalayan mountain range.', 2800.00, '2025-08-01', '2025-08-12', 30, 'nepal_trek.jpg', NOW(), NOW(), NULL);



INSERT INTO Bookings (user_id, tour_id, booking_date, travel_date, seats_booked, total_amount, payment_status, created_at, updated_at) VALUES
(1, 1, NOW(), '2024-06-01', 2, 2400.00, 'SUCCESS', NOW(), NOW()),
(2, 2, NOW(), '2024-07-01', 4, 8000.00, 'SUCCESS', NOW(), NOW()),
(3, 3, NOW(), '2024-08-01', 3, 4500.00, 'SUCCESS', NOW(), NOW()),
(4, 4, NOW(), '2024-09-01', 5, 9000.00, 'FAILED', NOW(), NOW()),
(5, 5, NOW(), '2024-10-01', 2, 4400.00, 'SUCCESS', NOW(), NOW()),
(6, 6, NOW(), '2024-11-01', 4, 5200.00, 'SUCCESS', NOW(), NOW()),
(7, 7, NOW(), '2024-12-01', 1, 1400.00, 'SUCCESS', NOW(), NOW()),
(8, 8, NOW(), '2025-01-01', 3, 6600.00, 'FAILED', NOW(), NOW()),
(9, 9, NOW(), '2025-02-01', 2, 2800.00, 'SUCCESS', NOW(), NOW()),
(10, 10, NOW(), '2025-03-01', 1, 1500.00, 'SUCCESS', NOW(), NOW()),
(11, 11, NOW(), '2025-04-01', 4, 8800.00, 'SUCCESS', NOW(), NOW()),
(12, 12, NOW(), '2025-05-01', 2, 4400.00, 'SUCCESS', NOW(), NOW()),
(13, 13, NOW(), '2025-06-01', 3, 6300.00, 'SUCCESS', NOW(), NOW()),
(14, 14, NOW(), '2025-07-01', 2, 4600.00, 'SUCCESS', NOW(), NOW()),
(15, 15, NOW(), '2025-08-01', 5, 11000.00, 'FAILED', NOW(), NOW()),
(16, 16, NOW(), '2025-09-01', 1, 1500.00, 'SUCCESS', NOW(), NOW()),
(17, 17, NOW(), '2025-10-01', 4, 8800.00, 'SUCCESS', NOW(), NOW()),
(18, 18, NOW(), '2025-11-01', 3, 6900.00, 'SUCCESS', NOW(), NOW()),
(19, 19, NOW(), '2025-12-01', 2, 3800.00, 'FAILED', NOW(), NOW()),
(20, 20, NOW(), '2025-01-01', 1, 2500.00, 'SUCCESS', NOW(), NOW()),
(21, 21, NOW(), '2025-02-01', 4, 8800.00, 'SUCCESS', NOW(), NOW()),
(22, 22, NOW(), '2025-03-01', 3, 5400.00, 'SUCCESS', NOW(), NOW()),
(23, 23, NOW(), '2025-04-01', 2, 4400.00, 'SUCCESS', NOW(), NOW()),
(24, 24, NOW(), '2025-05-01', 1, 1600.00, 'SUCCESS', NOW(), NOW()),
(25, 25, NOW(), '2025-06-01', 5, 11500.00, 'FAILED', NOW(), NOW()),
(26, 26, NOW(), '2025-07-01', 2, 4200.00, 'SUCCESS', NOW(), NOW()),
(27, 27, NOW(), '2025-08-01', 3, 6300.00, 'SUCCESS', NOW(), NOW()),
(28, 28, NOW(), '2025-09-01', 4, 8800.00, 'SUCCESS', NOW(), NOW()),
(29, 29, NOW(), '2025-10-01', 2, 4600.00, 'SUCCESS', NOW(), NOW()),
(30, 30, NOW(), '2025-11-01', 1, 1600.00, 'SUCCESS', NOW(), NOW()),
(31, 31, NOW(), '2025-12-01', 4, 8800.00, 'SUCCESS', NOW(), NOW()),
(32, 32, NOW(), '2025-01-01', 3, 6300.00, 'FAILED', NOW(), NOW()),
(33, 33, NOW(), '2025-02-01', 2, 4400.00, 'SUCCESS', NOW(), NOW()),
(34, 34, NOW(), '2025-03-01', 1, 1600.00, 'SUCCESS', NOW(), NOW()),
(35, 35, NOW(), '2025-04-01', 4, 8800.00, 'SUCCESS', NOW(), NOW()),
(36, 36, NOW(), '2025-05-01', 3, 6900.00, 'SUCCESS', NOW(), NOW()),
(37, 37, NOW(), '2025-06-01', 2, 3800.00, 'SUCCESS', NOW(), NOW()),
(38, 38, NOW(), '2025-07-01', 1, 1500.00, 'SUCCESS', NOW(), NOW()),
(39, 39, NOW(), '2025-08-01', 5, 11500.00, 'FAILED', NOW(), NOW()),
(40, 40, NOW(), '2025-09-01', 2, 4600.00, 'SUCCESS', NOW(), NOW()),
(41, 41, NOW(), '2025-10-01', 3, 6900.00, 'SUCCESS', NOW(), NOW()),
(42, 42, NOW(), '2025-11-01', 4, 8800.00, 'SUCCESS', NOW(), NOW()),
(43, 43, NOW(), '2025-12-01', 1, 1500.00, 'SUCCESS', NOW(), NOW()),
(44, 44, NOW(), '2025-01-01', 2, 4400.00, 'FAILED', NOW(), NOW()),
(45, 45, NOW(), '2025-02-01', 5, 11500.00, 'SUCCESS', NOW(), NOW()),
(46, 46, NOW(), '2025-03-01', 4, 8800.00, 'SUCCESS', NOW(), NOW()),
(47, 47, NOW(), '2025-04-01', 3, 6900.00, 'SUCCESS', NOW(), NOW()),
(48, 48, NOW(), '2025-05-01', 2, 4600.00, 'SUCCESS', NOW(), NOW()),
(49, 49, NOW(), '2025-06-01', 1, 1500.00, 'SUCCESS', NOW(), NOW()),
(50, 50, NOW(), '2025-07-01', 2, 4400.00, 'SUCCESS', NOW(), NOW());



INSERT INTO Payment ( payment_date, amount, payment_method, payment_status, transaction_id) VALUES
( NOW(), 2400.00, 'GCASH', 'SUCCESS', 'TXN12345678'),
( NOW(), 8000.00, 'GCASH', 'SUCCESS', 'TXN12345679'),
(NOW(), 4500.00, 'GCASH', 'SUCCESS', 'TXN12345680'),
( NOW(), 9000.00, 'GCASH', 'FAILED', 'TXN12345681'),
( NOW(), 4400.00, 'GCASH', 'SUCCESS', 'TXN12345682'),
( NOW(), 5200.00, 'GCASH', 'SUCCESS', 'TXN12345683'),
( NOW(), 1400.00, 'GCASH', 'SUCCESS', 'TXN12345684'),
( NOW(), 6600.00, 'GCASH', 'FAILED', 'TXN12345685'),
( NOW(), 2800.00, 'GCASH', 'SUCCESS', 'TXN12345686'),
( NOW(), 1500.00, 'GCASH', 'SUCCESS', 'TXN12345687'),
( NOW(), 8800.00, 'GCASH', 'SUCCESS', 'TXN12345688'),
( NOW(), 4400.00, 'GCASH', 'SUCCESS', 'TXN12345689'),
( NOW(), 6300.00, 'GCASH', 'SUCCESS', 'TXN12345690'),
( NOW(), 4600.00, 'GCASH', 'SUCCESS', 'TXN12345691'),
( NOW(), 11000.00, 'GCASH', 'FAILED', 'TXN12345692'),
( NOW(), 1500.00, 'GCASH', 'SUCCESS', 'TXN12345693'),
( NOW(), 8800.00, 'GCASH', 'SUCCESS', 'TXN12345694'),
( NOW(), 6900.00, 'GCASH', 'SUCCESS', 'TXN12345695'),
( NOW(), 3800.00, 'GCASH', 'FAILED', 'TXN12345696'),
( NOW(), 2500.00, 'GCASH', 'SUCCESS', 'TXN12345697'),
( NOW(), 8800.00, 'GCASH', 'SUCCESS', 'TXN12345698'),
( NOW(), 5400.00, 'GCASH', 'SUCCESS', 'TXN12345699'),
( NOW(), 4400.00, 'GCASH', 'SUCCESS', 'TXN12345700'),
( NOW(), 1600.00, 'GCASH', 'SUCCESS', 'TXN12345701'),
( NOW(), 11500.00, 'GCASH', 'FAILED', 'TXN12345702'),
( NOW(), 4200.00, 'GCASH', 'SUCCESS', 'TXN12345703'),
( NOW(), 6300.00, 'GCASH', 'SUCCESS', 'TXN12345704'),
( NOW(), 8800.00, 'GCASH', 'SUCCESS', 'TXN12345705'),
( NOW(), 4600.00, 'GCASH', 'SUCCESS', 'TXN12345706'),
( NOW(), 1600.00, 'GCASH', 'SUCCESS', 'TXN12345707'),
( NOW(), 8800.00, 'GCASH', 'SUCCESS', 'TXN12345708'),
( NOW(), 6300.00, 'GCASH', 'FAILED', 'TXN12345709'),
( NOW(), 4400.00, 'GCASH', 'SUCCESS', 'TXN12345710'),
( NOW(), 1600.00, 'GCASH', 'SUCCESS', 'TXN12345711'),
( NOW(), 8800.00, 'GCASH', 'SUCCESS', 'TXN12345712'),
( NOW(), 6900.00, 'GCASH', 'SUCCESS', 'TXN12345713'),
( NOW(), 3800.00, 'GCASH', 'SUCCESS', 'TXN12345714'),
( NOW(), 1500.00, 'GCASH', 'SUCCESS', 'TXN12345715'),
( NOW(), 11500.00, 'GCASH', 'FAILED', 'TXN12345716'),
( NOW(), 4600.00, 'GCASH', 'SUCCESS', 'TXN12345717'),
( NOW(), 6900.00, 'GCASH', 'SUCCESS', 'TXN12345718'),
( NOW(), 8800.00, 'GCASH', 'SUCCESS', 'TXN12345719'),
( NOW(), 1500.00, 'GCASH', 'SUCCESS', 'TXN12345720'),
( NOW(), 4400.00, 'GCASH', 'FAILED', 'TXN12345721'),
( NOW(), 11500.00, 'GCASH', 'SUCCESS', 'TXN12345722'),
( NOW(), 8800.00, 'GCASH', 'SUCCESS', 'TXN12345723'),
( NOW(), 6900.00, 'GCASH', 'SUCCESS', 'TXN12345724'),
( NOW(), 4600.00, 'GCASH', 'SUCCESS', 'TXN12345725'),
( NOW(), 1500.00, 'GCASH', 'SUCCESS', 'TXN12345726'),
( NOW(), 4400.00, 'GCASH', 'SUCCESS', 'TXN12345727');



INSERT INTO Reviews (user_id, tour_id, rating, comment, created_at) VALUES
(1, 1, 5, 'Amazing experience! The views were breathtaking, and the guide was very knowledgeable.', NOW()),
(2, 2, 4, 'Good trip, but some of the activities were too rushed. Still a great experience overall.', NOW()),
(3, 3, 5, 'One of the best tours I’ve ever been on! The destinations were perfect and well planned.', NOW()),
(4, 4, 3, 'The tour was decent, but there were too many delays. Could have been better organized.', NOW()),
(5, 5, 4, 'The tour was great, but I wish there was more time to explore some of the sights.', NOW()),
(6, 6, 5, 'Wonderful! Loved every minute of it. The accommodations were top-notch.', NOW()),
(7, 7, 4, 'Had a good time, but some parts of the tour could have been better communicated.', NOW()),
(8, 8, 2, 'Not what I expected. A few of the destinations were closed when we arrived.', NOW()),
(9, 9, 5, 'This tour exceeded my expectations! Every stop was well worth it.', NOW()),
(10, 10, 3, 'The itinerary was great, but the food options were disappointing.', NOW()),
(11, 11, 4, 'Really enjoyed the tour. A few minor hiccups, but overall a great experience.', NOW()),
(12, 12, 5, 'Fantastic experience! The best part was the local food and cultural immersion.', NOW()),
(13, 13, 4, 'Good value for money, but some parts of the tour felt a little rushed.', NOW()),
(14, 14, 5, 'Excellent tour! Everything was well-organized, and the guides were superb.', NOW()),
(15, 15, 3, 'The destinations were great, but the transportation could have been more comfortable.', NOW()),
(16, 16, 5, 'A memorable experience! We had a fantastic time exploring and learning about the history.', NOW()),
(17, 17, 4, 'Really enjoyed the trip. Would have liked more time to explore some locations.', NOW()),
(18, 18, 2, 'The tour was disappointing. There was a lot of downtime and not enough to do.', NOW()),
(19, 19, 5, 'Amazing experience! The wildlife was stunning, and the tour guides were very informative.', NOW()),
(20, 20, 4, 'Great tour! A bit overpriced for what we got, but still a great experience overall.', NOW()),
(21, 21, 5, 'The best trip I’ve ever taken! Highly recommend it to anyone interested in history and culture.', NOW()),
(22, 22, 4, 'Very good overall. A few minor hiccups but would still do it again!', NOW()),
(23, 23, 5, 'Incredible experience! The tour was smooth, and the food was incredible.', NOW()),
(24, 24, 3, 'The tour was okay. The guide was knowledgeable, but I expected more activities.', NOW()),
(25, 25, 5, 'Amazing trip! The hiking and scenery were stunning. Couldn’t have asked for more.', NOW()),
(26, 26, 4, 'Nice tour, though there were some logistical issues with transportation.', NOW()),
(27, 27, 5, 'The experience was unforgettable! Truly a once-in-a-lifetime adventure.', NOW()),
(28, 28, 5, 'Loved every part of the journey! The local food and sights were amazing.', NOW()),
(29, 29, 4, 'Good trip, but the accommodation could have been better.', NOW()),
(30, 30, 3, 'Decent trip, but the itinerary didn’t live up to the hype.', NOW()),
(31, 31, 5, 'Absolutely loved this tour! The trekking was challenging but worth every moment.', NOW()),
(32, 32, 4, 'Good tour, but the transportation was not very comfortable at times.', NOW()),
(33, 33, 5, 'Unforgettable experience! I will recommend this tour to everyone I know.', NOW()),
(34, 34, 4, 'The tour was good, but I wish we could have spent more time in each location.', NOW()),
(35, 35, 2, 'Not worth the money. The tour was underwhelming, and I felt like I was constantly rushed.', NOW()),
(36, 36, 5, 'Incredible! The guide was friendly, and the itinerary was perfect.', NOW()),
(37, 37, 3, 'The tour was okay, but the timing was off and there were some delays.', NOW()),
(38, 38, 5, 'This was one of the best tours I’ve done. Every detail was perfectly arranged.', NOW()),
(39, 39, 4, 'The trip was good, but we didn’t have enough time to enjoy each stop.', NOW()),
(40, 40, 5, 'Wonderful trip! Everything was well-organized, and the food was amazing.', NOW()),
(41, 41, 5, 'Absolutely incredible! From the breathtaking views to the cultural immersion, it was perfect.', NOW()),
(42, 42, 4, 'Good tour overall, but I wish there was more to do in the evenings.', NOW()),
(43, 43, 5, 'One of the best trips I’ve ever taken! Would definitely recommend to others.', NOW()),
(44, 44, 2, 'The tour didn’t meet my expectations. The itinerary was poorly planned.', NOW()),
(45, 45, 3, 'The trip was okay, but I expected more of an adventure. A lot of downtime.', NOW()),
(46, 46, 4, 'Good overall. The group was friendly, and the tour was well-planned, but a bit short.', NOW()),
(47, 47, 5, 'What an amazing experience! Highly recommend this tour for anyone interested in nature.', NOW()),
(48, 48, 5, 'This was an unforgettable adventure. The views and culture were beyond my expectations.', NOW()),
(49, 49, 4, 'The trip was fun, but the transport wasn’t as comfortable as expected.', NOW()),
(50, 50, 5, 'An amazing journey through the mountains. The guide was knowledgeable and the views were stunning.', NOW());



INSERT INTO AdminLogs (admin_id, action_type, description, timestamp) VALUES
(1, 'ADD', 'Added new tour to the database', NOW()),
(2, 'UPDATE', 'Updated the details of the tour "Beach Paradise"', NOW()),
(3, 'DELETE', 'Deleted a booking for user 12', NOW()),
(4, 'ADD', 'Added a new payment method for user 8', NOW()),
(5, 'UPDATE', 'Updated the booking status for booking ID 3', NOW()),
(6, 'DELETE', 'Deleted a review for tour ID 5', NOW()),
(7, 'UPDATE', 'Modified user information for user ID 6', NOW()),
(8, 'ADD', 'Added a new tour "Mountain Adventure"', NOW()),
(9, 'DELETE', 'Deleted payment record for transaction ID "TXN12345678"', NOW()),
(10, 'UPDATE', 'Updated user role for user ID 2 to ADMIN', NOW()),
(11, 'ADD', 'Created a new user account for user 15', NOW()),
(12, 'DELETE', 'Removed tour ID 10 from the available tours', NOW()),
(13, 'UPDATE', 'Modified booking information for booking ID 7', NOW()),
(14, 'ADD', 'Added a new review for tour ID 14', NOW()),
(15, 'UPDATE', 'Updated payment status for booking ID 20', NOW()),
(16, 'DELETE', 'Deleted user account for user ID 25', NOW()),
(17, 'ADD', 'Added a new discount campaign for tours', NOW()),
(18, 'UPDATE', 'Updated the seats availability for tour ID 17', NOW()),
(19, 'DELETE', 'Removed a payment method from the system', NOW()),
(20, 'ADD', 'Created new booking for user 11', NOW()),
(21, 'UPDATE', 'Updated the start date for tour "Beach Paradise"', NOW()),
(22, 'DELETE', 'Deleted payment record for booking ID 22', NOW()),
(23, 'ADD', 'Added a new review for tour ID 9', NOW()),
(24, 'UPDATE', 'Changed the price for tour ID 12', NOW()),
(25, 'DELETE', 'Deleted booking for user ID 30', NOW()),
(26, 'ADD', 'Created new booking for user ID 14', NOW()),
(27, 'UPDATE', 'Updated review for tour ID 7', NOW()),
(28, 'DELETE', 'Removed admin log with ID 18', NOW()),
(29, 'ADD', 'Added new tour "City Tour"', NOW()),
(30, 'UPDATE', 'Updated payment method for booking ID 31', NOW()),
(31, 'DELETE', 'Deleted a review for tour ID 12', NOW()),
(32, 'ADD', 'Added a new user with role "USERS"', NOW()),
(33, 'UPDATE', 'Modified user role for user ID 40 to ADMIN', NOW()),
(34, 'DELETE', 'Deleted user ID 35 from the system', NOW()),
(35, 'ADD', 'Added a new payment record for booking ID 24', NOW()),
(36, 'UPDATE', 'Updated the payment status for booking ID 35', NOW()),
(37, 'DELETE', 'Removed tour ID 45 from the database', NOW()),
(38, 'ADD', 'Created new booking for user 50', NOW()),
(39, 'UPDATE', 'Updated tour description for tour ID 3', NOW()),
(40, 'DELETE', 'Deleted booking for user ID 23', NOW()),
(41, 'ADD', 'Added new payment method for user 27', NOW()),
(42, 'UPDATE', 'Updated booking information for booking ID 12', NOW()),
(43, 'DELETE', 'Deleted review for tour ID 18', NOW()),
(44, 'ADD', 'Created new tour "Forest Exploration"', NOW()),
(45, 'UPDATE', 'Modified user information for user ID 10', NOW()),
(46, 'DELETE', 'Removed admin user with ID 13', NOW()),
(47, 'ADD', 'Added a new payment record for booking ID 8', NOW()),
(48, 'UPDATE', 'Updated tour price for tour ID 14', NOW()),
(49, 'DELETE', 'Deleted a booking for user 19', NOW()),
(50, 'ADD', 'Created new booking for user ID 5', NOW());



-- Select all data from the User table
SELECT * FROM User;

-- Select all data from the Tours table
SELECT * FROM Tours;

-- Select all data from the Bookings table
SELECT * FROM Bookings;

-- Select all data from the Payment table
SELECT * FROM Payment;

-- Select all data from the Reviews table
SELECT * FROM Reviews;

-- Select all data from the AdminLogs table
SELECT * FROM AdminLogs;



https://github.com/MonetForProgrammingPurposes/DATABASE-WITH-CONSTRAINT.git