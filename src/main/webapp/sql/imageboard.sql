-- [테이블] Oracle
CREATE TABLE imageboard
(
    seq          NUMBER PRIMARY KEY,
    imageId      VARCHAR2(20) NOT NULL, -- 상품코드
    imageName    VARCHAR2(40) NOT NULL, -- 상품명
    imagePrice   NUMBER NOT NULL,       -- 단가
    imageQty     NUMBER NOT NULL,       -- 개수
    imageContent VARCHAR2(4000) NOT NULL,
    image1       varchar2(200),
    logtime      DATE DEFAULT SYSDATE
);
create sequence seq_imageboard nocache nocycle;


-- [테이블] mysql
CREATE TABLE imageboard
(
    seq          integer PRIMARY KEY auto_increment,
    imageId      VARCHAR(20)   NOT NULL, -- 상품코드
    imageName    VARCHAR(40)   NOT NULL, -- 상품명
    imagePrice   int           NOT NULL, -- 단가
    imageQty     int           NOT NULL, -- 개수
    imageContent VARCHAR(4000) NOT NULL,
    image1       varchar(200),
    logtime      DATE DEFAULT (current_date) --날짜 만
);