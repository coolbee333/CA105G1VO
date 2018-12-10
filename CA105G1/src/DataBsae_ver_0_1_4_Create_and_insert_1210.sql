---SportyGo_ver_0_1_4_create_and_insert_1210------
--------------------------
------drop sequence-------
--------------------------
DROP SEQUENCE member_seq;
DROP SEQUENCE SPORT_SEQ;
DROP SEQUENCE VENUETYPE_SEQ;
DROP SEQUENCE VENUE_SEQ;
DROP SEQUENCE SG_INFO_SEQ;
DROP SEQUENCE SG_MSG_SEQ;
DROP SEQUENCE SG_REP_SEQ;
DROP SEQUENCE EVAOFMEM_SEQ;
DROP SEQUENCE club_seq;
DROP SEQUENCE club_member_seq;
DROP SEQUENCE club_member_LIST_seq;
DROP SEQUENCE MUTIMEDIA_SEQ;
DROP SEQUENCE post_info_seq;
DROP SEQUENCE post_seq;
DROP SEQUENCE post_like_seq;
DROP SEQUENCE respones_seq;
DROP SEQUENCE respones_like_seq;
DROP SEQUENCE ORD_SEQ;
DROP SEQUENCE PRODUCTCLASS_SEQ; 
DROP SEQUENCE PRODUCT_SEQ;
DROP SEQUENCE PROMOTION_SEQ; 
DROP SEQUENCE address_seq;
DROP SEQUENCE NEWSTYPE_SEQ; 
DROP SEQUENCE NEWS_SEQ;
DROP SEQUENCE EMP_SEQ;
DROP SEQUENCE COMPETITION_SEQ;
--------------------------------------
-----DROP TABLE-----------------------
--------------------------------------
DROP TABLE COMPETITION;
DROP TABLE EMP;
DROP TABLE NEWS;
DROP TABLE NEWSTYPE;
DROP TABLE ADDRESS;
---有表格改名字--第一個是舊的
DROP TABLE PRODUCT_DETAIL_PROMOTION;
DROP TABLE PRO_DETAIL_PROM;
---
DROP TABLE PROMOTION;
DROP TABLE SHOPPINGCART;
DROP TABLE PRODUCT_LIKE;
DROP TABLE ORDDETAILS;
DROP TABLE PRODUCT;
DROP TABLE PRODUCTCLASS;
DROP TABLE ORD;
DROP TABLE RESPONES_LIKE;
DROP TABLE RESPONES;
DROP TABLE POST;
DROP TABLE POST_LIKE;
DROP TABLE POST_INFO;
DROP TABLE MUTIMEDIA;
----FIRST IS OLDEER TABLE;
DROP TABLE CLUB_MEMBER;
DROP TABLE CLUB_MEMBERLIST;
----
DROP TABLE CLUB;
DROP table SG_LIKE;
DROP TABLE EVAOFMEM;
DROP table SG_REP;
DROP table SG_MEM;
DROP table SG_MSG;
DROP TABLE SG_INFO;
DROP TABLE V_EVALUATION;
DROP TABLE VENUE;
DROP TABLE REGION;
DROP TABLE VENUETYPE;
DROP table SPORT;
DROP TABLE FRIEND;
DROP TABLE MEMBERLIST;
------------01---------------------------
------------MEMBERLIST TABL-------------
---------------------------------20181208
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
------------02---------------------------
------------FRIEND-----------------------
---------------------------------20181208
CREATE TABLE FRIEND(
    MEM1_NO VARCHAR2(7),
    MEM2_NO VARCHAR2(7),
    RELATIONSHIP VARCHAR2(45),
    FRIEND_STATUS VARCHAR2(9) DEFAULT '申請中' NOT NULL,
    MEM_CHAT CLOB,
    CONSTRAINT FRIEND_PK PRIMARY KEY (MEM1_NO,MEM2_NO),
    CONSTRAINT PRIENDSHIP_FK1 FOREIGN KEY (MEM1_NO) REFERENCES MEMBERLIST (MEM_NO),
    CONSTRAINT PRIENDSHIP_FK2 FOREIGN KEY (MEM2_NO) REFERENCES MEMBERLIST (MEM_NO)
);
------------03---------------------------
------------SPORT------------------------
---------------------------------20181208
create table SPORT(
    SP_NO varchar2(7),
    SP_NAME varchar2(15) not null,
    
    constraint SPORT_PK primary key(SP_NO)
);
create sequence SPORT_SEQ
    increment by 1
    start with 1
    MAXVALUE 999
    NOCYCLE
    NOCACHE;
------------04---------------------------
------------VENUETYPE--------------------
---------------------------------20181208
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
---------------------------------20181208
CREATE TABLE REGION (
    REG_NO       NUMBER(5)      PRIMARY KEY, 
    REG_NAME     VARCHAR2(45)   NOT NULL
);
------------06---------------------------
------------VENUE------------------------
---------------------------------20181208
CREATE TABLE VENUE (
    V_NO        VARCHAR2(7)  PRIMARY KEY, 
    V_NAME      VARCHAR2(60) NOT NULL,
    VT_NO       VARCHAR2(7),
    REG_NO      NUMBER(5),
    V_LAT       DECIMAL(8,6),
    V_LONG      DECIMAL(9,6),
    V_LINK      VARCHAR2(200),
    V_OPENDAY   VARCHAR2(7),
    V_ADDRESS   VARCHAR2(120),
    V_PHONENO   NUMBER(10),
    V_STATUS    VARCHAR2(15),
    CONSTRAINT FK_VENUE_VENUETYPE
    FOREIGN KEY(VT_NO) REFERENCES VENUETYPE(VT_NO),
    CONSTRAINT FK_VENUE_REGION
    FOREIGN KEY(REG_NO) REFERENCES REGION(REG_NO)
);	  
CREATE SEQUENCE VENUE_SEQ
    INCREMENT BY 1
    START WITH 1
    NOMAXVALUE
    NOCYCLE
    NOCACHE;
------------07---------------------------
------------V_EVALUATION------------------------
---------------------------------20181208
CREATE TABLE V_EVALUATION (
    MEM_NO VARCHAR2(7),
    V_NO VARCHAR2(7), 
    SCORE NUMBER(1) ,
    CONSTRAINT V_EVALUATION_PK PRIMARY KEY(MEM_NO,V_NO),
    CONSTRAINT V_EVALUATION_MEMBER_FK FOREIGN KEY(MEM_NO) REFERENCES MEMBERLIST(MEM_NO),
    CONSTRAINT V_EVALUATION_VENUE_FK FOREIGN KEY(V_NO) REFERENCES VENUE(V_NO)
);  
------------08---------------------------
------------SG_INFO----------------------
---------------------------------20181208
CREATE TABLE SG_INFO(
    SG_NO varchar2(7),
    MEM_NO varchar2(7) not null,
    SG_NAME varchar2(50) not null,
    SG_DATE timestamp not null,
    APL_START timestamp not null,
    APL_END timestamp not null,
    SG_FEE number(6,0),
    SG_PIC blob,
    SG_PIC_EXT varchar2(10),
    SG_PER varchar2(10) not null,
    SPORT_NO varchar2(7) not null,
    VENUE_NO varchar2(7),
    SG_MAXNO number(2,0),
    SG_MINNO number(2,0),
    SG_TTLAPL number(2,0),
    SG_CHKNO number(2,0),
    SG_EXTRAINFO clob,
    SG_STATUS varchar2(10) default '揪團中' not null,
    LOC_START_LAT DECIMAL(9,6),
    LOC_START_LNG DECIMAL(8,6),
    LOC_END_LAT DECIMAL(9,6),
    LOC_END_LNG DECIMAL(8,6),
    
    constraint SG_INFO_PK primary key (SG_NO),
    constraint FK1_SG_INFO_MEM foreign key (MEM_NO) references MEMBERLIST(MEM_NO),
    constraint FK2_SG_INFO_SPORT foreign key (SPORT_NO) references SPORT(SP_NO),
    constraint FK3_SG_INFO_VEMUE foreign key (VENUE_NO) references VENUE(V_NO)
);
create sequence SG_INFO_SEQ
    start with 1
    increment by 1
    MAXVALUE 999
    nocycle
    nocache;
------------09---------------------------
------------SG_MSG-----------------------
---------------------------------20181208
create table SG_MSG(
    MSG_NO varchar2(7),
    SG_NO varchar2(7),
    MEM_NO varchar2(7),
    MSG_CONT clob,
    
    constraint SG_MSG_PK primary key(MSG_NO),
    constraint FK1_SG_MSG_INFO foreign key (SG_NO) references SG_INFO(SG_NO),
    constraint FK2_SG_MSG_MEM foreign key (MEM_NO) references MEMBERLIST(MEM_NO)
);
create sequence SG_MSG_SEQ
    increment by 1
    start with 1
    MAXVALUE 999
    NOCYCLE
    NOCACHE;
    
------------10---------------------------
------------SG_MEM----------------------
---------------------------------20181208
create table SG_MEM(
    SG_NO varchar2(7) not null,
    MEM_NO varchar2(7) not null,
    CH_STATUS varchar2(10) default '未報到' not null,
    
    constraint SG_MEM_PK primary key (SG_NO,MEM_NO),
    constraint FK1_SG_MEM_INFO foreign key (SG_NO) references SG_INFO(SG_NO),
    constraint FK2_SG_MEM_MEMLIST foreign key (MEM_NO) references MEMBERLIST(MEM_NO)
);

------------11---------------------------
------------SG_REP----------------------
---------------------------------20181208
create table SG_REP(
    REP_NO varchar2(7),
    SG_NO varchar2(7),
    MEM_NO varchar2(7),
    REP_TYPE varchar2(30) not null,
    REP_CONT clob,
    REP_STATUS varchar2(30) default '待審核' not null,
    
    constraint SG_REP_PK primary key(REP_NO),
    constraint FK1_SG_REP_INFO foreign key (SG_NO) references SG_INFO(SG_NO),
    constraint FK2_SG_REP_MEM foreign key (MEM_NO) references MEMBERLIST(MEM_NO)
);
create sequence SG_REP_SEQ
    increment by 1
    start with 1
    MAXVALUE 999
    NOCYCLE
    NOCACHE;

------------12---------------------------
------------SG_REP----------------------
---------------------------------20181208
CREATE TABLE EVAOFMEM(
    SG_NO VARCHAR2(7),
    EVALUATE_NO VARCHAR2(7),
    EVALUATED_NO VARCHAR2(7),
    EVA_SCORE NUMBER(3),
    CONSTRAINT EVAOFMAM_PK PRIMARY KEY (SG_NO,EVALUATE_NO,EVALUATED_NO),
    CONSTRAINT EVAOFMEM_SGINFO_FK1 FOREIGN KEY (SG_NO) REFERENCES SG_INFO (SG_NO),
    CONSTRAINT EVAOFMAM_MEMBER_FK2 FOREIGN KEY (EVALUATE_NO) REFERENCES MEMBERLIST (MEM_NO),
    CONSTRAINT EVAOFMAM_MEMBER_FK3 FOREIGN KEY (EVALUATED_NO) REFERENCES MEMBERLIST (MEM_NO)
);
create sequence EVAOFMEM_SEQ
    increment by 1
    start with 1
    MAXVALUE 999
    NOCYCLE
    NOCACHE;

------------13---------------------------
------------SG_LIKE----------------------
---------------------------------20181208
create table SG_LIKE(
    SG_NO varchar2(7),
    MEM_NO varchar2(7),
    
    constraint SG_LIKE_PK primary key(SG_NO,MEM_NO),
    constraint SG_LIKE_FK1 foreign key (SG_NO) references SG_INFO(SG_NO),
    constraint SG_LIKE_FK2 foreign key (MEM_NO) references MEMBERLIST(MEM_NO)
);

------------14---------------------------
------------CLUB-------------------------
---------------------------------20181208
CREATE TABLE CLUB (
  CLUB_NO       VARCHAR2(7), 
  SP_NO         VARCHAR2(7)  NOT NULL, 
  PHOTO         BLOB,
  PHOTO_EXT     VARCHAR2(10),
  CLUB_STATUS   VARCHAR2(10) DEFAULT '正常' NOT NULL,
  CLUB_NAME     VARCHAR2(20) NOT NULL,
  CLUB_INTRO    CLOB,
  
  CONSTRAINT CLUB_PK PRIMARY KEY (CLUB_NO),
  CONSTRAINT CLUB_FK FOREIGN KEY (SP_NO) REFERENCES SPORT (SP_NO)
);
CREATE SEQUENCE club_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 999
    NOCYCLE
    NOCACHE;

------------15---------------------------
------------CLUB_MEMBERLIST------------------
---------------------------------20181208
CREATE TABLE CLUB_MEMBERLIST (
    CLUB_NO       VARCHAR2(7)  NOT NULL, 
    MEM_NO        VARCHAR2(7)  NOT NULL, 
    CMEM_STATUS   VARCHAR2(20) DEFAULT '待審核' NOT NULL,
    CMEM_CLASS    VARCHAR2(15) DEFAULT '一般成員' NOT NULL,
    SILENCE_TIME  TIMESTAMP,

    CONSTRAINT CLUB_MEMBER_LIST_PK PRIMARY KEY(CLUB_NO,MEM_NO),
    CONSTRAINT CLUB_MEMBER_LIST_FK1 FOREIGN KEY (CLUB_NO) REFERENCES CLUB (CLUB_NO),
    CONSTRAINT CLUB_MEMBER_LIST_FK2 FOREIGN KEY (MEM_NO) REFERENCES MEMBERLIST (MEM_NO)
);
---why need it, club_member_list_seq ?
CREATE SEQUENCE club_member_list_seq
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 999
   NOCYCLE
   NOCACHE;

------------16---------------------------
------------MUTIMEDIA--------------------
---------------------------------20181208
CREATE TABLE MUTIMEDIA(
    MEDIA_NO VARCHAR2(7) PRIMARY KEY,
    FILE_EXTENSION VARCHAR2(10),
    MEDIA_CONTENT BLOB,
    CLUB_NO VARCHAR2(7),
    MEM_NO VARCHAR2(7),
    MEDIA_RRLEASEDATE TIMESTAMP NOT NULL,
    MEDIA_TITLE VARCHAR2(30) NOT NULL
);
CREATE SEQUENCE MUTIMEDIA_SEQ
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 999
   NOCYCLE
   NOCACHE;

------------17---------------------------
------------POST_INFO------------------
---------------------------------20181208
CREATE TABLE POST_INFO (
    POST_NO       VARCHAR2(7)  NOT NULL, 
    CLUB_NO       VARCHAR2(7)  NOT NULL, 
    MEM_NO        VARCHAR2(7)  NOT NULL,
    POST_TOPIC    VARCHAR2(60),
    POST_CONTENT  CLOB  NOT NULL,
    POST_DATE		TIMESTAMP  NOT NULL,
  
    CONSTRAINT POST_INFO_PK PRIMARY KEY (POST_NO),
    CONSTRAINT POST_INFO_FK1 FOREIGN KEY (CLUB_NO) REFERENCES CLUB (CLUB_NO),
    CONSTRAINT POST_INFO_FK2 FOREIGN KEY (MEM_NO) REFERENCES MEMBERLIST (MEM_NO)
);
CREATE SEQUENCE post_info_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 999
    NOCYCLE
    NOCACHE;

------------18---------------------------
------------POST_LIKE-------------------------
---------------------------------20181208
CREATE TABLE POST_LIKE (
    POST_NO       VARCHAR2(7), 
    MEM_NO        VARCHAR2(7),
    LIKE_TYPE     VARCHAR2(10)  NOT NULL,

    CONSTRAINT POST_LIKE_PK PRIMARY KEY(POST_NO,MEM_NO),
    CONSTRAINT POST_LIKE_FK1 FOREIGN KEY (POST_NO) REFERENCES POST_INFO(POST_NO),
    CONSTRAINT POST_LIKE_FK2 FOREIGN KEY (MEM_NO) REFERENCES MEMBERLIST (MEM_NO)
);
CREATE SEQUENCE post_like_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 999
    NOCYCLE
    NOCACHE;

------------19---------------------------
------------RESPONES---------------------
---------------------------------20181208
CREATE TABLE RESPONES (
    RES_NO        VARCHAR2(7), 
    POST_NO       VARCHAR2(7) NOT NULL, 
    MEM_NO        VARCHAR2(7) NOT NULL,
    RES_CONTENT   CLOB  NOT NULL,
    RES_DATE	  TIMESTAMP  NOT NULL,
  
    CONSTRAINT RESPONES_PK  PRIMARY KEY (RES_NO),
    CONSTRAINT RESPONES_FK1 FOREIGN KEY (POST_NO) REFERENCES POST_INFO (POST_NO),
    CONSTRAINT RESPONES_FK2 FOREIGN KEY (MEM_NO) REFERENCES MEMBERLIST (MEM_NO)
);    
CREATE SEQUENCE respones_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 999
    NOCYCLE
    NOCACHE;


------------20---------------------------
------------RESPONES_LIKE----------------
---------------------------------20181209
CREATE TABLE RESPONES_LIKE (
    RES_NO        VARCHAR2(7)  NOT NULL, 
    MEM_NO        VARCHAR2(7)  NOT NULL,
    LIKE_TYPE     BLOB,
    LIKE_TYPE_EXT     VARCHAR2(10),
    CONSTRAINT RESPONES_LIKE_PK PRIMARY KEY (RES_NO,MEM_NO),
    CONSTRAINT FK1_RESPONES_LIKE_RES FOREIGN KEY (RES_NO) REFERENCES RESPONES (RES_NO),
    CONSTRAINT FK2_RESPONES_LIKE_MEM FOREIGN KEY (MEM_NO) REFERENCES MEMBERLIST (MEM_NO)
);  
CREATE SEQUENCE respones_like_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 999
    NOCYCLE
    NOCACHE
    ORDER;

------------21---------------------------
------------ORD--------------------------
---------------------------------20181209
CREATE TABLE ORD (
    ORD_NO	        	VARCHAR2(20),
    MEM_NO	        	VARCHAR2(7)     NOT NULL,   
    ORD_DATE	        TIMESTAMP       NOT NULL,	
    ORD_DELDATE	        TIMESTAMP,	
    ORD_STATUS	        VARCHAR2(10)    NOT NULL,
    ORD_BACKDELDATE	    TIMESTAMP,	
    ORD_AMOUNT	        NUMBER(7)       NOT NULL,
    ORD_BACKAMOUNT	    NUMBER(7),
    CONSTRAINT fk1_ord_memberlist FOREIGN KEY (MEM_NO) REFERENCES MEMBERLIST(MEM_NO),
    CONSTRAINT ORD_PK PRIMARY KEY (ORD_NO)
);
CREATE SEQUENCE ORD_SEQ 
    INCREMENT BY 1 
    START WITH 1
    NOMAXVALUE 
    NOCYCLE
    NOCACHE
    ORDER;

------------22---------------------------
------------PRODUCTCLASS-----------------
---------------------------------20181209
CREATE TABLE PRODUCTCLASS(
    PRO_CLASSID		    VARCHAR2(7),
    PRO_CLASSNAME		VARCHAR2(100) NOT NULL,
    CONSTRAINT PRODUCTCLASS_PK PRIMARY KEY (PRO_CLASSID)
);
CREATE SEQUENCE PRODUCTCLASS_SEQ 
    INCREMENT BY 1 
    START WITH 1
    MAXVALUE 999
    NOCYCLE
    NOCACHE
    ORDER;

------------23---------------------------
------------PRODUCT----------------------
---------------------------------20181209
CREATE TABLE PRODUCT(
    PRO_NO		            VARCHAR2(7),
    PRO_CLASSID		        VARCHAR2(7)     NOT NULL,
    PRO_NAME		        VARCHAR2(100)   NOT NULL,
    PRO_PIC		            BLOB,
    PRO_PIC_EXT	        	VARCHAR2(10),
    PRO_FORMAT		        VARCHAR2(100)   NOT NULL,
    PRO_BONUS		        NUMBER(7)       NOT NULL,
    PRO_STOCK		        NUMBER(7)       NOT NULL,
    PRO_SAFESTOCK	        NUMBER(7)       NOT NULL,
    PRO_DETAILS		        VARCHAR2(1500),
    PRO_SHELVE		        VARCHAR2(10)    NOT NULL,
    PRO_ALL_ASSESS		    NUMBER(7),
    PRO_ALL_ASSESSMAN		NUMBER(7),
    CONSTRAINT FK1_PRODUCT_PRODUCTCLASS FOREIGN KEY (PRO_CLASSID) REFERENCES PRODUCTCLASS (PRO_CLASSID),
    CONSTRAINT PRODUCT_PK PRIMARY KEY (PRO_NO)
);

CREATE SEQUENCE PRODUCT_SEQ 
    INCREMENT BY 1 
    START WITH 1
    MAXVALUE 999
    NOCYCLE
    NOCACHE
    ORDER;
------------24---------------------------
------------ORDDETAILS-------------------
---------------------------------20181209
CREATE TABLE ORDDETAILS(
    ORD_NO		        VARCHAR2(20) NOT NULL,
    PRO_NO		        VARCHAR2(7) NOT NULL,
    ORD_PROBONUNS		NUMBER(7) NOT NULL,
    PRO_COUNT		    NUMBER(7) NOT NULL,
    CONSTRAINT FK1_ORDDETAILS_ORD FOREIGN KEY (ORD_NO) REFERENCES ORD (ORD_NO),
    CONSTRAINT FK2_ORDDETAILS_PRO FOREIGN KEY (PRO_NO) REFERENCES PRODUCT (PRO_NO),
    CONSTRAINT ORDDETAILS_PK PRIMARY KEY (ORD_NO , PRO_NO)
);

------------25---------------------------
------------PRODUCTLIKE------------------
---------------------------------20181209
CREATE TABLE PRODUCT_LIKE(
    PRODUCT_NO  VARCHAR2(7),
    MEM_NO      VARCHAR2(7),
    CONSTRAINT PRODUCT_LIKE_PK PRIMARY KEY (PRODUCT_NO,MEM_NO),
    CONSTRAINT PRODUCT_LIKE_MEMBER_FK1 FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT (PRO_NO),
    CONSTRAINT PRODUCT_LIKE_MEMBER_FK2 FOREIGN KEY (MEM_NO) REFERENCES MEMBERLIST (MEM_NO)
);
------------26---------------------------
------------SHOPPINGCART---Redis---------
---------------------------------20181209
CREATE TABLE SHOPPINGCART(
    MEM_NO		    VARCHAR2(7)     NOT NULL,
    PRO_NO		    VARCHAR2(7)     NOT NULL,
    PRO_COUNT		NUMBER(7)       NOT NULL,
    CONSTRAINT FK1_SHOPPINGCART_MEMBERLIST FOREIGN KEY (MEM_NO) REFERENCES MEMBERLIST(MEM_NO),
    CONSTRAINT SHOPPINGCART_PK PRIMARY KEY (MEM_NO , PRO_NO)
);



------------27---------------------------
------------PROMOTION--------------------
---------------------------------20181209
CREATE TABLE PROMOTION(
    PROM_PROJECT_ID		    VARCHAR2(7),
    PROM_PROJECT_NAME		VARCHAR2(100)   NOT NULL,
    PROM_PROJECT_SDATE		TIMESTAMP       NOT NULL,	
    PROM_PROJECT_EDATE		TIMESTAMP       NOT NULL,	
    CONSTRAINT PROMOTION_PK PRIMARY KEY (PROM_PROJECT_ID)
);

CREATE SEQUENCE PROMOTION_SEQ 
    INCREMENT BY 1 
    START WITH 1
    MAXVALUE 999
    NOCYCLE
    NOCACHE
    ORDER;
------------28---------------------------
------------PRO_DETAIL_PROMO--------------
---------------------------------20181209
CREATE TABLE PRO_DETAIL_PROM(
    PROM_PROJECT_ID		VARCHAR2(7) NOT NULL,
    PRO_NO		        VARCHAR2(7) NOT NULL,
    PRO_SALE		    NUMBER(7)   NOT NULL,
    CONSTRAINT PRODUCT_DETAILPROMOTION_PK 
    PRIMARY KEY (PROM_PROJECT_ID , PRO_NO),
    CONSTRAINT FK1_PRO_DELTAIL_PROM_PROBUCT FOREIGN KEY (PRO_NO) REFERENCES PRODUCT(PRO_NO),
    CONSTRAINT FK2_PRO_DETAIL_PROM_PROMOTION FOREIGN KEY (PROM_PROJECT_ID) REFERENCES PROMOTION(PROM_PROJECT_ID)
);

------------29---------------------------
------------ADDRESS----------------------
---------------------------------20181209
CREATE TABLE ADDRESS(
    ADDR_NO         VARCHAR2(7),
    MEM_NO          VARCHAR2(7),
    RECIVER         VARCHAR2(15)    NOT NULL,
    RECIVER_PHONE   VARCHAR2(13)    NOT NULL,
    COUNTRY         VARCHAR2(45)    NOT NULL,
    CITY            VARCHAR2(45)    NOT NULL,
    ADDR_DETAIL     VARCHAR2(60)    NOT NULL,
    ADDR_ZIP        NUMBER(5)       NOT NULL,
    CONSTRAINT ADDRESS_PK PRIMARY KEY (ADDR_NO),
    CONSTRAINT ADDRESS_MEMBER_FK FOREIGN KEY (MEM_NO) REFERENCES MEMBERLIST(MEM_NO)    
);
CREATE SEQUENCE address_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 999
    NOCYCLE
    NOCACHE
    ORDER;
------------30---------------------------
------------NEWSTYPE---------------------
---------------------------------20181209
CREATE TABLE NEWSTYPE
    (NEWSTYPE_NO    VARCHAR2(7)     PRIMARY KEY,
    NEWSTYPE_NAME   VARCHAR2(30)    NOT NULL
);
CREATE SEQUENCE NEWSTYPE_SEQ 
    INCREMENT BY 1 
    START WITH 1
    MAXVALUE 999
    NOCACHE
    NOCYCLE
    ORDER;
------------31---------------------------
------------NEWS-------------------------
---------------------------------20181209
CREATE TABLE NEWS
    (NEWS_NO        VARCHAR2(7)     PRIMARY KEY,
    NEWS_TYPENO     VARCHAR2(7),
    NEWS_SCRIPT     CLOB,
    PIC_EXTENSION   VARCHAR2(30)    NOT NULL,
    NEWS_PICTURE    BLOB            NOT NULL,
    NEWS_STUTAS     VARCHAR2(12)    NOT NULL,
    NEWS_RELEASE_DATE TIMESTAMP,
    NEWS_LAST_DATE  TIMESTAMP,
    FOREIGN KEY (NEWS_TYPENO) REFERENCES NEWSTYPE(NEWSTYPE_NO)
);
CREATE SEQUENCE NEWS_SEQ 
    INCREMENT BY 1 
    START WITH 1
    MAXVALUE 999
    NOCACHE
    NOCYCLE
    ORDER;
------------32---------------------------
------------EMP--------------------------
---------------------------------20181209
CREATE TABLE EMP 
    (EMP_NO VARCHAR2(7) PRIMARY KEY, 
    EMP_NAME VARCHAR2(255) NOT NULL, 
    EMP_AUTH VARCHAR2(255), 
    EMP_PHONE NUMBER(10,0), 
    EMP_EMAIL VARCHAR2(255) NOT NULL UNIQUE, 
    EMP_ACCOUNT VARCHAR2(50) NOT NULL UNIQUE, 
    EMP_PSW VARCHAR2(20), 
    HIREDATE DATE, 
    LEAVEDATE DATE
);
CREATE SEQUENCE EMP_SEQ 
    INCREMENT BY 1 
    START WITH 1
    MAXVALUE 999
    NOCACHE
    NOCYCLE
    ORDER;

------------33---------------------------
------------COMPETITION------------------
---------------------------------20181209
CREATE TABLE COMPETITION
    (COMP_NO        VARCHAR2(7)     PRIMARY KEY,
    COMP_NAME       VARCHAR2(255)   NOT NULL,
    COMP_STARTDATE  TIMESTAMP       NOT NULL,
    COMP_ENDDATE    TIMESTAMP       NOT NULL,
    COMP_CONT       CLOB            NOT NULL
);
CREATE SEQUENCE COMPETITION_SEQ 
    INCREMENT BY 1 
    START WITH 1
    MAXVALUE 999
    NOCACHE
    NOCYCLE
    ORDER;

COMMIT;



--------------------------------------------------------
--------------------------------------------------------
--------------------------------------------------------
---SportyGo_ver_0_1_4_insert_1210------
------------01-INSERT--------------------
------------MEMBERLIST-------------------
---------------------------------20181210
INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'大衛海鮮','a001','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'Peter1','a002','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'大崛彩','a003','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'松井稼頭央','a004','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'櫻木花道','a005','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'流川楓','a006','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'茂野吾郎','a007','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'運動明星','a008','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'酷斃','a009','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'ROLE1','a010','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'手臂強','a011','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'漢米爾頓','a012','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'野原家','a013','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'勘吉','a014','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'恰吉','a015','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'安西教練','a016','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'三井','a017','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'戴資穎','a018','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'周天成','a019','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'李宗偉','a020','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'OHTANI','a021','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'厄文','a022','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'大猩猩','a023','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'晴子','a024','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'杜蘭朵','a025','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'咖哩','a026','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'勒布朗','a027','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');

INSERT INTO MEMBERLIST(MEM_NO,MEM_NAME,MEM_ACCOUNT,MEM_PSWD,MEM_EMAIL,MEM_PHONE,MEM_STATUS)
VALUES('M'||LPAD(TO_CHAR(member_seq.NEXTVAL),3,'0'),'AARON','a028','123456','s9821100@gm.pu.edu.tw','0937351931','正式會員');


commit;


------------02-INSERT--------------------
------------FRIEND-----------------------
---------------------------------20181210


------------03-INSERT--------------------
------------SPORT------------------------
---------------------------------20181210insert into SPORT values('SP' || LPAD(SPORT_SEQ.nextval, 3, 0), '棒球');
insert into SPORT values('SP' || LPAD(SPORT_SEQ.nextval, 3, 0), '棒球');
insert into SPORT values('SP' || LPAD(SPORT_SEQ.nextval, 3, 0), '排球');
insert into SPORT values('SP' || LPAD(SPORT_SEQ.nextval, 3, 0), '籃球');
insert into SPORT values('SP' || LPAD(SPORT_SEQ.nextval, 3, 0), '網球');
insert into SPORT values('SP' || LPAD(SPORT_SEQ.nextval, 3, 0), '羽球');
insert into SPORT values('SP' || LPAD(SPORT_SEQ.nextval, 3, 0), '慢跑');
insert into SPORT values('SP' || LPAD(SPORT_SEQ.nextval, 3, 0), '自行車');



------------04-INSERT--------------------
------------VENUETYPE--------------------
---------------------------------20181210
Insert into VENUETYPE (VT_NO, VT_NAME) values ('VT'||LPAD(to_char(VENUETYPE_SEQ.NEXTVAL), 5, '0'), '棒球場');
Insert into VENUETYPE (VT_NO, VT_NAME) values ('VT'||LPAD(to_char(VENUETYPE_SEQ.NEXTVAL), 5, '0'), '籃球場');
Insert into VENUETYPE (VT_NO, VT_NAME) values ('VT'||LPAD(to_char(VENUETYPE_SEQ.NEXTVAL), 5, '0'), '羽球場');


------------05-INSERT--------------------
------------REGION-----------------------
---------------------------------20181210
Insert into REGION values (100, '台北市中正區');
Insert into REGION values (103, '台北市大同區');
Insert into REGION values (104, '台北市中山區');
Insert into REGION values (105, '台北市松山區');
Insert into REGION values (106, '台北市大安區');
Insert into REGION values (108, '台北市萬華區');
Insert into REGION values (110, '台北市信義區');
Insert into REGION values (111, '台北市士林區');
Insert into REGION values (112, '台北市北投區');
Insert into REGION values (114, '台北市內湖區');
Insert into REGION values (115, '台北市南港區');
Insert into REGION values (116, '台北市文山區');

Insert into REGION values (200, '基隆市仁愛區');
Insert into REGION values (201, '基隆市信義區');
Insert into REGION values (202, '基隆市中正區');
Insert into REGION values (203, '基隆市中山區');
Insert into REGION values (204, '基隆市安樂區');
Insert into REGION values (205, '基隆市暖暖區');
Insert into REGION values (206, '基隆市七堵區');

Insert into REGION values (207, '新北市萬里區');
Insert into REGION values (208, '新北市金山區');
Insert into REGION values (220, '新北市板橋區');
Insert into REGION values (221, '新北市汐止區');
Insert into REGION values (222, '新北市深坑區');
Insert into REGION values (223, '新北市石碇區');
Insert into REGION values (224, '新北市瑞芳區');
Insert into REGION values (226, '新北市平溪區');
Insert into REGION values (227, '新北市雙溪區');
Insert into REGION values (228, '新北市貢寮區');
Insert into REGION values (231, '新北市新店區');
Insert into REGION values (232, '新北市坪林區');
Insert into REGION values (233, '新北市烏來區');
Insert into REGION values (234, '新北市永和區');
Insert into REGION values (235, '新北市中和區');
Insert into REGION values (236, '新北市土城區');
Insert into REGION values (237, '新北市三峽區');
Insert into REGION values (238, '新北市樹林區');
Insert into REGION values (239, '新北市鶯歌區');
Insert into REGION values (241, '新北市三重區');
Insert into REGION values (242, '新北市新莊區');
Insert into REGION values (243, '新北市泰山區');
Insert into REGION values (244, '新北市林口區');
Insert into REGION values (247, '新北市蘆洲區');
Insert into REGION values (248, '新北市五股區');
Insert into REGION values (249, '新北市八里區');
Insert into REGION values (251, '新北市淡水區');
Insert into REGION values (252, '新北市三芝區');
Insert into REGION values (253, '新北市石門區');

Insert into REGION values (320, '桃園市中壢區');
Insert into REGION values (324, '桃園市平鎮區');
Insert into REGION values (325, '桃園市龍潭區');
Insert into REGION values (326, '桃園市楊梅區');
Insert into REGION values (327, '桃園市新屋區');
Insert into REGION values (328, '桃園市觀音區');
Insert into REGION values (330, '桃園市桃園區');
Insert into REGION values (333, '桃園市龜山區');
Insert into REGION values (334, '桃園市八德區');
Insert into REGION values (335, '桃園市大溪區');
Insert into REGION values (336, '桃園市復興區');
Insert into REGION values (337, '桃園市大園區');
Insert into REGION values (338, '桃園市蘆竹區');

Insert into REGION values (209, '連江縣南竿鄉');
Insert into REGION values (210, '連江縣北竿鄉');
Insert into REGION values (211, '連江縣莒光鄉');
Insert into REGION values (212, '連江縣東引鄉');

Insert into REGION values (260, '宜蘭縣宜蘭市');
Insert into REGION values (261, '宜蘭縣頭城鎮');
Insert into REGION values (262, '宜蘭縣礁溪鄉');
Insert into REGION values (263, '宜蘭縣壯圍鄉');
Insert into REGION values (264, '宜蘭縣員山鄉');
Insert into REGION values (265, '宜蘭縣羅東鎮');
Insert into REGION values (266, '宜蘭縣三星鄉');
Insert into REGION values (267, '宜蘭縣大同鄉');
Insert into REGION values (268, '宜蘭縣五結鄉');
Insert into REGION values (269, '宜蘭縣冬山鄉');
Insert into REGION values (270, '宜蘭縣蘇澳鎮');
Insert into REGION values (272, '宜蘭縣南澳鄉');
Insert into REGION values (290, '釣魚臺');


------------06-INSERT--------------------
------------VENUE------------------------
---------------------------------20181210
Insert into VENUE values('V'||LPAD(to_char(VENUE_SEQ.NEXTVAL), 6, '0'),'中央大學籃球場','VT00002',320,24.9697339773255,121.189337968826,'http://www.ncu.edu.tw','1234567','桃園市中壢區中大路300號',03-4227151,'開放中');
Insert into VENUE values('V'||LPAD(to_char(VENUE_SEQ.NEXTVAL), 6, '0'),'中央大學籃球場2','VT00002',320,24.9697339773255,121.189337968826,'http://www.ncu.edu.tw','1234567','桃園市中壢區中大路300號',03-4227151,'開放中');
Insert into VENUE values('V'||LPAD(to_char(VENUE_SEQ.NEXTVAL), 6, '0'),'中央大學籃球場3','VT00002',320,24.9697339773255,121.189337968826,'http://www.ncu.edu.tw','1234567','桃園市中壢區中大路300號',03-4227151,'開放中');


------------07-INSERT--------------------
------------V_EVALUATION------------------------
---------------------------------20181210


------------08-INSERT--------------------
------------SG_INFO----------------------
---------------------------------20181210
insert into SG_INFO values('S' || LPAD(SG_INFO_SEQ.nextval, 3, 0), 'M001', '中央大學籃球魂不滅', to_timestamp('2018-12-30 10:00:00','yyyy-mm-dd hh24:mi:ss'),to_timestamp('2018-12-20 00:00:00','yyyy-mm-dd hh24:mi:ss'),to_timestamp('2018-12-27 00:00:00','yyyy-mm-dd hh24:mi:ss'),100,null,null,'公開','SP003','V000001',10,3,null,null,'歡迎歡迎熱烈歡迎',default,null,null,null,null);
insert into SG_INFO values('S' || LPAD(SG_INFO_SEQ.nextval, 3, 0), 'M002', '熱血雙城計畫', to_timestamp('2018-12-20 21:30:00','yyyy-mm-dd hh24:mi:ss'),to_timestamp('2018-12-8 00:00:00','yyyy-mm-dd hh24:mi:ss'),to_timestamp('2018-12-17 00:00:00','yyyy-mm-dd hh24:mi:ss'),100,null,null,'公開','SP007',null,8,5,null,null,'一起來騎卡打掐',default,121.51694880000002,25.0478142,120.30200650000006,22.6389745);
insert into SG_INFO values('S' || LPAD(SG_INFO_SEQ.nextval, 3, 0), 'M001', '台北直直跑', to_timestamp('2018-12-7 17:30:00','yyyy-mm-dd hh24:mi:ss'),to_timestamp('2018-11-30 00:00:00','yyyy-mm-dd hh24:mi:ss'),to_timestamp('2018-12-4 00:00:00','yyyy-mm-dd hh24:mi:ss'),null,null,null,'公開','SP006',null,5,3,5,4,'跑起來','成團',121.56447219999995,25.0339639,121.56631708145142,25.041126551200858);
insert into SG_INFO values('S' || LPAD(SG_INFO_SEQ.nextval, 3, 0), 'M001', '打排球', to_timestamp('2018-11-30 18:30:00','yyyy-mm-dd hh24:mi:ss'),to_timestamp('2018-11-20 00:00:00','yyyy-mm-dd hh24:mi:ss'),to_timestamp('2018-11-27 00:00:00','yyyy-mm-dd hh24:mi:ss'),null,null,null,'限社團','SP002','V000003',20,12,5,null,null,'流團',null,null,null,null);
insert into SG_INFO values('S' || LPAD(SG_INFO_SEQ.nextval, 3, 0), 'M002', '網球拍拍', to_timestamp('2018-12-30 18:30:00','yyyy-mm-dd hh24:mi:ss'),to_timestamp('2018-12-20 00:00:00','yyyy-mm-dd hh24:mi:ss'),to_timestamp('2018-12-27 00:00:00','yyyy-mm-dd hh24:mi:ss'),null,null,null,'公開','SP004','V000002',99,3,1,null,'便宜進口包包熱賣中','封鎖',null,null,null,null);--notice the max of SG_MAXNO is 99; 



------------09-INSERT--------------------
------------SG_MSG-----------------------
---------------------------------20181210
insert into SG_MSG values('MSG' || LPAD(SG_MSG_SEQ.nextval, 3, 0),'S002','M002','請問需要準備哪些裝備呢?');
insert into SG_MSG values('MSG' || LPAD(SG_MSG_SEQ.nextval, 3, 0),'S002','M003','安安你好');
insert into SG_MSG values('MSG' || LPAD(SG_MSG_SEQ.nextval, 3, 0),'S003','M003','how are you?');
insert into SG_MSG values('MSG' || LPAD(SG_MSG_SEQ.nextval, 3, 0),'S004','M002','peter1');
insert into SG_MSG values('MSG' || LPAD(SG_MSG_SEQ.nextval, 3, 0),'S005','M004','欠檢舉逆!?');

------------10-INSERT--------------------
------------SG_MEM-----------------------
---------------------------------20181210
--SG_MEM假資料建立(資料不足 需再補充)
insert into SG_MEM (SG_NO,MEM_NO) values ('S002','M002');
insert into SG_MEM (SG_NO,MEM_NO) values ('S002','M003');
insert into SG_MEM (SG_NO,MEM_NO,CH_STATUS) values ('S003','M002','已報到');
insert into SG_MEM (SG_NO,MEM_NO,CH_STATUS) values ('S003','M003','已報到');
insert into SG_MEM (SG_NO,MEM_NO,CH_STATUS) values ('S003','M004','已報到');
insert into SG_MEM (SG_NO,MEM_NO) values ('S004','M002');
insert into SG_MEM (SG_NO,MEM_NO) values ('S004','M003');
insert into SG_MEM (SG_NO,MEM_NO) values ('S005','M004');


------------11-INSERT--------------------
------------SG_REP-----------------------
---------------------------------20181210
insert into SG_REP values('REP' || LPAD(SG_REP_SEQ.nextval, 3, 0),'S005','M004','廣告推銷','欠檢舉啦',default);



------------12-INSERT--------------------
------------EVAOFMEM-----------------------
---------------------------------20181210


------------13-INSERT--------------------
------------SG_LIKE----------------------
---------------------------------20181210
insert into SG_LIKE values('S001','M002');
insert into SG_LIKE values('S001','M003');
insert into SG_LIKE values('S001','M004');
insert into SG_LIKE values('S002','M003');
insert into SG_LIKE values('S002','M004');
insert into SG_LIKE values('S003','M004');


------------14-INSERT--------------------
------------CLUB-------------------------
---------------------------------20181210
Insert into CLUB (CLUB_NO,SP_NO,PHOTO,PHOTO_EXT,CLUB_STATUS,CLUB_NAME,CLUB_INTRO) 
            values ('C'||LPAD(to_char(club_seq.NEXTVAL), 4, '0'),'SP006',NULL,NULL,'封鎖','跑跑跑向前跑','歡迎所有喜歡跑步的朋友一起加入跑跑跑向前跑，這邊將提供提供慢跑運動、運動飲食、體能訓練，並提供最新慢跑鞋介紹，歡迎大家一起來分享跑步與訓練心得。');
Insert into CLUB (CLUB_NO,SP_NO,PHOTO,PHOTO_EXT,CLUB_STATUS,CLUB_NAME,CLUB_INTRO)
            values ('C'||LPAD(to_char(club_seq.NEXTVAL), 4, '0'),'SP003',NULL,NULL,DEFAULT,'籃球組隊約戰','籃球，不要光用「看」的；更不要用「講」的。籃球，用「打」的才過癮！一起來「打」球吧！');
Insert into CLUB (CLUB_NO,SP_NO,PHOTO,PHOTO_EXT,CLUB_STATUS,CLUB_NAME,CLUB_INTRO)
            values ('C'||LPAD(to_char(club_seq.NEXTVAL), 4, '0'),'SP007',NULL,NULL,DEFAULT,'中央騎跡','大至國際的自行車盛事，小到YouBike的芝麻小事，讓我們從踩踏間找到生活的樂趣，中央騎跡要讓你成為全世界最幸福的車友！');
Insert into CLUB (CLUB_NO,SP_NO,PHOTO,PHOTO_EXT,CLUB_STATUS,CLUB_NAME,CLUB_INTRO)
            values ('C'||LPAD(to_char(club_seq.NEXTVAL), 4, '0'),'SP004',NULL,NULL,DEFAULT,'今晚打老虎','打爆你們這些嫩逼');
Insert into CLUB (CLUB_NO,SP_NO,PHOTO,PHOTO_EXT,CLUB_STATUS,CLUB_NAME,CLUB_INTRO)
            values ('C'||LPAD(to_char(club_seq.NEXTVAL), 4, '0'),'SP005',NULL,NULL,DEFAULT,'羽球俱樂部','不管你是新手、老手、High咖、悶騷咖，只要你是想打球的『羽球咖』，哩來，哩來，攏總來！技巧不重要，開心才重要，逗陣來打球，一起交朋友。 我們都很好相處哦，想打球的伙伴快加入我們吧！');
Insert into CLUB (CLUB_NO,SP_NO,PHOTO,PHOTO_EXT,CLUB_STATUS,CLUB_NAME,CLUB_INTRO)
            values ('C'||LPAD(to_char(club_seq.NEXTVAL), 4, '0'),'SP002',NULL,NULL,DEFAULT,'排球魂','排球の魂~初衷、熱血、團結、努力 ');
Insert into CLUB (CLUB_NO,SP_NO,PHOTO,PHOTO_EXT,CLUB_STATUS,CLUB_NAME,CLUB_INTRO)
            values ('C'||LPAD(to_char(club_seq.NEXTVAL), 4, '0'),'SP001',NULL,NULL,'封鎖','棒球樂園','歡迎來到棒球樂園 , 這裡希望能帶給大家歡樂 !');



------------15-INSERT--------------------
------------CLUB_MEMBERLIST--------------
---------------------------------20181210
Insert into CLUB_memberlist (CLUB_NO,MEM_NO,CMEM_STATUS,CMEM_CLASS) 
                    values('C0001','M003','待審核',DEFAULT);
Insert into CLUB_memberlist (CLUB_NO,MEM_NO,CMEM_STATUS,CMEM_CLASS,SILENCE_TIME) 
                    values ('C0002','M005','正常',DEFAULT,to_timestamp('2018-11-10 12:00:04','yyyy-mm-dd hh24:mi:ss'));
Insert into CLUB_memberlist (CLUB_NO,MEM_NO,CMEM_STATUS,CMEM_CLASS)
                    values ('C0003','M001','正常',DEFAULT);
Insert into CLUB_memberlist (CLUB_NO,MEM_NO,CMEM_STATUS,CMEM_CLASS)
                    values ('C0004','M002','正常',DEFAULT);
Insert into CLUB_memberlist (CLUB_NO,MEM_NO,CMEM_STATUS,CMEM_CLASS,SILENCE_TIME)
                    values ('C0005','M007','正常',DEFAULT,to_timestamp('2019-01-30 00:00:00','yyyy-mm-dd hh24:mi:ss'));
Insert into CLUB_memberlist (CLUB_NO,MEM_NO,CMEM_STATUS,CMEM_CLASS)
                    values ('C0006','M004','待審核','管理員');
Insert into CLUB_memberlist (CLUB_NO,MEM_NO,CMEM_STATUS,CMEM_CLASS)
                    values ('C0007','M006','正常','管理員');



------------16-INSERT--------------------
------------MUTIMEDIA--------------------
---------------------------------20181210



------------17-INSERT--------------------
------------POST_INFO--------------------
---------------------------------20181210
Insert into POST_INFO (POST_NO,CLUB_NO,MEM_NO,POST_TOPIC,POST_CONTENT,POST_DATE) 
                    values ('P'||LPAD(to_char(post_info_seq.NEXTVAL), 4, '0'),'C0001','M003','運動保健','運動後的護理保養


● 運動後的緩和收操~避免痠痛肌肉產生

激烈運動後不要馬上停止，要慢慢降低做一些有氧緩和的動作，至少要維持10分鐘以上，能夠將體內形成的乳酸再次合成並代謝掉。

全身性舒緩的有氧運動：緩跑健走、緩騎自行車
能夠讓心跳率慢慢緩降至正常情況，也能夠讓運痛受產生出的物質(例如乳酸)能夠代謝排出。

局部關節運動：頸部、腳踝、膝蓋
關節部分慢慢地做伸展環繞運動，因為運動時關節與肌腱承受相當的壓力，藉由運動後關節的舒緩活動能夠避免關節僵化並促進關節系統的代謝。

伸展拉筋運動：
肌肉的溫度依然溫熱的情形下進行是最佳的，緩慢地將肌肉拉長延展維持6~30秒一個循環，這項緩和運動是一個維持肌肉長度與彈性的關鍵，尤其是在做完超負荷的訓練時伸展就更為重要。



● 運動後營養補充：多補充電解質、鉀、鎂、蛋白質以及水分

運動的營養補充主要包括水份及電解質，過度疲勞或營養不夠的身體，不但容易發生急性運動傷害，也容易產生慢性運動傷害。

如果身體已經痠痛就要多休息、多喝水、多按摩。補充電解質、鉀、鎂，來維持肌肉功能正常。

補充蛋白質：魚、瘦肉、牛奶、蛋

運動後肌纖維內蛋白質的合成速率最快，有助肌肉生成、代謝及修復。所以運動後，可多吃富含蛋白質的食物。

補充鎂：
鎂能幫助醣類代謝，並負責維持心臟、肌肉及神經正常功能，運動後會大量出汗，補充鎂能夠幫助維持心臟功能；此外鎂能夠維持肌肉正常，提升運動表現，也能夠舒緩運動後的緊繃肌肉。

補充水分：
一解身體運動後的乾渴，幫助身體降低溫度，減少組織發炎的機會。

適度睡眠：
充足的睡眠時間與良好的睡眠品質，讓身體有最好的時間與最佳的效率來恢復運動造成的身體消耗。


● 運動後黃金保養

運動後的30分鐘是體內血液循環代謝率增高的時間，因此在此時有效的肌膚保養能夠增加吸收。',to_timestamp('2018-12-08 00:00:00','yyyy-mm-dd hh24:mi:ss'));

Insert into POST_INFO (POST_NO,CLUB_NO,MEM_NO,POST_TOPIC,POST_CONTENT,POST_DATE) 
                    values ('P'||LPAD(to_char(post_info_seq.NEXTVAL), 4, '0'),'C0002','M005','閒聊','怪力亂神？你不知道的球員迷信


1.Jordan每場比賽都會穿兩條球褲
在1982年帶領北卡奪得NCAA冠軍之後，Jordan認為當時所穿的球褲就是他的幸運物。因此在他帶領公牛隊建立六冠王朝期間，他每場比賽都會將北卡的球褲穿在公牛隊的球褲裏面。
為了同時穿上兩條球褲，Jordan必須穿上大一碼的球褲。但正因為這樣Jordan順道帶起了整個NBA都穿大球褲的潮流。


2.Caron Butler被聯盟禁止壞習慣
每個球星都有他獨特的習慣，例如Curry的咬牙套，詹皇開場前的撒白粉，但是我們很少聽見聯盟會指明禁止某個球星的習慣，而這樣的規定剛好出現在Caron Butler身上兩次。
在為巫師效力期間，Caron Butler會在賽前喝半瓶兩公升的汽水，並在中場休息時喝完另一半。聯盟認為喝兩公升的汽水對他的表現及健康絕對有壞影響，所以決定禁止他再狂喝下去。
而第二樣被禁止的習慣是嚼吸管，他最高紀錄可以一場嚼12支吸管。他的上癮程度甚至要妻子每天為他拿60支吸管。在板凳休息的時侯，他會把吸管切成一小段然後慢慢嚼，而這項行為在2010年正式被聯盟禁止。


3.Jason Terry會在比賽前穿對手的球褲睡覺
作為專業球員當然要在比賽前好好了解自己的對手，而Terry採取了另類的方法去了解敵人。他在比賽前的一晚會穿對手的球褲睡覺，雖然穿對手的球褲睡覺不算太特別，但最特別的是他要求球褲必須是對手在比賽中親身穿過的。Terry認為他需要和對手有一定的連結才能夠保持比賽上的專注。
至於他為什麼能夠收集這麼多球褲，就是因為他私下跟不少球隊的訓練師及球員有不錯的交情。當然他也有收集不到球褲的時候，例如2006年對上熱火的總冠軍戰，他連一件熱火的球褲也拿不到，這可能就是小牛失落冠軍的原因之一。


4.三巨頭年代的賽爾提克會在比賽前吃三明治
為了預防嘔吐，大部份球員都會避免在比賽前進食。但是三巨頭年代的KG偏偏反其道而行，在每場比賽開始前1個小時會吃至小一個花生果醬三明治。
這一個習慣後來更發展到全隊都會在比賽前開三明治派對，而Rondo也因此養成習慣，並延續至今。有些人更認為這就是KG能在比賽高度集中的秘密。



5.Hamilton會在比賽前洗澡
一般而言，大家都會在運動過後滿身大汗才會去洗澡。有趣的是Hamilton會在比賽前就洗澡，他解釋指洗澡會令他感覺潔凈並能更有效跟比賽節奏同步。雖然隊友們都會因為這個習慣而嘲笑他，但他認為這是他保持高水平表現的必要元素。
除了Hamilton以外，Rondo也是其中一個會在比賽前洗澡的人。跟Hamilton不同的是，Rondo會在比賽當天洗澡四次，所以大家別再說Rondo是一個「骯髒」的球員了！',to_timestamp('2018-12-15 18:36:57','yyyy-mm-dd hh24:mi:ss'));


------------18-INSERT--------------------
------------POST_LIKE--------------------
---------------------------------20181210
Insert into POST_LIKE(POST_NO,MEM_NO,LIKE_TYPE) values ('P0001','M001','讚');
Insert into POST_LIKE(POST_NO,MEM_NO,LIKE_TYPE) values ('P0002','M005','讚');



------------19-INSERT--------------------
------------RESPONES---------------------
---------------------------------20181210
Insert into RESPONES (RES_NO,POST_NO,MEM_NO,RES_CONTENT,RES_DATE)
                   values ('R'||LPAD(to_char(respones_seq.NEXTVAL), 4, '0'),'P0001','M003','讚讚der',to_timestamp('2018-12-08 14:45:32','yyyy-mm-dd hh24:mi:ss'));
Insert into RESPONES (RES_NO,POST_NO,MEM_NO,RES_CONTENT,RES_DATE)
                   values ('R'||LPAD(to_char(respones_seq.NEXTVAL), 4, '0'),'P0002','M005','黑人問號',to_timestamp('2018-12-15 22:45:32','yyyy-mm-dd hh24:mi:ss'));

------------20-INSERT--------------------
------------RESPONES_LIKE----------------
---------------------------------20181210
Insert into RESPONES_LIKE (RES_NO,MEM_NO) values ('R0001','M003');
Insert into RESPONES_LIKE (RES_NO,MEM_NO) values ('R0002','M005');



------------21-INSERT--------------------
------------ORD--------------------------
---------------------------------20181210
Insert into ORD (ORD_NO,
MEM_NO,
ORD_DATE,
ORD_DELDATE,
ORD_STATUS,
ORD_BACKDELDATE,
ORD_AMOUNT,
ORD_BACKAMOUNT
) values (
to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ORD_SEQ.NEXTVAL),6, '0'),
'M001',
CURRENT_TIMESTAMP,
CURRENT_TIMESTAMP,
'待出貨',
CURRENT_TIMESTAMP,
0000001,
0000001
);



------------22-INSERT--------------------
------------PRODUCTCLASS-----------------
---------------------------------20181210
Insert into PRODUCTCLASS (PRO_CLASSID,PRO_CLASSNAME) values ('PT'||LPAD(to_char(PRODUCTCLASS_SEQ.NEXTVAL), 3, '0'),'CLOTHING');
Insert into PRODUCTCLASS (PRO_CLASSID,PRO_CLASSNAME) values ('PT'||LPAD(to_char(PRODUCTCLASS_SEQ.NEXTVAL), 3, '0'),'SHOES');

------------23-INSERT--------------------
------------PRODUCT----------------------
---------------------------------20181210
Insert into PRODUCT (
PRO_NO,
PRO_CLASSID,
PRO_NAME,
PRO_PIC,
PRO_PIC_EXT,
PRO_FORMAT,
PRO_BONUS,
PRO_STOCK,
PRO_SAFESTOCK,
PRO_DETAILS,
PRO_SHELVE,
PRO_ALL_ASSESS,
PRO_ALL_ASSESSMAN
) values (
'PR'||LPAD(to_char(PRODUCT_SEQ.NEXTVAL), 3, '0'),
'PT001',
'Nikex',
NULL,
'PIC_EXT',
'9.5',
2000,
20,
5,
'DETAILS..........',
'上架中',
5,
10
);


------------24-INSERT--------------------
------------ORDDETAILS-------------------
---------------------------------20181210
Insert into ORDDETAILS(
ORD_NO,
PRO_NO,
ORD_PROBONUNS,
PRO_COUNT    
) values (
to_char(sysdate,'yyyymmdd')||'-000001',
'PR001',
3400,
5
);


------------25-INSERT--------------------
------------PRODUCTLIKE------------------
---------------------------------20181210



------------27-INSERT--------------------
------------PROMOTION--------------------
---------------------------------20181210
Insert into PROMOTION (PROM_PROJECT_ID,
PROM_PROJECT_NAME,
PROM_PROJECT_SDATE,
PROM_PROJECT_EDATE) values 
    ('PR'||LPAD(to_char(PROMOTION_SEQ.NEXTVAL), 3, '0'),
    '母親節優惠',
  --  to_timestamp('2019-01-30 00:00:00','yyyy-mm-dd hh24:mi:ss')
    to_timestamp('2019-05-2','YYYY-MM-DD'),
    to_timestamp('2019-05-12','YYYY-MM-DD')
);

Insert into PROMOTION (PROM_PROJECT_ID,
PROM_PROJECT_NAME,
PROM_PROJECT_SDATE,
PROM_PROJECT_EDATE) values 
    ('PR'||LPAD(to_char(PROMOTION_SEQ.NEXTVAL), 3, '0'),
    '聖誕節優惠',
    to_timestamp('2019-12-15','YYYY-MM-DD'),
    to_timestamp('2019-12-25','YYYY-MM-DD')
);


------------28-INSERT--------------------
------------PRO_DETAIL_PROMO-------------
---------------------------------20181210



------------29-INSERT--------------------
------------ADDRESS----------------------
---------------------------------20181210


------------30-INSERT--------------------
------------NEWSTYPE---------------------
---------------------------------20181210



------------31-INSERT--------------------
------------NEWS-------------------------
---------------------------------20181210



------------32-INSERT--------------------
------------EMP--------------------------
---------------------------------20181210




------------33-INSERT--------------------
------------COMPETITION------------------
---------------------------------20181210
commit;