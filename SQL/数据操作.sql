use Shop

--会员表

insert into member(userName,trueName,memberPwd,amount,tel,email) values('actionNow','张三','123456',100 ,'12345678900','sdcet@163.com');
insert into member(userName,trueName,memberPwd,amount,tel,email) values('abc','李四','123456',100 ,'12345678900','sdcet@163.com');
insert into member(userName,trueName,memberPwd,amount,tel,email) values('dfg','搜索','123456',100 ,'12345678900','sdcet@163.com');
insert into member(userName,trueName,memberPwd,amount,tel,email) values('llll','生的伟大','123456',100 ,'12345678900','sdcet@163.com');
select count(*) from member where userName='jihuaijia'
update member set memberPwd = '147258' where memberId = 1
select memberId,userName,trueName,memberPwd,Amount,tel,email,freeze from member where memberId = 1
select memberId,userName,trueName,memberPwd,Amount,tel,email,freeze from member where userName = 'jihuaijia' AND memberPwd = '123456'
update member set userName = 'abcdef',trueName = '球粒',memberPwd = '147258',Amount = 100,tel = '15236984758',email = 'jihuaijia@163.com',freeze = 1 where memberId = 1
delete from member where memberId = 1
select COUNT(*) from member where userName = 'abcdef'
--商品大分类信息表
set identity_insert superType OFF	--关闭
insert into superType(typeName) values('华为')
insert into superType(typeName) values('苹果')
insert into superType(typeName) values('OPPO')
insert into superType(typeName) values('三星')
insert into superType(typeName) values('小米')

select superId,typeName from superType
delete from subType where subId in (11,12,13);
update superType set typeName=, where superId = 
--商品小分类信息表
select subId,superId,typeName from subType
insert into subType(typeName,superId) values('P系列',1)
insert into subType(typeName,superId) values('Mate系列',1)
insert into subType(typeName,superId) values('麦芒系列',1)

insert into subType(typeName,superId) values('Reno系列',3)
insert into subType(typeName,superId) values('Find X系列',3)
insert into subType(typeName,superId) values('R系列',3)
insert into subType(typeName,superId) values('A系列',3)

insert into subType(typeName,superId) values('S系列',4)
insert into subType(typeName,superId) values('A系列',4)
insert into subType(typeName,superId) values('Note系列',4)

insert into subType(typeName,superId) values('iPhone',2)

insert into subType(typeName,superId) values('小米',5)

select subId,typeName,superId from subType where superId = 1
update subType set subId = 9 where typeName='童装'
delete from subType where subId = 1000
update subType set typeName=,superId= where subId =

--商品信息表

--华为

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(3,'华为麦芒',2500,2500,'images/goods/H-maimang.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(3,'华为麦芒',2500,2100,'images/goods/H-maimang.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(2,'华为Mate20',3499,3499,'images/goods/H-Mate20.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(2,'华为Mate20',3499,3300,'images/goods/H-Mate20.jpg',1,0)

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(2,'华为Mate20Pro',5499,5499,'images/goods/H-Mate20pro.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(2,'华为Mate20Pro',5499,5400,'images/goods/H-Mate20pro.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(2,'华为Mate20X',4499,4499,'images/goods/H-Mate20X.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(2,'华为Mate20X',4499,4400,'images/goods/H-Mate20X.jpg',1,0)

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(3,'华为nova',1999,1999,'images/goods/H-nova.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(3,'华为nova',1999,1900,'images/goods/H-nova.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(3,'华为nova3i',1899,1899,'images/goods/H-nova3i.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(3,'华为nova3i',1899,1700,'images/goods/H-nova3i.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(1,'华为P20',3088,3088,'images/goods/H-P20.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(1,'华为P20',3088,3000,'images/goods/H-P20.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(1,'华为P30',4288,4288,'images/goods/H-P30.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(1,'华为P30',4288,4000,'images/goods/H-P30.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(1,'华为P30pro',5488,5488,'images/goods/H-P30Pro.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(1,'华为P30Pro',5488,5400,'images/goods/H-P30Pro.jpg',1,0)



--iphone
insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(11,'iPhone XS',8399,8399,'images/goods/p-1.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(11,'iPhone XS',8399,8300,'images/goods/p-1.jpg',1,0)

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(11,'iPhone XR',5499,5499,'images/goods/p-2.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(11,'iPhone XR',5499,5400,'images/goods/p-2.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(11,'iPhone X',5999,5999,'images/goods/p-3.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(11,'iPhone X',5999,5999,'images/goods/p-3.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(11,'iPhone 8 Plus',4699,4699,'images/goods/p-4.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(11,'iPhone 8 Plus',4699,4400,'images/goods/p-4.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(11,'iPhone 7 Plus',4199,4199,'images/goods/p-5.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(11,'iPhone 7 Plus',4199,3999,'images/goods/p-5.jpg',1,0)





--oppo

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(4,'OPPO Reno',3999,3999,'images/goods/O-Reno.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(4,'OPPO Reno',3999,3888,'images/goods/O-Reno.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(5,'OPPO Find X',5499,5499,'images/goods/O-FindX.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(5,'OPPO Find X',5499,5000,'images/goods/O-FindX.jpg',1,0)

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(5,'【兰博基尼版】OPPO Find X',9998,9998,'images/goods/O-FindXlanbo.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(5,'【兰博基尼版】OPPO Find X',9998,9990,'images/goods/O-FindXlanbo.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(6,'OPPO R17 Pro',2899,2899,'images/goods/O-R17Pro.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(6,'OPPO R17 Pro',2899,2800,'images/goods/O-R17Pro.jpg',1,0)

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(6,'OPPO R15',2299,2299,'images/goods/O-R15.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(6,'OPPO R15',2299,2000,'images/goods/O-R15.jpg',1,0)

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(6,'OPPO R17',2699,2699,'images/goods/O-R17.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(6,'OPPO R17',2699,2500,'images/goods/O-R17.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(7,'OPPO A7x',1599,1599,'images/goods/O-A7x.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(7,'OPPO A7x',1599,1500,'images/goods/O-A7x.jpg',1,0)

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(7,'OPPO A7',1499,1499,'images/goods/O-A7.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(7,'OPPO A7',1499,1400,'images/goods/O-A7.jpg',1,0)



--三星

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(8,'Galaxy S10',5999,5999,'images/goods/S-S10.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(8,'Galaxy S10',5999,5998,'images/goods/S-S10.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(8,'Galaxy S9',4498,4498,'images/goods/S-S9.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(8,'Galaxy S9',4498,4400,'images/goods/S-S9.jpg',1,0)

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(8,'Galaxy S10e',4999,4999,'images/goods/S-S10e.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(8,'Galaxy S10e',4999,4400,'images/goods/S-S10e.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(9,'Galaxy A8s',2798,2798,'images/goods/S-A8s.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(9,'Galaxy A8s',2798,2700,'images/goods/S-A8s.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(9,'Galaxy A6s',1499,1499,'images/goods/S-A6s.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(9,'Galaxy A6s',1499,1300,'images/goods/S-A6s.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(9,'Galaxy A9s',2499,2499,'images/goods/S-A9s.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(9,'Galaxy A9s',2499,2400,'images/goods/S-A9s.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(10,'Galaxy Note9',6997,6997,'images/goods/S-Note9.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(10,'Galaxy Note9',6997,6800,'images/goods/S-Note9.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(10,'Galaxy Note8',6399,6399,'images/goods/S-Note8.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(10,'Galaxy Note8',6399,6300,'images/goods/S-Note8.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(9,'Galaxy A9s',2499,2499,'images/goods/S-A9s.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(9,'Galaxy A9s',2499,2400,'images/goods/S-A9s.jpg',1,0)


--小米

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(12,'小米9',2999,2999,'images/goods/M-9.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(12,'小米9',2999,2400,'images/goods/M-9.jpg',1,0)

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(12,'小米9 SE',1999,1999,'images/goods/M-9SE.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(12,'小米9 SE',1999,1900,'images/goods/M-9SE.jpg',1,0)

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(12,'小米8屏幕指纹版',2699,2699,'images/goods/M-8zhiwen.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(12,'小米8屏幕指纹版',2699,2600,'images/goods/M-8zhiwen.jpg',1,0)

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(12,'小米8SE',1399,1399,'images/goods/M-8SE.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(12,'小米8SE',1399,1300,'images/goods/M-8SE.jpg',1,0)

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(12,'小米8青春版',1699,1699,'images/goods/M-8young.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(12,'小米8青春版',1699,1500,'images/goods/M-8young.jpg',1,0)

--华为 HUAWEI 麦芒7 6G+64G 魅海蓝 全网通 前置智慧双摄 移动联通电信4G手机 双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (1,6,'HUAWEI','魅海蓝','2340*1080','2400万+200万像素','2000万像素','八核','2.36 GHz','android','约172克','3750毫安','7.6mm','')

--华为 HUAWEI 麦芒7 6G+64G 魅海蓝 全网通 前置智慧双摄 移动联通电信4G手机 双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (2,6,'HUAWEI','魅海蓝','2340*1080','2400万+200万像素','2000万像素','八核','2.36 GHz','android','约172克','3750毫安','7.6mm','')

--华为 HUAWEI Mate 20 麒麟980AI智能芯片全面屏超微距影像超大广角徕卡三摄6GB+128GB翡冷翠全网通版双4G手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (3,6,'HUAWEI','翡冷翠','2244*1080','2400万像素','600万像素+1200万像素+800万像素','八核','2.36 GHz','android','188g','4000毫安','8.3mm','')

--华为 HUAWEI Mate 20 麒麟980AI智能芯片全面屏超微距影像超大广角徕卡三摄6GB+128GB翡冷翠全网通版双4G手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (4,6,'HUAWEI','翡冷翠','2244*1080','2400万像素','600万像素+1200万像素+800万像素','八核','2.36 GHz','android','188g','4000毫安','8.3mm','')

--华为 HUAWEI Mate 20 Pro (UD)屏内指纹版麒麟980芯片全面屏超大广角徕卡三摄8GB+128GB极光色全网通双4G手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (5,8,'HUAWEI','极光色','2340*1080','2400万像素','4000万+2000万+800万像素','八核','2.36 GHz','android','约189克', '4200毫安','8.6mm','')

--华为 HUAWEI Mate 20 Pro (UD)屏内指纹版麒麟980芯片全面屏超大广角徕卡三摄8GB+128GB极光色全网通双4G手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (6,8,'HUAWEI','极光色','2340*1080','2400万像素','4000万+2000万+800万像素','八核','2.36 GHz','android','约189克', '4200毫安','8.6mm','')

--HUAWEI Mate20X 麒麟980芯片全面屏超微距影像超大广角徕卡三摄6GB+128GB宝石蓝全网通版双4G游戏手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (7,6,'HUAWEI','宝石蓝','2244*1080','2400万像素','4000+1600+800万像素','八核','12.36 GHz','android','232g','5000毫安','8.15mm','')
select * from goods

--HUAWEI Mate20X 麒麟980芯片全面屏超微距影像超大广角徕卡三摄6GB+128GB宝石蓝全网通版双4G游戏手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (8,6,'HUAWEI','宝石蓝','2244*1080','2400万像素','4000+1600+800万像素','八核','12.36 GHz','android','232g','5000毫安','8.15mm','')

--华为 HUAWEI nova 4e 3200万立体美颜AI超广角三摄珍珠屏4GB+128GB雀翎蓝全网通版双4G手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (9,6,'HUAWEI','雀翎蓝','2312*1080','3200万像素','2400万+800万+200万像素','八核','2.36 GHz','android','159g','3340毫安','7.4mm','')

--华为 HUAWEI nova 4e 3200万立体美颜AI超广角三摄珍珠屏4GB+128GB雀翎蓝全网通版双4G手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (10,6,'HUAWEI','雀翎蓝','2312*1080','3200万像素','2400万+800万+200万像素','八核','2.36 GHz','android','159g','3340毫安','7.4mm','')

--华为 HUAWEI nova 3i 全面屏高清四摄游戏手机4GB+128GB 亮黑色 全网通移动联通电信4G手机双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (11,6,'HUAWEI','翡冷翠','2340*1080','2400万+200万像素','1600万+200万像素','八核','2.36 GHz','android','约169克','3340毫安','7.6mm','')

--华为 HUAWEI nova 3i 全面屏高清四摄游戏手机4GB+128GB 亮黑色 全网通移动联通电信4G手机双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (12,6,'HUAWEI','翡冷翠','2340*1080','2400万+200万像素','1600万+200万像素','八核','2.36 GHz','android','约169克','3340毫安','7.6mm','')

--华为 HUAWEI P20 AI智慧徕卡双摄全面屏游戏手机 6GB+64GB 亮黑色 全网通移动联通电信4G手机 双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (13,6,'HUAWEI','亮黑色','2340*1080','2400万像素','2000+1200万像素','八核','2.36 GHz','android','165g','3650毫安','7.65mm','')

--华为 HUAWEI P20 AI智慧徕卡双摄全面屏游戏手机 6GB+64GB 亮黑色 全网通移动联通电信4G手机 双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (14,6,'HUAWEI','亮黑色','2340*1080','2400万像素','2000+1200万像素','八核','2.36 GHz','android','165g','3650毫安','7.65mm','')

--华为 HUAWEI P30 超感光徕卡三摄麒麟980AI智能芯片全面屏屏内指纹版手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (15,32,'HUAWEI','黑色','2340*1080','3200万像素','4000+1600+800万像素','八核','2.36 GHz','android','165g','3650毫安','7.7mm','')

--华为 HUAWEI P30 超感光徕卡三摄麒麟980AI智能芯片全面屏屏内指纹版手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (16,32,'HUAWEI','黑色','2340*1080','3200万像素','4000+1600+800万像素','八核','2.36 GHz','android','165g','3650毫安','7.7mm','')

--HUAWEI P30 Pro 超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+128GB亮黑色全网通版双4G手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (17,8,'HUAWEI','亮黑色','2340*1080','2400万像素','2000+1200万像素','八核','2.36 GHz','android','192g','4200毫安','8.41mm','')

--HUAWEI P30 Pro 超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+128GB亮黑色全网通版双4G手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (18,8,'HUAWEI','亮黑色','2340*1080','2400万像素','2000+1200万像素','八核','2.36 GHz','android','192g','4200毫安','8.41mm','')

--Apple iPhone XS (A2100) 64GB 金色
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (19,64,'iphone','金色','2436×1125','700万像素','双1200万像素','16核','144HZ','ios','177g','4000毫安','7.7mm','')

--Apple iPhone XS (A2100) 64GB 金色
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (20,64,'iphone','金色','2436×1125','700万像素','双1200万像素','16核','144HZ','ios','177g','4000毫安','7.7mm','')

--Apple iPhone XR (A2108) 64GB 白色
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (21,64,'iphone','白色','1792*828','700万像素','双1200万像素','16核','144HZ','ios','194g','4000毫安','8.8mm','')

--Apple iPhone XR (A2108) 64GB 白色
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (22,64,'iphone','白色','1792*828','700万像素','双1200万像素','16核','144HZ','ios','194g','4000毫安','8.8mm','')

--Apple iPhone X (A1865) 64GB 深空灰色
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (23,64,'iphone','深空灰色','2436×1125','700万像素','双1200万像素','16核','144HZ','ios','174g','4000毫安','7.7mm','')

--Apple iPhone X (A1865) 64GB 深空灰色
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (24,64,'iphone','深空灰色','2436×1125','700万像素','双1200万像素','16核','144HZ','ios','174g','4000毫安','7.7mm','')

--Apple iPhone 8 Plus (A1864)
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (25,64,'iphone','金色','1920*1080','700万像素','双1200万像素','16核','144HZ','ios','202g','4500毫安','7.5mm','')

--Apple iPhone 8 Plus (A1864)
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (26,64,'iphone','金色','1920*1080','700万像素','双1200万像素','16核','144HZ','ios','202g','4500毫安','7.5mm','')

--Apple iPhone 7 Plus (A1661) 128G
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (27,32,'iphone','黑色','1920*1080','700万像素','双1200万像素','16核','144HZ','ios','188g','4000毫安','7.3mm','')

--Apple iPhone 7 Plus (A1661) 128G
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (28,32,'iphone','黑色','1920*1080','700万像素','双1200万像素','16核','144HZ','ios','188g','4000毫安','7.3mm','')

--OPPO Reno
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (29,8,'OPPO','绿色','1920*1080','1600万-1999万像素','2000万像素','8核','2.8GHz','Android','560g','4000毫安','8.5mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (30,8,'OPPO','绿色','1920*1080','1600万-1999万像素','2000万像素','8核','2.8GHz','Android','560g','4000毫安','8.5mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (31,32,'OPPO','波尔多红','2340*1080','2500万像素','2000万+1600万像素','8核','2.8GHz','Android','186g','3400毫安','7.3mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (32,32,'OPPO','波尔多红','2340*1080','2500万像素','2000万+1600万像素','8核','2.8GHz','Android','186g','3400毫安','7.3mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (33,8,'OPPO','波尔多红','2340*1080','2500万像素','2000万+1600万像素','8核','2.8GHz','Android','186g','3400mAh','9.6mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (34,8,'OPPO','波尔多红','2340*1080','2500万像素','2000万+1600万像素','8核','2.8GHz','Android','186g','3400mAh','9.6mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (35,8,'OPPO','蓝','2340*1080','2500万像素','2000万+1600万像素','8核','2.8GHz','Android','182g','2×1850mAh','7.9mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (36,8,'OPPO','蓝','2340*1080','2500万像素','2000万+1600万像素','8核','2.8GHz','Android','182g','2×1850mAh','7.9mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (37,8,'OPPO','冰萃银','2340*1080','2500万像素','2000万+1600万像素','8核','1.95GHz','Android','188g','3600毫安','7.3mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (38,8,'OPPO','冰萃银','2340*1080','2500万像素','2000万+1600万像素','8核','1.95GHz','Android','188g','3600毫安','7.3mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (39,8,'OPPO','流光蓝 ','2340*1080','2500万像素','1600万+500万像素','8核','2.0GHz','Android','182g','3500毫安','7.5mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (40,8,'OPPO','流光蓝 ','2340*1080','2500万像素','1600万+500万像素','8核','2.0GHz','Android','182g','3500毫安','7.5mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (41,4,'OPPO','星空紫','2340*1080','1600万像素','1600+200万像素','8核','2.0GHz','Android','169g','3500毫安','7.99mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (42,4,'OPPO','星空紫','2340*1080','1600万像素','1600+200万像素','8核','2.0GHz','Android','169g','3500毫安','7.99mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (43,6,'OPPO','湖光绿','1520x720','1600万像素','1300+200万像素','8核','1.8GHz','Android','158g','4230毫安','8.1mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (44,6,'OPPO','湖光绿','1520x720','1600万像素','1300+200万像素','8核','1.8GHz','Android','158g','4230毫安','8.1mm','')

--三星 Galaxy S10 8GB+128GB炭晶黑（SM-G9730）3D超声波屏下指纹超感官全视屏骁龙855双卡双待全网通4G手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (45,6,'三星','炭晶黑','3040*1440','1000万像素','1600万+1200万+1200万像素','八核','2.8 GHz','android','157g','3400mAh','7.8mm','')

--三星 Galaxy S10 8GB+128GB炭晶黑（SM-G9730）3D超声波屏下指纹超感官全视屏骁龙855双卡双待全网通4G手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (46,6,'三星','炭晶黑','3040*1440','1000万像素','1600万+1200万+1200万像素','八核','2.8 GHz','android','157g','3400mAh','7.8mm','')

--三星 Galaxy S9+ 6GB+64GB 夕雾紫 （SM-G9650/DS）全视曲面屏 智能可变光圈全网通4G 游戏手机 双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (47,6,'三星','夕雾紫 ','2960 x 1440','800万像素','双1200万像素','八核','2.8 GHz','android','189g','3500mAh','8.5mm','')

--三星 Galaxy S9+ 6GB+64GB 夕雾紫 （SM-G9650/DS）全视曲面屏 智能可变光圈全网通4G 游戏手机 双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (48,6,'三星','夕雾紫 ','2960 x 1440','800万像素','双1200万像素','八核','2.8 GHz','android','189g','3500mAh','8.5mm','')

--Galaxy S10e 6GB+128GB 沁柠黄（SM-G9700）超感官全视屏 骁龙855 双卡双待 全网通4G手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (49,6,'三星','沁柠黄','2280x1080','1000万像素','1600万+1200万像素','八核','2.8 GHz','android','150g','3100mAh','7.9mm','')

--Galaxy S10e 6GB+128GB 沁柠黄（SM-G9700）超感官全视屏 骁龙855 双卡双待 全网通4G手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (50,6,'三星','沁柠黄','2280x1080','1000万像素','1600万+1200万像素','八核','2.8 GHz','android','150g','3100mAh','7.9mm','')

--三星 Galaxy A8s 8GB+128GB 精灵蓝（SM-G8870）黑瞳全视屏手机 骁龙710芯片 后置三摄 全网通4G 双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (51,6,'三星','精灵蓝','2340*1080','2400万像素','2400万像素','八核','2.2 GHz','android','173g','3400mAh','7.4mm','')

--三星 Galaxy A8s 8GB+128GB 精灵蓝（SM-G8870）黑瞳全视屏手机 骁龙710芯片 后置三摄 全网通4G 双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (52,6,'三星','精灵蓝','2340*1080','2400万像素','2400万像素','八核','2.2 GHz','android','173g','3400mAh','7.4mm','')

--三星 Galaxy A6s 6GB+64GB 花仙紫(SM-G6200) 全面屏 渐变色 全网通4G 双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (53,6,'三星','花仙紫','2160*1080','1200万像素','1200+500万像素','八核','2.2GHz','android','183g','3300mAh','8.4mm','')

--三星 Galaxy A6s 6GB+64GB 花仙紫(SM-G6200) 全面屏 渐变色 全网通4G 双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (54,6,'三星','花仙紫','2160*1080','1200万像素','1200+500万像素','八核','2.2GHz','android','183g','3300mAh','8.4mm','')

--三星 Galaxy A9s (SM-A9200)全面屏手机 后置四摄 Bixby 6GB+128GB 鱼子黑 全网通4G 双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (55,6,'三星','鱼子黑','2220 x 1080','2400万像素','2400万+1000万+800万+500万像素','八核','2.2GHz','android','183g','3400mAh','7.8mm','')

--三星 Galaxy A9s (SM-A9200)全面屏手机 后置四摄 Bixby 6GB+128GB 鱼子黑 全网通4G 双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (56,6,'三星','鱼子黑','2220 x 1080','2400万像素','2400万+1000万+800万+500万像素','八核','2.2GHz','android','183g','3400mAh','7.8mm','')

--三星 Galaxy Note9 8GB+512GB 丹青黑（SM-N9600）智能S Pen 大容量电池 液冷散热系统 全网通4G 双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (57,6,'三星','丹青黑','2960 x 1440','800万像素','双1200万像素','八核','2.8 GHz','android','201g','4000mAh','8.8mm','')

--三星 Galaxy Note9 8GB+512GB 丹青黑（SM-N9600）智能S Pen 大容量电池 液冷散热系统 全网通4G 双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (58,6,'三星','丹青黑','2960 x 1440','800万像素','双1200万像素','八核','2.8 GHz','android','201g','4000mAh','8.8mm','')


--三星 Galaxy Note8 6GB+128GB 谜夜黑（SM-N9500）智能双摄|IP68级防尘防水 全网通4G 游戏手机 双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (59,6,'三星','谜夜黑','2960 x 1440','800万像素','双1200万像素','八核','2.8 GHz','android','162.5g','3400mAh','8.6mm','')

--三星 Galaxy Note8 6GB+128GB 谜夜黑（SM-N9500）智能双摄|IP68级防尘防水 全网通4G 游戏手机 双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (60,6,'三星','谜夜黑','2960 x 1440','800万像素','双1200万像素','八核','2.8 GHz','android','162.5g','3400mAh','8.6mm','')

--三星 Galaxy A9s (SM-A9200)全面屏手机 后置四摄 Bixby 6GB+128GB 鱼子黑 全网通4G 双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (61,6,'三星','鱼子黑','2220 x 1080','2400万像素','2400万+1000万+800万+500万像素','八核','2.2GHz','android','183g','3400mAh','7.8mm','')

--三星 Galaxy A9s (SM-A9200)全面屏手机 后置四摄 Bixby 6GB+128GB 鱼子黑 全网通4G 双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (62,6,'三星','鱼子黑','2220 x 1080','2400万像素','2400万+1000万+800万+500万像素','八核','2.2GHz','android','183g','3400mAh','7.8mm','')


--小米9 4800万超广角三摄 6GB+128GB全息幻彩蓝 骁龙855 全网通4G 双卡双待 水滴全面屏拍照游戏智能手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (63,6,'小米','幻彩蓝','2340*1080','2000万像素','4800万+1600万+1200万像素','八核','2.36 GHz','android','173g','3300mAh','7.61mm','')

--小米9 4800万超广角三摄 6GB+128GB全息幻彩蓝 骁龙855 全网通4G 双卡双待 水滴全面屏拍照游戏智能手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (64,6,'小米','幻彩蓝','2340*1080','2000万像素','4800万+1600万+1200万像素','八核','2.36 GHz','android','173g','3300mAh','7.61mm','')

--小米9 SE 4800万超广角三摄 骁龙712 水滴全面屏 游戏智能拍照手机 6GB+64GB 全息幻彩蓝 全网通4G双卡双
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (65,6,'小米','幻彩蓝','2340*1080','2000万像素','4800万+1300万+1200万像素','八核','2.36 GHz','android','155g','3070mAh','7.45mm','')

--小米9 SE 4800万超广角三摄 骁龙712 水滴全面屏 游戏智能拍照手机 6GB+64GB 全息幻彩蓝 全网通4G双卡双
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (66,6,'小米','幻彩蓝','2340*1080','2000万像素','4800万+1300万+1200万像素','八核','2.36 GHz','android','155g','3070mAh','7.45mm','')

--小米8屏幕指纹版 8GB+128GB 透明版 全网通4G 双卡双待 全面屏拍照游戏智能手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (67,6,'小米','幻彩蓝','2230*1080','2000万像素','双1200万像素','八核','2.36 GHz','android','170g','3000mAh','7.6mm','')

--小米8屏幕指纹版 8GB+128GB 透明版 全网通4G 双卡双待 全面屏拍照游戏智能手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (68,6,'小米','幻彩蓝','2230*1080','2000万像素','双1200万像素','八核','2.36 GHz','android','170g','3000mAh','7.6mm','')

--小米8SE 全面屏智能游戏拍照手机 6GB+64GB 灰色 骁龙710处理器 全网通4G 双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (69,6,'小米','灰色','其他','2000万像素','1200+500万像素','八核','2.36 GHz','android','164g','3120mAh','7.5mm','')

--小米8SE 全面屏智能游戏拍照手机 6GB+64GB 灰色 骁龙710处理器 全网通4G 双卡双待
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (70,6,'小米','灰色','其他','2000万像素','1200+500万像素','八核','2.36 GHz','android','164g','3120mAh','7.5mm','')

--小米8青春版 镜面渐变AI双摄 6GB+64GB 深空灰 全网通4G 双卡双待 全面屏拍照游戏智能手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (71,6,'小米','灰色','2280x1080','2400万像素','1200+500万像素','八核','2.36 GHz','android','169g','3350mAh','7.5mm','')

--小米8青春版 镜面渐变AI双摄 6GB+64GB 深空灰 全网通4G 双卡双待 全面屏拍照游戏智能手机
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (72,6,'小米','灰色','2280x1080','2400万像素','1200+500万像素','八核','2.36 GHz','android','169g','3350mAh)','7.5mm','')

select * from goods
--商品评价
insert into comment(goodsId,memberId,content) values(1,1,'商品实用性好')
insert into comment(goodsId,memberId,content) values(2,1,'商品实用性好')
insert into comment(goodsId,memberId,content) values(3,1,'商品实用性好')
insert into comment(goodsId,memberId,content) values(4,1,'商品实用性好')
insert into comment(goodsId,memberId,content) values(5,1,'商品实用性好')
insert into comment(goodsId,memberId,content) values(6,1,'商品实用性好')
insert into comment(goodsId,memberId,content) values(7,1,'商品实用性好')
insert into comment(goodsId,memberId,content) values(8,1,'商品实用性好')
insert into comment(goodsId,memberId,content) values(9,1,'商品实用性好')
insert into comment(goodsId,memberId,content) values(10,1,'商品实用性好')
insert into comment(goodsId,memberId,content) values(11,1,'商品实用性好')
insert into comment(goodsId,memberId,content) values(12,1,'商品实用性好')

select commentId,goodsId,memberId,conTime,content from comment
select goodsId,count(*) from comment group by goodsId order by count(*)
select goodsId,subId,goodsName,price,nowprice,picture,InTime,hit FROM (SELECT ROW_NUMBER() OVER ( ORDER BY nowPrice asc) AS ROWNUM,* FROM goods where goodsName like '%%')t WHERE t.ROWNUM >= 1 AND t.ROWNUM <=100 order by nowPrice asc

--添加商品详情

select introduceId,goodsId,memory,brand,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption from introduce where goodsId = 1
select introduceId,goodsId,memory,brand,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption FROM (SELECT ROW_NUMBER() OVER ( ORDER BY introduceId asc) AS ROWNUM,* FROM introduce)t WHERE t.ROWNUM >= 1 AND t.ROWNUM <=100
select goodsId,subId,goodsName,price,nowprice,picture,InTime,newsGoods,sale,hit from goods where goodsId in (select max(goodsId) from goods)
update introduce set memory=?,brand=?,color=?,distinguishability=?,front_camera=?,back_camera=?,cpu=?,rate=?,systems=?,heft=?,battery=?,thickness=?,caption=? where goodsId = ?

-- 清空货物信息 
select max(goodsId) from goods
--新货物

select top 18 goodsId,subId,goodsName,introduce,nowPrice,picture,InTime,newsGoods,hit from goods where newsGoods = 1

select goodsId,subId,goodsName,nowPrice,picture,InTime,hit from goods where newsGoods = 0 and sale = 0

--打折

select top 18 goodsId,subId,goodsName,introduce,price,nowprice,picture,InTime,sale,hit from goods where sale = 1

select top 100 goodsId,subId,goodsName,introduce,nowprice,picture,InTime,hit from goods order by hit desc

select goodsId,subId,goodsName,nowprice,picture,InTime,hit FROM (SELECT ROW_NUMBER() OVER ( ORDER BY goodsId ASC) AS ROWNUM,* FROM goods where goodsName like '%%')t WHERE t.ROWNUM > 0 AND t.ROWNUM <= 5

select COUNT(*) from goods where goodsName like '%%'

select goodsId,subId,goodsName,nowprice,picture,InTime,hit FROM (SELECT ROW_NUMBER() OVER ( ORDER BY goodsId ASC) AS ROWNUM,* FROM goods where subId in (select subId FROM subType where superId = 3))t WHERE t.ROWNUM > 0 AND t.ROWNUM <= 100

select COUNT(*) from goods where subId = 1

select goodsId,subId,goodsName,introduce,nowprice,picture,InTime,hit FROM goods where subId in (select subId FROM subType where superId = 1)

select COUNT(*) FROM goods where subId in (select subId FROM subType where superId = 1)

select top(6) goodsId,subId,goodsName,introduce,nowprice,picture,InTime,hit  FROM goods where subId  = 1 order by hit desc

update goods set hit = hit + 1 where goodsId = 62

update goods set subId= 1,goodsName=1,introduce=1,price=1,nowprice=1,picture=1,sale=1,newsGoods=1 where goodsId = 62

--订单信息表

insert into shopOrder(bnumber,receiveName,addresses,tel,remark,memberId) values(1,'1','1','1','1',1)

delete from detailOrder where orderId = 1

delete from shopOrder where orderId = 1

select orderId,bnumber,receiveName,addresses,tel,orderDate,remark,memberId from shopOrder where orderId = 1

select orderId,bnumber,receiveName,addresses,tel,orderDate,remark,memberId FROM (SELECT ROW_NUMBER() OVER ( ORDER BY orderId ASC) AS ROWNUM,* FROM shopOrder where receiveName like '%%' and memberId = 1)t WHERE t.ROWNUM > 0 AND t.ROWNUM <= 10

select COUNT(*) from shopOrder where receiveName like '%%' and memberId = 1

--订单信息明细表

insert into detailOrder(orderId,goodsId,price,number) values(1,1,1,1)

delete from detailOrder where detailOrderId = 1

select detailOrderId,orderId,goodsId,price,number from detailOrder

select detailOrderId,orderId,goodsId,price,number FROM (SELECT ROW_NUMBER() OVER ( ORDER BY detailOrderId ASC) AS ROWNUM,* FROM detailOrder where orderId = 3)t WHERE t.ROWNUM > 0 AND t.ROWNUM <= 10

select COUNT(*) from detailOrder

--管理员信息表

select managerId,managerName,managerPwd from manager

insert into manager(ManagerName,managerPwd) values('admin','admin')


update introduce set caption='images/introduce/intro.png'