--------------------------------------------------------
--  建立表格
--------------------------------------------------------
alter session set deferred_segment_creation=false;

--------------------------------------------------------
--  for Table VENUEYPE
--共有籃球、排球、網球、棒球、羽球
--------------------------------------------------------

Insert into VENUETYPE (VT_NO, VT_NAME) values ('VT'||LPAD(to_char(VENUETYPE_SEQ.NEXTVAL), 3, '0'), '籃球場');
Insert into VENUETYPE (VT_NO, VT_NAME) values ('VT'||LPAD(to_char(VENUETYPE_SEQ.NEXTVAL), 3, '0'), '排球場');
Insert into VENUETYPE (VT_NO, VT_NAME) values ('VT'||LPAD(to_char(VENUETYPE_SEQ.NEXTVAL), 3, '0'), '網球場');
Insert into VENUETYPE (VT_NO, VT_NAME) values ('VT'||LPAD(to_char(VENUETYPE_SEQ.NEXTVAL), 3, '0'), '棒球場');
Insert into VENUETYPE (VT_NO, VT_NAME) values ('VT'||LPAD(to_char(VENUETYPE_SEQ.NEXTVAL), 3, '0'), '羽球場');

--------------------------------------------------------
--  for Table REGION
--------------------------------------------------------

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



----------------------------------------------------------
----  for Table VENUE
----------------------------------------------------------
CREATE TABLE VENUE (
    V_NO        VARCHAR2(7)  PRIMARY KEY, 
    V_NAME      VARCHAR2(60) NOT NULL,
    VT_NO       VARCHAR2(7),
    REG_NO      NUMBER(5),
    V_LAT       DECIMAL(8,6),
    V_LONG      DECIMAL(9,6),
    FUNC      VARCHAR2(200),
    V_ADDRESS   VARCHAR2(120),
    V_PHONENO   NUMBER(10),
    V_STATUS    VARCHAR2(15),
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

--Insert into VENUE values
--('V'||LPAD(to_char(VENUE_SEQ.NEXTVAL), 6, '0'),'中央大學籃球場','VT00002',320,24.9697339773255,121.189337968826,'http://www.ncu.edu.tw','1234567','桃園市中壢區中大路300號',03-4227151,'開放中');


----------------------------------------------------------
----  for Table V_EVALUATION
----------------------------------------------------------



commit;