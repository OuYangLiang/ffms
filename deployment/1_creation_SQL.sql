--
-- ER/Studio 8.0 SQL Code Generation
-- Project :      DATA MODEL
--
-- Date Created : Friday, October 05, 2012 23:02:26
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: BANK_CARD 
--

CREATE TABLE BANK_CARD(
    BC_OID      DECIMAL(38, 0)    NOT NULL,
    CARD_NO     VARCHAR(30)       NOT NULL,
    BALANCE     DECIMAL(18, 2)    NOT NULL,
    USER_OID    DECIMAL(38, 0)    NOT NULL,
    PRIMARY KEY (BC_OID)
)ENGINE=INNODB
;



-- 
-- TABLE: BANK_CARD_RECORD 
--

CREATE TABLE BANK_CARD_RECORD(
    BCR_OID        DECIMAL(38, 0)    NOT NULL,
    BCR_TYPE       CHAR(1)           NOT NULL,
    AMOUNT         DECIMAL(18, 2)    NOT NULL,
    DESCRIPTION    VARCHAR(255)      NOT NULL,
    CTL_STATUS     CHAR(1)           NOT NULL,
    CREATE_DATE    DATETIME          NOT NULL,
    BC_OID         DECIMAL(38, 0)    NOT NULL,
    PRIMARY KEY (BCR_OID)
)ENGINE=INNODB
;



-- 
-- TABLE: CATEGORY 
--

CREATE TABLE CATEGORY(
    CATEGORY_OID     DECIMAL(38, 0)    NOT NULL,
    CATEGORY_TYPE    CHAR(1)           NOT NULL,
    CATEGORY_NAME    VARCHAR(50)       NOT NULL,
    FAMILY_OID       DECIMAL(38, 0)    NOT NULL,
    PRIMARY KEY (CATEGORY_OID)
)ENGINE=INNODB
;



-- 
-- TABLE: CREDIT_CARD 
--

CREATE TABLE CREDIT_CARD(
    CC_OID             DECIMAL(38, 0)    NOT NULL,
    CARD_NO            VARCHAR(30)       NOT NULL,
    QUOTA              DECIMAL(18, 2)    NOT NULL,
    DEBT               DECIMAL(18, 2)    NOT NULL,
    POINT              INT               NOT NULL,
    POINT_CONDITION    DECIMAL(18, 2)    NOT NULL,
    USER_OID           DECIMAL(38, 0)    NOT NULL,
    PRIMARY KEY (CC_OID)
)ENGINE=INNODB
;



-- 
-- TABLE: CREDIT_CARD_RECORD 
--

CREATE TABLE CREDIT_CARD_RECORD(
    CCR_OID        DECIMAL(38, 0)    NOT NULL,
    CCR_TYPE       CHAR(1)           NOT NULL,
    AMOUNT         DECIMAL(18, 2)    NOT NULL,
    DESCRIPTION    VARCHAR(255)      NOT NULL,
    CTL_STATUS     CHAR(1)           NOT NULL,
    CREATE_DATE    DATETIME          NOT NULL,
    CC_OID         DECIMAL(38, 0)    NOT NULL,
    BC_OID         DECIMAL(38, 0),
    PRIMARY KEY (CCR_OID)
)ENGINE=INNODB
;



-- 
-- TABLE: CTL_PARAM 
--

CREATE TABLE CTL_PARAM(
    CTL_GRP      VARCHAR(30)    NOT NULL,
    CTL_KEY      VARCHAR(30)    NOT NULL,
    CTL_VALUE    VARCHAR(50)    NOT NULL,
    PRIMARY KEY (CTL_GRP, CTL_KEY)
)ENGINE=INNODB
;



-- 
-- TABLE: FAMILY 
--

CREATE TABLE FAMILY(
    FAMILY_OID     DECIMAL(38, 0)    NOT NULL,
    FAMILY_NAME    VARCHAR(50)       NOT NULL,
    ADDRESS        VARCHAR(255)      NOT NULL,
    PHONE          VARCHAR(30),
    PRIMARY KEY (FAMILY_OID)
)ENGINE=INNODB
;



-- 
-- TABLE: FAMILY_USER 
--

CREATE TABLE FAMILY_USER(
    FAMILY_OID    DECIMAL(38, 0)    NOT NULL,
    USER_OID      DECIMAL(38, 0)    NOT NULL,
    PRIMARY KEY (FAMILY_OID, USER_OID)
)ENGINE=INNODB
;



-- 
-- TABLE: GENERIC_OID_SEQ 
--

CREATE TABLE GENERIC_OID_SEQ(
    SEQUENCE    BIGINT    AUTO_INCREMENT,
    PRIMARY KEY (SEQUENCE)
)ENGINE=INNODB
;



-- 
-- TABLE: ITEM 
--

CREATE TABLE ITEM(
    ITEM_OID         DECIMAL(38, 0)    NOT NULL,
    CATEGORY_OID     DECIMAL(38, 0),
    ITEM_DESC        VARCHAR(100)      NOT NULL,
    ITEM_COST        DECIMAL(18, 2)    NOT NULL,
    ITEM_QUANTITY    DECIMAL(38, 0)    NOT NULL,
    USER_OID         DECIMAL(38, 0)    NOT NULL,
    CTL_STATUS       CHAR(1)           NOT NULL,
    CREATE_DATE      DATETIME          NOT NULL,
    CC_OID           DECIMAL(38, 0),
    BC_OID           DECIMAL(38, 0),
    PRIMARY KEY (ITEM_OID)
)ENGINE=INNODB
;



-- 
-- TABLE: ITEM_OID_SEQ 
--

CREATE TABLE ITEM_OID_SEQ(
    SEQUENCE    BIGINT    AUTO_INCREMENT,
    PRIMARY KEY (SEQUENCE)
)ENGINE=INNODB
;



-- 
-- TABLE: MODULE 
--

CREATE TABLE MODULE(
    MODULE_ID       VARCHAR(20)     NOT NULL,
    MODULE_NAME     VARCHAR(50)     NOT NULL,
    MODULE_LEVEL    INT             NOT NULL,
    PARENT_ID       VARCHAR(20),
    SHOW_ABLE       CHAR(1)         NOT NULL,
    SHOW_ORDER      INT             NOT NULL,
    MODULE_LINK     VARCHAR(100),
    PRIMARY KEY (MODULE_ID)
)ENGINE=INNODB
;



-- 
-- TABLE: ROLE_MODULE 
--

CREATE TABLE ROLE_MODULE(
    ROLE_OID     DECIMAL(38, 0)    NOT NULL,
    MODULE_ID    VARCHAR(20)       NOT NULL,
    PRIMARY KEY (ROLE_OID, MODULE_ID)
)ENGINE=INNODB
;



-- 
-- TABLE: ROLE_PROFILE 
--

CREATE TABLE ROLE_PROFILE(
    ROLE_OID     DECIMAL(38, 0)    NOT NULL,
    ROLE_NAME    VARCHAR(50)       NOT NULL,
    PRIMARY KEY (ROLE_OID)
)ENGINE=INNODB
;



-- 
-- TABLE: SALARY_RECORD 
--

CREATE TABLE SALARY_RECORD(
    SR_OID         DECIMAL(30, 0)    NOT NULL,
    SR_TYPE        CHAR(1)           NOT NULL,
    AMOUNT         DECIMAL(18, 2)    NOT NULL,
    DESCRIPTION    VARCHAR(255)      NOT NULL,
    CTL_STATUS     CHAR(1)           NOT NULL,
    CREATE_DATE    DATETIME          NOT NULL,
    USER_OID       DECIMAL(38, 0)    NOT NULL,
    BC_OID         DECIMAL(38, 0),
    PRIMARY KEY (SR_OID)
)ENGINE=INNODB
;



-- 
-- TABLE: USER_PROFILE 
--

CREATE TABLE USER_PROFILE(
    USER_OID          DECIMAL(38, 0)    NOT NULL,
    USER_NAME         VARCHAR(50)       NOT NULL,
    USER_ALIAS        VARCHAR(50)       NOT NULL,
    USER_TYPE         CHAR(1)           NOT NULL,
    PHONE             VARCHAR(20),
    EMAIL             VARCHAR(50),
    GENDER            CHAR(1)           NOT NULL,
    LOGIN_ID          VARCHAR(10)       NOT NULL,
    LOGIN_PASSWD      VARCHAR(50)       NOT NULL,
    CTL_STATUS        CHAR(1)           NOT NULL,
    FAILED_ATTEMPT    INT               NOT NULL,
    PRIMARY KEY (USER_OID)
)ENGINE=INNODB
;



-- 
-- TABLE: USER_ROLE 
--

CREATE TABLE USER_ROLE(
    ROLE_OID    DECIMAL(38, 0)    NOT NULL,
    USER_OID    DECIMAL(38, 0)    NOT NULL,
    PRIMARY KEY (ROLE_OID, USER_OID)
)ENGINE=INNODB
;



-- 
-- TABLE: BANK_CARD 
--

ALTER TABLE BANK_CARD ADD 
    FOREIGN KEY (USER_OID)
    REFERENCES USER_PROFILE(USER_OID)
;


-- 
-- TABLE: BANK_CARD_RECORD 
--

ALTER TABLE BANK_CARD_RECORD ADD 
    FOREIGN KEY (BC_OID)
    REFERENCES BANK_CARD(BC_OID)
;


-- 
-- TABLE: CATEGORY 
--

ALTER TABLE CATEGORY ADD 
    FOREIGN KEY (FAMILY_OID)
    REFERENCES FAMILY(FAMILY_OID)
;


-- 
-- TABLE: CREDIT_CARD 
--

ALTER TABLE CREDIT_CARD ADD 
    FOREIGN KEY (USER_OID)
    REFERENCES USER_PROFILE(USER_OID)
;


-- 
-- TABLE: CREDIT_CARD_RECORD 
--

ALTER TABLE CREDIT_CARD_RECORD ADD 
    FOREIGN KEY (CC_OID)
    REFERENCES CREDIT_CARD(CC_OID)
;

ALTER TABLE CREDIT_CARD_RECORD ADD 
    FOREIGN KEY (BC_OID)
    REFERENCES BANK_CARD(BC_OID)
;


-- 
-- TABLE: FAMILY_USER 
--

ALTER TABLE FAMILY_USER ADD 
    FOREIGN KEY (FAMILY_OID)
    REFERENCES FAMILY(FAMILY_OID)
;

ALTER TABLE FAMILY_USER ADD 
    FOREIGN KEY (USER_OID)
    REFERENCES USER_PROFILE(USER_OID)
;


-- 
-- TABLE: ITEM 
--

ALTER TABLE ITEM ADD 
    FOREIGN KEY (CC_OID)
    REFERENCES CREDIT_CARD(CC_OID)
;

ALTER TABLE ITEM ADD 
    FOREIGN KEY (CATEGORY_OID)
    REFERENCES CATEGORY(CATEGORY_OID)
;

ALTER TABLE ITEM ADD 
    FOREIGN KEY (USER_OID)
    REFERENCES USER_PROFILE(USER_OID)
;

ALTER TABLE ITEM ADD 
    FOREIGN KEY (BC_OID)
    REFERENCES BANK_CARD(BC_OID)
;


-- 
-- TABLE: ROLE_MODULE 
--

ALTER TABLE ROLE_MODULE ADD 
    FOREIGN KEY (MODULE_ID)
    REFERENCES MODULE(MODULE_ID)
;

ALTER TABLE ROLE_MODULE ADD 
    FOREIGN KEY (ROLE_OID)
    REFERENCES ROLE_PROFILE(ROLE_OID)
;


-- 
-- TABLE: SALARY_RECORD 
--

ALTER TABLE SALARY_RECORD ADD 
    FOREIGN KEY (USER_OID)
    REFERENCES USER_PROFILE(USER_OID)
;

ALTER TABLE SALARY_RECORD ADD 
    FOREIGN KEY (BC_OID)
    REFERENCES BANK_CARD(BC_OID)
;


-- 
-- TABLE: USER_ROLE 
--

ALTER TABLE USER_ROLE ADD 
    FOREIGN KEY (ROLE_OID)
    REFERENCES ROLE_PROFILE(ROLE_OID)
;

ALTER TABLE USER_ROLE ADD 
    FOREIGN KEY (USER_OID)
    REFERENCES USER_PROFILE(USER_OID)
;

