INSERT INTO MYMEMBER (SEQ, MYID, PWD, EMAIL, MYNAME, PHONENUM, MYMANAGER)
VALUES(SEQ_MYMEMBER.NEXTVAL, 'admin', 'admin', 'admin@GSYJ.com', '관리자', '01012345678', 1);

DELETE FROM MYMEMBER;

SELECT * FROM MYMEMBER;

SELECT * FROM BBS;
SELECT COUNT(*) FROM BBS WHERE DEL = 0 

SELECT COUNT(*) FROM BBS 
WHERE MYID = 'gd' AND DEL = 0

SELECT COUNT(*) FROM BBS 
WHERE DEL = 0 AND TITLE LIKE '%""%'


SELECT SEQ, MYID, TITLE, MYCONTENT, WDATE, FILENAME, VCOUNT
FROM BBS 
ORDER BY SEQ DESC ;

DROP TABLE BBS 
CASCADE CONSTRAINT;

DROP TABLE RESCUEDDOG
CASCADE CONSTRAINTS;

SELECT SEQ, MYID, TITLE, MYCONTENT, WDATE, FILENAME, VCOUNT, DEL 
 FROM BBS 
WHERE DEL != 1
ORDER BY SEQ DESC;

DELETE 

--유저 정보
CREATE TABLE MYMEMBER 
(
SEQ NUMBER NOT NULL,             --시퀀스
MYID VARCHAR2(50) PRIMARY KEY,   --아이디
PWD VARCHAR2(50) NOT NULL,       --패스워드
EMAIL VARCHAR2(100) NOT NULL,    --패스워드
MYNAME VARCHAR2(50) NOT NULL,    --이름
PHONENUM VARCHAR2(100) NOT NULL, --연락처
MYMANAGER NUMBER NOT NULL        --관리자인지 여부 확인
);




--관리자 애완동물 제보 확인용 
CREATE TABLE ABANDONEDDOG
(
SEQ NUMBER NOT NULL,                --시퀀스
MYID VARCHAR2(50) NOT NULL,         --아이디(FK)
PHONENUM NUMBER NOT NULL,           --연락처
ADDR VARCHAR2(200) NOT NULL,        --주소
MYCONTENT VARCHAR2(500),            --내용
FILENAME VARCHAR2(100) PRIMARY KEY, --동물이미지
DAN NUMBER NOT NULL,                --위험 정도(1-3)
WDATE DATE NOT NULL                 --등록일
);





-- 관리자가 쓰고 회원이 보는 분양신청 TABLE  
CREATE TABLE RESCUEDDOG
(
SEQ NUMBER NOT NULL,               --시퀀스
WDATE DATE NOT NULL,               --작성일
VCOUNT NUMBER NOT NULL,            --조회수
TITLE VARCHAR2(50) NOT NULL,       --제목
MYCONTENT VARCHAR2(500) NOT NULL,  --내용
FILENAME VARCHAR2(100) NOT NULL,   --앞에서 받아온 파일 이름(FK)  
NEWFILENAME VARCHAR2(100) NOT NULL --새로 업로드한 파일 이름

);




-- 회원이 작성하는 분양신청 폼 (관리자가 본다) 
CREATE TABLE ADOPTDOG
(
SEQ NUMBER NOT NULL,         --시퀀스
MYID VARCHAR2(50) NOT NULL,  --아이디(FK)
WDATE DATE NOT NULL,         --작성일
RDATE VARCHAR2(100) NOT NULL,--분양가능일
MYCONTENT VARCHAR2(500)      --내용
);




--커뮤니티 
CREATE TABLE BBS
(
SEQ NUMBER NOT NULL,              --시퀀스
MYID VARCHAR2(50) NOT NULL,       --아이디(FK)
TITLE VARCHAR2(50) NOT NULL,      --제목
MYCONTENT VARCHAR2(500) NOT NULL, --내용
WDATE DATE NOT NULL,              --작성일
FILENAME VARCHAR2(100) NOT NULL,  --파일네임
VCOUNT NUMBER NOT NULL            --조회수
);

ALTER TABLE BBS
ADD 
DEL NUMBER NOT NULL;


-- 댓글
CREATE TABLE MYCOMMENT(
SEQ NUMBER NOT NULL,            --시퀀스
COMMENTID VARCHAR2(50) NOT NULL,--댓글 다는 사람의 아이디(FK)
WDATE DATE NOT NULL,            --댓글쓰는 날짜
CONTENT VARCHAR2(500) NOT NULL, --댓글 내용
REF NUMBER NOT NULL             --정렬용 (부모글작성자의 seq)
);






-- 후기 
CREATE TABLE AFTERSTORY 
(
SEQ NUMBER NOT NULL,              --시퀀스
MYID VARCHAR2(50) NOT NULL,       --아이디(FK)
TITLE VARCHAR2(50) NOT NULL,      --제목
MYCONTENT VARCHAR2(500) NOT NULL, --내용
WDATE DATE NOT NULL,              --작성일
FILENAME VARCHAR2(100) NOT NULL,  --파일네임
VCOUNT NUMBER NOT NULL            --조회수
);



--멤버 시퀀스
CREATE SEQUENCE SEQ_MYMEMBER
START WITH 1
INCREMENT BY 1; 

--인펫 시퀀스
CREATE SEQUENCE SEQ_ABANDONEDDOG
START WITH 1
INCREMENT BY 1; 

--아웃펫 시퀀스
CREATE SEQUENCE SEQ_RESCUEDDOG
START WITH 1
INCREMENT BY 1;


--WRITE PET
CREATE SEQUENCE SEQ_ADOPTDOG
START WITH 1
INCREMENT BY 1; 


--마이펫 시퀀스
CREATE SEQUENCE SEQ_BBS
START WITH 1
INCREMENT BY 1; 

--COMTPET
CREATE SEQUENCE SEQ_MYCOMMENT
START WITH 1
INCREMENT BY 1; 


--에프터(후기) 시퀀스
CREATE SEQUENCE SEQ_AFTERSTORY 
START WITH 1
INCREMENT BY 1; 


--외래키 연결 
ALTER TABLE ABANDONEDDOG
ADD
CONSTRAINT FK_INPET_ID FOREIGN KEY(MYID)
REFERENCES MYMEMBER(MYID);

ALTER TABLE RESCUEDDOG
ADD
CONSTRAINT FK_WRITE_ID FOREIGN KEY(FILENAME)
REFERENCES ABANDONEDDOG(FILENAME);

ALTER TABLE ADOPTDOG
ADD
CONSTRAINT FK_OUTPET_ID FOREIGN KEY(MYID)
REFERENCES MYMEMBER(MYID);

ALTER TABLE BBS
ADD
CONSTRAINT FK_MYPET_ID FOREIGN KEY(MYID)
REFERENCES MYMEMBER(MYID);


ALTER TABLE AFTERSTORY 
ADD
CONSTRAINT FK_AFPET_ID FOREIGN KEY(MYID)
REFERENCES MYMEMBER(MYID);


ALTER TABLE MYCOMMENT
ADD
CONSTRAINT FK_COM_ID FOREIGN KEY(COMMENTID)
REFERENCES MYMEMBER(MYID);

SELECT * FROM MYMEMBER;