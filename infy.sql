create database infy ;
use infy ;

CREATE TABLE customer (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Auto-incrementing ID
    name VARCHAR(100) NOT NULL,       -- Customer's name
    dob DATE NOT NULL,                -- Date of Birth
    email VARCHAR(100) UNIQUE NOT NULL, -- Unique Email ID
    phone_number VARCHAR(15) UNIQUE NOT NULL, -- Phone number (validated later)
    address TEXT NOT NULL,            -- Customer's address
    password VARCHAR(255) NOT NULL   -- Password (hashed for security)
);

select * from customer ;

CREATE TABLE booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY, -- Auto-incrementing booking ID
    customer_name VARCHAR(100) NOT NULL,       -- Customer's name
    customer_mail VARCHAR(100) NOT NULL,       -- Customer's email
    customer_phone VARCHAR(15) NOT NULL,       -- Customer's phone number
    booking_date DATE NOT NULL,                -- Booking date
    booking_time TIME NOT NULL,                -- Booking time
    agent_id INT DEFAULT NULL                  -- Agent ID (can be NULL if not chosen)
);

select * from booking ;
select * from customer ;

CREATE TABLE agent (
    agent_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    password VARCHAR(255) NOT NULL,
    languages_known VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    status ENUM('Available', 'Not Available', 'Busy') NOT NULL DEFAULT 'Available'
);

select * from agent ;

INSERT INTO agent (name, gender, password, languages_known, location, start_time, end_time, status)
VALUES
('John Doe', 'Male', 'password123', 'English, French', 'New York', '09:00:00', '17:00:00', 'Available'),
('Jane Smith', 'Female', 'password456', 'Spanish, English', 'Los Angeles', '10:00:00', '18:00:00', 'Busy'),
('Sam Lee', 'Male', 'password789', 'Mandarin, English', 'Chicago', '08:00:00', '16:00:00', 'Not Available');

INSERT INTO agent (name, gender, password, languages_known, location, start_time, end_time, status)
VALUES 
('John Doe', 'Male', 'password123', 'English, Spanish', 'New York', '09:00:00', '17:00:00', 'Available'),
('Jane Smith', 'Female', 'password456', 'English, French', 'Los Angeles', '10:00:00', '18:00:00', 'Available'),
('David Brown', 'Male', 'password789', 'English, German', 'Chicago', '08:00:00', '16:00:00', 'Not Available'),
('Emily White', 'Female', 'password012', 'English, Italian', 'San Francisco', '09:30:00', '17:30:00', 'Busy'),
('Michael Johnson', 'Male', 'password345', 'English, Portuguese', 'Miami', '08:30:00', '17:00:00', 'Available'),
('Sarah Lee', 'Female', 'password678', 'English, Chinese', 'Dallas', '09:00:00', '16:00:00', 'Available');


CREATE TABLE insurance_plans (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_category VARCHAR(50) NOT NULL,   -- Health, Life, etc.
    plan_name VARCHAR(100) NOT NULL,       -- Name of the plan
    plan_desc TEXT,                        -- Description of the plan
     plan_tier ENUM('Gold', 'Silver', 'Bronze', 'Platinum', 'Basic') DEFAULT 'Basic', -- Plan tier (Gold, Silver, etc.)
    age_group VARCHAR(50),                 -- Age group (e.g., "18-60", "60+")
    plan_for_gender ENUM('Male', 'Female', 'Both') NOT NULL,  -- Gender-specific or Both
    premium DECIMAL(10, 2),                -- Premium cost
    coverage_amount DECIMAL(15, 2),        -- Coverage amount
    plan_status ENUM('Active', 'Inactive', 'Discontinued') DEFAULT 'Active' -- Plan status
);

INSERT INTO insurance_plans (plan_category, plan_name, plan_desc, plan_tier, age_group, plan_for_gender, premium, coverage_amount, plan_status)
VALUES
('Health', 'Super Star Health Plan', 'Unlimited restoration, coverage for hospitalization, and no upper limit on room charges.', 'Gold', '18-60', 'Both', 5000.00, 500000.00, 'Active'),
('Life', 'Life Shield Policy', 'A comprehensive life insurance plan with coverage for accidental death and critical illness.', 'Platinum', '25-65', 'Both', 4000.00, 1000000.00, 'Active'),
('Health', 'Women Care Plan', 'Specially designed for women, covering maternity and other women-specific health issues.', 'Silver', '18-50', 'Female', 3500.00, 200000.00, 'Active'),
('Health', 'Senior Citizens Health Plan', 'Healthcare coverage designed for senior citizens with hospitalization and outpatient benefits.', 'Bronze', '60+', 'Both', 3000.00, 300000.00, 'Active'),
('Health', 'Diabetes Safe Plan', 'Covers hospitalization for diabetes-related issues and treatment.', 'Basic', '18-65', 'Both', 2500.00, 200000.00, 'Active'),
('Life', 'Family Protection Plan', 'Provides life insurance for families with coverage for spouse and children.', 'Silver', '30-55', 'Both', 4500.00, 700000.00, 'Active'),
('Health', 'Critical Illness Plan', 'Cover for major critical illnesses such as cancer, heart attack, and stroke.', 'Gold', '25-60', 'Both', 6000.00, 1200000.00, 'Active'),
('Health', 'Pregnancy Care Insurance', 'Special coverage for pregnancy-related expenses, including hospital stays and delivery.', 'Silver', '20-40', 'Female', 4000.00, 500000.00, 'Active'),
('Health', 'Child Health Plan', 'A plan to cover medical expenses for children, including vaccines, checkups, and emergencies.', 'Bronze', '0-18', 'Both', 2000.00, 100000.00, 'Active'),
('Health', 'Top-Up Health Plan', 'An additional coverage plan to increase the sum insured on top of your existing plan.', 'Platinum', '18-65', 'Both', 3500.00, 1500000.00, 'Active');


-- Life Insurance Plans
INSERT INTO insurance_plans (plan_category, plan_name, plan_desc, plan_tier, age_group, plan_for_gender, premium, coverage_amount, plan_status)
VALUES
('Life', 'Term Life Protector', 'A basic term life insurance policy providing coverage for a fixed term.', 'Gold', '18-65', 'Both', 3000.00, 500000.00, 'Active'),
('Life', 'Whole Life Assurance', 'A lifelong insurance plan with coverage for the policyholder\'s entire life.', 'Platinum', '18-80', 'Both', 4500.00, 1000000.00, 'Active'),
('Life', 'Family Security Plan', 'Provides life coverage for the policyholder and their family members.', 'Silver', '30-60', 'Both', 4000.00, 700000.00, 'Active'),
('Life', 'Critical Illness Protection', 'Offers life cover and also provides protection for critical illnesses such as cancer, stroke, etc.', 'Gold', '25-55', 'Both', 5000.00, 1200000.00, 'Active'),
('Life', 'Income Protection Plan', 'A policy that ensures your income is protected in case of disability or critical illness.', 'Bronze', '18-65', 'Both', 3500.00, 600000.00, 'Active'),
('Life', 'Cancer Life Shield', 'Special life insurance coverage for individuals diagnosed with cancer.', 'Silver', '18-70', 'Both', 4000.00, 800000.00, 'Active'),
('Life', 'Endowment Plan', 'A combination of insurance and investment that pays out both on death and maturity.', 'Platinum', '18-65', 'Both', 6000.00, 1500000.00, 'Active'),
('Life', 'Universal Life Plan', 'A flexible life insurance plan that combines insurance and savings.', 'Gold', '25-60', 'Both', 5000.00, 900000.00, 'Active'),
('Life', 'Group Life Plan', 'Covers employees or groups of individuals under one policy.', 'Silver', '18-65', 'Both', 2500.00, 500000.00, 'Active'),
('Life', 'Whole Life Family Plan', 'Offers lifelong coverage for the policyholder and their family with additional benefits.', 'Bronze', '30-65', 'Both', 4500.00, 1000000.00, 'Active');

select * from insurance_plans ;

-- Vehicle Insurance Plans
INSERT INTO insurance_plans (plan_category, plan_name, plan_desc, plan_tier, age_group, plan_for_gender, premium, coverage_amount, plan_status)
VALUES
('Vehicle', 'Comprehensive Car Insurance', 'Full coverage for your car including accidents, theft, and natural disasters.', 'Gold', '18-70', 'Both', 7000.00, 500000.00, 'Active'),
('Vehicle', 'Third-Party Car Insurance', 'Mandatory third-party coverage for any damage caused to others by your car.', 'Silver', '18-70', 'Both', 3000.00, 200000.00, 'Active'),
('Vehicle', 'Two-Wheeler Insurance', 'Affordable coverage for bikes and scooters against accidents and theft.', 'Bronze', '18-60', 'Both', 1500.00, 100000.00, 'Active'),
('Vehicle', 'Car Engine Protection Plan', 'Special coverage for engine and gearbox damage.', 'Platinum', '18-70', 'Both', 8000.00, 600000.00, 'Active'),
('Vehicle', 'Comprehensive Commercial Vehicle Insurance', 'For commercial vehicles, offering full protection against accidents, theft, and liabilities.', 'Gold', '18-70', 'Both', 10000.00, 1000000.00, 'Active'),
('Vehicle', 'Motorcycle Theft Protection', 'Provides coverage specifically for motorcycle theft.', 'Silver', '18-60', 'Both', 2000.00, 50000.00, 'Active'),
('Vehicle', 'Car Accidental Damage Insurance', 'Coverage against accidental damage for all types of cars.', 'Bronze', '18-70', 'Both', 4000.00, 300000.00, 'Active'),
('Vehicle', 'Electric Car Insurance', 'Tailored for electric cars offering protection against damage and theft.', 'Platinum', '18-70', 'Both', 6000.00, 700000.00, 'Active'),
('Vehicle', 'Third-Party Bike Insurance', 'Mandatory third-party coverage for damage caused by your bike.', 'Silver', '18-60', 'Both', 1000.00, 50000.00, 'Active'),
('Vehicle', 'Car Natural Calamity Coverage', 'Special coverage for damages caused by floods, earthquakes, and other natural disasters.', 'Gold', '18-70', 'Both', 7000.00, 400000.00, 'Active');

-- Home Insurance Plans
INSERT INTO insurance_plans (plan_category, plan_name, plan_desc, plan_tier, age_group, plan_for_gender, premium, coverage_amount, plan_status)
VALUES
('Home', 'Home Protection Plan', 'Full coverage for home structure, contents, and liability against accidents.', 'Gold', '18-80', 'Both', 5000.00, 1000000.00, 'Active'),
('Home', 'Renters Insurance', 'Coverage for renters to protect personal belongings and liabilities.', 'Silver', '18-70', 'Both', 1500.00, 200000.00, 'Active'),
('Home', 'Homeowner\'s Fire Insurance', 'Protection against damages caused by fire, smoke, and related hazards.', 'Platinum', '18-80', 'Both', 3500.00, 500000.00, 'Active'),
('Home', 'Flood Insurance', 'Special coverage for damages caused by flooding, ideal for high-risk areas.', 'Silver', '18-80', 'Both', 2500.00, 400000.00, 'Active'),
('Home', 'Natural Calamities Home Insurance', 'Covers damages due to earthquakes, landslides, floods, and other natural disasters.', 'Gold', '18-80', 'Both', 6000.00, 800000.00, 'Active'),
('Home', 'Theft Insurance for Home', 'Covers loss or damage to property due to burglary or theft.', 'Bronze', '18-80', 'Both', 2000.00, 300000.00, 'Active'),
('Home', 'Comprehensive Home Insurance', 'Complete protection for your home and its contents, including accidental damage.', 'Platinum', '18-80', 'Both', 8000.00, 1500000.00, 'Active'),
('Home', 'Landlord\'s Insurance', 'Covers properties that are rented out, including protection for structure and tenants\' belongings.', 'Gold', '18-80', 'Both', 7000.00, 1000000.00, 'Active'),
('Home', 'Home Contents Insurance', 'Protection for the contents of your home, including furniture, electronics, and appliances.', 'Silver', '18-80', 'Both', 3500.00, 500000.00, 'Active'),
('Home', 'Building Insurance', 'Protection for the physical structure of your home, including walls, roof, and foundation.', 'Bronze', '18-80', 'Both', 4000.00, 700000.00, 'Active');

select * from agent ;

SELECT * FROM booking WHERE agent_id = 2 ;

INSERT INTO booking (customer_name, customer_mail, customer_phone, booking_date, booking_time, agent_id)
VALUES
('John Doe', 'johndoe@example.com', '1234567890', '2024-11-28', '10:00:00', 1),
('Jane Smith', 'janesmith@example.com', '9876543210', '2024-11-28', '11:30:00', 2),
('Alice Johnson', 'alicej@example.com', '4567891230', '2024-11-28', '14:00:00', 3),
('Bob Brown', 'bobbrown@example.com', '7894561230', '2024-11-28', '15:30:00', 4),
('Emma White', 'emmawhite@example.com', '3216549870', '2024-11-29', '09:00:00', 5),
('David Black', 'davidblack@example.com', '6547893210', '2024-11-29', '10:30:00', 1),
('Sophia Green', 'sophiag@example.com', '9632587410', '2024-11-29', '12:00:00', 2),
('Liam Blue', 'liamblue@example.com', '8529637410', '2024-11-29', '13:30:00', 3),
('Olivia Red', 'oliviared@example.com', '7418529630', '2024-11-30', '10:00:00', 4),
('Mason Yellow', 'masonyellow@example.com', '9517538462', '2024-11-30', '11:30:00', 5);

-- Create table 'admin' with password column
CREATE TABLE admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    password VARCHAR(255) NOT NULL, -- Password column added
    role ENUM('SuperAdmin', 'Manager', 'Support') DEFAULT 'Manager'
);

INSERT INTO admin (username, email, phone_number, password, role) VALUES
('superadmin', 'superadmin@example.com', '1234567890', 'password123', 'SuperAdmin'),
('manager1', 'manager1@example.com', '9876543210', 'securepass1', 'Manager'),
('manager2', 'manager2@example.com', '6543219870', 'securepass2', 'Manager'),
('support1', 'support1@example.com', '1231231234', 'supportpass1', 'Support'),
('support2', 'support2@example.com', '3213213214', 'supportpass2', 'Support'),
('adminuser1', 'admin1@example.com', NULL, 'adminpass1', 'Manager'),
('adminuser2', 'admin2@example.com', '4564564567', 'adminpass2', 'Manager'),
('adminuser3', 'admin3@example.com', '7897897890', 'adminpass3', 'Support'),
('support3', 'support3@example.com', NULL, 'supportpass3', 'Support'),
('adminuser4', 'admin4@example.com', '9998887777', 'adminpass4', 'Manager');

-- Create table 'subscribers'
CREATE TABLE subscribers (
    subscriber_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(15) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    date_of_birth DATE NOT NULL,
    address TEXT NOT NULL,
    subscription_plan_id INT NOT NULL,
    subscription_date DATE,
    subscription_status ENUM('Active', 'Inactive', 'Cancelled') DEFAULT 'Active'
);

INSERT INTO subscribers (first_name, last_name, email, phone_number, gender, date_of_birth, address, subscription_plan_id, subscription_date, subscription_status) VALUES
('John', 'Doe', 'johndoe@example.com', '1112223333', 'Male', '1990-05-15', '123 Elm Street, Springfield', 1, '2024-01-01', 'Active'),
('Jane', 'Smith', 'janesmith@example.com', '4445556666', 'Female', '1985-03-22', '456 Oak Street, Shelbyville', 2, '2023-12-01', 'Inactive'),
('Alex', 'Taylor', 'alextaylor@example.com', '7778889999', 'Other', '1992-07-30', '789 Pine Street, Capital City', 3, '2024-06-15', 'Cancelled'),
('Chris', 'Brown', 'chrisbrown@example.com', '2223334444', 'Male', '1991-09-10', '101 Maple Avenue, Springfield', 2, '2024-05-20', 'Active'),
('Emily', 'Clark', 'emilyclark@example.com', '5556667777', 'Female', '1989-11-12', '202 Birch Lane, Shelbyville', 1, '2024-02-10', 'Active'),
('Michael', 'Johnson', 'michaeljohnson@example.com', '9990001111', 'Male', '1995-01-25', '303 Cedar Road, Springfield', 4, '2024-03-05', 'Inactive'),
('Sarah', 'Miller', 'sarahmiller@example.com', '8887776666', 'Female', '1987-06-18', '404 Ash Street, Capital City', 5, '2024-04-15', 'Cancelled'),
('Daniel', 'Lee', 'daniellee@example.com', '1231231231', 'Male', '1994-08-08', '505 Palm Drive, Springfield', 3, '2024-06-10', 'Active'),
('Sophia', 'Davis', 'sophiadavis@example.com', '3213213213', 'Female', '1993-12-31', '606 Cherry Lane, Shelbyville', 1, '2024-01-15', 'Active'),
('Ryan', 'Wilson', 'ryanwilson@example.com', '7897897897', 'Male', '1992-03-03', '707 Pineview Circle, Capital City', 2, '2024-05-25', 'Cancelled');