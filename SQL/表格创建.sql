use phone

--会员表

--某些不需要的属性
--cardType varchar(20),							--购物车类型*
--grade int,									--用户等级*
--city varchar(20),								--所在城市*
--addresses varchar(100),						--具体地址*
--postcode varchar(6),							--邮政编码*
--orderId int unique,							--购物车ID*

create table member (
	memberId int identity(1,1) primary key,						--会员编号
	userName varchar(20),										--用户名
	trueName varchar(20),										--真实姓名
	memberPwd varchar(20),										--密码
	tel varchar(20),											--电话
	email varchar(100),											--邮箱
	memberType int default 0,									--用户类型
	amount money,												--账户金额
	freeze int default 0,										--冻结状态
	constraint CK_member_freeze check(freeze in (0,1)),			--0:未冻结		1:冻结
	constraint CK_member_memberType check(memberType in (0,1))	--0:普通用户	1:会员
)

--商品大分类信息表
create table superType(
	superId int identity(1,1) primary key,		--商品大分类编号
	typeName varchar(50)						--商品大分类名称
)



--商品小分类信息表
create table subType(
	subId int identity(1,1) primary key,		--商品小分类编号
	typeName varchar(50),						--商品小分类名称
	superId int,								--商品大分类编号(用于主外键连接)
	constraint FK_subType_superId foreign key(superId) references superType(superId)
)

--商品信息表
create table goods(
	goodsId int identity(1,1) primary key,		--商品编号
	subId int,									--商品小分类编号(用于主外键连接)
	goodsName varchar(200),						--商品名称
	price smallmoney,							--原价价格
	nowPrice smallmoney,						--现价
	picture varchar(100),						--图片
	InTime smalldatetime default(getdate()),	--进货时间
	newsGoods int default 0,					--是否新品
	sale int default 0,							--是否特价
	hit int default 0,							--点击次数
	constraint CK_goods_sale check(sale in (0,1)),
	constraint CK_goods_newsGoods check(newsGoods in (0,1)),
	constraint FK_goods_subType foreign key(subId) references subType(subId)
)

create table introduce(
	introduceId int identity(1,1) primary key,	--商品详情ID
	goodsId int,								--商品ID用于外键连接
	memory int,									--内存
	brand varchar(30),							--品牌
	color varchar(20),							--颜色
	distinguishability varchar(30),				--分辨率
	front_camera varchar(30),					--前置摄像头
	back_camera varchar(30),					--后置摄像头
	cpu varchar(10),							--核数
	rate varchar(30),							--频率
	systems varchar(10),						--系统
	heft varchar(20),							--重量
	battery varchar(20),						--电池
	thickness varchar(20),						--机身厚度
	caption varchar(100),						--商品介绍图
	constraint FK_introduce_goodsId foreign key(goodsId) references goods(goodsId)
)

--introduce text,								--商品介绍
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

--订单信息表
create table shopOrder(
	orderId int primary key,					--订单编号
	bnumber smallint,							--品种数量
	total smallmoney,							--总计
	receiveName varchar(15),					--收件人
	addresses varchar(100),						--收件地址
	tel varchar(20),							--联系电话
	orderDate datetime default(getdate()),	--订单日期
	remark varchar(200),						--备注
	memberId int,								--会员ID(用于主外键连接)
	constraint FK_shopOrder_memberId foreign key(memberID) references member(memberId)
)


--订单信息明细表
create table detailOrder(
	detailOrderId int identity(1,1) primary key,	--详细订单编号
	orderId int,									--订单编号(用于主外键连接)
	goodsId int,									--商品编号(用于主外键连接)
	price smallmoney,								--订单价格
	number int,										--订单数量
	total smallmoney								--总计
	constraint FK_detailOrder_orderId foreign key(orderId) references shopOrder(orderId),
	constraint FK_detailOrder_goodsId foreign key(goodsId) references goods(goodsId)
)



--管理员信息表
create table manager(
	managerId int identity(1,1) primary key,		--管理员编号
	managerName varchar(30),						--管理员名称
	managerPwd varchar(30)							--管理员密码 
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