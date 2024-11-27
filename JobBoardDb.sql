-- Connect to MySQL
mysql -u root -p


-- Create Database
CREATE DATABASE  jobboardb;
USE jobboardb;


-- Create Tables with Constraints

-- Authentication Table
CREATE TABLE Authentication (
    authentication_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255),
    email VARCHAR(255),
    password_hash VARCHAR(255),
    role ENUM('user', 'admin'),
    created_at DATETIME,
    updated_at DATETIME,
    deleted_at DATETIME
);

-- User Table
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    authentication_id INT,
    name VARCHAR(255),
    birth_date DATE,
    skills TEXT,
    work_experience TEXT,
    updated_at DATETIME,
    FOREIGN KEY (authentication_id) REFERENCES Authentication(authentication_id)
);

-- Job_Posting Table
CREATE TABLE Job_Posting (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    employer_id INT,
    job_title VARCHAR(255),
    job_description TEXT,
    location VARCHAR(255),
    category VARCHAR(255),
    industry VARCHAR(255),
    min_salary DECIMAL(10, 2),
    max_salary DECIMAL(10, 2),
    created_at DATETIME,
    updated_at DATETIME,
    deleted_at DATETIME
);

-- Job_Performance Table
CREATE TABLE Job_Performance (
    performance_id INT AUTO_INCREMENT PRIMARY KEY,
    job_id INT,
    applicants_count INT,
    views_count INT,
    open_date DATETIME,
    close_date DATETIME,
    time_to_fill INT,
    updated_at DATETIME,
    FOREIGN KEY (job_id) REFERENCES Job_Posting(job_id)
);

-- Job_Interaction Table
CREATE TABLE Job_Interaction (
    interaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    job_id INT,
    interaction_type ENUM('view', 'apply', 'save'),
    interaction_date DATETIME,
    is_applied BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (job_id) REFERENCES Job_Posting(job_id)
);

-- Application Table
CREATE TABLE Application (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    job_seeker_id INT,
    job_id INT,
    resume BLOB,
    status ENUM('pending', 'interview', 'rejected', 'accepted'),
    skills TEXT,
    work_experience TEXT,
    applied_at DATETIME,
    updated_at DATETIME,
    deleted_at DATETIME,
    FOREIGN KEY (job_seeker_id) REFERENCES User(user_id),
    FOREIGN KEY (job_id) REFERENCES Job_Posting(job_id)
);

-- Message Table
CREATE TABLE Message (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT,
    recipient_id INT,
    application_id INT,
    message_text TEXT,
    is_read BOOLEAN,
    message_type ENUM('text', 'image', 'file'),
    sent_at DATETIME,
    deleted_at DATETIME,
    FOREIGN KEY (sender_id) REFERENCES User(user_id),
    FOREIGN KEY (recipient_id) REFERENCES User(user_id),
    FOREIGN KEY (application_id) REFERENCES Application(application_id)
);


-- Insert Dummy Records
--

INSERT INTO Authentication (username, email, password_hash, role, created_at, updated_at, deleted_at)
VALUES
  ('user1', 'user1@example.com', 'hashedpassword1', 'user', NOW(), NOW(), NULL),
  ('user2', 'user2@example.com', 'hashedpassword2', 'admin', NOW(), NOW(), NULL),
  ('user3', 'user3@example.com', 'hashedpassword3', 'user', NOW(), NOW(), NULL),
  ('user4', 'user4@example.com', 'hashedpassword4', 'user', NOW(), NOW(), NULL),
  ('user5', 'user5@example.com', 'hashedpassword5', 'user', NOW(), NOW(), NULL),
  ('admin1', 'admin1@example.com', 'hashedpassword6', 'admin', NOW(), NOW(), NULL),
  ('user6', 'user6@example.com', 'hashedpassword7', 'user', NOW(), NOW(), NULL),
  ('admin2', 'admin2@example.com', 'hashedpassword8', 'admin', NOW(), NOW(), NULL),
  ('user7', 'user7@example.com', 'hashedpassword9', 'user', NOW(), NOW(), NULL),
  ('user8', 'user8@example.com', 'hashedpassword10', 'user', NOW(), NOW(), NULL),
  ('user9', 'user9@example.com', 'hashedpassword11', 'user', NOW(), NOW(), NULL),
  ('user10', 'user10@example.com', 'hashedpassword12', 'user', NOW(), NOW(), NULL),
  ('user11', 'user11@example.com', 'hashedpassword13', 'user', NOW(), NOW(), NULL),
  ('user12', 'user12@example.com', 'hashedpassword14', 'user', NOW(), NOW(), NULL),
  ('admin3', 'admin3@example.com', 'hashedpassword15', 'admin', NOW(), NOW(), NULL),
  ('user13', 'user13@example.com', 'hashedpassword16', 'user', NOW(), NOW(), NULL),
  ('user14', 'user14@example.com', 'hashedpassword17', 'user', NOW(), NOW(), NULL),
  ('user15', 'user15@example.com', 'hashedpassword18', 'user', NOW(), NOW(), NULL),
  ('user16', 'user16@example.com', 'hashedpassword19', 'user', NOW(), NOW(), NULL),
  ('user17', 'user17@example.com', 'hashedpassword20', 'user', NOW(), NOW(), NULL),
  ('admin4', 'admin4@example.com', 'hashedpassword21', 'admin', NOW(), NOW(), NULL),
  ('user18', 'user18@example.com', 'hashedpassword22', 'user', NOW(), NOW(), NULL),
  ('user19', 'user19@example.com', 'hashedpassword23', 'user', NOW(), NOW(), NULL),
  ('user20', 'user20@example.com', 'hashedpassword24', 'user', NOW(), NOW(), NULL),
  ('user21', 'user21@example.com', 'hashedpassword25', 'user', NOW(), NOW(), NULL),
  ('user22', 'user22@example.com', 'hashedpassword26', 'user', NOW(), NOW(), NULL),
  ('user23', 'user23@example.com', 'hashedpassword27', 'user', NOW(), NOW(), NULL),
  ('admin5', 'admin5@example.com', 'hashedpassword28', 'admin', NOW(), NOW(), NULL),
  ('user24', 'user24@example.com', 'hashedpassword29', 'user', NOW(), NOW(), NULL),
  ('user25', 'user25@example.com', 'hashedpassword30', 'user', NOW(), NOW(), NULL),
  ('user26', 'user26@example.com', 'hashedpassword31', 'user', NOW(), NOW(), NULL),
  ('user27', 'user27@example.com', 'hashedpassword32', 'user', NOW(), NOW(), NULL),
  ('user28', 'user28@example.com', 'hashedpassword33', 'user', NOW(), NOW(), NULL),
  ('user29', 'user29@example.com', 'hashedpassword34', 'user', NOW(), NOW(), NULL),
  ('user30', 'user30@example.com', 'hashedpassword35', 'user', NOW(), NOW(), NULL),
  ('admin6', 'admin6@example.com', 'hashedpassword36', 'admin', NOW(), NOW(), NULL),
  ('user31', 'user31@example.com', 'hashedpassword37', 'user', NOW(), NOW(), NULL),
  ('user32', 'user32@example.com', 'hashedpassword38', 'user', NOW(), NOW(), NULL),
  ('user33', 'user33@example.com', 'hashedpassword39', 'user', NOW(), NOW(), NULL),
  ('user34', 'user34@example.com', 'hashedpassword40', 'user', NOW(), NOW(), NULL),
  ('admin7', 'admin7@example.com', 'hashedpassword41', 'admin', NOW(), NOW(), NULL),
  ('user35', 'user35@example.com', 'hashedpassword42', 'user', NOW(), NOW(), NULL),
  ('user36', 'user36@example.com', 'hashedpassword43', 'user', NOW(), NOW(), NULL),
  ('user37', 'user37@example.com', 'hashedpassword44', 'user', NOW(), NOW(), NULL),
  ('user38', 'user38@example.com', 'hashedpassword45', 'user', NOW(), NOW(), NULL),
  ('user39', 'user39@example.com', 'hashedpassword46', 'user', NOW(), NOW(), NULL),
  ('user40', 'user40@example.com', 'hashedpassword47', 'user', NOW(), NOW(), NULL),
  ('admin8', 'admin8@example.com', 'hashedpassword48', 'admin', NOW(), NOW(), NULL),
  ('user41', 'user41@example.com', 'hashedpassword49', 'user', NOW(), NOW(), NULL),
  ('user42', 'user42@example.com', 'hashedpassword50', 'user', NOW(), NOW(), NULL);



INSERT INTO User (authentication_id, name, birth_date, skills, work_experience, updated_at)
VALUES
  (1, 'Alice Johnson', '1990-01-15', 'Java, SQL, Python', 'Software Engineer at TechCorp', NOW()),
  (2, 'Bob Smith', '1985-03-22', 'Management, Communication', 'Project Manager at BusinessCo', NOW()),
  (3, 'Charlie Brown', '1992-06-10', 'Python, Data Science, Machine Learning', 'Data Analyst at DataTech', NOW()),
  (4, 'David Lee', '1993-11-25', 'UI/UX, HTML, CSS, Javascript', 'Frontend Developer at WebWorks', NOW()),
  (5, 'Eva Green', '1991-08-17', 'Marketing, SEO, Google Ads', 'Marketing Specialist at AdMarketing', NOW()),
  (6, 'Frank White', '1989-02-02',

 'Sales, Leadership, CRM', 'Sales Manager at CRM Solutions', NOW()),
  (7, 'Grace Moore', '1994-05-29', 'Python, Data Analytics, R', 'Junior Data Scientist at DataFlow', NOW()),
  (8, 'Hannah Smith', '1987-10-14', 'Customer Service, Problem Solving', 'Customer Support at QuickTech', NOW()),
  (9, 'Ian Brown', '1988-12-02', 'Networking, Cloud Computing', 'IT Administrator at CloudNet', NOW()),
  (10, 'Jack Johnson', '1980-06-30', 'Finance, Accounting, Excel', 'Finance Analyst at FinSolutions', NOW()),
  (11, 'Kerry Walker', '1982-09-08', 'Marketing, PR, Strategy', 'Marketing Director at Innovate Ltd', NOW()),
  (12, 'Liam Taylor', '1989-07-25', 'Project Management, Agile', 'Scrum Master at AgileTech', NOW()),
  (13, 'Megan Harris', '1990-12-10', 'Content Creation, Social Media', 'Content Manager at MediaPulse', NOW()),
  (14, 'Noah Green', '1992-01-01', 'Java, Web Development', 'Software Developer at CodeWorks', NOW()),
  (15, 'Olivia Lee', '1993-11-03', 'Data Analysis, SQL, Excel', 'Data Analyst at Data Insights', NOW()),
  (16, 'Paul Scott', '1985-04-18', 'Business Analysis, Reporting', 'Business Analyst at MarketEdge', NOW()),
  (17, 'Quincy Clark', '1991-03-17', 'Python, Machine Learning', 'Data Scientist at DataScience Inc.', NOW()),
  (18, 'Rachel Adams', '1988-02-12', 'Financial Analysis, Excel', 'Financial Analyst at Bank Corp', NOW()),
  (19, 'Sam Nelson', '1994-06-21', 'Sales, Negotiation', 'Sales Executive at SalesPro', NOW()),
  (20, 'Tom Harris', '1986-11-30', 'UX Design, Sketch, Figma', 'UX Designer at Creative Agency', NOW()),
  (21, 'Ursula White', '1992-07-17', 'Marketing, Advertising, Content', 'Content Marketing Specialist at ContentLab', NOW()),
  (22, 'Vince Allen', '1984-10-20', 'Financial Modeling, Data Analysis', 'Financial Planner at FinanceHouse', NOW()),
  (23, 'Wendy Moore', '1993-09-15', 'Software Development, C++', 'Software Developer at TechPoint', NOW()),
  (24, 'Xander Lee', '1987-01-22', 'Network Security, IT', 'Security Specialist at SafeNet', NOW()),
  (25, 'Yara Stone', '1995-11-05', 'Sales, Marketing, Customer Service', 'Sales Representative at MarketDirect', NOW()),
  (26, 'Zane Young', '1986-03-13', 'Engineering, Manufacturing', 'Engineer at BuildTech', NOW()),
  (27, 'Amelia Carter', '1990-06-09', 'Operations Management, Logistics', 'Operations Manager at LogiCo', NOW()),
  (28, 'Ben Rogers', '1992-08-18', 'JavaScript, Node.js', 'Backend Developer at DevWorks', NOW()),
  (29, 'Catherine Knight', '1994-04-23', 'Database Management, SQL', 'Database Administrator at DB Tech', NOW()),
  (30, 'Dylan Foster', '1991-02-02', 'Marketing Automation, Email Campaigns', 'Marketing Specialist at MailPro', NOW()),
  (31, 'Ethan King', '1988-07-14', 'HR, Recruitment, Strategy', 'HR Manager at PeopleFirst', NOW()),
  (32, 'Fiona Davis', '1989-11-09', 'System Administration, Cloud', 'System Admin at TechSavvy', NOW()),
  (33, 'George White', '1993-12-21', 'Product Management, Agile', 'Product Manager at InnovateTech', NOW()),
  (34, 'Holly Gray', '1990-05-10', 'Project Management, Scrum', 'Project Coordinator at BuildIt', NOW()),
  (35, 'Ivy Phillips', '1992-01-10', 'Web Development, Frontend', 'Frontend Developer at DevLabs', NOW()),
  (36, 'James Johnson', '1987-08-15', 'IT Support, Troubleshooting', 'IT Support at HelpDesk Solutions', NOW()),
  (37, 'Kaitlyn Morgan', '1990-03-28', 'Design, Marketing, Branding', 'Brand Manager at BrandIt', NOW()),
  (38, 'Lucas Bell', '1985-11-05', 'Business Intelligence, SQL', 'BI Analyst at DataGroup', NOW()),
  (39, 'Maya Edwards', '1994-04-10', 'Sales, Retail, Customer Experience', 'Sales Manager at RetailPro', NOW()),
  (40, 'Nina Reed', '1993-07-21', 'Data Science, Machine Learning', 'Junior Data Scientist at AI Lab', NOW()),
  (41, 'Oscar Turner', '1987-12-04', 'Marketing Strategy, SEO', 'Digital Marketing Manager at NetReach', NOW()),
  (42, 'Penny Walker', '1990-11-22', 'Content Writing, Blogging', 'Content Writer at CopyPro', NOW()),
  (43, 'Quentin Young', '1989-09-30', 'Software Development, C#', 'Full Stack Developer at CodeHub', NOW()),
  (44, 'Rachel Martin', '1991-12-01', 'Customer Service, CRM', 'Customer Service Manager at ServiceFirst', NOW()),
  (45, 'Steve Clark', '1992-06-05', 'Networking, Security', 'Network Engineer at NetSolutions', NOW()),
  (46, 'Tina Hill', '1994-10-13', 'Content Strategy, Social Media', 'Content Strategist at SocialPlus', NOW()),
  (47, 'Ursula Black', '1990-07-27', 'Web Design, UX/UI', 'Web Designer at DesignWorks', NOW()),
  (48, 'Victor Moore', '1987-02-25', 'Product Development, QA', 'Quality Analyst at ProdTech', NOW()),
  (49, 'Wanda Bell', '1993-05-11', 'Product Marketing, Advertising', 'Product Marketer at AdTech', NOW()),
  (50, 'Xander James', '1992-01-05', 'App Development, Swift', 'Mobile Developer at AppWorks', NOW());




INSERT INTO Job_Posting (employer_id, job_title, job_description, location, category, industry, min_salary, max_salary, created_at, updated_at, deleted_at)
VALUES
  (1, 'Software Engineer', 'Develop and maintain software applications.', 'San Francisco, CA', 'Engineering', 'Software', 80000, 120000, NOW(), NOW(), NULL),
  (2, 'Project Manager', 'Manage client projects and teams.', 'New York, NY', 'Management', 'Consulting', 70000, 100000, NOW(), NOW(), NULL),
  (3, 'Data Analyst', 'Analyze and interpret complex data to provide insights.', 'Austin, TX', 'Data Science', 'Technology', 65000, 90000, NOW(), NOW(), NULL),
  (4, 'Frontend Developer', 'Build user interfaces for web applications.', 'Chicago, IL', 'Engineering', 'Tech', 70000, 95000, NOW(), NOW(), NULL),
  (5, 'Marketing Specialist', 'Develop marketing strategies to drive sales.', 'Los Angeles, CA', 'Marketing', 'Advertising', 55000, 80000, NOW(), NOW(), NULL),
  (6, 'Sales Manager', 'Lead a team of sales professionals.', 'Houston, TX', 'Sales', 'Retail', 60000, 95000, NOW(), NOW(), NULL),
  (7, 'Junior Data Scientist', 'Assist with data modeling and analytics tasks.', 'Boston, MA', 'Data Science', 'Finance', 65000, 85000, NOW(), NOW(), NULL),
  (8, 'Customer Support Representative', 'Handle customer inquiries and provide solutions.', 'Dallas, TX', 'Customer Service', 'E-commerce', 35000, 50000, NOW(), NOW(), NULL),
  (9, 'IT Administrator', 'Manage IT infrastructure and systems.', 'Denver, CO', 'IT', 'Software', 70000, 95000, NOW(), NOW(), NULL),
  (10, 'Finance Analyst', 'Analyze financial data and provide recommendations.', 'Miami, FL', 'Finance', 'Banking', 75000, 100000, NOW(), NOW(), NULL),
  (11, 'HR Manager', 'Oversee recruiting and employee relations.', 'Seattle, WA', 'Human Resources', 'Tech', 85000, 120000, NOW(), NOW(), NULL),
  (12, 'Content Manager', 'Manage content creation and distribution.', 'San Diego, CA', 'Marketing', 'Media', 60000, 90000, NOW(), NOW(), NULL),
  (13, 'Java Developer', 'Develop backend systems using Java.', 'Los Angeles, CA', 'Engineering', 'Software', 80000, 110000, NOW(), NOW(), NULL),
  (14, 'Digital Marketing Manager', 'Manage digital marketing campaigns and strategies.', 'Portland, OR', 'Marketing', 'Advertising', 70000, 95000, NOW(), NOW(), NULL),
  (15, 'Data Scientist', 'Create data models and predict business trends.', 'New York, NY', 'Data Science', 'Healthcare', 90000, 120000, NOW(), NOW(), NULL),
  (16, 'UX Designer', 'Design user-friendly interfaces for mobile apps.', 'Chicago, IL', 'Design', 'Technology', 75000, 100000, NOW(), NOW(), NULL),
  (17, 'Product Manager', 'Lead product development and strategy.', 'San Francisco, CA', 'Management', 'E-commerce', 90000, 130000, NOW(), NOW(), NULL),
  (18, 'Security Specialist', 'Oversee and manage network security systems.', 'Washington, DC', 'Security', 'Tech', 85000, 120000, NOW(), NOW(), NULL),
  (19, 'Software Engineer', 'Design and develop scalable software solutions.', 'Austin, TX', 'Engineering', 'FinTech', 85000, 110000, NOW(), NOW(), NULL),
  (20, 'SEO Specialist', 'Optimize website content for search engines.', 'Los Angeles, CA', 'Marketing', 'Digital Media', 55000, 75000, NOW(), NOW(), NULL),
  (21, 'Mobile Developer', 'Develop mobile applications for iOS and Android.', 'San Diego, CA', 'Engineering', 'Mobile', 80000, 105000, NOW(), NOW(), NULL),
  (22, 'Customer Service Manager', 'Supervise and manage customer support teams.', 'New York, NY', 'Customer Service', 'Retail', 65000, 95000, NOW(), NOW(), NULL),
  (23, 'Software Engineer', 'Develop and maintain back-end systems.', 'Seattle, WA', 'Engineering', 'Software', 80000, 110000, NOW(), NOW(), NULL),
  (24, 'QA Engineer', 'Test and ensure quality of software applications.', 'Dallas, TX', 'Engineering', 'Software', 70000, 95000, NOW(), NOW(), NULL),
  (25, 'Business Analyst', 'Identify business needs and recommend solutions.', 'Chicago, IL', 'Business', 'Consulting', 75000, 105000, NOW(), NOW(), NULL),
  (26, 'Content Strategist', 'Create and implement content strategies for websites.', 'Austin, TX', 'Marketing', 'Media', 65000, 90000, NOW(), NOW(), NULL),
  (27, 'Product Marketing Manager', 'Develop marketing strategies for product launches.', 'Portland, OR', 'Marketing', 'Tech', 80000, 115000, NOW(), NOW(), NULL),
  (28, 'Full Stack Developer', 'Build and manage web applications from front to back.', 'New York, NY', 'Engineering', 'Tech', 85000, 120000, NOW(), NOW(), NULL),
  (29, 'Web Developer', 'Develop and maintain websites.', 'Los Angeles, CA', 'Engineering', 'Software', 70000, 95000, NOW(), NOW(), NULL),
  (30, 'Data Analyst', 'Provide insights by analyzing large datasets.', 'Chicago, IL', 'Data Science', 'Finance', 70000, 90000, NOW(), NOW(), NULL),
  (31, 'Cloud Engineer', 'Design and maintain cloud infrastructure and services.', 'San Francisco, CA', 'Engineering', 'Cloud Computing', 90000, 120000, NOW(), NOW(), NULL),
  (32, 'Operations Manager', 'Oversee daily operations and improve efficiency.', 'Miami, FL', 'Operations', 'Logistics', 75000, 100000, NOW(), NOW(), NULL),
  (33, 'Project Coordinator', 'Coordinate project activities and resources.', 'Boston, MA', 'Management', 'Consulting', 60000, 85000, NOW(), NOW(), NULL),
  (34, 'HR Specialist', 'Assist with hiring and employee relations.', 'Washington, DC', 'Human Resources', 'Tech', 60000, 85000, NOW(), NOW(), NULL),
  (35, 'Technical Writer', 'Create and maintain user manuals and documentation.', 'Austin, TX', 'Engineering', 'Tech', 60000, 80000, NOW(), NOW(), NULL),
  (36, 'Legal Advisor', 'Provide legal counsel to business leaders and teams.', 'San Diego, CA', 'Legal', 'Consulting', 95000, 140000, NOW(), NOW(), NULL),
  (37, 'Cloud Solutions Architect', 'Design and implement cloud-based solutions.', 'Seattle, WA', 'Engineering', 'Cloud Computing', 105000, 150000, NOW(), NOW(), NULL),
  (38, 'Creative Director', 'Lead creative projects and teams.', 'New York, NY', 'Design', 'Media', 95000, 130000, NOW(), NOW(), NULL),
  (39, 'Account Executive', 'Manage client relationships and sales targets.', 'San Francisco, CA', 'Sales', 'Advertising', 75000, 110000, NOW(), NOW(), NULL),
  (40, 'Video Editor', 'Edit and produce video content for digital platforms.', 'Chicago, IL', 'Media', 'Entertainment', 50000, 70000, NOW(), NOW(), NULL),
  (41, 'Accountant', 'Handle financial transactions and accounting reports.', 'Portland, OR', 'Finance', 'Accounting', 60000, 80000, NOW(), NOW(), NULL),
  (42, 'Business Development Manager', 'Drive business growth and partnerships.', 'Los Angeles, CA', 'Business Development', 'Retail', 75000, 110000, NOW(), NOW(), NULL),
  (43, 'Content Writer', 'Write articles and blog posts for the website.', 'Boston, MA', 'Content', 'Media', 40000, 60000, NOW(), NOW(), NULL),
  (44, 'Database Administrator', 'Manage and optimize database systems.', 'San Francisco, CA', 'Engineering', 'Tech', 80000, 100000, NOW(), NOW(), NULL),
  (45, 'Machine Learning Engineer', 'Design and build machine learning models.', 'Seattle, WA', 'Data Science', 'AI', 95000, 130000, NOW(), NOW(), NULL),
  (46, 'IT Support Specialist', 'Provide technical support for hardware and software issues.', 'Denver, CO', 'IT', 'Tech', 50000, 75000, NOW(), NOW(), NULL),
  (47, 'Executive Assistant', 'Provide administrative support to executives.', 'New York, NY', 'Administrative', 'Tech', 55000, 75000, NOW(), NOW(), NULL),
  (48, 'Senior Developer', 'Develop complex web applications and systems.', 'San Francisco, CA', 'Engineering', 'Tech', 100000, 130000, NOW(), NOW(), NULL),
  (49, 'Financial Planner', 'Provide financial advice and planning services.', 'Miami, FL', 'Finance', 'Consulting', 70000, 90000, NOW(), NOW(), NULL),
  (50, 'Data Engineer', 'Build and optimize data pipelines for analytics.', 'Los Angeles, CA', 'Data Engineering', 'Tech', 85000, 120000, NOW(), NOW(), NULL);





INSERT INTO Job_Performance (job_id, applicants_count, views_count, open_date, close_date, time_to_fill, updated_at)
VALUES
  (1, 120, 2500, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY), 30, NOW()),
  (2, 200, 3000, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY), 45, NOW()),
  (3, 85, 1800, NOW(), DATE_ADD(NOW(), INTERVAL 35 DAY), 35, NOW()),
  (4, 150, 2300, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY), 30, NOW()),
  (5, 50, 1000, NOW(), DATE_ADD(NOW(), INTERVAL 60 DAY), 60, NOW()),
  (6, 90, 1700, NOW(), DATE_ADD(NOW(), INTERVAL 40 DAY), 40, NOW()),
  (7, 80, 1500, NOW(), DATE_ADD(NOW(), INTERVAL 50 DAY), 50, NOW()),
  (8, 200, 3500, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY), 30, NOW()),
  (9, 110, 2100, NOW(), DATE_ADD(NOW(), INTERVAL 25 DAY), 25, NOW()),
  (10, 75, 1200, NOW(), DATE_ADD(NOW(), INTERVAL 60 DAY), 60, NOW()),
  (11, 130, 2600, NOW(), DATE_ADD(NOW(), INTERVAL 35 DAY), 35, NOW()),
  (12, 95, 2200, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY), 45, NOW()),
  (13, 110, 2800, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY), 30, NOW()),
  (14, 70, 1500, NOW(), DATE_ADD(NOW(), INTERVAL 55 DAY), 55, NOW()),
  (15, 150, 2400, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY), 30, NOW()),
  (16, 130, 2200, NOW(), DATE_ADD(NOW(), INTERVAL 50 DAY), 50, NOW()),
  (17, 160, 2900, NOW(), DATE_ADD(NOW(), INTERVAL 35 DAY), 35, NOW()),
  (18, 200, 3200, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY), 30, NOW()),
  (19, 100, 1800, NOW(), DATE_ADD(NOW(), INTERVAL 40 DAY), 40, NOW()),
  (20, 75, 1500, NOW(), DATE_ADD(NOW(), INTERVAL 50 DAY), 50, NOW()),
  (21, 90, 1600, NOW(), DATE_ADD(NOW(), INTERVAL 60 DAY), 60, NOW()),
  (22, 180, 3300, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY), 30, NOW()),
  (23, 140, 2800, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY), 30, NOW()),
  (24, 120, 2300, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY), 45, NOW()),
  (25, 80, 1400, NOW(), DATE_ADD(NOW(), INTERVAL 60 DAY), 60, NOW()),
  (26, 160, 3100, NOW(), DATE_ADD(NOW(), INTERVAL 35 DAY), 35, NOW()),
  (27, 130, 2500, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY), 30, NOW()),
  (28, 90, 2000, NOW(), DATE_ADD(NOW(), INTERVAL 40 DAY), 40, NOW()),
  (29, 100, 1700, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY), 45, NOW()),
  (30, 140, 2500, NOW(), DATE_ADD(NOW(), INTERVAL 25 DAY), 25, NOW()),
  (31, 180, 3300, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY), 30, NOW()),
  (32, 120, 2200, NOW(), DATE_ADD(NOW(), INTERVAL 50 DAY), 50, NOW()),
  (33, 200, 3500, NOW(), DATE_ADD(NOW(), INTERVAL 40 DAY), 40, NOW()),
  (34, 110, 2100, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY), 45, NOW()),
  (35, 95, 1800, NOW(), DATE_ADD(NOW(), INTERVAL 60 DAY), 60, NOW()),
  (36, 100, 2000, NOW(), DATE_ADD(NOW(), INTERVAL 50 DAY), 50, NOW()),
  (37, 140, 2600, NOW(), DATE_ADD(NOW(), INTERVAL 35 DAY), 35, NOW()),
  (38, 90, 1500, NOW(), DATE_ADD(NOW(), INTERVAL 40 DAY), 40, NOW()),
  (39, 160, 3000, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY), 30, NOW()),
  (40, 110, 2300, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY), 45, NOW()),
  (41, 80, 1500, NOW(), DATE_ADD(NOW(), INTERVAL 60 DAY), 60, NOW()),
  (42, 180, 3200, NOW(), DATE_ADD(NOW(), INTERVAL 35 DAY), 35, NOW()),
  (43, 150, 2800, NOW(), DATE_ADD(NOW(), INTERVAL 50 DAY), 50, NOW()),
  (44, 120, 2100, NOW(), DATE_ADD(NOW(), INTERVAL 60 DAY), 60, NOW()),
  (45, 90, 1700, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY), 30, NOW()),
  (46, 100, 1800, NOW(), DATE_ADD(NOW(), INTERVAL 40 DAY), 40, NOW()),
  (47, 130, 2400, NOW(), DATE_ADD(NOW(), INTERVAL 35 DAY), 35, NOW()),
  (48, 160, 3100, NOW(), DATE_ADD(NOW(), INTERVAL 25 DAY), 25, NOW()),
  (49, 90, 1600, NOW(), DATE_ADD(NOW(), INTERVAL 60 DAY), 60, NOW()),
  (50, 180, 3200, NOW(), DATE_ADD(NOW(), INTERVAL 40 DAY), 40, NOW());



INSERT INTO Job_Interaction (user_id, job_id, interaction_type, interaction_date, is_applied)
VALUES
  (1, 1, 'view', NOW(), FALSE),
  (2, 2, 'apply', NOW(), TRUE),
  (3, 3, 'save', NOW(), FALSE),
  (4, 4, 'view', NOW(), FALSE),
  (5, 5, 'apply', NOW(), TRUE),
  (6, 6, 'save', NOW(), FALSE),
  (7, 7, 'view', NOW(), FALSE),
  (8, 8, 'save', NOW(), FALSE),
  (9, 9, 'apply', NOW(), TRUE),
  (10, 10, 'view', NOW(), FALSE),
  (11, 11, 'save', NOW(), FALSE),
  (12, 12, 'view', NOW(), FALSE),
  (13, 13, 'apply', NOW(), TRUE),
  (14, 14, 'save', NOW(), FALSE),
  (15, 15, 'view', NOW(), FALSE),
  (16, 16, 'apply', NOW(), TRUE),
  (17, 17, 'view', NOW(), FALSE),
  (18, 18, 'save', NOW(), FALSE),
  (19, 19, 'apply', NOW(), TRUE),
  (20, 20, 'view', NOW(), FALSE),
  (21, 21, 'save', NOW(), FALSE),
  (22, 22, 'view', NOW(), FALSE),
  (23, 23, 'apply', NOW(), TRUE),
  (24, 24, 'view', NOW(), FALSE),
  (25, 25, 'save', NOW(), FALSE),
  (26, 26, 'apply', NOW(), TRUE),
  (27, 27, 'view', NOW(), FALSE),
  (28, 28, 'save', NOW(), FALSE),
  (29, 29, 'apply', NOW(), TRUE),
  (30, 30, 'view', NOW(), FALSE),
  (31, 31, 'save', NOW(), FALSE),
  (32, 32, 'view', NOW(), FALSE),
  (33, 33, 'apply', NOW(), TRUE),
  (34, 34, 'save', NOW(), FALSE),
  (35, 35, 'view', NOW(), FALSE),
  (36, 36, 'apply', NOW(), TRUE),
  (37, 37, 'save', NOW(), FALSE),
  (38, 38, 'view', NOW(), FALSE),
  (39, 39, 'apply', NOW(), TRUE),
  (40, 40, 'view', NOW(), FALSE),
  (41, 41, 'save', NOW(), FALSE),
  (42, 42, 'apply', NOW(), TRUE),
  (43, 43, 'view', NOW(), FALSE),
  (44, 44, 'save', NOW(), FALSE),
  (45, 45, 'apply', NOW(), TRUE),
  (46, 46, 'view', NOW(), FALSE),
  (47, 47, 'save', NOW(), FALSE),
  (48, 48, 'view', NOW(), FALSE),
  (49, 49, 'apply', NOW(), TRUE),
  (50, 50, 'view', NOW(), FALSE);





INSERT INTO Application (job_seeker_id, job_id, resume, status, skills, work_experience, applied_at, updated_at, deleted_at)
VALUES
  (1, 1, NULL, 'pending', 'Java, Python', '3 years at TechCorp', NOW(), NOW(), NULL),
  (2, 2, NULL, 'interview', 'Project Management, Scrum', '5 years at ConsultCo', NOW(), NOW(), NULL),
  (3, 3, NULL, 'rejected', 'Data Analysis, SQL', '2 years at DataGroup', NOW(), NOW(), NULL),
  (4, 4, NULL, 'accepted', 'Web Development, HTML, CSS', '3 years at WebTech', NOW(), NOW(), NULL),
  (5, 5, NULL, 'pending', 'Marketing Strategy, SEO', '4 years at MarketPro', NOW(), NOW(), NULL),
  (6, 6, NULL, 'accepted', 'Sales, Negotiation', '5 years at SalesForce', NOW(), NOW(), NULL),
  (7, 7, NULL, 'rejected', 'Machine Learning, Python', '2 years at DataLabs', NOW(), NOW(), NULL),
  (8, 8, NULL, 'pending', 'Customer Service, CRM', '3 years at EcomCorp', NOW(), NOW(), NULL),
  (9, 9, NULL, 'pending', 'IT Support, Troubleshooting', '3 years at HelpDesk', NOW(), NOW(), NULL),
  (10, 10, NULL, 'accepted', 'Financial Analysis, Excel', '5 years at FinanceHouse', NOW(), NOW(), NULL),
  (11, 11, NULL, 'interview', 'HR Management, Recruiting', '4 years at PeopleHR', NOW(), NOW(), NULL),
  (12, 12, NULL, 'pending', 'Content Writing, Blogging', '2 years at WriteNow', NOW(), NOW(), NULL),
  (13, 13, NULL, 'rejected', 'Java, Spring Framework', '3 years at DevTeam', NOW(), NOW(), NULL),
  (14, 14, NULL, 'pending', 'Digital Marketing, SEO', '4 years at MarketReach', NOW(), NOW(), NULL),
  (15, 15, NULL, 'accepted', 'Data Science, AI', '5 years at DataGroup', NOW(), NOW(), NULL),
  (16, 16, NULL, 'interview', 'UX Design, Prototyping', '3 years at DesignLab', NOW(), NOW(), NULL),
  (17, 17, NULL, 'pending', 'Product Management, Agile', '3 years at InnovateTech', NOW(), NOW(), NULL),
  (18, 18, NULL, 'rejected', 'Cybersecurity, Network Security', '2 years at SecureNet', NOW(), NOW(), NULL),
  (19, 19, NULL, 'accepted', 'Software Development, C#', '5 years at DevWorks', NOW(), NOW(), NULL),
  (20, 20, NULL, 'interview', 'Digital Marketing, PPC', '4 years at AdReach', NOW(), NOW(), NULL),
  (21, 21, NULL, 'pending', 'Mobile Development, Swift', '2 years at MobileX', NOW(), NOW(), NULL),
  (22, 22, NULL, 'rejected', 'Customer Service, Problem Solving', '3 years at RetailPlus', NOW(), NOW(), NULL),
  (23, 23, NULL, 'pending', 'Full Stack Development, React', '3 years at CodeMaster', NOW(), NOW(), NULL),
  (24, 24, NULL, 'rejected', 'JavaScript, Node.js', '4 years at DevTeam', NOW(), NOW(), NULL),
  (25, 25, NULL, 'accepted', 'Networking, Cloud', '5 years at NetSolutions', NOW(), NOW(), NULL),
  (26, 26, NULL, 'pending', 'Content Strategy, Social Media', '3 years at ContentPro', NOW(), NOW(), NULL),
  (27, 27, NULL, 'rejected', 'Operations Management, Logistics', '4 years at LogiCo', NOW(), NOW(), NULL),
  (28, 28, NULL, 'accepted', 'Web Development, JavaScript', '5 years at WebWorks', NOW(), NOW(), NULL),
  (29, 29, NULL, 'pending', 'Financial Planning, Forecasting', '3 years at FinanceCo', NOW(), NOW(), NULL),
  (30, 30, NULL, 'interview', 'Email Marketing, Automation', '3 years at MailTech', NOW(), NOW(), NULL),
  (31, 31, NULL, 'rejected', 'System Admin, Cloud Computing', '2 years at CloudSolutions', NOW(), NOW(), NULL),
  (32, 32, NULL, 'pending', 'Project Management, Scrum', '3 years at BuildIt', NOW(), NOW(), NULL),
  (33, 33, NULL, 'accepted', 'Product Development, Agile', '5 years at InnovateTech', NOW(), NOW(), NULL),
  (34, 34, NULL, 'interview', 'Customer Support, CRM', '4 years at HelpDesk', NOW(), NOW(), NULL),
  (35, 35, NULL, 'pending', 'Technical Writing, Documentation', '3 years at TechDocs', NOW(), NOW(), NULL),
  (36, 36, NULL, 'rejected', 'Legal Counsel, Contract Law', '5 years at LawCo', NOW(), NOW(), NULL),
  (37, 37, NULL, 'accepted', 'Cloud Solutions, AWS', '5 years at CloudSolutions', NOW(), NOW(), NULL),
  (38, 38, NULL, 'pending', 'Creative Direction, Design', '3 years at MediaDesign', NOW(), NOW(), NULL),
  (39, 39, NULL, 'rejected', 'Business Development, Sales', '4 years at SalesPro', NOW(), NOW(), NULL),
  (40, 40, NULL, 'pending', 'Video Production, Editing', '3 years at CreativeMedia', NOW(), NOW(), NULL),
  (41, 41, NULL, 'rejected', 'Accounting, Tax Filing', '3 years at LedgerCorp', NOW(), NOW(), NULL),
  (42, 42, NULL, 'accepted', 'Business Development, Partnerships', '5 years at GrowthLabs', NOW(), NOW(), NULL),
  (43, 43, NULL, 'interview', 'Content Creation, Blog Writing', '2 years at WriteNow', NOW(), NOW(), NULL),
  (44, 44, NULL, 'pending', 'Database Management, SQL', '3 years at DBSystems', NOW(), NOW(), NULL),
  (45, 45, NULL, 'rejected', 'Machine Learning, Python', '4 years at MLTech', NOW(), NOW(), NULL),
  (46, 46, NULL, 'pending', 'Technical Support, IT Troubleshooting', '3 years at HelpDesk', NOW(), NOW(), NULL),
  (47, 47, NULL, 'accepted', 'Executive Assistance, Scheduling', '4 years at AssistPro', NOW(), NOW(), NULL),
  (48, 48, NULL, 'pending', 'Software Engineering, Cloud Solutions', '5 years at TechHub', NOW(), NOW(), NULL),
  (49, 49, NULL, 'rejected', 'Product Design, User Interface', '2 years at DesignPro', NOW(), NOW(), NULL),
  (50, 50, NULL, 'accepted', 'Data Engineering, Big Data', '5 years at DataLabs', NOW(), NOW(), NULL);



-- Select all data from the Authentication table
SELECT * FROM Authentication;

-- Select all data from the User table
SELECT * FROM User;

-- Select all data from the Job_Posting table
SELECT * FROM Job_Posting;

-- Select all data from the Job_Performance table
SELECT * FROM Job_Performance;

-- Select all data from the Job_Interaction table
SELECT * FROM Job_Interaction;

-- Select all data from the Application table
SELECT * FROM Application;


