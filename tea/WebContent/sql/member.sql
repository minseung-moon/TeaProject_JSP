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