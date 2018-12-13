--------------------------------------------------------
--  建立表格
--------------------------------------------------------

DROP TABLE V_EVALUATION;
DROP TABLE VENUE;
DROP SEQUENCE VENUE_SEQ;
DROP TABLE VENUETYPE;
DROP SEQUENCE VENUETYPE_SEQ;
DROP TABLE REGION;


------------04---------------------------
------------VENUETYPE--------------------
---------------------------------20181211
CREATE TABLE VENUETYPE (
    VT_NO       VARCHAR2(7)     PRIMARY KEY, 
    VT_NAME     VARCHAR2(30)    NOT NULL
);  
CREATE SEQUENCE VENUETYPE_SEQ
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 999
    NOCYCLE
    NOCACHE;
------------05---------------------------
------------REGION-----------------------
---------------------------------20181211
CREATE TABLE REGION (
    REG_NO       NUMBER(5)      PRIMARY KEY, 
    REG_NAME     VARCHAR2(45)   NOT NULL,
    REG_DIST     VARCHAR2(45)   NOT NULL
);
------------06---------------------------
------------VENUE------------------------
---------------------------------20181211
CREATE TABLE VENUE (
    V_NO        VARCHAR2(7)  PRIMARY KEY, 
    V_NAME      VARCHAR2(60) NOT NULL,
    VT_NO       VARCHAR2(7),
    REG_NO      NUMBER(5),
    V_LAT       NUMBER(17,14),
    V_LONG      NUMBER(17,14),
    V_PIC       VARCHAR2(500),
    V_ADDRESS   VARCHAR2(500),
    V_PHONENO   VARCHAR2(50),
    V_STATUS    VARCHAR2(50),
    V_FUNC      VARCHAR2(500),
    CONSTRAINT VENUE_VENUETYPE_FK
    FOREIGN KEY(VT_NO) REFERENCES VENUETYPE(VT_NO),
    CONSTRAINT VENUE_REGION_FK
    FOREIGN KEY(REG_NO) REFERENCES REGION(REG_NO)
);  
CREATE SEQUENCE VENUE_SEQ
    INCREMENT BY 1
    START WITH 1
    NOMAXVALUE
    NOCYCLE
    NOCACHE;
------------07---------------------------
------------VENUE------------------------
---------------------------------20181211
CREATE TABLE V_EVALUATION (
    MEM_NO VARCHAR2(7),
    V_NO VARCHAR2(7), 
    SCORE NUMBER(1) ,
    CONSTRAINT V_EVALUATION_PK PRIMARY KEY(MEM_NO,V_NO),
    CONSTRAINT V_EVALUATION_MEMBER_FK FOREIGN KEY(MEM_NO) REFERENCES MEMBERLIST(MEM_NO),
    CONSTRAINT V_EVALUATION_VENUE_FK FOREIGN KEY(V_NO) REFERENCES VENUE(V_NO)
);  



commit;