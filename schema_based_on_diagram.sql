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

CREATE TABLE invoices(
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL NOT NULL,
    generated_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    payed_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    medical_history__id INT NOT NULL REFERENCES medical_histories(id),
    PRIMARY KEY (id)
);

