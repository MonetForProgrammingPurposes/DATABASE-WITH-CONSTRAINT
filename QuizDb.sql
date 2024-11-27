-- Connect to MySQL
mysql -u root -p


-- Create Database
CREATE DATABASE QuizDb;
USE QuizDb;

-- Create Tables with Constraints

-- Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role ENUM('teacher', 'student') NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Quizzes Table
CREATE TABLE Quizzes (
    quiz_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    quiz_code VARCHAR(20) UNIQUE,
    teacher_id INT NOT NULL,
    duration INT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (teacher_id) REFERENCES Users(user_id)
);

-- Questions Table
CREATE TABLE Questions (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    quiz_id INT NOT NULL,
    question_text TEXT NOT NULL,
    question_type ENUM('MCQ', 'True/False', 'Short Answer', 'Multimedia') NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (quiz_id) REFERENCES Quizzes(quiz_id) ON DELETE CASCADE
);

-- Options Table (for MCQ Questions)
CREATE TABLE Options (
    option_id INT AUTO_INCREMENT PRIMARY KEY,
    question_id INT NOT NULL,
    option_text VARCHAR(255) NOT NULL,
    is_correct BOOLEAN DEFAULT 0,
    FOREIGN KEY (question_id) REFERENCES Questions(question_id) ON DELETE CASCADE
);

-- Answers Table
CREATE TABLE Answers (
    answer_id INT AUTO_INCREMENT PRIMARY KEY,
    question_id INT NOT NULL,
    student_id INT,
    answer_text TEXT NOT NULL,
    submitted_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (question_id) REFERENCES Questions(question_id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES Users(user_id)
);

-- Results Table
CREATE TABLE Results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    quiz_id INT NOT NULL,
    student_id INT NOT NULL,
    score DECIMAL(5,2),
    submitted_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (quiz_id) REFERENCES Quizzes(quiz_id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES Users(user_id)
);

-- Insert Dummy Records


-- Insert Dummy Users
INSERT INTO Users (name, email, password, role) VALUES
('Johan Liebert', 'johan@liebert.com', 'password123', 'teacher'),
('Miyagi Ryouta', 'miyagi@shohoku.com', 'password123', 'student'),
('Vincent Van Gogh', 'vincent@vangogh.com', 'password123', 'teacher'),
('God Usopp', 'god@usopp.com', 'password123', 'student'),
('Levi Ackerman', 'levi@ackerman.com', 'password123', 'teacher'),
('Son Goku', 'son@goku.com', 'password123', 'student'),
('Andrew Garfield', 'andrew@garfield.com', 'password123', 'student'),
('Bumble Bee', 'bumble@bee.com', 'password123', 'teacher'),
('Erwin Smith', 'erwin@smith.com', 'password123', 'teacher'),
('Elsa', 'elsa@ex.com', 'password123', 'student'),
('Stephen Curry', 'steph@curry.com', 'password123', 'student'),
('Albert Einstein', 'albert@einstein.com', 'password123', 'teacher'),
('Saitama Sensei', 'saitama@sensei.com', 'password123', 'student'),
('Legolas Greenleaf', 'legolas@pogii.com', 'password123', 'teacher'),
('Naruto Uzumaki', 'naruto@uzumaki.com', 'password123', 'student'),
('Rukawa Kaede', 'rukawa@shohoku.com', 'password123', 'student'),
('Megan Fox', 'megan@fox.com', 'password123', 'student'),
('Peter Parker', 'peter@parker.com', 'password123', 'student'),
('Bruno Mars', 'bruno@mars', 'password123', 'student'),
('Thirdy Gayares', 'thir@dy.com', 'password123', 'teacher'),
('Roy Mustang', 'roy@mustang.com', 'password123', 'student'),
('Kenshin Himura', 'kenshin@himura.com', 'password123', 'student'),
('Stephen Strange', 'stephen@strange.com', 'password123', 'student'),
('Chris Evans', 'chris@evans.com', 'password123', 'student'),
('Jack Sparrow', 'jack@sparrow.com', 'password123', 'student'),
('Bruce Wayne', 'bruce@wayne.com', 'password123', 'student'),
('Clark Kent', 'clark@kent.com', 'password123', 'student'),
('Roronoa Zoro', 'zoro@roronoa.com', 'password123', 'student'),
('Akashi Seijuro', 'akashi@rakuzan.com', 'password123', 'student'),
('Gollum', 'gollum@lotr.com', 'password123', 'student'),
('Fedelina Nicolas', 'fed@nicolas', 'password123', 'student'),
('Tony Stark', 'tony@stark.com', 'password123', 'student'),
('Claude Monet', 'claude@monet.com', 'password123', 'student'),
('Shalom Harlow', 'sharlom@ex.com', 'password123', 'student'),
('Kyrie Irving', 'kyrie@irving.com', 'password123', 'student'),
('Light Yagami', 'light@yagami.com', 'password123', 'teacher'),
('Jennifer Lawrence', 'jennifer@lawrence.com', 'password123', 'student'),
('Zayn Malik', 'zayn@malik.com', 'password123', 'student'),
('Kyle Kuzma', 'kyle@ex.com', 'password123', 'student'),
('Giannis Antetokounmpo', 'giannis@ex.com', 'password123', 'student'),
('Lolo Santis', 'lolo@santis.com', 'password123', 'student'),
('Thomas Edison', 'tomas@edison.com', 'password123', 'teacher'),
('Griffith', 'griffith@ex.com', 'password123', 'student'),
('Guts', 'guts@ex.com', 'password123', 'student'),
('Thorfinn', 'thor@finn.com', 'password123', 'student'),
('Ella Johnson', 'ella@johnson.com', 'password123', 'student'),
('Jake Turner', 'jake@turner.com', 'password123', 'student'),
('Sophia Lee', 'sophia@lee.com', 'password123', 'student'),
('Mason Harris', 'mason@harris.com', 'password123', 'student'),
('Lily Adams', 'lily@adams.com', 'password123', 'student');



-- Insert 50 Dummy Quizzes
INSERT INTO Quizzes (title, description, quiz_code, teacher_id, duration) VALUES
('Law', 'Law quiz covering legal principles and concepts', 'LAW001', 36, 30),
('Science', 'Science fundamentals', 'SCI001', 11, 25),
('History', 'History quiz from ancient to modern times', 'HIST001', 9, 40),
('Electrical Engineering', 'Electrical Engineering questions from around the world', 'EE001', 13, 35),
('Physics', 'Quiz on classical mechanics and thermodynamics', 'PHY001', 32, 45),
('Psychology', 'Introduction to psychology concepts', 'PSY001', 1, 30),
('Chemistry', 'Basic chemistry principles', 'CHEM001', 5, 40),
('Computer Science', 'Quiz on programming and algorithms', 'CS001', 20, 30),
('Biology Fundamentals', 'Quiz covering basic biology concepts', 'BIO001', 14, 50),
('Art', 'Quiz about world art and culture', 'ART001', 3, 25),
('Law', 'Law quiz covering criminal law and offenses', 'LAW002', 36, 40),
('Science', 'Science quiz on physics and chemistry', 'SCI002', 11, 30),
('History', 'Quiz on world history events', 'HIST002', 9, 35),
('Electrical Engineering', 'Electrical Engineering quiz on continents and oceans', 'EE002', 13, 30),
('Physics', 'Physics quiz on electromagnetism and waves', 'PHY002', 32, 40),
('Psychology', 'Psychology quiz on human behavior', 'PSY002', 1, 35),
('Chemistry', 'Organic chemistry basics', 'CHEM002', 5, 50),
('Computer Science', 'Computer science basics and algorithms', 'CS002', 20, 40),
('Biology Fundamentals', 'Quiz on animal and plant biology', 'BIO002', 14, 45),
('Art', 'Art history and famous artists quiz', 'ART002', 3, 30),
('Law', 'Law quiz on constitutional law and rights', 'LAW003', 36, 45),
('Science', 'Science quiz on biology and physics', 'SCI003', 11, 40),
('History', 'Quiz on ancient civilizations', 'HIST003', 9, 30),
('Electrical Engineering', 'Quiz on capitals and world landmarks', 'EE003', 13, 50),
('Physics', 'Quiz on quantum mechanics and relativity', 'PHY003', 32, 35),
('Psychology', 'Psychological theories and studies', 'PSY003', 1, 40),
('Chemistry', 'Chemical reactions and bonding quiz', 'CHEM003', 5, 45),
('Computer Science', 'Quiz on data structures and algorithms', 'CS003', 20, 50),
('Biology Fundamentals', 'Genetics and microbiology quiz', 'BIO003', 14, 30),
('Art', 'Modern art movements quiz', 'ART003', 3, 40),
('Law', 'Law of torts and civil liabilities quiz', 'LAW004', 36, 30),
('Science', 'General science quiz for beginners', 'SCI004', 11, 25),
('History', 'Quiz on important historical figures', 'HIST004', 9, 45),
('Electrical Engineering', 'Countries and their flags quiz', 'EE004', 13, 40),
('Physics', 'Physics quiz on thermodynamics and optics', 'PHY004', 32, 30),
('Psychology', 'Personality theories in psychology', 'PSY004', 1, 35),
('Chemistry', 'Quiz on acids, bases, and pH', 'CHEM004', 5, 50),
('Computer Science', 'Programming languages quiz', 'CS004', 20, 35),
('Biology Fundamentals', 'Quiz on human anatomy', 'BIO004', 14, 40),
('Art', 'Art techniques and materials quiz', 'ART004', 3, 25),
('Law', 'Applied law in real-life scenarios', 'LAW005', 36, 45),
('Science', 'Astronomy and space exploration quiz', 'SCI005', 11, 40),
('History', 'Quiz on world wars and conflicts', 'HIST005', 9, 35),
('Electrical Engineering', 'Environmental electrical engineering quiz', 'EE005', 13, 30),
('Physics', 'Quiz on particle physics and standard model', 'PHY005', 32, 50),
('Psychology', 'Cognitive psychology and learning', 'PSY005', 1, 30),
('Chemistry', 'Chemistry of everyday life quiz', 'CHEM005', 5, 40),
('Computer Science', 'Computer networks and security quiz', 'CS005', 20, 45),
('Biology Fundamentals', 'Evolution and ecology quiz', 'BIO005', 14, 50),
('Art', 'Famous sculptures and painters quiz', 'ART005', 3, 30);



-- Insert Dummy Questions
INSERT INTO Questions (quiz_id, question_text, question_type) VALUES
(1, 'What is behaviorism?', 'MCQ'),
(1, 'What is classical conditioning?', 'MCQ'),
(1, 'Who is the father of modern psychology?', 'MCQ'),
(1, 'What does cognitive psychology study?', 'MCQ'),
(1, 'What is positive reinforcement?', 'MCQ'),

(2, 'Who painted the Mona Lisa?', 'MCQ'),
(2, 'Which artist is known for the technique of chiaroscuro?', 'MCQ'),
(2, 'What is the term for painting on wet plaster?', 'MCQ'),
(2, 'What is surrealism in art?', 'MCQ'),
(2, 'Who is considered the father of modern art?', 'MCQ'),

(3, 'What is the atomic number of Oxygen?', 'MCQ'),
(3, 'What is a covalent bond?', 'MCQ'),
(3, 'What is the chemical formula for water?', 'MCQ'),
(3, 'What is the pH level of pure water?', 'MCQ'),
(3, 'What is the process of oxidation?', 'MCQ'),

(4, 'Who was the first president of the Philippines?', 'MCQ'),
(4, 'What year did the Philippine Revolution begin?', 'MCQ'),
(4, 'What is the significance of the Philippine Independence Day?', 'MCQ'),
(4, 'Who was the leader of the Philippines during World War II?', 'MCQ'),
(4, 'What was the significance of the People Power Revolution in 1986?', 'MCQ'),

(5, 'What is the second law of thermodynamics?', 'MCQ'),
(5, 'What is Newtons second law of motion?', 'MCQ'),
(5, 'What is the difference between velocity and acceleration?', 'MCQ'),
(5, 'What is the principle of conservation of energy?', 'MCQ'),
(5, 'What is the unit of force in physics?', 'MCQ'),

(6, 'Which unit is used to measure electrical resistance?', 'MCQ'),
(6, 'Which device stores electrical energy in an electric field?', 'MCQ'),
(6, 'Which component controls the flow of current in an electrical circuit?', 'MCQ'),
(6, 'Which unit is used to measure electrical power?', 'MCQ'),
(6, 'Which law defines the relationship between voltage, current, and resistance?', 'MCQ'),

(7, 'What is the difference between prokaryotic and eukaryotic cells?', 'MCQ'),
(7, 'What is the process of photosynthesis?', 'MCQ'),
(7, 'What are the main parts of a cell?', 'MCQ'),
(7, 'What is mitosis?', 'MCQ'),
(7, 'What is the purpose of chlorophyll in plants?', 'MCQ'),

(8, 'Which data structure follows Last In, First Out (LIFO) principle?', 'MCQ'),
(8, 'Which data structure follows First In, First Out (FIFO) principle?', 'MCQ'),
(8, 'Which data structure organizes elements in a hierarchy with at most two child nodes per parent?', 'MCQ'),
(8, 'Which data structure uses a hash function to map keys to values?', 'MCQ'),
(8, 'What term refers to the efficiency of an algorithm in terms of time and space usage?', 'MCQ'),


(9, 'What is the speed of light in kilometers per second?', 'MCQ'),
(9, 'What describes the phenomenon where particles remain connected regardless of distance?', 'MCQ'),
(9, 'What branch of physics studies very small particles?', 'MCQ'),
(9, 'What principle states that position and momentum cannot be precisely measured simultaneously?', 'MCQ'),
(9, 'What principle states that the laws of physics are the same for all observers in uniform motion?', 'MCQ'),

(10, 'What is the difference between civil law and criminal law?', 'MCQ'),
(10, 'What is the rule of law?', 'MCQ'),
(10, 'What is tort law?', 'MCQ'),
(10, 'What is the burden of proof in a criminal case?', 'MCQ'),
(10, 'What is a precedent in the judicial system?', 'MCQ');





-- Insert Dummy Options


-- Disable foreign key checks to avoid constraint issues
SET foreign_key_checks = 0;


-- Insert Dummy Options for Psychology Quiz (quiz_id = 1)

-- Question 1
INSERT INTO Options (question_id, option_text, is_correct) VALUES
(1, 'The study of observable behaviors', 1),
(1, 'The study of mental processes', 0),
(1, 'Focuses on the unconscious mind', 0),
(1, 'Explores emotions and moods', 0),

-- Question 2
(2, 'Learning through stimulus association', 1),
(2, 'Learning by trial and error', 0),
(2, 'A theory of motivation', 0),
(2, 'A form of problem-solving', 0),

-- Question 3
(3, 'Wilhelm Wundt', 1),
(3, 'Sigmund Freud', 0),
(3, 'John Watson', 0),
(3, 'Carl Rogers', 0),

-- Question 4
(4, 'Mental processes', 1),
(4, 'Observable behaviors', 0),
(4, 'Unconscious mind', 0),
(4, 'Biological instincts', 0),

-- Question 5
(5, 'Adding a stimulus to strengthen behavior', 1),
(5, 'Removing a stimulus to weaken behavior', 0),
(5, 'Adding a stimulus to weaken behavior', 0),
(5, 'Removing a stimulus to strengthen behavior', 0);


-- Insert Dummy Options for Art Quiz (quiz_id = 2)
-- Question 1
INSERT INTO Options (question_id, option_text, is_correct) VALUES
(1, 'Vincent Van Gogh', 0),
(1, 'Leonardo da Vinci', 1),
(1, 'Pablo Picasso', 0),
(1, 'Claude Monet', 0),

-- Question 2
(2, 'Caravaggio', 1),
(2, 'Rembrandt', 0),
(2, 'Leonardo da Vinci', 0),
(2, 'Michelangelo', 0),

-- Question 3:
(3, 'Mosaic', 0),
(3, 'Fresco', 1),
(3, 'Oil painting', 0),
(3, 'Watercolor', 0),

-- Question 4
(4, 'A style that depicts dreamlike, irrational imagery', 1),
(4, 'A style focused on geometric shapes and patterns', 0),
(4, 'A movement focusing on realism and details', 0),
(4, 'A technique of painting with bright colors', 0),

-- Question 5
(5, 'Pablo Picasso', 1),
(5, 'Claude Monet', 0),
(5, 'Salvador Dalí', 0),
(5, 'Jackson Pollock', 0);


-- Insert Dummy Options for Chemistry Quiz (quiz_id = 3)
-- Question 1
INSERT INTO Options (question_id, option_text, is_correct) VALUES
(1, '8', 1),
(1, '6', 0),
(1, '12', 0),
(1, '16', 0),

-- Question 2: What is a covalent bond?
(2, 'A bond formed by the sharing of electrons', 1),
(2, 'A bond formed by the transfer of electrons', 0),
(2, 'A bond formed by the attraction of protons', 0),
(2, 'A bond formed by hydrogen ions', 0),

-- Question 3: What is the chemical formula for water?
(3, 'H2O', 1),
(3, 'CO2', 0),
(3, 'O2', 0),
(3, 'H2O2', 0),

-- Question 4: What is the pH level of pure water?
(4, '7', 1),
(4, '5', 0),
(4, '9', 0),
(4, '10', 0),

-- Question 5: What is the process of oxidation?
(5, 'The loss of electrons', 1),
(5, 'The gain of electrons', 0),
(5, 'The loss of protons', 0),
(5, 'The gain of protons', 0);


-- Insert Dummy Options for History Quiz (quiz_id = 4)
-- Question 1: Who was the first president of the Philippines?
INSERT INTO Options (question_id, option_text, is_correct) VALUES
(1, 'Emilio Aguinaldo', 1),
(1, 'Manuel L. Quezon', 0),
(1, 'Sergio Osmeña', 0),
(1, 'Jose P. Laurel', 0),

-- Question 2: What year did the Philippine Revolution begin?
(2, '1896', 1),
(2, '1946', 0),
(2, '1941', 0),
(2, '1965', 0),

-- Question 3: What is the significance of the Philippine Independence Day?
(3, 'Marks the declaration of independence from Spain', 1),
(3, 'Marks the victory of the Philippine-American War', 0),
(3, 'Marks the day the Constitution was enacted', 0),
(3, 'Marks the start of Martial Law', 0),

-- Question 4: Who was the leader of the Philippines during World War II?
(4, 'Manuel L. Quezon', 1),
(4, 'Ferdinand Marcos', 0),
(4, 'Sergio Osmeña', 0),
(4, 'Emilio Aguinaldo', 0),

-- Question 5: What was the significance of the People Power Revolution in 1986?
(5, 'Restored democracy and ousted Ferdinand Marcos', 1),
(5, 'Led to the establishment of Martial Law', 0),
(5, 'Marked the declaration of independence from the United States', 0),
(5, 'Led to the signing of the 1987 Constitution', 0);


-- Insert Dummy Options for Question ID 5 (Physics questions)
INSERT INTO Options (question_id, option_text, is_correct) VALUES
(1, '299,792', 1),
(1, '300,000', 0),
(1, '150,000', 0),
(1, '100,000', 0),

-- Question 2
(2, 'Quantum entanglement', 1),
(2, 'Quantum superposition', 0),
(2, 'Wave-particle duality', 0),
(2, 'Heisenberg principle', 0),

-- Question 3
(3, 'Quantum mechanics', 1),
(3, 'Classical mechanics', 0),
(3, 'Thermodynamics', 0),
(3, 'Optics', 0),

-- Question 4
(4, 'Uncertainty principle', 1),
(4, 'Relativity principle', 0),
(4, 'Conservation principle', 0),
(4, 'Exclusion principle', 0),

-- Question 5
(5, 'Principle of relativity', 1),
(5, 'Uncertainty principle', 0),
(5, 'Superposition principle', 0),
(5, 'Equivalence principle', 0);



-- Insert Dummy Options for Electrical Engineering questions
INSERT INTO Options (question_id, option_text, is_correct) VALUES
(1, 'Ohm', 0),
(1, 'Volt', 0),
(1, 'Ampere', 0),
(1, 'Ohm Meter', 1),

(2, 'Capacitor', 1),
(2, 'Inductor', 0),
(2, 'Resistor', 0),
(2, 'Diode', 0),

(3, 'Resistor', 1),
(3, 'Capacitor', 0),
(3, 'Inductor', 0),
(3, 'Battery', 0),

(4, 'Watt', 1),
(4, 'Volt', 0),
(4, 'Ampere', 0),
(4, 'Ohm', 0),

(5, 'Kirchhoff’s Law', 0),
(5, 'Ohm’s Law', 1),
(5, 'Coulomb’s Law', 0),
(5, 'Faraday’s Law', 0);


-- Insert Dummy Options for Biology Fundamentals questions
INSERT INTO Options (question_id, option_text, is_correct) VALUES

-- Question 1
(1, 'Prokaryotes lack a nucleus, eukaryotes have one', 1),
(1, 'Prokaryotes have a nucleus, eukaryotes lack one', 0),
(1, 'Both have a nucleus', 0),
(1, 'Neither has a nucleus', 0),

-- Question 2
(2, 'Converts sunlight to energy', 1),
(2, 'Breaks down food', 0),
(2, 'Produces oxygen only', 0),
(2, 'Stores nutrients', 0),

-- Question 3
(3, 'Nucleus, cytoplasm, membrane', 1),
(3, 'Chlorophyll, roots, leaves', 0),
(3, 'DNA, RNA, proteins', 0),
(3, 'Enzymes, mitochondria, ribosomes', 0),

-- Question 4
(4, 'Cell division', 1),
(4, 'Protein synthesis', 0),
(4, 'Energy production', 0),
(4, 'Photosynthesis', 0),

-- Question 5
(5, 'Absorbs sunlight', 1),
(5, 'Stores energy', 0),
(5, 'Produces nutrients', 0),
(5, 'Generates oxygen', 0);


-- Insert Dummy Options for Computer Science Questions
INSERT INTO Options (question_id, option_text, is_correct) VALUES
(1, 'Stack', 1),
(1, 'Queue', 0),
(1, 'Linked List', 0),
(1, 'Array', 0),

(2, 'Queue', 1),
(2, 'Stack', 0),
(2, 'Linked List', 0),
(2, 'Tree', 0),

(3, 'Binary Tree', 1),
(3, 'Linked List', 0),
(3, 'Queue', 0),
(3, 'Stack', 0),

(4, 'Hash Table', 1),
(4, 'Binary Search Tree', 0),
(4, 'Stack', 0),
(4, 'Queue', 0),

(5, 'Algorithm Complexity', 1),
(5, 'Time Complexity', 0),
(5, 'Space Complexity', 0),
(5, 'Efficiency Ratio', 0);



-- Insert Dummy Options for Physics questions
INSERT INTO Options (question_id, option_text, is_correct) VALUES
(1, '299,792', 1),
(1, '300,000', 0),
(1, '150,000', 0),
(1, '100,000', 0),

(2, 'Entanglement', 1),
(2, 'Fusion', 0),
(2, 'Decay', 0),
(2, 'Superposition', 0),

(3, 'Quantum Mechanics', 1),
(3, 'Classical Mechanics', 0),
(3, 'Particle Physics', 0),
(3, 'Relativity', 0),

(4, 'Uncertainty', 1),
(4, 'Relativity', 0),
(4, 'Certainty', 0),
(4, 'Momentum', 0),

(5, 'Relativity', 1),
(5, 'Gravity', 0),
(5, 'Entropy', 0),
(5, 'Inertia', 0);



-- Insert Dummy Options for Law 
INSERT INTO Options (question_id, option_text, is_correct) VALUES

-- Question 1
(1, 'Civil law resolves disputes; criminal law punishes crimes', 1),
(1, 'Criminal law resolves disputes; civil law punishes crimes', 0),
(1, 'Both involve public offenses', 0),
(1, 'Neither involves individual rights', 0),

-- Question 2
(2, 'Laws apply equally to everyone', 1),
(2, 'Only judges follow the law', 0),
(2, 'Government enforces selective laws', 0),
(2, 'Laws apply differently based on status', 0),

-- Question 3
(3, 'Tort law deals with civil wrongs', 1),
(3, 'Tort law involves criminal cases', 0),
(3, 'Tort law only applies to property', 0),
(3, 'Tort law is unrelated to compensation', 0),

-- Question 4
(4, 'Beyond a reasonable doubt', 1),
(4, 'Preponderance of evidence', 0),
(4, 'Clear and convincing evidence', 0),
(4, 'Probable cause', 0),

-- Question 5
(5, 'Past court decision used as a reference', 1),
(5, 'New law enacted by the government', 0),
(5, 'Verdict in a pending case', 0),
(5, 'Opinion given by legal experts', 0);

-- Enable foreign key checks again
SET foreign_key_checks = 1;







-- Insert Dummy Answers

INSERT INTO Answers (question_id, student_id, answer_text) VALUES

-- Psychology Quiz
(87, 1, 'The study of observable behaviors'),
(88, 2, 'Learning through stimulus association'),
(89, 3, 'Wilhelm Wundt'),
(90, 4, 'Mental processes'),
(91, 5, 'Adding a stimulus to strengthen behavior'),

-- Art Quiz
(92, 6, 'Leonardo da Vinci'),
(93, 7, 'Caravaggio'),
(94, 8, 'Fresco'),
(95, 9, 'A style that depicts dreamlike, irrational imagery'),
(96, 10, 'Pablo Picasso'),


-- Chemistry Quiz
(97, 1, '8'),
(98, 2, 'A bond formed by the sharing of electrons'),
(99, 3, 'H2O'),
(100, 4, '7'),
(101, 5, 'The loss of electrons'),

-- History Quiz
(102, 6, 'Emilio Aguinaldo'),
(103, 7, '1896'),
(104, 8, 'Marks the declaration of independence from Spain'),
(105, 9, 'Manuel L. Quezon'),
(106, 10, 'Restored democracy and ousted Ferdinand Marcos'),

-- Physics Quiz
(107, 1, '299,792'),
(108, 2, 'Quantum entanglement'),
(109, 3, 'Quantum mechanics'),
(110, 4, 'Uncertainty principle'),
(111, 5, 'Principle of relativity'),


-- Electrical Engineering Quiz
(112, 6, 'Ohm Meter'),
(113, 7, 'Capacitor'),
(114, 8, 'Resistor'),
(115, 9, 'Watt'),
(116, 10, 'Ohm’s Law'),

-- Biology Fundamentals Quiz
(117, 1, 'Prokaryotes lack a nucleus, eukaryotes have one'),
(118, 2, 'Converts sunlight to energy'),
(119, 3, 'Nucleus, cytoplasm, membrane'),
(120, 4, 'Cell division'),
(121, 5, 'Absorbs sunlight'),


-- Computer Science Quiz
(122, 6, 'Stack'),
(123, 7, 'Queue'),
(124, 8, 'Binary Tree'),
(125, 9, 'Hash Table'),
(126, 10, 'Algorithm Complexity'),

-- Physics Quiz
(127, 1, '299,792'),
(128, 2, 'Entanglement'),
(129, 3, 'Quantum Mechanics'),
(130, 4, 'Uncertainty'),
(131, 5, 'Relativity'),

-- Law Quiz
(132, 6, 'Civil law resolves disputes; criminal law punishes crimes'),
(133, 7, 'Laws apply equally to everyone'),
(134, 8, 'Tort law deals with civil wrongs'),
(135, 9, 'Beyond a reasonable doubt'),
(136, 10, 'Past court decision used as a reference');



-- Insert Dummy Results
INSERT INTO Results (quiz_id, student_id, score) VALUES
(1, 1, 85),
(1, 2, 90),
(1, 3, 88),
(1, 4, 75),
(1, 5, 80),

(2, 6, 92),
(2, 7, 85),
(2, 8, 89),
(2, 9, 84),
(2, 10, 78),

(3, 1, 87),
(3, 2, 91),
(3, 3, 80),
(3, 4, 76),
(3, 5, 82),

(4, 6, 88),
(4, 7, 79),
(4, 8, 93),
(4, 9, 85),
(4, 10, 72),

(5, 1, 78),
(5, 2, 85),
(5, 3, 90),
(5, 4, 80),
(5, 5, 88),

(6, 6, 92),
(6, 7, 77),
(6, 8, 84),
(6, 9, 89),
(6, 10, 80),

(7, 1, 79),
(7, 2, 85),
(7, 3, 88),
(7, 4, 91),
(7, 5, 76),

(8, 6, 80),
(8, 7, 95),
(8, 8, 83),
(8, 9, 82),
(8, 10, 89),

(9, 1, 86),
(9, 2, 90),
(9, 3, 92),
(9, 4, 81),
(9, 5, 77),

(10, 6, 84),
(10, 7, 75),
(10, 8, 91),
(10, 9, 82),
(10, 10, 78);



-- Select all data from the Users table
SELECT * FROM Users;

-- Select all data from the Quizzes table
SELECT * FROM Quizzes;

-- Select all data from the Questions table
SELECT * FROM Questions;

-- Select all data from the Options table
SELECT * FROM Options;

-- Select all data from the Answers table
SELECT * FROM Answers;

-- Select all data from the Results table
SELECT * FROM Results;



