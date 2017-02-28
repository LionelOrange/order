ALTER TABLE SCOTT.CATEGORYS
 DROP PRIMARY KEY CASCADE;
DROP TABLE SCOTT.CATEGORYS CASCADE CONSTRAINTS;

CREATE TABLE SCOTT.CATEGORYS
(
  CATEGORYID    NUMBER(8),
  CATEGORYNAME  VARCHAR2(16 BYTE),
  CATEGORYDESC  VARCHAR2(16 BYTE)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE SCOTT.PROVIDER
 DROP PRIMARY KEY CASCADE;
DROP TABLE SCOTT.PROVIDER CASCADE CONSTRAINTS;

CREATE TABLE SCOTT.PROVIDER
(
  PROVIDERID    NUMBER(16),
  PROVIDERNAME  VARCHAR2(16 BYTE),
  PROVIDERADD   VARCHAR2(16 BYTE),
  PROVIDERTEL   NUMBER(16),
  ACCOUNT       VARCHAR2(16 BYTE),
  EMAIL         VARCHAR2(16 BYTE)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE SCOTT.PRODUCTS
 DROP PRIMARY KEY CASCADE;
DROP TABLE SCOTT.PRODUCTS CASCADE CONSTRAINTS;

CREATE TABLE SCOTT.PRODUCTS
(
  PRODUCTID    NUMBER(6)                        NOT NULL,
  PRODUCTNAME  VARCHAR2(30 BYTE)                NOT NULL,
  INCOMEPRICE  NUMBER(6)                        NOT NULL,
  PROVIDERID   NUMBER(6)                        NOT NULL,
  SALESPRICE   NUMBER(6)                        NOT NULL,
  CATEGORYID   NUMBER(6)                        NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE SCOTT.CUSTOMER
 DROP PRIMARY KEY CASCADE;
DROP TABLE SCOTT.CUSTOMER CASCADE CONSTRAINTS;

CREATE TABLE SCOTT.CUSTOMER
(
  CUSTOMERID    NUMBER(16),
  CUSTOMERNAME  VARCHAR2(16 BYTE),
  CUSTOMERADD   VARCHAR2(16 BYTE),
  CUSTOMERBIR   VARCHAR2(16 BYTE),
  CUSTOMERTEL   NUMBER(16)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE SCOTT.EMPLOYEES
 DROP PRIMARY KEY CASCADE;
DROP TABLE SCOTT.EMPLOYEES CASCADE CONSTRAINTS;

CREATE TABLE SCOTT.EMPLOYEES
(
  EMPID     NUMBER(16),
  EMPNAME   VARCHAR2(16 BYTE),
  HIREDATE  VARCHAR2(16 BYTE),
  SAL       NUMBER,
  PSW       NUMBER
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


ALTER TABLE SCOTT.ORDERS
 DROP PRIMARY KEY CASCADE;
DROP TABLE SCOTT.ORDERS CASCADE CONSTRAINTS;

CREATE TABLE SCOTT.ORDERS
(
  ORDERID     VARCHAR2(30 BYTE),
  ORDERDATE   DATE,
  CUSTOMERID  NUMBER,
  EMPID       NUMBER
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


DROP TABLE SCOTT.ORDERDETAIL CASCADE CONSTRAINTS;

CREATE TABLE SCOTT.ORDERDETAIL
(
  ORDERID    VARCHAR2(30 BYTE),
  PRODUCTID  NUMBER,
  QUANTITY   NUMBER,
  DISCOUNT   NUMBER
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE UNIQUE INDEX SCOTT.ORDERS_PK ON SCOTT.ORDERS
(ORDERID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX SCOTT.PK_PRODUCTID ON SCOTT.PRODUCTS
(PRODUCTID)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


ALTER TABLE SCOTT.CATEGORYS ADD (
  PRIMARY KEY
 (CATEGORYID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ));

ALTER TABLE SCOTT.PROVIDER ADD (
  PRIMARY KEY
 (PROVIDERID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ));

ALTER TABLE SCOTT.PRODUCTS ADD (
  CONSTRAINT PK_PRODUCTID
 PRIMARY KEY
 (PRODUCTID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ));

ALTER TABLE SCOTT.CUSTOMER ADD (
  PRIMARY KEY
 (CUSTOMERID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ));

ALTER TABLE SCOTT.EMPLOYEES ADD (
  PRIMARY KEY
 (EMPID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ));

ALTER TABLE SCOTT.ORDERS ADD (
  CONSTRAINT ORDERS_PK
 PRIMARY KEY
 (ORDERID)
    USING INDEX 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ));

ALTER TABLE SCOTT.PRODUCTS ADD (
  CONSTRAINT FK_PRODUCTS_PROVIDERID 
 FOREIGN KEY (PROVIDERID) 
 REFERENCES SCOTT.PROVIDER (PROVIDERID),
  CONSTRAINT FK_PRODUCTS_CATEGORYID 
 FOREIGN KEY (CATEGORYID) 
 REFERENCES SCOTT.CATEGORYS (CATEGORYID));

ALTER TABLE SCOTT.ORDERS ADD (
  CONSTRAINT CUSTOMER_R01 
 FOREIGN KEY (CUSTOMERID) 
 REFERENCES SCOTT.CUSTOMER (CUSTOMERID),
  CONSTRAINT ORDERS_R01 
 FOREIGN KEY (EMPID) 
 REFERENCES SCOTT.EMPLOYEES (EMPID));

ALTER TABLE SCOTT.ORDERDETAIL ADD (
  CONSTRAINT ORDERDETAIL_R01 
 FOREIGN KEY (ORDERID) 
 REFERENCES SCOTT.ORDERS (ORDERID),
  CONSTRAINT ORDERDETAIL_PROID 
 FOREIGN KEY (PRODUCTID) 
 REFERENCES SCOTT.PRODUCTS (PRODUCTID));
