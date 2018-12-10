--------------------------------------------------------
--  建立表格
--------------------------------------------------------
DROP SEQUENCE member_seq;
DROP SEQUENCE VENUETYPE_SEQ;
DROP SEQUENCE VENUE_SEQ;
DROP TABLE V_EVALUATION;
DROP TABLE VENUE;
DROP TABLE REGION;
DROP TABLE VENUETYPE;
DROP TABLE MEMBERLIST;

CREATE TABLE MEMBERLIST(
    MEM_NO VARCHAR2(7),
    MEM_NAME VARCHAR2(45) NOT NULL,
    MEM_NICK VARCHAR2(45),
    MEM_ACCOUNT VARCHAR2(15) NOT NULL,
    MEM_PSWD VARCHAR2(12) NOT NULL,
    MEM_EMAIL VARCHAR2(60) NOT NULL,
    MEM_PHONE VARCHAR2(13) NOT NULL,
    MEM_EMGC VARCHAR2(15),
    MEM_EMGCPHONE VARCHAR2(13),
    MEM_STATUS VARCHAR2(15) DEFAULT '未驗證' NOT NULL,
    MEM_CARD NUMBER(16),
    MEM_EXPIRY DATE,
    MEM_PIC BLOB,
    MEM_PICKIND VARCHAR2(10),
    CONSTRAINT MEMBERLIST_PK PRIMARY KEY (MEM_NO)
);
CREATE SEQUENCE member_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 999
    NOCYCLE
    NOCACHE;
    
INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'大衛海鮮','a001','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'Peter1','a002','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'大崛彩','a003','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'松井稼頭央','a004','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');


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
    REG_NAME     VARCHAR2(45)   NOT NULL
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
    V_ADDRESS   VARCHAR2(120),
    V_PHONENO   VARCHAR2(20),
    V_STATUS    VARCHAR2(20),
    V_FUNC      VARCHAR2(100),
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