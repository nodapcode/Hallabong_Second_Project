DELETE FROM admin;
INSERT INTO admin (id, pw) VALUES ('smile', '12345');

DELETE FROM noti;
Insert into SYSTEM.NOTI (NO,TIT,CONT,REG_TM) values ('NOTI2023050522282536','�������� ���� ���ظ� �����ϱ� ���� ��й�ȣ�� ���������� �������ּ���','�ȳ��ϼ���.
�ֱ� ��к������ ���̵� ����� �����ؼ� �̿��ںе��� ����� ������ �κп� ���� ������ ���� �����帳�ϴ�.

�ǽ� ����Ʈ �Ǵ� �Ǽ��ڵ忡 ������ �ܸ��� ���� ���� ���̵�, ��й�ȣ�� ����ǰų� ������ ���� �Ϻ� ����Ʈ���� ����Ǵ� ��� ������ ������ ������ �ٸ� ����Ʈ������ ���޾� ���ذ� �߻��� �� �ֽ��ϴ�.
���� ���� ���� ���� ���ظ� �����ϱ� ���� �ϳ��� ���̵�� ���� ����Ʈ�� �̿��Ͻô� ��� ��й�ȣ�� �����ϰ�, �����ϴٸ� �� ����Ʈ���� �ٸ� ��й�ȣ�� ����� ���� �ǰ��ϰ� �ֽ��ϴ�.  

�̿��� �������� �Ƚ��ϰ� ���񽺸� �̿��Ͻ� �� �ֵ��� ����ؿ��� �ֽ��ϴ�. �����ε� �̿��� �������� ��ȣ�� �ּ��� ���ϰڽ��ϴ�.

�����մϴ�.',to_timestamp('23/05/05 22:28:25.368000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SYSTEM.NOTI (NO,TIT,CONT,REG_TM) values ('NOTI2023050522333796','[����] �ҹ� ���� �Ǿ�ǰ �Һ��� ����','�ȳ��ϼ���.
�����ϰ� ������ �¶��� ���� ȯ�� ������ ���� ���� ���ɿ� ���˵Ǵ� ��ǰ�� �Ǹ��ϴ� ������ �����ϰ� �ֽ��ϴ�.
 
Ư�� �Ǿ�ǰ�� ���, �౹ ������(�ش� �౹�� �ٹ��ϴ� ��� �Ǵ� �Ѿ�縦 ����)�� �ƴϸ� �Ǹ��� �� ������ �౹ �Ǵ� ���� ���� �̿��� ��ҿ����� �Ǹ��� �� �����ϴ�.
 
���� ���� ���ɿ� ���� 2022�� 7�� 21�Ϻ��ʹ� �����Ǿ�ǰ�� �ҹ����� ������ �ڿ��Ե� �ִ� 100������ ���·ᰡ �ΰ��� �� �ֽ��ϴ�.
* �ٰ� ���� : ���� ��44��, ��47����4, ��50��',to_timestamp('23/05/05 22:33:37.966000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SYSTEM.NOTI (NO,TIT,CONT,REG_TM) values ('NOTI2023050522343432','[����] �����������! ���̽� ���ǹٶ��ϴ�!!','�ֱ� �ؿܰ��� ���� �Һ��ں�ȣ���� �� ���ر������� ���� ��Ī�ϴ� ���̽� ��ʰ� �����ϰ� �ֽ��ϴ�.
�ǽɽ����� SMS �� ����� ��ȣ�� ��ȭ �����ϰų� ���ͳ��ּ�(URL) ���� Ŭ������ �ʵ��� �����Ͽ� �ֽð�, ���� �߻��� �Ʒ� �Ű�������� ��� �Ű��Ͻñ� �ٶ��ϴ�.',to_timestamp('23/05/05 22:34:34.328000000','RR/MM/DD HH24:MI:SSXFF'));

DELETE FROM cat;
INSERT INTO cat (no, name) VALUES ('1', 'ä��');
INSERT INTO cat (no, name) VALUES ('2', '����');
INSERT INTO cat (no, name) VALUES ('3', '����');
INSERT INTO cat (no, name) VALUES ('4', '�ػ깰');

DELETE FROM prod;
Insert into SYSTEM.PROD (NO,FS,NAME,COST,SP,S_IMG,L_IMG,CAT_NO,REG_TM) values ('PROD2023050314575378','Y','���� ���� ���� 900g (5~6��)',9900,11400,'1683094315522.png','1683094315523.png','2',to_timestamp('23/05/03 14:57:53.782000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SYSTEM.PROD (NO,FS,NAME,COST,SP,S_IMG,L_IMG,CAT_NO,REG_TM) values ('PROD2023050315264769','Y','���� ���纣�� 100g (Ư)',7181,7900,'1683095207661.png','1683095207662.png','2',to_timestamp('23/05/03 15:26:47.690000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SYSTEM.PROD (NO,FS,NAME,COST,SP,S_IMG,L_IMG,CAT_NO,REG_TM) values ('PROD2023050314493258','Y','[KF365] DOLE �Ǽ� �ٳ��� 1kg (�ʸ���)',3536,3890,'1683094914121.png','1683094914122.png','2',to_timestamp('23/05/03 14:49:32.584000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SYSTEM.PROD (NO,FS,NAME,COST,SP,S_IMG,L_IMG,CAT_NO,REG_TM) values ('PROD2023050316062740','Y','[MPARK] ������ ���絵 ������ 1.2kg (�ߴ��/5��)',8900,7900,'1683097587384.png','1683097587386.png','2',to_timestamp('23/05/03 16:06:27.404000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SYSTEM.PROD (NO,FS,NAME,COST,SP,S_IMG,L_IMG,CAT_NO,REG_TM) values ('PROD2023050520063934','Y','���� ���� 1kg',5000,5500,'1683284799338.png','1683284799341.png','1',to_timestamp('23/05/05 20:06:39.348000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SYSTEM.PROD (NO,FS,NAME,COST,SP,S_IMG,L_IMG,CAT_NO,REG_TM) values ('PROD2023050520092124','Y','[KF]365 �ٴٱ���� 3',3173,3490,'1683285736705.png','1683284961247.png','1',to_timestamp('23/05/05 20:09:21.249000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SYSTEM.PROD (NO,FS,NAME,COST,SP,S_IMG,L_IMG,CAT_NO,REG_TM) values ('PROD2023050522132908','Y','���� 1.5kg',4263,4690,'1683292434997.png','1683292471431.png','1',to_timestamp('23/05/05 22:13:29.086000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SYSTEM.PROD (NO,FS,NAME,COST,SP,S_IMG,L_IMG,CAT_NO,REG_TM) values ('PROD2023050522190597','Y','����� 500g',2718,2990,'1683292745966.png','1683292745975.png','1',to_timestamp('23/05/05 22:19:05.976000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SYSTEM.PROD (NO,FS,NAME,COST,SP,S_IMG,L_IMG,CAT_NO,REG_TM) values ('PROD2023050314284911','Y','[KF365] �������� ���絵��� 1.5kg (5~6��)',11730,12900,'1683094512372.png','1683094512373.png','2',to_timestamp('23/05/03 14:28:49.110000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SYSTEM.PROD (NO,FS,NAME,COST,SP,S_IMG,L_IMG,CAT_NO,REG_TM) values ('PROD2023050514170987','Y','[KF365] ���� 1kg',5900,6490,'1683264940886.png','1683264940889.png','1',to_timestamp('23/05/05 14:17:09.871000000','RR/MM/DD HH24:MI:SSXFF'));

COMMIT;