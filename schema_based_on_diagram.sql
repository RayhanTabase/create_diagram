CREATE DATABASE clinic;
\c clinic;
CREATE TABLE patients (
  id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(200) NOT NULL,
  date_of_birth DATE
);


CREATE TABLE treatments (
  id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(200) NOT NULL,
  type VARCHAR(200) NOT NULL
);

CREATE TABLE medical_histories (
  id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP, 
  patient_id INT REFERENCES patients(id) ON DELETE CASCADE , 
  status VARCHAR(200) NOT NULL
);

CREATE TABLE medical_histories_treatments (
  id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
  treatment_id INT REFERENCES treatments(id) ON DELETE SET NULL ,
  medical_history_id INT REFERENCES medical_histories(id) ON DELETE SET NULL
);

CREATE TABLE invoices (
  id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT UNIQUE REFERENCES medical_histories(id) ON DELETE SET NULL
);

CREATE TABLE invoice_items (
  id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT REFERENCES invoices(id) ON DELETE SET NULL ,
  treatment_id INT REFERENCES treatments(id) ON DELETE SET NULL
);
