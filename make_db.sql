/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     27/03/2020 9:13:02 p. m.                     */
/*==============================================================*/


drop table CLIENTE;

drop table PRODUCTOS;

drop table RELACION_CLIENTE_PRODUCTO;

drop table TIPO_DOCUMENTO;

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           NUMERIC(20)          not null,
   NOMBRES              CHAR(10)             null,
   ID_DOC               CHAR(5)              not null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: PRODUCTOS                                             */
/*==============================================================*/
create table PRODUCTOS (
   ID                   CHAR(5)              not null,
   DESCRIPCION          VARCHAR(20)          null,
   constraint PK_PRODUCTOS primary key (ID)
);

/*==============================================================*/
/* Table: RELACION_CLIENTE_PRODUCTO                             */
/*==============================================================*/
create table RELACION_CLIENTE_PRODUCTO (
   ID_CLIENTE           NUMERIC(20)          null,
   ID                   CHAR(5)              null
);

/*==============================================================*/
/* Table: TIPO_DOCUMENTO                                        */
/*==============================================================*/
create table TIPO_DOCUMENTO (
   ID_DOC               CHAR(5)              not null,
   DESCRIPCION          VARCHAR(20)          null,
   constraint PK_TIPO_DOCUMENTO primary key (ID_DOC)
);

alter table CLIENTE
   add constraint FK_CLIENTE_REFERENCE_TIPO_DOC foreign key (ID_DOC)
      references TIPO_DOCUMENTO (ID_DOC)
      on delete restrict on update restrict;

alter table RELACION_CLIENTE_PRODUCTO
   add constraint FK_RELACION_REFERENCE_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table RELACION_CLIENTE_PRODUCTO
   add constraint FK_RELACION_REFERENCE_PRODUCTO foreign key (ID)
      references PRODUCTOS (ID)
      on delete restrict on update restrict;

