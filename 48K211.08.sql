-- Create Database
CREATE DATABASE QuanLyNhanSu;
USE QuanLyNhanSu;

-- Table: QuanLy
CREATE TABLE QuanLy (
    Taikhoan VARCHAR(25) PRIMARY KEY NOT NULL,
    Matkhau VARCHAR(10) NOT NULL
);
-- Table: ChucVu
CREATE TABLE ChucVu (
    MaChucVu VARCHAR(7) NOT NULL PRIMARY KEY,
    ChucVu NVARCHAR(25) NOT NULL
);
-- Table: NhanVien
CREATE TABLE NhanVien (
    MaNV VARCHAR(7) PRIMARY KEY NOT NULL,
    Hovaten NVARCHAR(50) NOT NULL,
    Sodienthoai CHAR(10),
    Gioitinh BIT,
    Diachi NVARCHAR(150),
    Ngaythangnamsinh DATE,
    PhuCap FLOAT,
    MaChucVu CHAR(4) NOT NULL,
    FOREIGN KEY (MaChucVu) REFERENCES ChucVu(MaChucVu)
);

-- Table: ChiTietThuongPhat
CREATE TABLE ChiTietThuongPhat (
    MaThuongPhat VARCHAR(7) PRIMARY KEY NOT NULL,
    MaNV CHAR(4) NOT NULL,
    NgayThangNamTP DATE,
    Phat FLOAT,
    Thuong FLOAT,
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);

-- Table: UngLuong
CREATE TABLE UngLuong (
    MaUngLuong VARCHAR(7) NOT NULL PRIMARY KEY,
    MaNV VARCHAR(7) NOT NULL,
    NgayUng DATE,
    SoTien FLOAT,
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);

-- Table: BangChamCongChiTiet
CREATE TABLE BangChamCongChiTiet (
    MaChamCong VARCHAR(7) NOT NULL,
    MaNV VARCHAR(7) NOT NULL,
    NgayThangNam DATE,
    GioDiLam TIME,
    GioRaVe TIME,
    SoGioLam FLOAT,
    SoGioTre FLOAT,
    PRIMARY KEY (MaChamCong, NgayThangNam),
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);
-- Table: BangLuong
CREATE TABLE BangLuong (
    MaLuong VARCHAR(7) NOT NULL PRIMARY KEY,
    MaNV VARCHAR(7) NOT NULL,
    ThangNamLuong DATE,
    LuongCT DECIMAL(10,2),
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);

-- Table: BangLuongChiTiet
CREATE TABLE BangLuongChiTiet (
    MaLuong VARCHAR(7) NOT NULL,
	MaChamCong VARCHAR(7) NOT NULL,
    NgayThangNam DATE primary key NOT NULL,
    LuongTheoGio DECIMAL(10,2),
    LuongTheoNgay DECIMAL(10,2),
    FOREIGN KEY (MaLuong) REFERENCES BangLuong(MaLuong),
	FOREIGN KEY(MaChamCong,NgayThangNam) REFERENCES BangChamCongChiTiet(MaChamCong,NgayThangNam)
);
-- Table: PhanCongCaLamViec
CREATE TABLE PhanCongCaLamViec (
    MaPhanCong VARCHAR(7) not null primary key,
    MaNV VARCHAR(7) not null,
    NgayThangNamLamViec DATE,
    Thoigianvaoca TIME,
    Thoigianketca TIME,
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);
INSERT INTO QuanLy (Taikhoan, Matkhau) VALUES
('admin01', 'pass12345');  -- This is within the 10-character limit.


ALTER TABLE QuanLy ALTER COLUMN Matkhau VARCHAR(20);

-- Then insert the original password:
INSERT INTO QuanLy (Taikhoan, Matkhau) VALUES
('admin01', 'password123');

-- Select all rows from QuanLy table
SELECT * FROM QuanLy;

-- Select all rows from ChucVu table
SELECT * FROM ChucVu;

-- Select all rows from NhanVien table
SELECT * FROM NhanVien;

-- Select all rows from ChiTietThuongPhat table
SELECT * FROM ChiTietThuongPhat;

-- Select all rows from UngLuong table
SELECT * FROM UngLuong;

-- Select all rows from BangChamCongChiTiet table
SELECT * FROM BangChamCongChiTiet;

-- Select all rows from BangLuong table
SELECT * FROM BangLuong;
-- Select all rows from BangLuongChiTiet table
SELECT * FROM BangLuongChiTiet;

-- Select all rows from PhanCongCaLamViec table
SELECT * FROM PhanCongCaLamViec;SSSS





