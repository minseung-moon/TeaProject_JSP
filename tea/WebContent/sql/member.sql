create table teaUser(
	userId varchar2(10) not null primary key,
	userPw varchar2(15) not null,
	userName varchar2(10) not null,
	userPhone varchar2(13) not null,
	userAddr varchar2(50) not null,
	userGrade varchar2(1) default 'c' not null,
	userState varchar2(1) default '1' not null
);
-- ���, admin(R), vip()
--ȸ�� ���(���� r)
--s vip
--a �ֿ��ȸ��
--b ���ȸ��
--c �Ϲ�
--
--state(o, x)
--1 : Ȱ��ȭ
--0 : ��Ȱ��ȭ

create table teaCommunity(
	userId varchar2(10) not null primary key,
	title varchar2(100) not null,
	content CLOB
	make_date timestamp default systimestamp,
);
select to_char(make_date, 'yyyymmdd'), content from a;
create table a(
	make_date timestamp default systimestamp,
	content CLOB
);

---------------------------------------
https://jmoon.co.kr/151?category=722204
create user board identified by 1234;
grant connect, resource, dba to board;

create table board(
	idx number not null primary key,
	title varchar2(200) not null,
	writer varchar2(20) not null,
	regdate varchar2(20) not null,
	count varchar(20)  not null,
	content clob  not null
);

create sequence board_seq;