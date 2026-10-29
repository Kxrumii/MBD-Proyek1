CREATE SCHEMA SALAM;

CREATE TABLE SALAM.mahasiswas (
    nim VARCHAR(10) PRIMARY KEY,
    nama_lengkap VARCHAR(100) NOT NULL,
    email_kampus VARCHAR(100) UNIQUE NOT NULL,
    github_profile VARCHAR(255) UNIQUE,
    semester INT CHECK (semester BETWEEN 1 AND 14),
    ipk NUMERIC(3,2) CHECK (ipk >= 0.00 AND ipk <= 4.00)
);

INSERT INTO SALAM.mahasiswas (nim, nama_lengkap, email_kampus, github_profile, semester, ipk)
VALUES ('1247050084', 'Fahri Khairun Ariansyah', 'fahri@uinsgd.ac.id', 'https://github.com/kxrumii', 5, 4);

-- Buat cek unique constraint
INSERT INTO SALAM.mahasiswas (nim, nama_lengkap, email_kampus, github_profile, semester, ipk)
VALUES ('1247050000', 'Unique Constraint', 'fahri@uinsgd.ac.id', 'https://github.com/unique', 3, 3.50);

-- Buat cek check constraint
INSERT INTO SALAM.mahasiswas (nim, nama_lengkap, email_kampus, github_profile, semester, ipk)
VALUES ('1247050001', 'Check Constraint', 'check@uinsgd.ac.id', 'https://github.com/checkipk', 2, 4.50);


CREATE USER backend_dev WITH PASSWORD 'Fahri';
CREATE USER bi_dev WITH PASSWORD 'Khairun';
CREATE USER data_engineer WITH PASSWORD 'Ariansyah';

GRANT USAGE ON SCHEMA SALAM TO backend_dev, bi_dev, data_engineer;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA SALAM TO backend_dev;

GRANT SELECT ON ALL TABLES IN SCHEMA SALAM TO bi_dev;

GRANT ALL PRIVILEGES ON SCHEMA SALAM TO data_engineer;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA SALAM TO data_engineer;
GRANT postgres TO data_engineer;

-- ALTER DEFAULT PRIVILEGES IN SCHEMA SALAM GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO backend_dev;
-- ALTER DEFAULT PRIVILEGES IN SCHEMA SALAM GRANT SELECT ON TABLES TO bi_dev;

-- Buat cek bi_dev
SET ROLE bi_dev;
SELECT * FROM SALAM.mahasiswas; 
INSERT INTO SALAM.mahasiswas (nim, nama_lengkap, email_kampus, semester, ipk) 
VALUES ('1247050066', 'bidev', 'bidev@uinsgd.ac.id', 1, 3.00);
RESET ROLE;

-- Buat cek backend_dev
SET ROLE backend_dev;
UPDATE SALAM.mahasiswas SET nama_lengkap = 'Fahri Khairun A.' WHERE nim = '1247050084';
DROP TABLE SALAM.mahasiswas;
RESET ROLE;

-- Buat cek data_engineer
SET ROLE data_engineer;
CREATE TABLE SALAM.tabel_analisis_dummy (
    id_analisis SERIAL PRIMARY KEY,
    deskripsi TEXT
);
DROP TABLE SALAM.tabel_analisis_dummy;
RESET ROLE;