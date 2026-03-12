/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     12/12/2023 15:31:03                          */
/*==============================================================*/


drop table if exists BARANG;

drop table if exists CABANG_ALFAMART;

drop table if exists KASIR;

drop table if exists KERANJANG;

drop table if exists NOTA;

drop table if exists PEMASOK_BARANG;

drop table if exists STOK_BARANG;

/*==============================================================*/
/* Table: BARANG                                                */
/*==============================================================*/
create table BARANG
(
   ID_BARANG            int not null,
   ID_PEMASOK_BARANG    int,
   BARCODE_BARANG       int,
   NAMA_BARANG          varchar(20),
   HARGA_BARANG         int,
   KATEGORI_BARANG      varchar(20),
   STOK_BARANG          int,
   TGL_KADALUARSA_BARANG date,
   MERK_BARANG          varchar(30),
   STATUS_BOIKOT_BARANG int,
   primary key (ID_BARANG)
);

/*==============================================================*/
/* Table: CABANG_ALFAMART                                       */
/*==============================================================*/
create table CABANG_ALFAMART
(
   ID_CABANG_ALFAMART   int not null,
   NAMA_CABANG_ALFAMART varchar(30),
   ALAMAT1T_CABANG_ALFAMART varchar(150),
   ALAMAT2_CABANG_ALFAMART varchar(150),
   NPWP_CABANG_ALFAMART varchar(20),
   NO_KONTAK_KRITIK_SARAN varchar(12),
   NO_KONTAK_SMS        varchar(12),
   primary key (ID_CABANG_ALFAMART)
);

/*==============================================================*/
/* Table: KASIR                                                 */
/*==============================================================*/
create table KASIR
(
   ID_KASIR             int not null,
   ID_CABANG_ALFAMART   int,
   NIK_KTP_KASIR        varchar(20),
   NAMA_KASIR           varchar(8),
   ALAMAT_KASIR         varchar(200),
   USER_KASIR           text,
   PASS_KASIR           text,
   NO_KONTAK_KASIR      varchar(200),
   JK_KASIR             varchar(200),
   TGL_LAHIR_KASIR      date,
   TEMPAT_DOMISILI_KASIR text,
   STATUS_KASIR         varchar(15),
   AGAMA_KASIR          varchar(15),
   primary key (ID_KASIR)
);

/*==============================================================*/
/* Table: KERANJANG                                             */
/*==============================================================*/
create table KERANJANG
(
   ID_KERANJANG         int not null,
   ID_BARANG            int,
   ID_NOTA              varchar(20),
   TGL_KERANJANG        date,
   QTY_KERANJANG        int,
   HARGA_BARANG_KERANJANG int,
   DISKON_BARANG_KERANJANG int,
   primary key (ID_KERANJANG)
);

/*==============================================================*/
/* Table: NOTA                                                  */
/*==============================================================*/
create table NOTA
(
   ID_NOTA              varchar(20) not null,
   ID_KASIR             int,
   WAKTU_NOTA           datetime,
   JUMLAH_YANG_DIBAYAR_NOTA int,
   JUMLAH_HARGA_BARANG_NOTA int,
   PAJAK_NOTA           int,
   UANG_KEMBALIAN_NOTA  int,
   primary key (ID_NOTA)
);

/*==============================================================*/
/* Table: PEMASOK_BARANG                                        */
/*==============================================================*/
create table PEMASOK_BARANG
(
   ID_PEMASOK_BARANG    int not null,
   NAMA_PEMASOK_BARANG  varchar(100),
   ALAMAT_PEMASOK_BARANG text,
   NO_KONTAK_PEMASOK_BARANG varchar(13),
   primary key (ID_PEMASOK_BARANG)
);

/*==============================================================*/
/* Table: STOK_BARANG                                           */
/*==============================================================*/
create table STOK_BARANG
(
   ID_STOK_CABANG       int not null,
   ID_CABANG_ALFAMART   int,
   ID_BARANG            int,
   JUMLAH_STOK_CABANG   int,
   primary key (ID_STOK_CABANG)
);

alter table BARANG add constraint FK_MEMASOKAN_BARANG_KE_TOKO foreign key (ID_PEMASOK_BARANG)
      references PEMASOK_BARANG (ID_PEMASOK_BARANG) on delete cascade on update cascade;

alter table KASIR add constraint FK_KASIR_BERKERJA_DI_ALFAMART foreign key (ID_CABANG_ALFAMART)
      references CABANG_ALFAMART (ID_CABANG_ALFAMART) on delete cascade on update cascade;

alter table KERANJANG add constraint FK_KERANJANG_MEMILIKI_DATA_BARANG foreign key (ID_BARANG)
      references BARANG (ID_BARANG) on delete cascade on update cascade;

alter table KERANJANG add constraint FK_NOTA_UNTUK_KERANJANG_BELANJA foreign key (ID_NOTA)
      references NOTA (ID_NOTA) on delete cascade on update cascade;

alter table NOTA add constraint FK_KASIR_YANG_MELAYANI foreign key (ID_KASIR)
      references KASIR (ID_KASIR) on delete cascade on update cascade;

alter table STOK_BARANG add constraint FK_JUMLAH_STOK_BARANG foreign key (ID_BARANG)
      references BARANG (ID_BARANG) on delete cascade on update cascade;

alter table STOK_BARANG add constraint FK_SETIAP_CABANG_YANG_MEMILIKI_STOK_BARANG foreign key (ID_CABANG_ALFAMART)
      references CABANG_ALFAMART (ID_CABANG_ALFAMART) on delete cascade on update cascade;

