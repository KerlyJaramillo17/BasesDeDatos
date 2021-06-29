/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           INT4                 not null,
   CEDULA_CLIENTE       INT4                 not null,
   NOMBRE_CLIENTE       VARCHAR(30)          not null,
   APELLIDO_CLIENTE     VARCHAR(30)          not null,
   TELEFONO_CLIENTE     INT4                 not null,
   NACIONALIDAD         VARCHAR(30)          not null,
   DOMICILIO_CLIENTE    VARCHAR(30)          not null,
   LUGARDETRABAJO       VARCHAR(30)          not null,
   TELF_TRABAJO         INT4                 not null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: COMPRAR_LIBRO_A_PROVEEDOR                             */
/*==============================================================*/
create table COMPRAR_LIBRO_A_PROVEEDOR (
   ID_COMPRA            INT4                 not null,
   CODIGO_EMPLEADO      INT4                 null,
   ID_LIBRO             INT4                 null,
   ID_PROVEEDORES       INT4                 null,
   DIA_COMPRA           DATE                 not null,
   CANTIDAD_DE_LIBRO    INT4                 not null,
   COSTO_ADQUISICION    DECIMAL              not null,
   REPORTES             INT4                 not null,
   constraint PK_COMPRAR_LIBRO_A_PROVEEDOR primary key (ID_COMPRA)
);


/*==============================================================*/
/* Table: EDITORIAL                                             */
/*==============================================================*/
create table EDITORIAL (
   ID_EDITORIAL         INT4                 not null,
   DESCRIPCION          VARCHAR(60)          not null,
   constraint PK_EDITORIAL primary key (ID_EDITORIAL)
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   CODIGO_EMPLEADO      INT4                 not null,
   NOMBRE_EMPLEADO      VARCHAR(30)          not null,
   APELLIDO_EMPLEADO    VARCHAR(30)          not null,
   CEDULA_EMPLEADO      INT4                 not null,
   CORREO_EMPLEADO      VARCHAR(30)          not null,
   constraint PK_EMPLEADO primary key (CODIGO_EMPLEADO)
);



/*==============================================================*/
/* Table: GENERO                                                */
/*==============================================================*/
create table GENERO (
   ID_GENERO            INT4                 not null,
   NOMBRE               VARCHAR(60)          not null,
   constraint PK_GENERO primary key (ID_GENERO)
);


/*==============================================================*/
/* Table: LIBRO                                                 */
/*==============================================================*/
create table LIBRO (
   ID_LIBRO             INT4                 not null,
   ID_EDITORIAL         INT4                 null,
   ID_GENERO            INT4                 null,
   ID_VERSION           INT4                 null,
   TITULO_LIBRO         VARCHAR(60)          not null,
   AUTOR_LIBRO          VARCHAR(60)          not null,
   ANO_LIBRO            DATE                 not null,
   EDICIONES_LIBRO      VARCHAR(60)          not null,
   ISBN_LIBRO           INT4                 not null,
   PRECIO_LIBRO         DECIMAL              not null,
   STOCK_LIBRO          INT4                 not null,
   constraint PK_LIBRO primary key (ID_LIBRO)
);



/*==============================================================*/
/* Table: PRESTAR_LIBRO                                         */
/*==============================================================*/
create table PRESTAR_LIBRO (
   ID_PRESTAMO          INT4                 not null,
   ID_LIBRO             INT4                 null,
   ID_CLIENTE           INT4                 null,
   FECHA_PRESTAMO       DATE                 not null,
   FEHA_ENTREGA_ESTIMADA DATE                 not null,
   FECHA_ENTREGA_REAL   DATE                 null,
   constraint PK_PRESTAR_LIBRO primary key (ID_PRESTAMO)
);

/*==============================================================*/
/* Table: PROVEEDORES                                           */
/*==============================================================*/
create table PROVEEDORES (
   ID_PROVEEDORES       INT4                 not null,
   CEDULA_PROVEEDORES   INT4                 not null,
   NOMBRE_PROVEEDORES   VARCHAR(30)          not null,
   APELLIDOS_PROVEEDORES VARCHAR(30)          not null,
   EMPRESAQTRABAJA      VARCHAR(30)          not null,
   CANT_LIBROS_Q_PROVEE INT4                 not null,
   constraint PK_PROVEEDORES primary key (ID_PROVEEDORES)
);

/*==============================================================*/
/* Table: VENTA_LIBROS_A_CLIENTE                                */
/*==============================================================*/
create table VENTA_LIBROS_A_CLIENTE (
   ID_VENTA             INT4                 not null,
   ID_LIBRO             INT4                 null,
   ID_CLIENTE           INT4                 null,
   FECHA_VENTA          DATE                 not null,
   CANTIDAD_LIBRO_VENTA INT4                 not null,
   PRECIO_LIBRO         DECIMAL              not null,
   TOTAL_A_PAGAR        INT4                 not null,
   constraint PK_VENTA_LIBROS_A_CLIENTE primary key (ID_VENTA)
);

/*==============================================================*/
/* Table: VERSION                                               */
/*==============================================================*/
create table VERSION (
   ID_VERSION           INT4                 not null,
   DESCRIPCION          VARCHAR(60)          not null,
   constraint PK_VERSION primary key (ID_VERSION)
);

alter table COMPRAR_LIBRO_A_PROVEEDOR
   add constraint FK_COMPRAR__RELATIONS_EMPLEADO foreign key (CODIGO_EMPLEADO)
      references EMPLEADO (CODIGO_EMPLEADO)
      on delete restrict on update restrict;

alter table COMPRAR_LIBRO_A_PROVEEDOR
   add constraint FK_COMPRAR__RELATIONS_LIBRO foreign key (ID_LIBRO)
      references LIBRO (ID_LIBRO)
      on delete restrict on update restrict;

alter table COMPRAR_LIBRO_A_PROVEEDOR
   add constraint FK_COMPRAR__VENDE_PROVEEDO foreign key (ID_PROVEEDORES)
      references PROVEEDORES (ID_PROVEEDORES)
      on delete restrict on update restrict;

alter table LIBRO
   add constraint FK_LIBRO_RELATIONS_VERSION foreign key (ID_VERSION)
      references VERSION (ID_VERSION)
      on delete restrict on update restrict;

alter table LIBRO
   add constraint FK_LIBRO_RELATIONS_EDITORIA foreign key (ID_EDITORIAL)
      references EDITORIAL (ID_EDITORIAL)
      on delete restrict on update restrict;

alter table LIBRO
   add constraint FK_LIBRO_RELATIONS_GENERO foreign key (ID_GENERO)
      references GENERO (ID_GENERO)
      on delete restrict on update restrict;

alter table PRESTAR_LIBRO
   add constraint FK_PRESTAR__OBTIENE_LIBRO foreign key (ID_LIBRO)
      references LIBRO (ID_LIBRO)
      on delete restrict on update restrict;

alter table PRESTAR_LIBRO
   add constraint FK_PRESTAR__PRESTA_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table VENTA_LIBROS_A_CLIENTE
   add constraint FK_VENTA_LI_COMPRA_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table VENTA_LIBROS_A_CLIENTE
   add constraint FK_VENTA_LI_RELATIONS_LIBRO foreign key (ID_LIBRO)
      references LIBRO (ID_LIBRO)
      on delete restrict on update restrict;

