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