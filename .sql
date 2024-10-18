--------------------------------------------------------
-- Archivo creado  - Thursday-October-10-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence HABITACIONES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HABITACIONES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence INVENTARIO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "INVENTARIO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LOGS_DISPONIBILIDAD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "LOGS_DISPONIBILIDAD_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 181 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MASCOTAS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "MASCOTAS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PAGOS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PAGOS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PRECIOS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PRECIOS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PROMOCIONES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROMOCIONES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PROVEEDORES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROVEEDORES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence RESERVACIONES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "RESERVACIONES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 141 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SERVICIOS_RESERVACIONES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SERVICIOS_RESERVACIONES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 72 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SERVICIOS_RESERVACION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SERVICIOS_RESERVACION_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 241 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SERVICIOS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SERVICIOS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence USUARIOS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "USUARIOS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 121 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table HABITACIONES
--------------------------------------------------------

  CREATE TABLE "HABITACIONES" 
   (	"HABITACION_ID" NUMBER, 
	"NOMBRE_HABITACION" VARCHAR2(100 BYTE), 
	"ESTADO" VARCHAR2(50 BYTE), 
	"CAPACIDAD_MAXIMA" NUMBER, 
	"TIPO_HABITACION" VARCHAR2(50 BYTE), 
	"UBICACION" VARCHAR2(100 BYTE), 
	"DESCRIPCION" VARCHAR2(4000 BYTE), 
	"PRECIO_BASE" NUMBER(10,2), 
	"BANOS_PROPIOS" NUMBER, 
	"CANTIDAD_CAMAS" NUMBER, 
	"IMAGENES" CLOB
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("IMAGENES") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table INVENTARIO
--------------------------------------------------------

  CREATE TABLE "INVENTARIO" 
   (	"INVENTARIO_ID" NUMBER, 
	"NOMBRE_ITEM" VARCHAR2(100 BYTE), 
	"CANTIDAD" NUMBER, 
	"FECHA_INGRESO" TIMESTAMP (6) DEFAULT CURRENT_TIMESTAMP, 
	"PROVEEDOR" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table LOGS_DISP
--------------------------------------------------------

  CREATE TABLE "LOGS_DISP" 
   (	"LOG_ID" NUMBER, 
	"HABITACION_ID" NUMBER, 
	"ESTADO" VARCHAR2(50 BYTE), 
	"COMENTARIOS" VARCHAR2(4000 BYTE), 
	"FECHA_ENTRADA" TIMESTAMP (6) DEFAULT CURRENT_TIMESTAMP, 
	"FECHA_SALIDA" TIMESTAMP (6) DEFAULT NULL
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table LOGS_DISP_BACKUP
--------------------------------------------------------

  CREATE TABLE "LOGS_DISP_BACKUP" 
   (	"LOG_ID" NUMBER, 
	"HABITACION_ID" NUMBER, 
	"ESTADO" VARCHAR2(50 BYTE), 
	"FECHA_CAMBIO" TIMESTAMP (6), 
	"COMENTARIOS" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MASCOTAS
--------------------------------------------------------

  CREATE TABLE "MASCOTAS" 
   (	"MASCOTA_ID" NUMBER, 
	"PROPIETARIO_ID" NUMBER, 
	"NOMBRE_MASCOTA" VARCHAR2(100 BYTE), 
	"ESPECIE" VARCHAR2(50 BYTE), 
	"RAZA" VARCHAR2(100 BYTE), 
	"PESO" NUMBER(5,2), 
	"FECHA_REGISTRO" TIMESTAMP (6) DEFAULT CURRENT_TIMESTAMP, 
	"EDAD" NUMBER, 
	"SEXO" VARCHAR2(10 BYTE), 
	"CATEGORIA" VARCHAR2(50 BYTE), 
	"FOTO" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PAGOS
--------------------------------------------------------

  CREATE TABLE "PAGOS" 
   (	"PAGO_ID" NUMBER, 
	"RESERVACION_ID" NUMBER, 
	"MONTO_TOTAL" NUMBER(10,2), 
	"FECHA_PAGO" TIMESTAMP (6) DEFAULT CURRENT_TIMESTAMP, 
	"METODO_PAGO" VARCHAR2(50 BYTE), 
	"ESTADO_PAGO" VARCHAR2(50 BYTE) DEFAULT 'pendiente'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PRECIOS
--------------------------------------------------------

  CREATE TABLE "PRECIOS" 
   (	"PRECIO_ID" NUMBER, 
	"TIPO_MASCOTA" VARCHAR2(50 BYTE), 
	"TIPO_HABITACION" VARCHAR2(50 BYTE), 
	"PRECIO_DIARIO" NUMBER(10,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PROMOCIONES
--------------------------------------------------------

  CREATE TABLE "PROMOCIONES" 
   (	"PROMOCION_ID" NUMBER, 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"DESCRIPCION" VARCHAR2(4000 BYTE), 
	"DESCUENTO" NUMBER(5,2), 
	"FECHA_INICIO" TIMESTAMP (6), 
	"FECHA_FIN" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PROVEEDORES
--------------------------------------------------------

  CREATE TABLE "PROVEEDORES" 
   (	"PROVEEDOR_ID" NUMBER, 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"CONTACTO" VARCHAR2(100 BYTE), 
	"DIRECCION" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table RESERVACIONES
--------------------------------------------------------

  CREATE TABLE "RESERVACIONES" 
   (	"RESERVACION_ID" NUMBER, 
	"MASCOTA_ID" NUMBER, 
	"HABITACION_ID" NUMBER, 
	"FECHA_ENTRADA" TIMESTAMP (6), 
	"FECHA_SALIDA" TIMESTAMP (6), 
	"ESTADO" VARCHAR2(50 BYTE) DEFAULT 'borrador', 
	"TOTAL" NUMBER(10,2), 
	"NOTAS" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SERVICIOS
--------------------------------------------------------

  CREATE TABLE "SERVICIOS" 
   (	"SERVICIO_ID" NUMBER, 
	"NOMBRE_SERVICIO" VARCHAR2(100 BYTE), 
	"DESCRIPCION" VARCHAR2(4000 BYTE), 
	"PRECIO" NUMBER(10,2), 
	"DURACION" NUMBER, 
	"TIPO" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SERVICIOS_RESERVACIONES
--------------------------------------------------------

  CREATE TABLE "SERVICIOS_RESERVACIONES" 
   (	"SERVICIO_RESERVACION_ID" NUMBER, 
	"RESERVACION_ID" NUMBER, 
	"SERVICIO_ID" NUMBER, 
	"CANTIDAD" NUMBER, 
	"PRECIO" NUMBER(10,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USUARIOS
--------------------------------------------------------

  CREATE TABLE "USUARIOS" 
   (	"USUARIO_ID" NUMBER, 
	"NOMBRE_USUARIO" VARCHAR2(100 BYTE), 
	"CORREO" VARCHAR2(100 BYTE), 
	"CONTRASEÑA" VARCHAR2(100 BYTE), 
	"ROL" VARCHAR2(50 BYTE), 
	"TELEFONO" VARCHAR2(15 BYTE), 
	"FECHA_CREACION" TIMESTAMP (6) DEFAULT CURRENT_TIMESTAMP, 
	"AVATAR_URL" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into HABITACIONES
SET DEFINE OFF;
Insert into HABITACIONES (HABITACION_ID,NOMBRE_HABITACION,ESTADO,CAPACIDAD_MAXIMA,TIPO_HABITACION,UBICACION,DESCRIPCION,PRECIO_BASE,BANOS_PROPIOS,CANTIDAD_CAMAS) values ('1','Habitación Perro fiel','Ocupada','2','perro','Planta Baja','Habitación con vista al jardín:

una habitacion comoda, para tus peludos favoritos, cuenta con 2 camas muy comodas rellenas de plumas de pavo ','50','1','2');
Insert into HABITACIONES (HABITACION_ID,NOMBRE_HABITACION,ESTADO,CAPACIDAD_MAXIMA,TIPO_HABITACION,UBICACION,DESCRIPCION,PRECIO_BASE,BANOS_PROPIOS,CANTIDAD_CAMAS) values ('22','Habitación serpiente ','Ocupada','4','gato','bajo techo','habitacion con termometro adaptable al ambiente','150','0','0');
Insert into HABITACIONES (HABITACION_ID,NOMBRE_HABITACION,ESTADO,CAPACIDAD_MAXIMA,TIPO_HABITACION,UBICACION,DESCRIPCION,PRECIO_BASE,BANOS_PROPIOS,CANTIDAD_CAMAS) values ('24','Habitación Económica','Ocupada','1','Estándar','Segundo Piso','Habitación sencilla con baño compartido.','75','0','1');
Insert into HABITACIONES (HABITACION_ID,NOMBRE_HABITACION,ESTADO,CAPACIDAD_MAXIMA,TIPO_HABITACION,UBICACION,DESCRIPCION,PRECIO_BASE,BANOS_PROPIOS,CANTIDAD_CAMAS) values ('26','Habitación Familiar','Disponible','4','Familiar','Planta Alta','Ideal para familias grandes, con dos camas dobles.','200','2','2');
Insert into HABITACIONES (HABITACION_ID,NOMBRE_HABITACION,ESTADO,CAPACIDAD_MAXIMA,TIPO_HABITACION,UBICACION,DESCRIPCION,PRECIO_BASE,BANOS_PROPIOS,CANTIDAD_CAMAS) values ('28','Habitación Premium','Disponible','3','Suite','Tercer Piso','Suite con jacuzzi privado y balcón.','250','1','2');
Insert into HABITACIONES (HABITACION_ID,NOMBRE_HABITACION,ESTADO,CAPACIDAD_MAXIMA,TIPO_HABITACION,UBICACION,DESCRIPCION,PRECIO_BASE,BANOS_PROPIOS,CANTIDAD_CAMAS) values ('30','Habitación Ejecutiva','Disponible','1','Estándar','Segundo Piso','Habitación perfecta para viajes de negocios.','120','1','1');
Insert into HABITACIONES (HABITACION_ID,NOMBRE_HABITACION,ESTADO,CAPACIDAD_MAXIMA,TIPO_HABITACION,UBICACION,DESCRIPCION,PRECIO_BASE,BANOS_PROPIOS,CANTIDAD_CAMAS) values ('32','Habitación Doble','Disponible','2','Estándar','Primer Piso','Habitación doble con vista a la piscina.','180','1','2');
Insert into HABITACIONES (HABITACION_ID,NOMBRE_HABITACION,ESTADO,CAPACIDAD_MAXIMA,TIPO_HABITACION,UBICACION,DESCRIPCION,PRECIO_BASE,BANOS_PROPIOS,CANTIDAD_CAMAS) values ('34','Suite Presidencial','Disponible','5','Suite','Último Piso','La suite más lujosa, con terraza privada.','500','3','3');
Insert into HABITACIONES (HABITACION_ID,NOMBRE_HABITACION,ESTADO,CAPACIDAD_MAXIMA,TIPO_HABITACION,UBICACION,DESCRIPCION,PRECIO_BASE,BANOS_PROPIOS,CANTIDAD_CAMAS) values ('36','Habitación Individual','Ocupada','1','Estándar','Planta Baja','Cómoda habitación individual con jardín privado.','90','1','1');
Insert into HABITACIONES (HABITACION_ID,NOMBRE_HABITACION,ESTADO,CAPACIDAD_MAXIMA,TIPO_HABITACION,UBICACION,DESCRIPCION,PRECIO_BASE,BANOS_PROPIOS,CANTIDAD_CAMAS) values ('38','Habitación Doble Económica','Disponible','2','Económica','Segundo Piso','Habitación económica con dos camas individuales.','80','0','2');
Insert into HABITACIONES (HABITACION_ID,NOMBRE_HABITACION,ESTADO,CAPACIDAD_MAXIMA,TIPO_HABITACION,UBICACION,DESCRIPCION,PRECIO_BASE,BANOS_PROPIOS,CANTIDAD_CAMAS) values ('40','Habitación Loft','Disponible','3','Loft','Ático','Moderno loft con cocina integrada y grandes ventanales.','300','2','2');
REM INSERTING into INVENTARIO
SET DEFINE OFF;
Insert into INVENTARIO (INVENTARIO_ID,NOMBRE_ITEM,CANTIDAD,FECHA_INGRESO,PROVEEDOR) values ('1','Comida para perros','100',to_timestamp('02/10/24 23:16:02,675000000','DD/MM/RR HH24:MI:SSXFF'),'Proveedor de Alimentos XYZ');
REM INSERTING into LOGS_DISP
SET DEFINE OFF;
Insert into LOGS_DISP (LOG_ID,HABITACION_ID,ESTADO,COMENTARIOS,FECHA_ENTRADA,FECHA_SALIDA) values ('173','26','Disponible','La reservación ha sido completada',to_timestamp('10/10/24 00:24:00,000000000','DD/MM/RR HH24:MI:SSXFF'),to_timestamp('10/10/24 00:24:00,000000000','DD/MM/RR HH24:MI:SSXFF'));
Insert into LOGS_DISP (LOG_ID,HABITACION_ID,ESTADO,COMENTARIOS,FECHA_ENTRADA,FECHA_SALIDA) values ('174','22','Disponible','La reservación ha sido completada',to_timestamp('10/10/24 00:50:00,000000000','DD/MM/RR HH24:MI:SSXFF'),to_timestamp('12/10/24 00:50:00,000000000','DD/MM/RR HH24:MI:SSXFF'));
Insert into LOGS_DISP (LOG_ID,HABITACION_ID,ESTADO,COMENTARIOS,FECHA_ENTRADA,FECHA_SALIDA) values ('175','1','Disponible','La reservación ha sido completada',to_timestamp('10/10/24 01:01:00,000000000','DD/MM/RR HH24:MI:SSXFF'),to_timestamp('13/10/24 01:01:00,000000000','DD/MM/RR HH24:MI:SSXFF'));
Insert into LOGS_DISP (LOG_ID,HABITACION_ID,ESTADO,COMENTARIOS,FECHA_ENTRADA,FECHA_SALIDA) values ('176','24','Disponible','La reservación ha sido completada',to_timestamp('10/10/24 01:06:00,000000000','DD/MM/RR HH24:MI:SSXFF'),to_timestamp('12/10/24 01:06:00,000000000','DD/MM/RR HH24:MI:SSXFF'));
Insert into LOGS_DISP (LOG_ID,HABITACION_ID,ESTADO,COMENTARIOS,FECHA_ENTRADA,FECHA_SALIDA) values ('171','36','Disponible','La reservación ha sido completada',to_timestamp('10/10/24 00:13:00,000000000','DD/MM/RR HH24:MI:SSXFF'),to_timestamp('12/10/24 00:13:00,000000000','DD/MM/RR HH24:MI:SSXFF'));
Insert into LOGS_DISP (LOG_ID,HABITACION_ID,ESTADO,COMENTARIOS,FECHA_ENTRADA,FECHA_SALIDA) values ('172','38','Disponible','La reservación ha sido completada',to_timestamp('12/10/24 00:21:00,000000000','DD/MM/RR HH24:MI:SSXFF'),to_timestamp('16/10/24 00:21:00,000000000','DD/MM/RR HH24:MI:SSXFF'));
REM INSERTING into LOGS_DISP_BACKUP
SET DEFINE OFF;
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('1','1','Disponible',to_timestamp('02/10/24 23:15:57,904000000','DD/MM/RR HH24:MI:SSXFF'),'Habitación lista para nuevos huéspedes');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('25','38','ocupada',to_timestamp('03/10/24 03:12:39,833000000','DD/MM/RR HH24:MI:SSXFF'),'ocupada para nuevos');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('26','36','ocupada',to_timestamp('05/10/24 03:12:39,833000000','DD/MM/RR HH24:MI:SSXFF'),'ocupada para nuevos');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('23','40','ocupada',to_timestamp('06/10/24 23:15:57,904000000','DD/MM/RR HH24:MI:SSXFF'),'ocupada para nuevos');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('44','36','disponible',to_timestamp('07/10/24 03:34:33,927000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('45','40','disponible',to_timestamp('07/10/24 03:34:33,927000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('46','40','ocupada',to_timestamp('06/10/24 23:15:57,904000000','DD/MM/RR HH24:MI:SSXFF'),'ocupada para nuevos');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('47','38','disponible',to_timestamp('07/10/24 03:35:33,952000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('48','36','disponible',to_timestamp('07/10/24 03:35:33,952000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('49','40','disponible',to_timestamp('07/10/24 03:35:33,952000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('50','40','disponible',to_timestamp('07/10/24 03:35:33,952000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('51','38','disponible',to_timestamp('07/10/24 03:36:33,026000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('52','36','disponible',to_timestamp('07/10/24 03:36:33,026000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('53','40','disponible',to_timestamp('07/10/24 03:36:33,026000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('54','40','disponible',to_timestamp('07/10/24 03:36:33,026000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('55','38','disponible',to_timestamp('07/10/24 03:37:33,015000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('56','36','disponible',to_timestamp('07/10/24 03:37:33,015000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('57','40','disponible',to_timestamp('07/10/24 03:37:33,015000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('40','38','disponible',to_timestamp('07/10/24 03:33:33,922000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('41','36','disponible',to_timestamp('07/10/24 03:33:33,922000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('42','40','disponible',to_timestamp('07/10/24 03:33:33,923000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('43','38','disponible',to_timestamp('07/10/24 03:34:33,927000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('58','40','disponible',to_timestamp('07/10/24 03:37:33,015000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('59','38','disponible',to_timestamp('07/10/24 03:38:33,019000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('60','36','disponible',to_timestamp('07/10/24 03:38:33,019000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('61','40','disponible',to_timestamp('07/10/24 03:38:33,019000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('62','40','disponible',to_timestamp('07/10/24 03:38:33,020000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('63','38','disponible',to_timestamp('07/10/24 03:39:33,010000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('64','36','disponible',to_timestamp('07/10/24 03:39:33,010000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('65','40','disponible',to_timestamp('07/10/24 03:39:33,010000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('66','40','disponible',to_timestamp('07/10/24 03:39:33,010000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('67','38','disponible',to_timestamp('07/10/24 03:40:33,012000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('68','36','disponible',to_timestamp('07/10/24 03:40:33,012000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('69','40','disponible',to_timestamp('07/10/24 03:40:33,013000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('70','40','disponible',to_timestamp('07/10/24 03:40:33,013000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('71','38','disponible',to_timestamp('07/10/24 03:41:33,020000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('72','36','disponible',to_timestamp('07/10/24 03:41:33,020000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('73','40','disponible',to_timestamp('07/10/24 03:41:33,020000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('74','40','disponible',to_timestamp('07/10/24 03:41:33,021000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('75','38','disponible',to_timestamp('07/10/24 03:42:33,025000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('76','36','disponible',to_timestamp('07/10/24 03:42:33,025000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('77','40','disponible',to_timestamp('07/10/24 03:42:33,026000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('78','40','disponible',to_timestamp('07/10/24 03:42:33,026000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('79','38','disponible',to_timestamp('07/10/24 03:43:33,013000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('80','36','disponible',to_timestamp('07/10/24 03:43:33,014000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('81','40','disponible',to_timestamp('07/10/24 03:43:33,014000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('82','40','disponible',to_timestamp('07/10/24 03:43:33,014000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('83','38','disponible',to_timestamp('07/10/24 03:44:33,022000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('84','36','disponible',to_timestamp('07/10/24 03:44:33,022000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('85','40','disponible',to_timestamp('07/10/24 03:44:33,023000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('86','40','disponible',to_timestamp('07/10/24 03:44:33,023000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación ahora disponible');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('87','38','disponible',to_timestamp('07/10/24 03:45:33,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('88','36','disponible',to_timestamp('07/10/24 03:45:33,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('89','40','disponible',to_timestamp('07/10/24 03:45:33,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('90','40','disponible',to_timestamp('07/10/24 03:45:33,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('91','38','disponible',to_timestamp('07/10/24 03:47:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('92','36','disponible',to_timestamp('07/10/24 03:47:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('93','40','disponible',to_timestamp('07/10/24 03:47:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('94','40','disponible',to_timestamp('07/10/24 03:47:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('95','38','disponible',to_timestamp('07/10/24 03:49:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('96','36','disponible',to_timestamp('07/10/24 03:49:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('97','40','disponible',to_timestamp('07/10/24 03:49:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('98','40','disponible',to_timestamp('07/10/24 03:49:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('99','38','disponible',to_timestamp('07/10/24 03:51:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('100','36','disponible',to_timestamp('07/10/24 03:51:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('101','40','disponible',to_timestamp('07/10/24 03:51:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('102','40','disponible',to_timestamp('07/10/24 03:51:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('103','38','disponible',to_timestamp('07/10/24 03:53:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('104','36','disponible',to_timestamp('07/10/24 03:53:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('105','40','disponible',to_timestamp('07/10/24 03:53:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('106','40','disponible',to_timestamp('07/10/24 03:53:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('107','38','disponible',to_timestamp('07/10/24 03:55:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('108','36','disponible',to_timestamp('07/10/24 03:55:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('109','40','disponible',to_timestamp('07/10/24 03:55:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('110','40','disponible',to_timestamp('07/10/24 03:55:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('111','38','disponible',to_timestamp('07/10/24 03:57:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('112','36','disponible',to_timestamp('07/10/24 03:57:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('113','40','disponible',to_timestamp('07/10/24 03:57:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('114','40','disponible',to_timestamp('07/10/24 03:57:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('115','38','disponible',to_timestamp('07/10/24 03:59:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('116','36','disponible',to_timestamp('07/10/24 03:59:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('117','40','disponible',to_timestamp('07/10/24 03:59:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('118','40','disponible',to_timestamp('07/10/24 03:59:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('119','38','disponible',to_timestamp('07/10/24 04:01:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('120','36','disponible',to_timestamp('07/10/24 04:01:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('121','40','disponible',to_timestamp('07/10/24 04:01:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('122','40','disponible',to_timestamp('07/10/24 04:01:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('123','38','disponible',to_timestamp('07/10/24 04:03:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('124','36','disponible',to_timestamp('07/10/24 04:03:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('125','40','disponible',to_timestamp('07/10/24 04:03:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
Insert into LOGS_DISP_BACKUP (LOG_ID,HABITACION_ID,ESTADO,FECHA_CAMBIO,COMENTARIOS) values ('126','40','disponible',to_timestamp('07/10/24 04:03:22,000000000','DD/MM/RR HH24:MI:SSXFF'),'Actualización automática: habitación disponible nuevamente');
REM INSERTING into MASCOTAS
SET DEFINE OFF;
Insert into MASCOTAS (MASCOTA_ID,PROPIETARIO_ID,NOMBRE_MASCOTA,ESPECIE,RAZA,PESO,FECHA_REGISTRO,EDAD,SEXO,CATEGORIA,FOTO) values ('41','81','pugberto','Perro','pug','25',to_timestamp('06/10/24 00:13:52,406000000','DD/MM/RR HH24:MI:SSXFF'),'4','macho','Domestico','http://localhost:3000/imgs-mascotas/1728195232374-185550930-felidog.jpg');
Insert into MASCOTAS (MASCOTA_ID,PROPIETARIO_ID,NOMBRE_MASCOTA,ESPECIE,RAZA,PESO,FECHA_REGISTRO,EDAD,SEXO,CATEGORIA,FOTO) values ('23','81','Albert','cuerpespin',null,'5',to_timestamp('05/10/24 19:08:20,065000000','DD/MM/RR HH24:MI:SSXFF'),'2','macho','exotico','http://localhost:3000/imgs-mascotas/1728176900018-969108489-erizo.jpg');
Insert into MASCOTAS (MASCOTA_ID,PROPIETARIO_ID,NOMBRE_MASCOTA,ESPECIE,RAZA,PESO,FECHA_REGISTRO,EDAD,SEXO,CATEGORIA,FOTO) values ('25','81','COPO','conejo','holandes','5',to_timestamp('05/10/24 20:58:44,800000000','DD/MM/RR HH24:MI:SSXFF'),'3','macho','Exotico','/imgs-mascotas/1728433015496-64156698-team-1.jpg');
REM INSERTING into PAGOS
SET DEFINE OFF;
Insert into PAGOS (PAGO_ID,RESERVACION_ID,MONTO_TOTAL,FECHA_PAGO,METODO_PAGO,ESTADO_PAGO) values ('53','121','299,75',to_timestamp('10/10/24 00:25:10,607000000','DD/MM/RR HH24:MI:SSXFF'),'card','completado');
Insert into PAGOS (PAGO_ID,RESERVACION_ID,MONTO_TOTAL,FECHA_PAGO,METODO_PAGO,ESTADO_PAGO) values ('54','122','709,5',to_timestamp('10/10/24 00:51:06,192000000','DD/MM/RR HH24:MI:SSXFF'),'card','completado');
Insert into PAGOS (PAGO_ID,RESERVACION_ID,MONTO_TOTAL,FECHA_PAGO,METODO_PAGO,ESTADO_PAGO) values ('55','123','502,5',to_timestamp('10/10/24 01:01:54,681000000','DD/MM/RR HH24:MI:SSXFF'),'card','completado');
Insert into PAGOS (PAGO_ID,RESERVACION_ID,MONTO_TOTAL,FECHA_PAGO,METODO_PAGO,ESTADO_PAGO) values ('56','124','349,5',to_timestamp('10/10/24 01:07:11,741000000','DD/MM/RR HH24:MI:SSXFF'),'card','completado');
Insert into PAGOS (PAGO_ID,RESERVACION_ID,MONTO_TOTAL,FECHA_PAGO,METODO_PAGO,ESTADO_PAGO) values ('51','119','400',to_timestamp('10/10/24 00:14:02,260000000','DD/MM/RR HH24:MI:SSXFF'),'card','completado');
Insert into PAGOS (PAGO_ID,RESERVACION_ID,MONTO_TOTAL,FECHA_PAGO,METODO_PAGO,ESTADO_PAGO) values ('52','120','859',to_timestamp('10/10/24 00:22:28,354000000','DD/MM/RR HH24:MI:SSXFF'),'card','completado');
REM INSERTING into PRECIOS
SET DEFINE OFF;
Insert into PRECIOS (PRECIO_ID,TIPO_MASCOTA,TIPO_HABITACION,PRECIO_DIARIO) values ('1','Doméstica','Estandar','30');
REM INSERTING into PROMOCIONES
SET DEFINE OFF;
Insert into PROMOCIONES (PROMOCION_ID,NOMBRE,DESCRIPCION,DESCUENTO,FECHA_INICIO,FECHA_FIN) values ('1','Promoción de Verano','Descuento del 10% en habitaciones premium','10',to_timestamp('01/06/24 00:00:00,000000000','DD/MM/RR HH24:MI:SSXFF'),to_timestamp('30/09/24 23:59:59,000000000','DD/MM/RR HH24:MI:SSXFF'));
REM INSERTING into PROVEEDORES
SET DEFINE OFF;
Insert into PROVEEDORES (PROVEEDOR_ID,NOMBRE,CONTACTO,DIRECCION) values ('1','Proveedor de Alimentos XYZ','contacto@proveedorxyz.com','Calle Falsa 123');
REM INSERTING into RESERVACIONES
SET DEFINE OFF;
Insert into RESERVACIONES (RESERVACION_ID,MASCOTA_ID,HABITACION_ID,FECHA_ENTRADA,FECHA_SALIDA,ESTADO,TOTAL,NOTAS) values ('120','23','38',to_timestamp('12/10/24 00:21:00,000000000','DD/MM/RR HH24:MI:SSXFF'),to_timestamp('16/10/24 00:21:00,000000000','DD/MM/RR HH24:MI:SSXFF'),'completado','859','hola');
Insert into RESERVACIONES (RESERVACION_ID,MASCOTA_ID,HABITACION_ID,FECHA_ENTRADA,FECHA_SALIDA,ESTADO,TOTAL,NOTAS) values ('121','23','26',to_timestamp('10/10/24 00:24:00,000000000','DD/MM/RR HH24:MI:SSXFF'),to_timestamp('10/10/24 00:24:00,000000000','DD/MM/RR HH24:MI:SSXFF'),'completado','299,75','hola');
Insert into RESERVACIONES (RESERVACION_ID,MASCOTA_ID,HABITACION_ID,FECHA_ENTRADA,FECHA_SALIDA,ESTADO,TOTAL,NOTAS) values ('122','23','22',to_timestamp('10/10/24 00:50:00,000000000','DD/MM/RR HH24:MI:SSXFF'),to_timestamp('12/10/24 00:50:00,000000000','DD/MM/RR HH24:MI:SSXFF'),'completado','709,5','hola');
Insert into RESERVACIONES (RESERVACION_ID,MASCOTA_ID,HABITACION_ID,FECHA_ENTRADA,FECHA_SALIDA,ESTADO,TOTAL,NOTAS) values ('123','23','1',to_timestamp('10/10/24 01:01:00,000000000','DD/MM/RR HH24:MI:SSXFF'),to_timestamp('13/10/24 01:01:00,000000000','DD/MM/RR HH24:MI:SSXFF'),'completado','502,5','hola');
Insert into RESERVACIONES (RESERVACION_ID,MASCOTA_ID,HABITACION_ID,FECHA_ENTRADA,FECHA_SALIDA,ESTADO,TOTAL,NOTAS) values ('119','23','36',to_timestamp('10/10/24 00:13:00,000000000','DD/MM/RR HH24:MI:SSXFF'),to_timestamp('12/10/24 00:13:00,000000000','DD/MM/RR HH24:MI:SSXFF'),'completado','400','hola');
Insert into RESERVACIONES (RESERVACION_ID,MASCOTA_ID,HABITACION_ID,FECHA_ENTRADA,FECHA_SALIDA,ESTADO,TOTAL,NOTAS) values ('124','23','24',to_timestamp('10/10/24 01:06:00,000000000','DD/MM/RR HH24:MI:SSXFF'),to_timestamp('12/10/24 01:06:00,000000000','DD/MM/RR HH24:MI:SSXFF'),'completado','349,5','hola');
REM INSERTING into SERVICIOS
SET DEFINE OFF;
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('22','Comida Premium','Alimento balanceado de alta calidad animal.','15,99','1','Alimentos');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('24','Comida Dietética','Comida especial para mascotas con necesidades dietéticas.','12,5','1','Alimentos');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('26','Snacks Saludables','Snacks nutritivos para mantener la energía de tu mascota.','5,99','1','Alimentos');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('28','Comida Gourmet','Comida preparada por chef especializada para mascotas.','25','1','Alimentos');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('30','Comida Vegetariana','Menú especial para mascotas vegetarianas.','14,75','1','Alimentos');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('32','Baño Completo','Baño completo con productos especializados.','30','1','Cuidados');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('34','Corte de Uñas','Servicio de corte de uñas para todas las razas.','10','0,5','Cuidados');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('36','Limpieza de Oídos','Limpieza especializada para evitar infecciones.','12','0,5','Cuidados');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('38','Cuidado Dental','Cepillado dental y revisión.','20','1','Cuidados');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('40','Desenredo de Pelo','Desenredo y peinado de pelo largo.','18,5','1','Cuidados');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('42','Clase de Obediencia','Clases para mejorar la obediencia de tu mascota.','50','2','Clases');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('44','Entrenamiento de Cachorros','Entrenamiento básico para cachorros.','45','1,5','Clases');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('46','Socialización de Mascotas','Clases grupales para socialización.','35','2','Clases');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('48','Agilidad y Deportes','Entrenamiento en deportes y agilidad.','60','2,5','Clases');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('50','Resolución de Problemas','Clases para corregir problemas de comportamiento.','70','2','Clases');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('52','Paseos al Parque','Paseos guiados al parque para tu mascota.','20','1,5','Recreacion');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('54','Tiempo de Juego','Juegos supervisados para el entretenimiento de tu mascota.','15','1','Recreacion');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('56','Piscina para Mascotas','Piscina segura para que tu mascota se divierta.','25','2','Recreacion');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('58','Día de Campo','Excursión al aire libre para las mascotas.','40','3','Recreacion');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('60','Juguetes Interactivos','Juguetes para estimular el juego y la actividad física.','10','1','Recreacion');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('62','Caminata Diaria','Caminatas diarias para mantener a tu mascota activa.','15','1','Ejercitacion');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('64','Trotar con tu Mascota','Sesiones de trote para mejorar la resistencia física.','20','1,5','Ejercitacion');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('66','Entrenamiento con Cuerdas','Ejercicios con cuerdas para mejorar la fuerza de tu mascota.','18','1','Ejercitacion');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('68','Carreras de Velocidad','Entrenamiento para mejorar la velocidad.','22','1','Ejercitacion');
Insert into SERVICIOS (SERVICIO_ID,NOMBRE_SERVICIO,DESCRIPCION,PRECIO,DURACION,TIPO) values ('70','Circuito de Obstáculos','Circuito completo para ejercitar a tu mascota.','30','2','Ejercitacion');
REM INSERTING into SERVICIOS_RESERVACIONES
SET DEFINE OFF;
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('46','119','46','1','35');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('47','119','54','1','15');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('48','120','30','1','14,75');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('49','120','42','1','50');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('50','120','56','1','25');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('51','120','62','1','15');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('52','120','70','1','30');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('53','121','30','1','14,75');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('54','121','32','1','30');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('55','121','46','1','35');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('56','121','52','1','20');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('57','122','30','1','14,75');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('58','122','32','1','30');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('59','122','46','1','35');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('60','122','48','1','60');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('61','122','56','1','25');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('62','122','58','1','40');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('44','119','34','1','10');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('45','119','42','1','50');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('63','123','24','1','12,5');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('64','123','32','1','30');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('65','123','46','1','35');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('66','123','52','1','20');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('67','123','64','1','20');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('68','124','30','1','14,75');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('69','124','32','1','30');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('70','124','46','1','35');
Insert into SERVICIOS_RESERVACIONES (SERVICIO_RESERVACION_ID,RESERVACION_ID,SERVICIO_ID,CANTIDAD,PRECIO) values ('71','124','52','1','20');
REM INSERTING into USUARIOS
SET DEFINE OFF;
Insert into USUARIOS (USUARIO_ID,NOMBRE_USUARIO,CORREO,"CONTRASEÑA",ROL,TELEFONO,FECHA_CREACION,AVATAR_URL) values ('1','usuario1','usuario1@example.com','password123','admin','123456789',to_timestamp('02/10/24 23:08:02,511000000','DD/MM/RR HH24:MI:SSXFF'),null);
Insert into USUARIOS (USUARIO_ID,NOMBRE_USUARIO,CORREO,"CONTRASEÑA",ROL,TELEFONO,FECHA_CREACION,AVATAR_URL) values ('21','Juan Perez','juan.perez@example.com','$2b$10$pjJeFGsAWY/dMaKUKkCWYup8aTWpmDiW7NWfW9Bxtg.PXtWn.46B6','cliente','1234567890',to_timestamp('04/10/24 00:52:41,624000000','DD/MM/RR HH24:MI:SSXFF'),null);
Insert into USUARIOS (USUARIO_ID,NOMBRE_USUARIO,CORREO,"CONTRASEÑA",ROL,TELEFONO,FECHA_CREACION,AVATAR_URL) values ('23','Perfil_Prueba','prueba@example.com','$2b$10$JBw/ZS7e6m5cCZ2m/od2huBsUigq9Hh3DMelaFhwOfHRU3KIPfdTe','cliente','20807956',to_timestamp('04/10/24 00:55:44,244000000','DD/MM/RR HH24:MI:SSXFF'),'http://localhost:3000/imgs-perfil/1728160205610-812920860-team-2.jpg');
Insert into USUARIOS (USUARIO_ID,NOMBRE_USUARIO,CORREO,"CONTRASEÑA",ROL,TELEFONO,FECHA_CREACION,AVATAR_URL) values ('83','Carlos Hernández','2019180@colegioboston.edu.gt',null,'usuario','909090',to_timestamp('05/10/24 00:48:54,394000000','DD/MM/RR HH24:MI:SSXFF'),'/imgs-perfil/1728416451578-934916431-team-3.jpg');
Insert into USUARIOS (USUARIO_ID,NOMBRE_USUARIO,CORREO,"CONTRASEÑA",ROL,TELEFONO,FECHA_CREACION,AVATAR_URL) values ('101','carlos prueba','cwhapen77@gmail.com',null,'usuario','53161679',to_timestamp('08/10/24 18:15:30,491000000','DD/MM/RR HH24:MI:SSXFF'),'/imgs-perfil/1728432979565-717139811-carlos.jpg');
Insert into USUARIOS (USUARIO_ID,NOMBRE_USUARIO,CORREO,"CONTRASEÑA",ROL,TELEFONO,FECHA_CREACION,AVATAR_URL) values ('81','carlos Alfonso','alfonsocarlos200@gmail.com',null,'usuario','53161690',to_timestamp('04/10/24 19:59:56,483000000','DD/MM/RR HH24:MI:SSXFF'),'http://localhost:3000/imgs-perfil/1728113223966-902352235-carlos.jpg');
--------------------------------------------------------
--  DDL for Index SYS_C008911
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008911" ON "USUARIOS" ("USUARIO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008912
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008912" ON "USUARIOS" ("CORREO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008914
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008914" ON "PROVEEDORES" ("PROVEEDOR_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008917
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008917" ON "INVENTARIO" ("INVENTARIO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008920
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008920" ON "SERVICIOS" ("SERVICIO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008925
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008925" ON "HABITACIONES" ("HABITACION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008930
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008930" ON "PROMOCIONES" ("PROMOCION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008934
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008934" ON "MASCOTAS" ("MASCOTA_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008939
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008939" ON "PRECIOS" ("PRECIO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008946
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008946" ON "RESERVACIONES" ("RESERVACION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008953
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008953" ON "PAGOS" ("PAGO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008957
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008957" ON "LOGS_DISP" ("LOG_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008990
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008990" ON "LOGS_DISP_BACKUP" ("LOG_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C009005
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C009005" ON "SERVICIOS_RESERVACIONES" ("SERVICIO_RESERVACION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008925
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008925" ON "HABITACIONES" ("HABITACION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008917
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008917" ON "INVENTARIO" ("INVENTARIO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008957
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008957" ON "LOGS_DISP" ("LOG_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008990
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008990" ON "LOGS_DISP_BACKUP" ("LOG_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008934
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008934" ON "MASCOTAS" ("MASCOTA_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008953
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008953" ON "PAGOS" ("PAGO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008939
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008939" ON "PRECIOS" ("PRECIO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008930
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008930" ON "PROMOCIONES" ("PROMOCION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008914
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008914" ON "PROVEEDORES" ("PROVEEDOR_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008946
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008946" ON "RESERVACIONES" ("RESERVACION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008920
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008920" ON "SERVICIOS" ("SERVICIO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C009005
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C009005" ON "SERVICIOS_RESERVACIONES" ("SERVICIO_RESERVACION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008911
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008911" ON "USUARIOS" ("USUARIO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C008912
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008912" ON "USUARIOS" ("CORREO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger HABITACIONES_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HABITACIONES_BI" 
BEFORE INSERT ON Habitaciones
FOR EACH ROW
BEGIN
  :NEW.Habitacion_ID := Habitaciones_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "HABITACIONES_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INVENTARIO_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "INVENTARIO_BI" 
BEFORE INSERT ON Inventario
FOR EACH ROW
BEGIN
  :NEW.Inventario_ID := Inventario_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "INVENTARIO_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger LOGS_DISPONIBILIDAD_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "LOGS_DISPONIBILIDAD_BI" 
BEFORE INSERT ON LOGS_DISP
FOR EACH ROW
BEGIN
  :NEW.Log_ID := Logs_Disponibilidad_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "LOGS_DISPONIBILIDAD_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MASCOTAS_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MASCOTAS_BI" 
BEFORE INSERT ON Mascotas
FOR EACH ROW
BEGIN
  :NEW.Mascota_ID := Mascotas_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "MASCOTAS_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PAGOS_AI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PAGOS_AI" 
AFTER INSERT OR UPDATE OF "ESTADO_PAGO" ON "PAGOS"
FOR EACH ROW
 WHEN (NEW."ESTADO_PAGO" = 'completado') BEGIN
   UPDATE "RESERVACIONES"
   SET "ESTADO" = 'completado'
   WHERE "RESERVACION_ID" = :NEW."RESERVACION_ID";
END;

/
ALTER TRIGGER "PAGOS_AI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PAGOS_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PAGOS_BI" 
BEFORE INSERT ON Pagos
FOR EACH ROW
BEGIN
  :NEW.Pago_ID := Pagos_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "PAGOS_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PRECIOS_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PRECIOS_BI" 
BEFORE INSERT ON Precios
FOR EACH ROW
BEGIN
  :NEW.Precio_ID := Precios_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "PRECIOS_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PROMOCIONES_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PROMOCIONES_BI" 
BEFORE INSERT ON Promociones
FOR EACH ROW
BEGIN
  :NEW.Promocion_ID := Promociones_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "PROMOCIONES_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PROVEEDORES_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PROVEEDORES_BI" 
BEFORE INSERT ON Proveedores
FOR EACH ROW
BEGIN
  :NEW.Proveedor_ID := Proveedores_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "PROVEEDORES_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RESERVACIONES_AI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "RESERVACIONES_AI" 
AFTER UPDATE OF "ESTADO" ON "RESERVACIONES"
FOR EACH ROW
 WHEN (NEW."ESTADO" = 'completado') BEGIN
   INSERT INTO "LOGS_DISP" 
   ("HABITACION_ID", "ESTADO", "COMENTARIOS", "FECHA_ENTRADA", "FECHA_SALIDA")
   VALUES 
   (:NEW."HABITACION_ID", 'Disponible', 'La reservación ha sido completada', :NEW."FECHA_ENTRADA", :NEW."FECHA_SALIDA");
END;

/
ALTER TRIGGER "RESERVACIONES_AI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RESERVACIONES_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "RESERVACIONES_BI" 
BEFORE INSERT ON Reservaciones
FOR EACH ROW
BEGIN
  :NEW.Reservacion_ID := Reservaciones_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "RESERVACIONES_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SERVICIOS_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SERVICIOS_BI" 
BEFORE INSERT ON Servicios
FOR EACH ROW
BEGIN
  :NEW.Servicio_ID := Servicios_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "SERVICIOS_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SERVICIOS_RESERVACIONES_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SERVICIOS_RESERVACIONES_BI" 
BEFORE INSERT ON Servicios_Reservaciones
FOR EACH ROW
BEGIN
  :NEW.Servicio_Reservacion_ID := Servicios_Reservaciones_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "SERVICIOS_RESERVACIONES_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIG_ACTUALIZA_ESTADO_HAB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRIG_ACTUALIZA_ESTADO_HAB" 
AFTER INSERT OR UPDATE ON LOGS_DISP
FOR EACH ROW
BEGIN
    -- Si la fecha actual está antes de la fecha de entrada
    IF SYSDATE < :NEW.FECHA_ENTRADA THEN
        UPDATE HABITACIONES
        SET ESTADO = 'Disponible'
        WHERE HABITACION_ID = :NEW.HABITACION_ID;

    -- Si la fecha actual está entre la fecha de entrada y la fecha de salida
    ELSIF SYSDATE BETWEEN :NEW.FECHA_ENTRADA AND :NEW.FECHA_SALIDA THEN
        UPDATE HABITACIONES
        SET ESTADO = 'Ocupada'
        WHERE HABITACION_ID = :NEW.HABITACION_ID;

    -- Si la fecha actual es posterior a la fecha de salida
    ELSIF SYSDATE > :NEW.FECHA_SALIDA THEN
        UPDATE HABITACIONES
        SET ESTADO = 'Disponible'
        WHERE HABITACION_ID = :NEW.HABITACION_ID;
    END IF;
END;

/
ALTER TRIGGER "TRIG_ACTUALIZA_ESTADO_HAB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USUARIOS_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "USUARIOS_BI" 
BEFORE INSERT ON Usuarios
FOR EACH ROW
BEGIN
  :NEW.Usuario_ID := Usuarios_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "USUARIOS_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger HABITACIONES_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HABITACIONES_BI" 
BEFORE INSERT ON Habitaciones
FOR EACH ROW
BEGIN
  :NEW.Habitacion_ID := Habitaciones_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "HABITACIONES_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INVENTARIO_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "INVENTARIO_BI" 
BEFORE INSERT ON Inventario
FOR EACH ROW
BEGIN
  :NEW.Inventario_ID := Inventario_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "INVENTARIO_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIG_ACTUALIZA_ESTADO_HAB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRIG_ACTUALIZA_ESTADO_HAB" 
AFTER INSERT OR UPDATE ON LOGS_DISP
FOR EACH ROW
BEGIN
    -- Si la fecha actual está antes de la fecha de entrada
    IF SYSDATE < :NEW.FECHA_ENTRADA THEN
        UPDATE HABITACIONES
        SET ESTADO = 'Disponible'
        WHERE HABITACION_ID = :NEW.HABITACION_ID;

    -- Si la fecha actual está entre la fecha de entrada y la fecha de salida
    ELSIF SYSDATE BETWEEN :NEW.FECHA_ENTRADA AND :NEW.FECHA_SALIDA THEN
        UPDATE HABITACIONES
        SET ESTADO = 'Ocupada'
        WHERE HABITACION_ID = :NEW.HABITACION_ID;

    -- Si la fecha actual es posterior a la fecha de salida
    ELSIF SYSDATE > :NEW.FECHA_SALIDA THEN
        UPDATE HABITACIONES
        SET ESTADO = 'Disponible'
        WHERE HABITACION_ID = :NEW.HABITACION_ID;
    END IF;
END;

/
ALTER TRIGGER "TRIG_ACTUALIZA_ESTADO_HAB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger LOGS_DISPONIBILIDAD_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "LOGS_DISPONIBILIDAD_BI" 
BEFORE INSERT ON LOGS_DISP
FOR EACH ROW
BEGIN
  :NEW.Log_ID := Logs_Disponibilidad_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "LOGS_DISPONIBILIDAD_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MASCOTAS_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MASCOTAS_BI" 
BEFORE INSERT ON Mascotas
FOR EACH ROW
BEGIN
  :NEW.Mascota_ID := Mascotas_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "MASCOTAS_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PAGOS_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PAGOS_BI" 
BEFORE INSERT ON Pagos
FOR EACH ROW
BEGIN
  :NEW.Pago_ID := Pagos_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "PAGOS_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PAGOS_AI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PAGOS_AI" 
AFTER INSERT OR UPDATE OF "ESTADO_PAGO" ON "PAGOS"
FOR EACH ROW
 WHEN (NEW."ESTADO_PAGO" = 'completado') BEGIN
   UPDATE "RESERVACIONES"
   SET "ESTADO" = 'completado'
   WHERE "RESERVACION_ID" = :NEW."RESERVACION_ID";
END;

/
ALTER TRIGGER "PAGOS_AI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PRECIOS_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PRECIOS_BI" 
BEFORE INSERT ON Precios
FOR EACH ROW
BEGIN
  :NEW.Precio_ID := Precios_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "PRECIOS_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PROMOCIONES_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PROMOCIONES_BI" 
BEFORE INSERT ON Promociones
FOR EACH ROW
BEGIN
  :NEW.Promocion_ID := Promociones_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "PROMOCIONES_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PROVEEDORES_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PROVEEDORES_BI" 
BEFORE INSERT ON Proveedores
FOR EACH ROW
BEGIN
  :NEW.Proveedor_ID := Proveedores_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "PROVEEDORES_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RESERVACIONES_AI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "RESERVACIONES_AI" 
AFTER UPDATE OF "ESTADO" ON "RESERVACIONES"
FOR EACH ROW
 WHEN (NEW."ESTADO" = 'completado') BEGIN
   INSERT INTO "LOGS_DISP" 
   ("HABITACION_ID", "ESTADO", "COMENTARIOS", "FECHA_ENTRADA", "FECHA_SALIDA")
   VALUES 
   (:NEW."HABITACION_ID", 'Disponible', 'La reservación ha sido completada', :NEW."FECHA_ENTRADA", :NEW."FECHA_SALIDA");
END;

/
ALTER TRIGGER "RESERVACIONES_AI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RESERVACIONES_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "RESERVACIONES_BI" 
BEFORE INSERT ON Reservaciones
FOR EACH ROW
BEGIN
  :NEW.Reservacion_ID := Reservaciones_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "RESERVACIONES_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SERVICIOS_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SERVICIOS_BI" 
BEFORE INSERT ON Servicios
FOR EACH ROW
BEGIN
  :NEW.Servicio_ID := Servicios_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "SERVICIOS_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SERVICIOS_RESERVACIONES_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SERVICIOS_RESERVACIONES_BI" 
BEFORE INSERT ON Servicios_Reservaciones
FOR EACH ROW
BEGIN
  :NEW.Servicio_Reservacion_ID := Servicios_Reservaciones_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "SERVICIOS_RESERVACIONES_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USUARIOS_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "USUARIOS_BI" 
BEFORE INSERT ON Usuarios
FOR EACH ROW
BEGIN
  :NEW.Usuario_ID := Usuarios_SEQ.NEXTVAL;
END;

/
ALTER TRIGGER "USUARIOS_BI" ENABLE;
--------------------------------------------------------
--  DDL for Procedure ACTUALIZA_ESTADO_HABITACIONES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ACTUALIZA_ESTADO_HABITACIONES" IS
BEGIN
    -- Actualizar a 'Disponible' si la fecha actual es anterior a la fecha de entrada
    UPDATE HABITACIONES H
    SET H.ESTADO = 'Disponible'
    WHERE H.HABITACION_ID IN (
        SELECT L.HABITACION_ID
        FROM LOGS_DISP L
        WHERE SYSDATE < L.FECHA_ENTRADA
    );

    -- Actualizar a 'Ocupada' si la fecha actual está entre la fecha de entrada y salida
    UPDATE HABITACIONES H
    SET H.ESTADO = 'Ocupada'
    WHERE H.HABITACION_ID IN (
        SELECT L.HABITACION_ID
        FROM LOGS_DISP L
        WHERE SYSDATE BETWEEN L.FECHA_ENTRADA AND L.FECHA_SALIDA
    );

    -- Actualizar a 'Disponible' si la fecha actual es posterior a la fecha de salida
    UPDATE HABITACIONES H
    SET H.ESTADO = 'Disponible'
    WHERE H.HABITACION_ID IN (
        SELECT L.HABITACION_ID
        FROM LOGS_DISP L
        WHERE SYSDATE > L.FECHA_SALIDA
    );
END;

/
--------------------------------------------------------
--  Constraints for Table HABITACIONES
--------------------------------------------------------

  ALTER TABLE "HABITACIONES" ADD PRIMARY KEY ("HABITACION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "HABITACIONES" MODIFY ("TIPO_HABITACION" NOT NULL ENABLE);
  ALTER TABLE "HABITACIONES" MODIFY ("CAPACIDAD_MAXIMA" NOT NULL ENABLE);
  ALTER TABLE "HABITACIONES" MODIFY ("ESTADO" NOT NULL ENABLE);
  ALTER TABLE "HABITACIONES" MODIFY ("NOMBRE_HABITACION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table INVENTARIO
--------------------------------------------------------

  ALTER TABLE "INVENTARIO" ADD PRIMARY KEY ("INVENTARIO_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "INVENTARIO" MODIFY ("CANTIDAD" NOT NULL ENABLE);
  ALTER TABLE "INVENTARIO" MODIFY ("NOMBRE_ITEM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGS_DISP
--------------------------------------------------------

  ALTER TABLE "LOGS_DISP" MODIFY ("FECHA_ENTRADA" NOT NULL ENABLE);
  ALTER TABLE "LOGS_DISP" ADD PRIMARY KEY ("LOG_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "LOGS_DISP" MODIFY ("ESTADO" NOT NULL ENABLE);
  ALTER TABLE "LOGS_DISP" MODIFY ("HABITACION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGS_DISP_BACKUP
--------------------------------------------------------

  ALTER TABLE "LOGS_DISP_BACKUP" ADD PRIMARY KEY ("LOG_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "LOGS_DISP_BACKUP" MODIFY ("ESTADO" NOT NULL ENABLE);
  ALTER TABLE "LOGS_DISP_BACKUP" MODIFY ("HABITACION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MASCOTAS
--------------------------------------------------------

  ALTER TABLE "MASCOTAS" MODIFY ("CATEGORIA" NOT NULL ENABLE);
  ALTER TABLE "MASCOTAS" ADD PRIMARY KEY ("MASCOTA_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "MASCOTAS" MODIFY ("ESPECIE" NOT NULL ENABLE);
  ALTER TABLE "MASCOTAS" MODIFY ("NOMBRE_MASCOTA" NOT NULL ENABLE);
  ALTER TABLE "MASCOTAS" MODIFY ("PROPIETARIO_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PAGOS
--------------------------------------------------------

  ALTER TABLE "PAGOS" ADD PRIMARY KEY ("PAGO_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "PAGOS" MODIFY ("ESTADO_PAGO" NOT NULL ENABLE);
  ALTER TABLE "PAGOS" MODIFY ("METODO_PAGO" NOT NULL ENABLE);
  ALTER TABLE "PAGOS" MODIFY ("MONTO_TOTAL" NOT NULL ENABLE);
  ALTER TABLE "PAGOS" MODIFY ("RESERVACION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRECIOS
--------------------------------------------------------

  ALTER TABLE "PRECIOS" ADD PRIMARY KEY ("PRECIO_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "PRECIOS" MODIFY ("PRECIO_DIARIO" NOT NULL ENABLE);
  ALTER TABLE "PRECIOS" MODIFY ("TIPO_HABITACION" NOT NULL ENABLE);
  ALTER TABLE "PRECIOS" MODIFY ("TIPO_MASCOTA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROMOCIONES
--------------------------------------------------------

  ALTER TABLE "PROMOCIONES" ADD PRIMARY KEY ("PROMOCION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "PROMOCIONES" MODIFY ("FECHA_FIN" NOT NULL ENABLE);
  ALTER TABLE "PROMOCIONES" MODIFY ("FECHA_INICIO" NOT NULL ENABLE);
  ALTER TABLE "PROMOCIONES" MODIFY ("DESCUENTO" NOT NULL ENABLE);
  ALTER TABLE "PROMOCIONES" MODIFY ("NOMBRE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROVEEDORES
--------------------------------------------------------

  ALTER TABLE "PROVEEDORES" ADD PRIMARY KEY ("PROVEEDOR_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "PROVEEDORES" MODIFY ("NOMBRE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RESERVACIONES
--------------------------------------------------------

  ALTER TABLE "RESERVACIONES" ADD PRIMARY KEY ("RESERVACION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RESERVACIONES" MODIFY ("TOTAL" NOT NULL ENABLE);
  ALTER TABLE "RESERVACIONES" MODIFY ("ESTADO" NOT NULL ENABLE);
  ALTER TABLE "RESERVACIONES" MODIFY ("FECHA_SALIDA" NOT NULL ENABLE);
  ALTER TABLE "RESERVACIONES" MODIFY ("FECHA_ENTRADA" NOT NULL ENABLE);
  ALTER TABLE "RESERVACIONES" MODIFY ("HABITACION_ID" NOT NULL ENABLE);
  ALTER TABLE "RESERVACIONES" MODIFY ("MASCOTA_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SERVICIOS
--------------------------------------------------------

  ALTER TABLE "SERVICIOS" ADD PRIMARY KEY ("SERVICIO_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SERVICIOS" MODIFY ("PRECIO" NOT NULL ENABLE);
  ALTER TABLE "SERVICIOS" MODIFY ("NOMBRE_SERVICIO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SERVICIOS_RESERVACIONES
--------------------------------------------------------

  ALTER TABLE "SERVICIOS_RESERVACIONES" ADD PRIMARY KEY ("SERVICIO_RESERVACION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SERVICIOS_RESERVACIONES" MODIFY ("PRECIO" NOT NULL ENABLE);
  ALTER TABLE "SERVICIOS_RESERVACIONES" MODIFY ("CANTIDAD" NOT NULL ENABLE);
  ALTER TABLE "SERVICIOS_RESERVACIONES" MODIFY ("SERVICIO_ID" NOT NULL ENABLE);
  ALTER TABLE "SERVICIOS_RESERVACIONES" MODIFY ("RESERVACION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USUARIOS
--------------------------------------------------------

  ALTER TABLE "USUARIOS" ADD UNIQUE ("CORREO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "USUARIOS" ADD PRIMARY KEY ("USUARIO_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "USUARIOS" MODIFY ("ROL" NOT NULL ENABLE);
  ALTER TABLE "USUARIOS" MODIFY ("CORREO" NOT NULL ENABLE);
  ALTER TABLE "USUARIOS" MODIFY ("NOMBRE_USUARIO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table LOGS_DISP
--------------------------------------------------------

  ALTER TABLE "LOGS_DISP" ADD CONSTRAINT "FK_LOG_HAB" FOREIGN KEY ("HABITACION_ID")
	  REFERENCES "HABITACIONES" ("HABITACION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MASCOTAS
--------------------------------------------------------

  ALTER TABLE "MASCOTAS" ADD CONSTRAINT "FK_MASCOTAS_PROPIETARIO" FOREIGN KEY ("PROPIETARIO_ID")
	  REFERENCES "USUARIOS" ("USUARIO_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PAGOS
--------------------------------------------------------

  ALTER TABLE "PAGOS" ADD CONSTRAINT "FK_PAGO_RESERVACION" FOREIGN KEY ("RESERVACION_ID")
	  REFERENCES "RESERVACIONES" ("RESERVACION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RESERVACIONES
--------------------------------------------------------

  ALTER TABLE "RESERVACIONES" ADD CONSTRAINT "FK_RESERVACION_HABITACION" FOREIGN KEY ("HABITACION_ID")
	  REFERENCES "HABITACIONES" ("HABITACION_ID") ENABLE;
  ALTER TABLE "RESERVACIONES" ADD CONSTRAINT "FK_RESERVACION_MASCOTA" FOREIGN KEY ("MASCOTA_ID")
	  REFERENCES "MASCOTAS" ("MASCOTA_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SERVICIOS_RESERVACIONES
--------------------------------------------------------

  ALTER TABLE "SERVICIOS_RESERVACIONES" ADD CONSTRAINT "FK_SERVRESERVACIONES_RESERV" FOREIGN KEY ("RESERVACION_ID")
	  REFERENCES "RESERVACIONES" ("RESERVACION_ID") ENABLE;
  ALTER TABLE "SERVICIOS_RESERVACIONES" ADD CONSTRAINT "FK_SERVRESERVACIONES_SERV" FOREIGN KEY ("SERVICIO_ID")
	  REFERENCES "SERVICIOS" ("SERVICIO_ID") ENABLE;
