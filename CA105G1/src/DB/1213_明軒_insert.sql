--------------------------------------------------------
--  INSERT
--------------------------------------------------------

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

Insert into REGION values (320, '桃園市', '中壢區');
Insert into REGION values (324, '桃園市', '平鎮區');
Insert into REGION values (325, '桃園市', '龍潭區');
Insert into REGION values (326, '桃園市', '楊梅區');
Insert into REGION values (327, '桃園市', '新屋區');
Insert into REGION values (328, '桃園市', '觀音區');
Insert into REGION values (330, '桃園市', '桃園區');
Insert into REGION values (333, '桃園市', '龜山區');
Insert into REGION values (334, '桃園市', '八德區');
Insert into REGION values (335, '桃園市', '大溪區');
Insert into REGION values (336, '桃園市', '復興區');
Insert into REGION values (337, '桃園市', '大園區');
Insert into REGION values (338, '桃園市', '蘆竹區');


----------------------------------------------------------
----  for Table VENUE
----------------------------------------------------------

Insert into VENUE values('V000001', '中央大學附屬中壢高中自強館', 'VT001', 320, 24.9625795754056, 121.211014509136, 'https://az804957.vo.msecnd.net/photogym/20140605155519_自強館1.JPG', '桃園市中壢區三光路115號', '03-4932181#34', '付費開放使用', '籃球場,羽球場(館),桌球場(館)');
Insert into VENUE values('V000002', '中央大學附屬中壢高中籃球場', 'VT001', 320, 24.9638709920322, 121.210166931414, 'https://az804957.vo.msecnd.net/photogym/20140610141357_籃球場1.JPG', '桃園市中壢區三光路115號', '03-4932181#34', '免費開放使用', '籃球場');
Insert into VENUE values('V000003', '中央大學依仁堂', 'VT001', 320, 24.9682993807963, 121.190807819366, 'https://az804957.vo.msecnd.net/photogym/20140710103425_依仁堂全景.JPG', '桃園市中壢區中大路300號', '03-4267128', '付費開放使用', '籃球館,排球館,韻律教室,技擊教室,體適能健身教室');
Insert into VENUE values('V000004', '中央大學籃球場', 'VT001', 320, 24.9697339773255, 121.189337968826, 'https://az804957.vo.msecnd.net/photogym/20140711153257_籃球場全景.JPG', '桃園市中壢區中大路300號', '03-4227151#57251', '免費開放使用', '籃球場');

----------------------------------------------------------
----  for Table V_EVALUATION
----------------------------------------------------------
    
Insert into V_EVALUATION values ('M001', 'V000001', 3);
Insert into V_EVALUATION values ('M002', 'V000002', 2);
Insert into V_EVALUATION values ('M003', 'V000003', 1);
Insert into V_EVALUATION values ('M004', 'V000004', 5);


commit;