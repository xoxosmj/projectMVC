-- [테이블] Oracle
CREATE TABLE board
(
    seq     NUMBER           NOT NULL, -- 글번호 (시퀀스 객체 이용)
    id      VARCHAR2(20) NOT NULL,     -- 아이디
    name    VARCHAR2(40) NOT NULL,     -- 이름
    email   VARCHAR2(40),              -- 이메일
    subject VARCHAR2(255) NOT NULL,    -- 제목
    content VARCHAR2(4000) NOT NULL,   -- 내용

    ref     NUMBER           NOT NULL, -- 그룹번호
    lev     NUMBER DEFAULT 0 NOT NULL, -- 단계
    step    NUMBER DEFAULT 0 NOT NULL, -- 글순서
    pseq    NUMBER DEFAULT 0 NOT NULL, -- 원글번호
    reply   NUMBER DEFAULT 0 NOT NULL, -- 답변수

    hit     NUMBER DEFAULT 0,          -- 조회수
    logtime DATE   DEFAULT SYSDATE
);
CREATE SEQUENCE seq_board NOCACHE NOCYCLE;


-- [테이블] MySQL
CREATE TABLE board
(
    seq     integer primary key auto_increment, -- 글번호 (mysql은 시퀀스객체가없음)
    id      VARCHAR(20)        NOT NULL,        -- 아이디
    name    VARCHAR(40)        NOT NULL,        -- 이름
    email   VARCHAR(40),                        -- 이메일
    subject VARCHAR(255)       NOT NULL,        -- 제목
    content VARCHAR(4000)      NOT NULL,        -- 내용

    ref     integer,                            -- 그룹번호
    lev     integer  DEFAULT 0 NOT NULL,        -- 단계
    step    integer  DEFAULT 0 NOT NULL,        -- 글순서
    pseq    integer  DEFAULT 0 NOT NULL,        -- 원글번호
    reply   integer  DEFAULT 0 NOT NULL,        -- 답변수

    hit     integer  DEFAULT 0,                 -- 조회수
    logtime DATETIME DEFAULT NOW()              --날짜와 시간, current_timestamp
);





