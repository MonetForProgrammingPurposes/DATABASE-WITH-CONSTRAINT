-- Connect to MySQL
mysql -u root -p


-- Create Database
CREATE DATABASE eventmanagementdbs;
USE eventmanagementdbs;


-- Create Tables with Constraints


-- Admin Table
CREATE TABLE Admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    admin_username VARCHAR(255),
    admin_email VARCHAR(255),
    admin_password VARCHAR(255)
);


CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_gmail VARCHAR(255),
    user_password VARCHAR(255),
    user_firstname VARCHAR(255),
    user_lastname VARCHAR(255)
);


CREATE TABLE Events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_title VARCHAR(255),
    event_description TEXT,
    event_additional_description TEXT,
    event_address VARCHAR(255),
    event_planner VARCHAR(255),
    event_image VARCHAR(255),
    event_status VARCHAR(255),
    event_start DATE
);


CREATE TABLE Invited (
    invitation_id INT AUTO_INCREMENT PRIMARY KEY,
    invited_name VARCHAR(255),
    event_id INT,
    attendee_type VARCHAR(255),
    seat_number VARCHAR(255),
    FOREIGN KEY (event_id) REFERENCES Events(event_id) ON DELETE CASCADE
);


CREATE TABLE Attendees (
    attendee_id INT AUTO_INCREMENT PRIMARY KEY,
    invitation_id INT,
    FOREIGN KEY (invitation_id) REFERENCES Invited(invitation_id) ON DELETE CASCADE
);


CREATE TABLE Agenda (
    agenda_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT,
    agenda_name VARCHAR(255),
    agenda_time_start VARCHAR(255),
    agenda_time_end VARCHAR(255),
    FOREIGN KEY (event_id) REFERENCES Events(event_id) ON DELETE CASCADE
);



-- Insert Dummy Records
--




INSERT INTO Admin (admin_username, admin_email, admin_password) VALUES
('admin1', 'admin1@example.com', 'password1'),
('admin2', 'admin2@example.com', 'password2'),
('admin3', 'admin3@example.com', 'password3'),
('admin4', 'admin4@example.com', 'password4'),
('admin5', 'admin5@example.com', 'password5'),
('admin6', 'admin6@example.com', 'password6'),
('admin7', 'admin7@example.com', 'password7'),
('admin8', 'admin8@example.com', 'password8'),
('admin9', 'admin9@example.com', 'password9'),
('admin10', 'admin10@example.com', 'password10'),
('admin11', 'admin11@example.com', 'password11'),
('admin12', 'admin12@example.com', 'password12'),
('admin13', 'admin13@example.com', 'password13'),
('admin14', 'admin14@example.com', 'password14'),
('admin15', 'admin15@example.com', 'password15'),
('admin16', 'admin16@example.com', 'password16'),
('admin17', 'admin17@example.com', 'password17'),
('admin18', 'admin18@example.com', 'password18'),
('admin19', 'admin19@example.com', 'password19'),
('admin20', 'admin20@example.com', 'password20'),
('admin21', 'admin21@example.com', 'password21'),
('admin22', 'admin22@example.com', 'password22'),
('admin23', 'admin23@example.com', 'password23'),
('admin24', 'admin24@example.com', 'password24'),
('admin25', 'admin25@example.com', 'password25'),
('admin26', 'admin26@example.com', 'password26'),
('admin27', 'admin27@example.com', 'password27'),
('admin28', 'admin28@example.com', 'password28'),
('admin29', 'admin29@example.com', 'password29'),
('admin30', 'admin30@example.com', 'password30'),
('admin31', 'admin31@example.com', 'password31'),
('admin32', 'admin32@example.com', 'password32'),
('admin33', 'admin33@example.com', 'password33'),
('admin34', 'admin34@example.com', 'password34'),
('admin35', 'admin35@example.com', 'password35'),
('admin36', 'admin36@example.com', 'password36'),
('admin37', 'admin37@example.com', 'password37'),
('admin38', 'admin38@example.com', 'password38'),
('admin39', 'admin39@example.com', 'password39'),
('admin40', 'admin40@example.com', 'password40'),
('admin41', 'admin41@example.com', 'password41'),
('admin42', 'admin42@example.com', 'password42'),
('admin43', 'admin43@example.com', 'password43'),
('admin44', 'admin44@example.com', 'password44'),
('admin45', 'admin45@example.com', 'password45'),
('admin46', 'admin46@example.com', 'password46'),
('admin47', 'admin47@example.com', 'password47'),
('admin48', 'admin48@example.com', 'password48'),
('admin49', 'admin49@example.com', 'password49'),
('admin50', 'admin50@example.com', 'password50');




INSERT INTO User (user_gmail, user_password, user_firstname, user_lastname) VALUES
('user1@gmail.com', 'userpassword1', 'John', 'Doe'),
('user2@gmail.com', 'userpassword2', 'Jane', 'Smith'),
('user3@gmail.com', 'userpassword3', 'Tom', 'Brown'),
('user4@gmail.com', 'userpassword4', 'Emma', 'Jones'),
('user5@gmail.com', 'userpassword5', 'James', 'Taylor'),
('user6@gmail.com', 'userpassword6', 'Sophia', 'Davis'),
('user7@gmail.com', 'userpassword7', 'Lucas', 'Miller'),
('user8@gmail.com', 'userpassword8', 'Lily', 'Wilson'),
('user9@gmail.com', 'userpassword9', 'Ethan', 'Moore'),
('user10@gmail.com', 'userpassword10', 'Chloe', 'Anderson'),
('user11@gmail.com', 'userpassword11', 'Mason', 'Thomas'),
('user12@gmail.com', 'userpassword12', 'Amelia', 'Jackson'),
('user13@gmail.com', 'userpassword13', 'Aiden', 'White'),
('user14@gmail.com', 'userpassword14', 'Isabella', 'Harris'),
('user15@gmail.com', 'userpassword15', 'Liam', 'Clark'),
('user16@gmail.com', 'userpassword16', 'Aria', 'Lewis'),
('user17@gmail.com', 'userpassword17', 'Oliver', 'Young'),
('user18@gmail.com', 'userpassword18', 'Madison', 'King'),
('user19@gmail.com', 'userpassword19', 'Alexander', 'Scott'),
('user20@gmail.com', 'userpassword20', 'Grace', 'Green'),
('user21@gmail.com', 'userpassword21', 'Daniel', 'Adams'),
('user22@gmail.com', 'userpassword22', 'Charlotte', 'Baker'),
('user23@gmail.com', 'userpassword23', 'Henry', 'Nelson'),
('user24@gmail.com', 'userpassword24', 'Mila', 'Carter'),
('user25@gmail.com', 'userpassword25', 'Jacob', 'Mitchell'),
('user26@gmail.com', 'userpassword26', 'Luna', 'Perez'),
('user27@gmail.com', 'userpassword27', 'Wyatt', 'Roberts'),
('user28@gmail.com', 'userpassword28', 'Zoey', 'Gonzalez'),
('user29@gmail.com', 'userpassword29', 'Leo', 'Wilson'),
('user30@gmail.com', 'userpassword30', 'Harper', 'Garcia'),
('user31@gmail.com', 'userpassword31', 'Jackson', 'Rodriguez'),
('user32@gmail.com', 'userpassword32', 'Victoria', 'Martinez'),
('user33@gmail.com', 'userpassword33', 'Sebastian', 'Hernandez'),
('user34@gmail.com', 'userpassword34', 'Evelyn', 'Lopez'),
('user35@gmail.com', 'userpassword35', 'Jack', 'Gonzalez'),
('user36@gmail.com', 'userpassword36', 'Ella', 'Walker'),
('user37@gmail.com', 'userpassword37', 'Matthew', 'Hall'),
('user38@gmail.com', 'userpassword38', 'Scarlett', 'Allen'),
('user39@gmail.com', 'userpassword39', 'Jackson', 'Sanchez'),
('user40@gmail.com', 'userpassword40', 'Leah', 'Wright'),
('user41@gmail.com', 'userpassword41', 'Nathan', 'King'),
('user42@gmail.com', 'userpassword42', 'Zoe', 'Lopez'),
('user43@gmail.com', 'userpassword43', 'Gabriel', 'Hill'),
('user44@gmail.com', 'userpassword44', 'Ava', 'Adams'),
('user45@gmail.com', 'userpassword45', 'Owen', 'Davis'),
('user46@gmail.com', 'userpassword46', 'Piper', 'Garcia'),
('user47@gmail.com', 'userpassword47', 'Evan', 'Clark'),
('user48@gmail.com', 'userpassword48', 'Sophie', 'Baker'),
('user49@gmail.com', 'userpassword49', 'Lucas', 'Nelson'),
('user50@gmail.com', 'userpassword50', 'Zara', 'Roberts');



INSERT INTO Events (event_title, event_description, event_additional_description, event_address, event_planner, event_image, event_status, event_start) VALUES
('Music Concert', 'Outdoor music concert with live performances.', 'Featuring various musical genres.', '123 Concert Ave, Music City', 'Live Events Group', 'music_concert.jpg', 'Upcoming', '2024-10-10'),
('Photography Exhibit', 'Exhibition of contemporary photography.', 'Stunning visuals from top photographers.', '456 Art St, City Center', 'Gallery Showcase', 'photography_exhibit.jpg', 'Active', '2024-09-20'),
('Food and Wine Tasting', 'An evening of wine tasting and gourmet food.', 'Sample fine wines and dishes from renowned chefs.', '789 Vineyard Rd, Wine Town', 'Epicurean Events', 'food_wine_tasting.jpg', 'Active', '2024-10-05'),
('Flea Market', 'Monthly outdoor flea market featuring local vendors.', 'Vintage finds, clothes, and antiques.', '101 Flea Market Rd, Town Square', 'Flea Market Org', 'flea_market.jpg', 'Active', '2024-09-25'),
('Virtual Networking Event', 'Online networking event for professionals.', 'Virtual rooms for one-on-one chats and group discussions.', 'Online Event', 'Digital Networkers', 'virtual_networking.jpg', 'Upcoming', '2024-11-02'),
('Environmental Summit', 'Conference on sustainable living practices.', 'Discussions on climate change and green technologies.', '222 Greenway Ave, Eco Park', 'Eco Awareness', 'environmental_summit.jpg', 'Upcoming', '2024-10-28'),
('Comic Convention', 'Annual comic book and pop culture convention.', 'Panels, cosplay, and merchandise.', '333 Comic Con Blvd, Pop Town', 'Geek Events', 'comic_convention.jpg', 'Upcoming', '2024-11-01'),
('Dance Party', 'All-night dance party with DJ performances.', 'House music, techno, and EDM all night long.', '444 Dance Ave, Night City', 'Party Planners', 'dance_party.jpg', 'Active', '2024-09-30'),
('Literary Festival', 'Festival celebrating literature and storytelling.', 'Author talks, book signings, and performances.', '555 Book Lane, Literary City', 'Wordsmith Events', 'literary_festival.jpg', 'Upcoming', '2024-11-10'),
('Yoga Retreat', 'Weekend retreat focused on relaxation and wellness.', 'Daily yoga classes, mindfulness exercises, and organic meals.', '666 Serenity Rd, Peaceville', 'Zen Retreats', 'yoga_retreat.jpg', 'Active', '2024-10-18'),
('New Year’s Eve Party', 'Ring in the new year with a grand celebration.', 'Live music, fireworks, and a midnight toast.', '777 Celebration Ave, City Center', 'Event Experts', 'new_year_party.jpg', 'Upcoming', '2024-12-31'),
('Street Art Festival', 'A festival showcasing street artists and live graffiti.', 'Live art installations, music, and performances.', '888 Street Art Rd, Urban District', 'Art Collective', 'street_art_festival.jpg', 'Upcoming', '2024-10-15'),
('Winter Wonderland', 'A magical winter festival with lights and ice skating.', 'Ice sculptures, rides, and hot cocoa stalls.', '999 Winter Blvd, Snowy Hills', 'Winter Events', 'winter_wonderland.jpg', 'Upcoming', '2024-12-05'),
('Game Night', 'Fun-filled evening of board games and trivia.', 'Play games and win prizes in a casual setting.', '101 Game St, Fun City', 'Game Masters', 'game_night.jpg', 'Active', '2024-09-18'),
('Street Food Festival', 'Festival featuring street food from around the world.', 'Taste cuisine from different cultures and countries.', '234 Street Rd, Foodie Town', 'World Food Co.', 'street_food_festival.jpg', 'Active', '2024-10-08'),
('Summer Camp', 'Outdoor summer camp for kids and teens.', 'Camp activities, games, and outdoor adventures.', '345 Campground Rd, Natureville', 'Adventure Camps', 'summer_camp.jpg', 'Upcoming', '2024-07-15'),
('Craft Fair', 'Local artisans showcase their handmade crafts.', 'Handmade jewelry, furniture, and artwork for sale.', '456 Crafts St, Maker City', 'Craft Fairs Inc.', 'craft_fair.jpg', 'Active', '2024-10-14'),
('Auto Show', 'Annual showcase of luxury cars and automotive technology.', 'Car showrooms, test drives, and expert panels.', '567 Auto Blvd, Speed City', 'Car Shows Group', 'auto_show.jpg', 'Upcoming', '2024-11-25'),
('Health Expo', 'Expo for health and wellness products and services.', 'Fitness products, healthcare, and nutrition seminars.', '678 Health St, Wellness Town', 'Health Expo Co.', 'health_expo.jpg', 'Upcoming', '2024-11-07'),
('Pet Adoption Event', 'Event featuring adoptable pets from local shelters.', 'Adopt a pet and support animal welfare organizations.', '789 Pet Rd, Animal Town', 'Animal Rescue Org', 'pet_adoption_event.jpg', 'Active', '2024-10-20'),
('Circus Show', 'A dazzling circus show featuring acrobats and clowns.', 'Performances of juggling, trapeze, and clown acts.', '123 Circus St, Showtown', 'Big Top Productions', 'circus_show.jpg', 'Active', '2024-10-25'),
('Fashion Photography Workshop', 'Workshop for aspiring fashion photographers.', 'Learn from professionals and improve your skills.', '234 Photo Blvd, Art City', 'Creative Workshops', 'fashion_photography.jpg', 'Upcoming', '2024-11-05'),
('Gaming Tournament', 'Competitive gaming tournament with cash prizes.', 'Esports competition featuring top games.', '345 Gaming Blvd, Play City', 'Gaming League', 'gaming_tournament.jpg', 'Upcoming', '2024-11-10'),
('Film Screening & Discussion', 'Private screening followed by a discussion with the director.', 'Q&A session after the screening of an indie film.', '456 Cinema Blvd, Film City', 'Cinema Screening Co.', 'film_screening.jpg', 'Upcoming', '2024-10-12'),
('Outdoor Adventure', 'Hiking, kayaking, and outdoor activities.', 'Join us for a day of adventure in the great outdoors.', '567 Trailhead Rd, Adventure Park', 'Outdoor Adventures', 'outdoor_adventure.jpg', 'Upcoming', '2024-10-22'),
('Cultural Festival', 'Festival celebrating local cultures and traditions.', 'Dance, food, and performances from different cultures.', '678 Culture St, Heritage Town', 'Culture Events', 'cultural_festival.jpg', 'Active', '2024-09-29'),
('Photography Contest', 'Enter the photography contest and win amazing prizes.', 'Submit your best photo and have a chance to win.', '789 Picture Rd, Art City', 'Creative Photography', 'photo_contest.jpg', 'Active', '2024-11-01'),
('Tech Startup Workshop', 'Learn the basics of starting your own tech company.', 'Workshops, funding advice, and networking opportunities.', '890 Startup St, Innovation City', 'Tech Growth', 'tech_startup_workshop.jpg', 'Upcoming', '2024-10-23'),
('Bridal Shower', 'Elegant bridal shower for the bride-to-be.', 'Games, gifts, and plenty of fun for the bride.', '123 Bridal Ave, Wedding City', 'Bridal Events', 'bridal_shower.jpg', 'Active', '2024-10-02'),
('Wine and Jazz Night', 'Evening of jazz music and fine wines.', 'Relax and enjoy a glass of wine while listening to live jazz.', '234 Wine Rd, Music City', 'Vino & Jazz', 'wine_jazz_night.jpg', 'Upcoming', '2024-10-18'),
('Indoor Skiing', 'Indoor ski experience for beginners and experts alike.', 'Skiing and snowboarding in an indoor venue.', '345 Ski Center Rd, Snowtown', 'Winter Sports Co.', 'indoor_skiing.jpg', 'Active', '2024-11-10'),
('Tea Party', 'Elegant afternoon tea event with pastries and tea blends.', 'A relaxed atmosphere with tea and snacks.', '456 Tea Ln, Garden City', 'Tea Lovers', 'tea_party.jpg', 'Upcoming', '2024-10-05'),
('Dance Workshop', 'Workshop for beginners and advanced dancers.', 'Learn new dance styles and improve your technique.', '567 Dance Ave, Rhythm City', 'Dance Academy', 'dance_workshop.jpg', 'Upcoming', '2024-11-08'),
('Vintage Car Rally', 'Classic car rally featuring antique and rare vehicles.', 'Enjoy a day of vintage cars and history.', '678 Vintage Blvd, Classic City', 'Car Lovers', 'vintage_car_rally.jpg', 'Active', '2024-09-12'),
('Camping Weekend', 'Outdoor camping event with hiking, cooking, and games.', 'Get back to nature with a weekend of camping and outdoor fun.', '789 Camp Rd, Wilderness Park', 'Camp Together', 'camping_weekend.jpg', 'Upcoming', '2024-11-15'),
('Winter Fashion Show', 'Fashion show featuring winter collections from top designers.', 'See the latest winter fashion on the runway.', '890 Fashion Blvd, Style City', 'Fashion Forward', 'winter_fashion_show.jpg', 'Active', '2024-12-01'),
('Street Photography Walk', 'Guided walk for street photographers in the city.', 'Capture the essence of the city through your lens.', '123 Walk St, Urban City', 'Photo Walks', 'street_photography.jpg', 'Active', '2024-10-13');



INSERT INTO Attendees (invitation_id) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43),
(44),
(45),
(46),
(47),
(48),
(49),
(50);



INSERT INTO Invited (invited_name, event_id, attendee_type, seat_number) VALUES
('John Brown', 31, 'VIP', 'A1'),
('Sophie Adams', 31, 'General', 'B1'),
('David Lee', 32, 'VIP', 'C1'),
('Lily Harris', 32, 'Attendee', 'D1'),
('James Davis', 33, 'VIP', 'E1'),
('Sarah Clark', 33, 'General', 'F1'),
('Sophia Green', 34, 'Speaker', 'G1'),
('Michael White', 34, 'VIP', 'H1'),
('Lucas Young', 35, 'General', 'I1'),
('Grace Scott', 35, 'VIP', 'J1'),
('Ethan Brown', 36, 'Speaker', 'K1'),
('Olivia Miller', 36, 'VIP', 'L1'),
('Chloe Taylor', 37, 'Attendee', 'M1'),
('James Anderson', 37, 'VIP', 'N1'),
('Emily Walker', 38, 'General', 'O1'),
('Daniel Harris', 38, 'VIP', 'P1'),
('Isabel Roberts', 39, 'Attendee', 'Q1'),
('Ryan Hall', 39, 'VIP', 'R1'),
('Sophia Lewis', 40, 'Speaker', 'S1'),
('Mason White', 40, 'VIP', 'T1'),
('Henry Johnson', 41, 'General', 'U1'),
('Amelia Taylor', 41, 'VIP', 'V1'),
('Charlotte Adams', 42, 'Speaker', 'W1'),
('Lucas Robinson', 42, 'VIP', 'X1'),
('Benjamin King', 43, 'Attendee', 'Y1'),
('Ella Allen', 43, 'VIP', 'Z1'),
('Jackie Martin', 44, 'Speaker', 'A2'),
('Sophia Harris', 44, 'VIP', 'B2'),
('William Lee', 45, 'General', 'C2'),
('Zoe Wilson', 45, 'VIP', 'D2'),
('Aiden Brown', 46, 'Attendee', 'E2'),
('Lucas Adams', 46, 'VIP', 'F2'),
('Sophia Young', 47, 'Speaker', 'G2'),
('Benjamin Hall', 47, 'VIP', 'H2'),
('Lily Johnson', 48, 'Attendee', 'I2'),
('Sebastian Taylor', 48, 'VIP', 'J2'),
('Mason Green', 49, 'Speaker', 'K2'),
('Olivia Evans', 49, 'VIP', 'L2'),
('Grace Clark', 50, 'Attendee', 'M2'),
('Ethan Martin', 50, 'VIP', 'N2');



INSERT INTO Agenda (event_id, agenda_name, agenda_time_start, agenda_time_end) VALUES
(1, 'Opening Remarks', '09:00 AM', '09:30 AM'),
(2, 'Band Performance', '09:30 AM', '11:00 AM'),
(3, 'Audience Interaction', '11:00 AM', '12:00 PM'),
(4, 'Lunch Break', '12:00 PM', '01:00 PM'),
(5, 'Dance Performance', '01:00 PM', '02:00 PM'),
(6, 'Closing Remarks', '02:00 PM', '02:30 PM'),
(7, 'Opening Ceremony', '10:00 AM', '10:30 AM'),
(8, 'Artist Talk', '10:30 AM', '11:30 AM'),
(9, 'Photography Portfolio Review', '11:30 AM', '01:00 PM'),
(10, 'Lunch Break', '01:00 PM', '02:00 PM'),
(11, 'Gallery Walkthrough', '02:00 PM', '04:00 PM'),
(12, 'Closing Ceremony', '04:00 PM', '04:30 PM'),
(13, 'Welcome and Introduction', '06:00 PM', '06:30 PM'),
(14, 'Wine Tasting Session 1', '06:30 PM', '07:30 PM'),
(15, 'Food Pairing 1', '07:30 PM', '08:00 PM'),
(16, 'Wine Tasting Session 2', '08:00 PM', '09:00 PM'),
(17, 'Food Pairing 2', '09:00 PM', '09:30 PM'),
(18, 'Closing Remarks', '09:30 PM', '10:00 PM'),
(19, 'Market Opening', '08:00 AM', '08:30 AM'),
(20, 'Vendor Presentations', '08:30 AM', '12:00 PM'),
(21, 'Lunch Break', '12:00 PM', '01:00 PM'),
(22, 'Live Music Performances', '01:00 PM', '03:00 PM'),
(23, 'Vendor Meet and Greet', '03:00 PM', '04:00 PM'),
(24, 'Closing Remarks', '04:00 PM', '04:30 PM'),
(25, 'Event Kickoff', '09:00 AM', '09:30 AM'),
(26, 'Keynote Speech', '09:30 AM', '10:30 AM'),
(27, 'Networking Break', '10:30 AM', '11:00 AM'),
(28, 'Panel Discussion 1', '11:00 AM', '12:00 PM'),
(29, 'Lunch Break', '12:00 PM', '01:00 PM'),
(30, 'Panel Discussion 2', '01:00 PM', '02:00 PM'),
(31, 'Pitching Sessions', '02:00 PM', '03:30 PM'),
(32, 'Closing Remarks', '03:30 PM', '04:00 PM'),
(33, 'Opening Remarks', '09:00 AM', '09:30 AM'),
(34, 'Yoga Session 1', '09:30 AM', '10:30 AM'),
(35, 'Meditation Session', '10:30 AM', '11:30 AM'),
(36, 'Lunch Break', '12:00 PM', '01:00 PM'),
(37, 'Yoga Session 2', '01:00 PM', '02:00 PM'),
(38, 'Wellness Talk', '02:00 PM', '03:00 PM'),
(39, 'Closing Ceremony', '03:00 PM', '03:30 PM'),
(40, 'Event Kickoff', '09:00 AM', '09:30 AM'),
(41, 'Pitching Session 1', '09:30 AM', '10:30 AM'),
(42, 'Networking Break', '10:30 AM', '11:00 AM'),
(43, 'Pitching Session 2', '11:00 AM', '12:00 PM'),
(44, 'Lunch Break', '12:00 PM', '01:00 PM'),
(45, 'Investor Panel', '01:00 PM', '02:00 PM'),
(46, 'Startup Pitches', '02:00 PM', '03:30 PM'),
(47, 'Closing Remarks', '03:30 PM', '04:00 PM'),
(48, 'Event Introduction', '08:00 AM', '08:30 AM'),
(49, 'Science Projects Showcase', '08:30 AM', '12:00 PM'),
(50, 'Lunch Break', '12:00 PM', '01:00 PM');


-- Select all data from the Admin table
SELECT * FROM Admin;

-- Select all data from the User table
SELECT * FROM User;

-- Select all data from the Events table
SELECT * FROM Events;

-- Select all data from the Invited table
SELECT * FROM Invited;

-- Select all data from the Attendees table
SELECT * FROM Attendees;

-- Select all data from the Agenda table
SELECT * FROM Agenda;

