
-- Drop tables if they exist (to start fresh)
DROP TABLE IF EXISTS diagnoses;
DROP TABLE IF EXISTS visits;
DROP TABLE IF EXISTS patients;

-- Create the patients table
CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    contact_number VARCHAR(15)
);

-- Create the visits table
CREATE TABLE visits (
    visit_id SERIAL PRIMARY KEY,
    patient_id INT NOT NULL,
    visit_date DATE NOT NULL,
    attending_physician VARCHAR(100),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Create the diagnoses table
CREATE TABLE diagnoses (
    diagnosis_id SERIAL PRIMARY KEY,
    visit_id INT NOT NULL,
    diagnosis_code VARCHAR(10) NOT NULL,
    description TEXT,
    FOREIGN KEY (visit_id) REFERENCES visits(visit_id)
);

-- Insert sample data into patients
INSERT INTO patients (patient_id,full_name, date_of_birth, contact_number) VALUES
(1123,'Alice Thompson', '1985-03-14', '9876543210'),
(1124, 'Bob Carter', '1992-06-28', '9123456789'),
(1125, 'Charles King', '1970-11-10', '9012345678'),
(1001, 'Alice Thompson', '1985-03-14', '9876543210'),
(1002, 'Bob Carter', '1992-06-28', '9123456789'),
(1003, 'Charles King', '1970-11-10', '9012345678'),
(1004, 'Diana Moore', '1988-09-22', '9898989898'),
(1005, 'Edward Blake', '1995-01-05', '9001234567'),
(1006, 'Fiona Harris', '1979-02-12', '9900112233'),
(1007, 'George Lewis', '1965-07-19', '9812345670'),
(1008, 'Hannah Wright', '1993-08-25', '9887766554'),
(1009, 'Ian Scott', '1980-10-03', '9776655443'),
(1010, 'Julia Baker', '1997-12-11', '9665544332'),
(1011, 'Kevin Nelson', '1991-04-20', '9554433221'),
(1012, 'Laura Clark', '1986-09-09', '9443322110'),
(1013, 'Michael Young', '1982-01-15', '9332211009'),
(1014, 'Natalie Adams', '1975-06-05', '9221100988'),
(1015, 'Oliver Allen', '1990-03-23', '9110009876'),
(1016, 'Paula Martin', '1987-05-17', '9009998765'),
(1017, 'Quincy Turner', '1969-11-29', '8899887766'),
(1018, 'Rachel Evans', '1994-02-08', '8788776655'),
(1019, 'Samuel Hill', '1983-04-13', '8677665544'),
(1020, 'Tina Brooks', '1978-07-30', '8566554433');

-- Insert sample data into visits
INSERT INTO visits (visit_id,patient_id, visit_date, attending_physician) VALUES
(103,1123, '2025-06-10', 'Dr. Jenkins'),
(455,1124, '2025-07-02', 'Dr. Patel'),
(224,1125, '2025-06-30', 'Dr. Singh'),
(2001, 1001, '2025-07-01', 'Dr. Jenkins'),
(2002, 1002, '2025-07-02', 'Dr. Patel'),
(2003, 1003, '2025-07-03', 'Dr. Singh'),
(2004, 1004, '2025-07-04', 'Dr. Rao'),
(2005, 1005, '2025-07-05', 'Dr. Kapoor'),
(2006, 1006, '2025-07-06', 'Dr. Mehta'),
(2007, 1007, '2025-07-07', 'Dr. Shah'),
(2008, 1008, '2025-07-08', 'Dr. Nair'),
(2009, 1009, '2025-07-09', 'Dr. Das'),
(2010, 1010, '2025-07-10', 'Dr. Banerjee'),
(2011, 1011, '2025-07-11', 'Dr. Reddy'),
(2012, 1012, '2025-07-12', 'Dr. Kulkarni'),
(2013, 1013, '2025-07-13', 'Dr. Iyer'),
(2014, 1014, '2025-07-14', 'Dr. Shetty'),
(2015, 1015, '2025-07-15', 'Dr. Sharma'),
(2016, 1016, '2025-07-16', 'Dr. Bhatt'),
(2017, 1017, '2025-07-17', 'Dr. Joshi'),
(2018, 1018, '2025-07-18', 'Dr. Khanna'),
(2019, 1019, '2025-07-19', 'Dr. Srivastava'),
(2020, 1020, '2025-07-20', 'Dr. Gupta')
;

-- Insert sample data into diagnoses
INSERT INTO diagnoses (diagnosis_id,visit_id, diagnosis_code, description) VALUES
(146, 103,'d3', 'Influenza with other respiratory symptoms'),
(135, 455, 'd6','General medical examination'),
(246 ,224,'d3', 'Essential hypertension'),
(3001, 2001, 'D1', 'Common cold'),
(3002, 2002, 'D2', 'Seasonal allergy'),
(3003, 2003, 'D3', 'Influenza'),
(3004, 2004, 'D4', 'Migraine'),
(3005, 2005, 'D5', 'High blood pressure'),
(3006, 2006, 'D6', 'Type 2 Diabetes'),
(3007, 2007, 'D7', 'Asthma'),
(3008, 2008, 'D8', 'Back pain'),
(3009, 2009, 'D9', 'Stomach ulcer'),
(3010, 2010, 'D10', 'Anemia'),
(3011, 2011, 'D11', 'Sinus infection'),
(3012, 2012, 'D12', 'Bronchitis'),
(3013, 2013, 'D13', 'Skin rash'),
(3014, 2014, 'D14', 'Eye infection'),
(3015, 2015, 'D15', 'Ear infection'),
(3016, 2016, 'D16', 'Joint pain'),
(3017, 2017, 'D17', 'Depression'),
(3018, 2018, 'D18', 'Anxiety disorder'),
(3019, 2019, 'D19', 'Fatigue'),
(3020, 2020, 'D20', 'Thyroid disorder')
;
-- List all visits with patient names
SELECT p.full_name, v.visit_date, v.attending_physician
FROM patients p
JOIN visits v ON p.patient_id = v.patient_id;

-- List all diagnoses for a patient
SELECT p.full_name, v.visit_date, d.diagnosis_code, d.description
FROM patients p
JOIN visits v ON p.patient_id = v.patient_id
JOIN diagnoses d ON v.visit_id = d.visit_id
WHERE p.full_name = 'Alice Thompson';

-- Count diagnoses per patient
SELECT p.full_name, COUNT(d.diagnosis_id) AS total_diagnoses
FROM patients p
JOIN visits v ON p.patient_id = v.patient_id
JOIN diagnoses d ON v.visit_id = d.visit_id
GROUP BY p.full_name;