use phone

--��Ա��

--ĳЩ����Ҫ������
--cardType varchar(20),							--���ﳵ����*
--grade int,									--�û��ȼ�*
--city varchar(20),								--���ڳ���*
--addresses varchar(100),						--�����ַ*
--postcode varchar(6),							--��������*
--orderId int unique,							--���ﳵID*

create table member (
	memberId int identity(1,1) primary key,						--��Ա���
	userName varchar(20),										--�û���
	trueName varchar(20),										--��ʵ����
	memberPwd varchar(20),										--����
	tel varchar(20),											--�绰
	email varchar(100),											--����
	memberType int default 0,									--�û�����
	amount money,												--�˻����
	freeze int default 0,										--����״̬
	constraint CK_member_freeze check(freeze in (0,1)),			--0:δ����		1:����
	constraint CK_member_memberType check(memberType in (0,1))	--0:��ͨ�û�	1:��Ա
)

--��Ʒ�������Ϣ��
create table superType(
	superId int identity(1,1) primary key,		--��Ʒ�������
	typeName varchar(50)						--��Ʒ���������
)



--��ƷС������Ϣ��
create table subType(
	subId int identity(1,1) primary key,		--��ƷС������
	typeName varchar(50),						--��ƷС��������
	superId int,								--��Ʒ�������(�������������)
	constraint FK_subType_superId foreign key(superId) references superType(superId)
)

--��Ʒ��Ϣ��
create table goods(
	goodsId int identity(1,1) primary key,		--��Ʒ���
	subId int,									--��ƷС������(�������������)
	goodsName varchar(200),						--��Ʒ����
	price smallmoney,							--ԭ�ۼ۸�
	nowPrice smallmoney,						--�ּ�
	picture varchar(100),						--ͼƬ
	InTime smalldatetime default(getdate()),	--����ʱ��
	newsGoods int default 0,					--�Ƿ���Ʒ
	sale int default 0,							--�Ƿ��ؼ�
	hit int default 0,							--�������
	constraint CK_goods_sale check(sale in (0,1)),
	constraint CK_goods_newsGoods check(newsGoods in (0,1)),
	constraint FK_goods_subType foreign key(subId) references subType(subId)
)

create table introduce(
	introduceId int identity(1,1) primary key,	--��Ʒ����ID
	goodsId int,								--��ƷID�����������
	memory int,									--�ڴ�
	brand varchar(30),							--Ʒ��
	color varchar(20),							--��ɫ
	distinguishability varchar(30),				--�ֱ���
	front_camera varchar(30),					--ǰ������ͷ
	back_camera varchar(30),					--��������ͷ
	cpu varchar(10),							--����
	rate varchar(30),							--Ƶ��
	systems varchar(10),						--ϵͳ
	heft varchar(20),							--����
	battery varchar(20),						--���
	thickness varchar(20),						--������
	caption varchar(100),						--��Ʒ����ͼ
	constraint FK_introduce_goodsId foreign key(goodsId) references goods(goodsId)
)

--introduce text,								--��Ʒ����
create table collect(
	collectId int identity(1,1) primary key,
	goodsId int,
	constraint FK_collect_goodsId foreign key(goodsId) references goods(goodsId)
)

create table comment(
	commentId int identity(1,1) primary key,
	goodsId int,
	memberId int,
	conTime datetime default(getdate()),
	content text,
	constraint FK_comment_goodsId foreign key(goodsId) references goods(goodsId),
	constraint FK_comment_memberId foreign key(memberId) references member(memberId)
)

--������Ϣ��
create table shopOrder(
	orderId int primary key,					--�������
	bnumber smallint,							--Ʒ������
	total smallmoney,							--�ܼ�
	receiveName varchar(15),					--�ռ���
	addresses varchar(100),						--�ռ���ַ
	tel varchar(20),							--��ϵ�绰
	orderDate datetime default(getdate()),	--��������
	remark varchar(200),						--��ע
	memberId int,								--��ԱID(�������������)
	constraint FK_shopOrder_memberId foreign key(memberID) references member(memberId)
)


--������Ϣ��ϸ��
create table detailOrder(
	detailOrderId int identity(1,1) primary key,	--��ϸ�������
	orderId int,									--�������(�������������)
	goodsId int,									--��Ʒ���(�������������)
	price smallmoney,								--�����۸�
	number int,										--��������
	total smallmoney								--�ܼ�
	constraint FK_detailOrder_orderId foreign key(orderId) references shopOrder(orderId),
	constraint FK_detailOrder_goodsId foreign key(goodsId) references goods(goodsId)
)



--����Ա��Ϣ��
create table manager(
	managerId int identity(1,1) primary key,		--����Ա���
	managerName varchar(30),						--����Ա����
	managerPwd varchar(30)							--����Ա���� 
)

ALTER TABLE member DROP COLUMN city 
ALTER TABLE member DROP COLUMN addresses
ALTER TABLE member DROP COLUMN postcode
ALTER TABLE member DROP COLUMN cardType
ALTER TABLE member DROP COLUMN grade
alter table shoporder alter column orderDate datetime
drop table superType
drop table subType
drop table member
drop table manager
drop table goods
drop table collect
drop table introduce
drop table comment
drop table shopOrder
drop table detailOrder