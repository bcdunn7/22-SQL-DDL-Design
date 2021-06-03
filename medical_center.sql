DROP DATABASE IF EXISTS medical_center_db;

CREATE DATABASE medical_center_db;

\c medical_center_db

CREATE TABLE doctor (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE patient (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    has_insurance BOOLEAN DEFAULT false,
    primary_doctor INT NOT NULL REFERENCES doctor(id) ON DELETE SET NULL
);

CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    doctor_id INT NOT NULL REFERENCES doctor(id) ON DELETE CASCADE,
    patient_id int NOT NULL REFERENCES patient(id) ON DELETE CASCADE
);

CREATE TABLE visit (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    need_to_comeback BOOLEAN  DEFAULT false,
    patient_id INT NOT NULL REFERENCES patient(id) ON DELETE SET NULL,
    doctor_id INT NOT NULL REFERENCES doctor(id) ON DELETE SET NULL,
    notes text
);

CREATE TABLE disease (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    visit_id INT NOT NULL REFERENCES visit(id) ON DELETE CASCADE,
    disease_id INT NOT NULL REFERENCES doctor(id) ON DELETE SET NULL
);