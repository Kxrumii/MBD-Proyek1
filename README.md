# UTS Manajemen Basis Data - Proyek 1

Repositori ini berisi konfigurasi infrastruktur basis data menggunakan Docker (PostgreSQL dan pgAdmin4) beserta script SQL (DDL, DML, DCL) untuk memenuhi Tugas Ujian Tengah Semester (UTS) mata kuliah Manajemen Basis Data.

## Identitas
* **Nama:** Fahri Khairun Ariansyah
* **NIM:** 1247050084
* **Kelas:** A

## Arsitektur Sistem
* **PostgreSQL (15-alpine):** Berjalan di port lokal `22084` (Diekspos dari port internal `5432`).
* **pgAdmin4:** Berjalan di port lokal `44084` (Diekspos dari port internal `80`).

## Struktur Repositori
* `docker-compose.yml`: Orkestrasi layanan database dan pgAdmin4.
* `.env.example`: environment credential template.
* `script.sql`: Kumpulan perintah SQL yang mencakup:
  * Pembuatan skema `SALAM` dan tabel `mahasiswas` dengan Primary Key, Unique, dan Check constraints.
  * *Role-Based Access Control* (RBAC) untuk user `backend_dev`, `bi_dev`, dan `data_engineer`.

## Cara Menjalankan (How to Run)
1. Clone repositori:
```bash
git clone https://github.com/Kxrumii/MBD-Proyek1.git
cd MBD-Proyek1
```
2. Buat file .env berdasarkan template .env.example:
`cp .env.example .env`
3. Sesuaikan nilai di dalam file .env dengan kredensial yang diinginkan.
4. Jalankan kontainer menggunakan Docker Compose:
`docker compose up -d`