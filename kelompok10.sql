
-- Table: CABANG
CREATE TABLE CABANG (
    ID_Cabang INT PRIMARY KEY,
    Nama_Cabang VARCHAR(100),
    Alamat_Cabang TEXT,
    Kota VARCHAR(50),
    Jumlah_Studio INT,
    Jam_Operasional VARCHAR(50)
);

-- Table: STUDIO
CREATE TABLE STUDIO (
    ID_Studio INT PRIMARY KEY,
    Nomor_Studio VARCHAR(10),
    Kapasitas_Kursi INT,
    Tipe_Studio VARCHAR(50),
    ID_Cabang INT,
    FOREIGN KEY (ID_Cabang) REFERENCES CABANG(ID_Cabang)
);

-- Table: KURSI
CREATE TABLE KURSI (
    ID_Kursi INT PRIMARY KEY,
    Nomor_Kursi VARCHAR(10),
    Jenis_Kursi VARCHAR(50),
    Status_Kursi VARCHAR(20),
    ID_Studio INT,
    FOREIGN KEY (ID_Studio) REFERENCES STUDIO(ID_Studio)
);

-- Table: USER
CREATE TABLE USER (
    ID_User INT PRIMARY KEY,
    Nama VARCHAR(100),
    Email VARCHAR(100),
    Nomor_Telepon VARCHAR(20),
    Kata_Sandi VARCHAR(100)
);

-- Table: ADMIN
CREATE TABLE ADMIN (
    ID_User INT PRIMARY KEY,
    Alamat TEXT,
    Gaji DECIMAL(12, 2),
    ID_Cabang INT,
    FOREIGN KEY (ID_User) REFERENCES USER(ID_User),
    FOREIGN KEY (ID_Cabang) REFERENCES CABANG(ID_Cabang)
);

-- Table: MEMBER
CREATE TABLE MEMBER (
    ID_User INT PRIMARY KEY,
    Status_Keanggotaan VARCHAR(50),
    Metode_Bayar_Favorit VARCHAR(50),
    FOREIGN KEY (ID_User) REFERENCES USER(ID_User)
);

-- Table: FILM
CREATE TABLE FILM (
    ID_Film INT PRIMARY KEY,
    Judul_Film VARCHAR(100),
    Durasi_Film INT,
    Pangkat_Usia VARCHAR(20)
);

-- Table: GENRE
CREATE TABLE GENRE (
    ID_Genre INT PRIMARY KEY,
    Jenis_Genre VARCHAR(50)
);

-- Table: MEMILIKI
CREATE TABLE MEMILIKI (
    ID_Genre INT,
    ID_Film INT,
    PRIMARY KEY (ID_Genre, ID_Film),
    FOREIGN KEY (ID_Genre) REFERENCES GENRE(ID_Genre),
    FOREIGN KEY (ID_Film) REFERENCES FILM(ID_Film)
);

-- Table: TIKET
CREATE TABLE TIKET (
    ID_TIKET INT PRIMARY KEY,
    Harga_Tiket DECIMAL(10,2),
    Jadwal_Tayang DATETIME,
    ID_Kursi INT,
    ID_Film INT,
    FOREIGN KEY (ID_Kursi) REFERENCES KURSI(ID_Kursi),
    FOREIGN KEY (ID_Film) REFERENCES FILM(ID_Film)
);

-- Table: JADWAL_TAYANG
CREATE TABLE JADWAL_TAYANG (
    ID_Jadwal_Tayang INT PRIMARY KEY,
    Jam_Mulai TIME,
    Jam_Selesai TIME,
    Format_Film VARCHAR(50),
    ID_TIKET INT,
    FOREIGN KEY (ID_TIKET) REFERENCES TIKET(ID_TIKET)
);

-- Table: TRANSAKSI
CREATE TABLE TRANSAKSI (
    ID_Transaksi INT PRIMARY KEY,
    Tanggal_Transaksi DATE,
    Waktu_Transaksi TIME,
    Metode_Bayar VARCHAR(50),
    Status_Bayar VARCHAR(20),
    Total_Bayar DECIMAL(12,2),
    Diskon DECIMAL(5,2),
    ID_User INT,
    ID_TIKET INT,
    FOREIGN KEY (ID_User) REFERENCES USER(ID_User),
    FOREIGN KEY (ID_TIKET) REFERENCES TIKET(ID_TIKET)
);


-- DML Inserts Below --

INSERT INTO CABANG (ID_Cabang, Nama_Cabang, Alamat_Cabang, Kota, Jumlah_Studio, Jam_Operasional) VALUES
(1, 'Cabang Jakarta', 'Jl. Sudirman No.1', 'Jakarta', 5, '10:00 - 22:00'),
(2, 'Cabang Bandung', 'Jl. Asia Afrika No.2', 'Bandung', 3, '11:00 - 21:00'),
(3, 'Cabang Surabaya', 'Jl. Pemuda No.3', 'Surabaya', 4, '10:00 - 23:00');
INSERT INTO STUDIO (ID_Studio, Nomor_Studio, Kapasitas_Kursi, Tipe_Studio, ID_Cabang) VALUES
(1, 'S1', 100, 'Reguler', 1),
(2, 'S2', 110, 'Reguler', 2),
(3, 'S3', 120, 'Reguler', 3),
(4, 'S4', 130, 'Reguler', 1),
(5, 'S5', 140, 'Reguler', 2),
(6, 'S6', 150, 'Reguler', 3),
(7, 'S7', 160, 'Reguler', 1),
(8, 'S8', 170, 'Reguler', 2),
(9, 'S9', 180, 'Reguler', 3),
(10, 'S10', 190, 'Reguler', 1);
INSERT INTO KURSI (ID_Kursi, Nomor_Kursi, Jenis_Kursi, Status_Kursi, ID_Studio) VALUES
(1, 'A1', 'Reguler', 'Tersedia', 1),
(2, 'A2', 'Reguler', 'Tersedia', 2),
(3, 'A3', 'Reguler', 'Tersedia', 3),
(4, 'A4', 'Reguler', 'Tersedia', 4),
(5, 'A5', 'Reguler', 'Tersedia', 5),
(6, 'A6', 'Reguler', 'Tersedia', 6),
(7, 'A7', 'Reguler', 'Tersedia', 7),
(8, 'A8', 'Reguler', 'Tersedia', 8),
(9, 'A9', 'Reguler', 'Tersedia', 9),
(10, 'A10', 'Reguler', 'Tersedia', 10),
(11, 'A11', 'Reguler', 'Tersedia', 1),
(12, 'A12', 'Reguler', 'Tersedia', 2),
(13, 'A13', 'Reguler', 'Tersedia', 3),
(14, 'A14', 'Reguler', 'Tersedia', 4),
(15, 'A15', 'Reguler', 'Tersedia', 5),
(16, 'A16', 'Reguler', 'Tersedia', 6),
(17, 'A17', 'Reguler', 'Tersedia', 7),
(18, 'A18', 'Reguler', 'Tersedia', 8),
(19, 'A19', 'Reguler', 'Tersedia', 9),
(20, 'A20', 'Reguler', 'Tersedia', 10),
(21, 'A21', 'Reguler', 'Tersedia', 1),
(22, 'A22', 'Reguler', 'Tersedia', 2),
(23, 'A23', 'Reguler', 'Tersedia', 3),
(24, 'A24', 'Reguler', 'Tersedia', 4),
(25, 'A25', 'Reguler', 'Tersedia', 5),
(26, 'A26', 'Reguler', 'Tersedia', 6),
(27, 'A27', 'Reguler', 'Tersedia', 7),
(28, 'A28', 'Reguler', 'Tersedia', 8),
(29, 'A29', 'Reguler', 'Tersedia', 9),
(30, 'A30', 'Reguler', 'Tersedia', 10);
INSERT INTO USER (ID_User, Nama, Email, Nomor_Telepon, Kata_Sandi) VALUES
(1, 'User1', 'user1@mail.com', '08123456780', 'password123'),
(2, 'User2', 'user2@mail.com', '08123456781', 'password123'),
(3, 'User3', 'user3@mail.com', '08123456782', 'password123'),
(4, 'User4', 'user4@mail.com', '08123456783', 'password123'),
(5, 'User5', 'user5@mail.com', '08123456784', 'password123'),
(6, 'User6', 'user6@mail.com', '08123456785', 'password123'),
(7, 'User7', 'user7@mail.com', '08123456786', 'password123'),
(8, 'User8', 'user8@mail.com', '08123456787', 'password123'),
(9, 'User9', 'user9@mail.com', '08123456788', 'password123'),
(10, 'User10', 'user10@mail.com', '08123456789', 'password123');
INSERT INTO ADMIN (ID_User, Alamat, Gaji, ID_Cabang) VALUES
(1, 'Jl. Admin 0', 5000000, 1),
(2, 'Jl. Admin 1', 5100000, 2),
(3, 'Jl. Admin 2', 5200000, 3);
INSERT INTO MEMBER (ID_User, Status_Keanggotaan, Metode_Bayar_Favorit) VALUES
(4, 'Aktif', 'Transfer Bank'),
(5, 'Aktif', 'Transfer Bank'),
(6, 'Aktif', 'Transfer Bank'),
(7, 'Aktif', 'Transfer Bank');
INSERT INTO FILM (ID_Film, Judul_Film, Durasi_Film, Pangkat_Usia) VALUES
(1, 'Film 1', 90, 'SU'),
(2, 'Film 2', 95, 'SU'),
(3, 'Film 3', 100, 'SU'),
(4, 'Film 4', 105, 'SU'),
(5, 'Film 5', 110, 'SU');
INSERT INTO GENRE (ID_Genre, Jenis_Genre) VALUES
(1, 'Aksi'),
(2, 'Drama'),
(3, 'Komedi'),
(4, 'Horor'),
(5, 'Sci-Fi');
INSERT INTO MEMILIKI (ID_Genre, ID_Film) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
INSERT INTO TIKET (ID_TIKET, Harga_Tiket, Jadwal_Tayang, ID_Kursi, ID_Film) VALUES
(1, 45000, '2024-06-12 17:05:16', 1, 1),
(2, 50000, '2024-01-04 08:57:23', 2, 2),
(3, 55000, '2024-04-15 18:13:50', 3, 3),
(4, 60000, '2024-10-02 20:02:29', 4, 4),
(5, 65000, '2024-05-02 23:46:10', 5, 5),
(6, 45000, '2024-04-27 03:49:13', 6, 1),
(7, 50000, '2024-04-16 05:04:56', 7, 2),
(8, 55000, '2024-10-26 11:39:54', 8, 3),
(9, 60000, '2024-04-20 04:21:54', 9, 4),
(10, 65000, '2024-08-10 12:47:04', 10, 5);
INSERT INTO JADWAL_TAYANG (ID_Jadwal_Tayang, Jam_Mulai, Jam_Selesai, Format_Film, ID_TIKET) VALUES
(1, '17:15:00', '12:15:00', '2D', 1),
(2, '19:00:00', '10:30:00', '2D', 2),
(3, '18:30:00', '16:00:00', '2D', 3),
(4, '14:00:00', '15:15:00', '2D', 4),
(5, '20:30:00', '13:00:00', '2D', 5),
(6, '13:00:00', '17:15:00', '2D', 6),
(7, '20:15:00', '17:00:00', '2D', 7),
(8, '16:30:00', '17:00:00', '2D', 8),
(9, '16:30:00', '20:15:00', '2D', 9),
(10, '19:00:00', '17:00:00', '2D', 10);
INSERT INTO TRANSAKSI (ID_Transaksi, Tanggal_Transaksi, Waktu_Transaksi, Metode_Bayar, Status_Bayar, Total_Bayar, Diskon, ID_User, ID_TIKET) VALUES
(1, '2024-12-01', '18:30:00', 'QRIS', 'Lunas', 50000, 0, 1, 1),
(2, '2024-12-01', '18:30:00', 'QRIS', 'Lunas', 50000, 0, 2, 2),
(3, '2024-12-01', '18:30:00', 'QRIS', 'Lunas', 50000, 0, 3, 3),
(4, '2024-12-01', '18:30:00', 'QRIS', 'Lunas', 50000, 0, 4, 4),
(5, '2024-12-01', '18:30:00', 'QRIS', 'Lunas', 50000, 0, 5, 5),
(6, '2024-12-01', '18:30:00', 'QRIS', 'Lunas', 50000, 0, 6, 6),
(7, '2024-12-01', '18:30:00', 'QRIS', 'Lunas', 50000, 0, 7, 7),
(8, '2024-12-01', '18:30:00', 'QRIS', 'Lunas', 50000, 0, 8, 8),
(9, '2024-12-01', '18:30:00', 'QRIS', 'Lunas', 50000, 0, 9, 9),
(10, '2024-12-01', '18:30:00', 'QRIS', 'Lunas', 50000, 0, 10, 10),
(11, '2024-12-01', '18:30:00', 'QRIS', 'Lunas', 50000, 0, 1, 1),
(12, '2024-12-01', '18:30:00', 'QRIS', 'Lunas', 50000, 0, 2, 2),
(13, '2024-12-01', '18:30:00', 'QRIS', 'Lunas', 50000, 0, 3, 3),
(14, '2024-12-01', '18:30:00', 'QRIS', 'Lunas', 50000, 0, 4, 4),
(15, '2024-12-01', '18:30:00', 'QRIS', 'Lunas', 50000, 0, 5, 5);
