--Menu Data Utama
CREATE TABLE DataUtama (
    id_aju UNIQUEIDENTIFIER PRIMARY KEY,
    nomor_pengajuan VARCHAR(50),
    tanggal_pengajuan DATE,
    nomor_pendaftaran VARCHAR(50),
    tanggal_pendaftaran DATE,
    kd_pabean_asal VARCHAR(10),
    kd_skep_fasilitas VARCHAR(5),
    jenis_pib VARCHAR(5),
    kd_jenis_impor VARCHAR(5),
    kd_cara_bayar VARCHAR(5),
    kd_transaksi VARCHAR(5),
);

CREATE TABLE Pabean(
	kd_pabean_asal VARCHAR(10) PRIMARY KEY,
	ur_pabean_asal VARCHAR(100)
);

CREATE TABLE SKEPFasilitas(
	kd_skep_fasilitas VARCHAR(5) PRIMARY KEY,
	ur_skep_fasilitas VARCHAR(100)
);

CREATE TABLE PIB(
	jenis_pib VARCHAR(5) PRIMARY KEY,
	ur_jenis_pib VARCHAR(100)
);

CREATE TABLE JenisImpor(
	kd_jenis_impor VARCHAR(5) PRIMARY KEY,
	ur_jenis_impor VARCHAR(100)
);

CREATE TABLE CaraBayar(
	kd_pabean_asal VARCHAR(5) PRIMARY KEY,
	ur_pabean_asal VARCHAR(100)
);

CREATE TABLE Transaksi(
	kd_transaksi VARCHAR(5) PRIMARY KEY,
	ur_transaksi_impor VARCHAR(100)
);


--Menu Data Entitas
CREATE TABLE DataEntitas(
	id_entitas VARCHAR(10) PRIMARY KEY,
	id_aju UNIQUEIDENTIFIER,
	kd_entitas_pemberitahu VARCHAR(5),
	kd_entitas VARCHAR(5),
	FOREIGN KEY (kd_entitas_pemberitahu) REFERENCES JenisPemberitahuan(kd_entitas_pemberitahu),
	FOREIGN KEY (id_aju) REFERENCES DataUtama(id_aju)
);

CREATE TABLE JenisPemberitahuan(
	kd_entitas_pemberitahu VARCHAR(5) PRIMARY KEY,
	ur_entitas_pemberitahu VARCHAR(100),
	id_entitas VARCHAR(10),
	FOREIGN KEY (id_entitas) REFERENCES DataEntitas(id_entitas)
);

CREATE TABLE Pengusaha(
	kd_entitas VARCHAR(5) PRIMARY KEY,
	ur_entitas VARCHAR(100),
	kd_identitas VARCHAR(10),
	FOREIGN KEY (kd_identitas) REFERENCES DataEntitas(kd_identitas)
);

CREATE TABLE Identitas(
	kd_identitas VARCHAR(10) PRIMARY KEY,
	ur_identitas VARCHAR(100),
	no_identitas_16 VARCHAR(16),
	nama_identitas VARCHAR(100),
	kd_provinsi VARCHAR(10),
	kota VARCHAR(100),
	kecamatan VARCHAR(100),
	rt_rw VARCHAR(10),
	telephone VARCHAR(20),
	email VARCHAR(100),
	kd_status VARCHAR(10)
);

CREATE TABLE Provinsi(
	kd_provinsi VARCHAR(10) PRIMARY KEY,
	ur_provinsi VARCHAR(100),
);

CREATE TABLE [Status](
	kd_status VARCHAR(10) PRIMARY KEY,
	ur_status VARCHAR(100),
);


--Manu Data Pungutan
CREATE TABLE DataPungutan(
	id_pungutan VARCHAR(10) PRIMARY KEY,
	id_aju UNIQUEIDENTIFIER,
	kd_incoterms VARCHAR(10),
	kd_valuta VARCHAR(10),
	kurs DECIMAL(16, 2),
	nilai DECIMAL(16, 2),
	biaya_tambahan DECIMAL(16, 2),
	biaya_pengurang DECIMAL(16, 2),
	voluntary_declaration DECIMAL(16, 2),
	kd_asuransi_dibayar_di VARCHAR(5),
	asuransi DECIMAL(16, 2),
	freight DECIMAL(16, 2),
	cif DECIMAL(16, 2),
	cif_rp DECIMAL(16, 2),
	bruto DECIMAL(16, 2),
	netto DECIMAL(16, 2),
	kd_flag_kontainer VARCHAR(5),
	FOREIGN KEY (id_aju) REFERENCES DataUtama(id_aju)
);

CREATE TABLE Incoterms(
	kd_incoterms VARCHAR(10) PRIMARY KEY,
	ur_incoterms VARCHAR(100)
);

CREATE TABLE Valuta(
	kd_valuta VARCHAR(10) PRIMARY KEY,
	ur_valuta VARCHAR(100)
);

CREATE TABLE PembayaranAsuransi(
	kd_asuransi_dibayar_di VARCHAR(5) PRIMARY KEY,
	ur_asuransi_dibayar_di VARCHAR(100)
);

CREATE TABLE FlagKontainer(
	kd_flag_kontainer VARCHAR(5) PRIMARY KEY,
	ur_flag_kontainer VARCHAR(100)
);