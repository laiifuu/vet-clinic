CREATE TABLE patients(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR NOT NULL,
    date_of_birth DATE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories(
    id INT GENERATED ALWAYS AS IDENTITY,
    addmitted_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    patient_id INT NOT NULL REFERENCES patients(id),
    status VARCHAR NOT NULL,
    PRIMARY KEY (id)
);
-- FK index
CREATE INDEX patient_id_index ON
    medical_histories(patient_id);

CREATE TABLE invoices(
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL NOT NULL,
    generated_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    payed_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    medical_history__id INT NOT NULL REFERENCES medical_histories(id),
    PRIMARY KEY (id)
);
-- FK index
CREATE INDEX medical_history__id_index ON
    invoices(medical_history__id);

CREATE TABLE treatements(
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR NOT NULL,
    name VARCHAR NOT NULL,
    PRIMARY KEY (id)
);
-- FK index
CREATE INDEX treatements_id_index ON
    treatements(id);

CREATE TABLE invoice_items(
    id  INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL NOT NULL,
    invoice_id INT NOT NULL REFERENCES invoices(id),
    treatement_id INT NOT NULL REFERENCES treatements(id),
    PRIMARY KEY (id)
);
-- FK index
CREATE INDEX treatements_id_index ON
    invoice_items(treatement_id);


CREATE TABLE med_his_treatements(
  id INT GENERATED ALWAYS AS IDENTITY,
  medical_history__id INT NOT NULL REFERENCES medical_histories(id),
  treatement_id INT NOT NULL REFERENCES treatements(id),
  PRIMARY KEY (id)
);
-- FK index
CREATE INDEX med_his_treatements_index ON
    med_his_treatements(medical_history__id, treatement_id);

