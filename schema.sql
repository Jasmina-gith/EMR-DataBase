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