use Shop

--��Ա��

insert into member(userName,trueName,memberPwd,amount,tel,email) values('actionNow','����','123456',100 ,'12345678900','sdcet@163.com');
insert into member(userName,trueName,memberPwd,amount,tel,email) values('abc','����','123456',100 ,'12345678900','sdcet@163.com');
insert into member(userName,trueName,memberPwd,amount,tel,email) values('dfg','����','123456',100 ,'12345678900','sdcet@163.com');
insert into member(userName,trueName,memberPwd,amount,tel,email) values('llll','����ΰ��','123456',100 ,'12345678900','sdcet@163.com');
select count(*) from member where userName='jihuaijia'
update member set memberPwd = '147258' where memberId = 1
select memberId,userName,trueName,memberPwd,Amount,tel,email,freeze from member where memberId = 1
select memberId,userName,trueName,memberPwd,Amount,tel,email,freeze from member where userName = 'jihuaijia' AND memberPwd = '123456'
update member set userName = 'abcdef',trueName = '����',memberPwd = '147258',Amount = 100,tel = '15236984758',email = 'jihuaijia@163.com',freeze = 1 where memberId = 1
delete from member where memberId = 1
select COUNT(*) from member where userName = 'abcdef'
--��Ʒ�������Ϣ��
set identity_insert superType OFF	--�ر�
insert into superType(typeName) values('��Ϊ')
insert into superType(typeName) values('ƻ��')
insert into superType(typeName) values('OPPO')
insert into superType(typeName) values('����')
insert into superType(typeName) values('С��')

select superId,typeName from superType
delete from subType where subId in (11,12,13);
update superType set typeName=, where superId = 
--��ƷС������Ϣ��
select subId,superId,typeName from subType
insert into subType(typeName,superId) values('Pϵ��',1)
insert into subType(typeName,superId) values('Mateϵ��',1)
insert into subType(typeName,superId) values('��âϵ��',1)

insert into subType(typeName,superId) values('Renoϵ��',3)
insert into subType(typeName,superId) values('Find Xϵ��',3)
insert into subType(typeName,superId) values('Rϵ��',3)
insert into subType(typeName,superId) values('Aϵ��',3)

insert into subType(typeName,superId) values('Sϵ��',4)
insert into subType(typeName,superId) values('Aϵ��',4)
insert into subType(typeName,superId) values('Noteϵ��',4)

insert into subType(typeName,superId) values('iPhone',2)

insert into subType(typeName,superId) values('С��',5)

select subId,typeName,superId from subType where superId = 1
update subType set subId = 9 where typeName='ͯװ'
delete from subType where subId = 1000
update subType set typeName=,superId= where subId =

--��Ʒ��Ϣ��

--��Ϊ

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(3,'��Ϊ��â',2500,2500,'images/goods/H-maimang.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(3,'��Ϊ��â',2500,2100,'images/goods/H-maimang.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(2,'��ΪMate20',3499,3499,'images/goods/H-Mate20.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(2,'��ΪMate20',3499,3300,'images/goods/H-Mate20.jpg',1,0)

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(2,'��ΪMate20Pro',5499,5499,'images/goods/H-Mate20pro.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(2,'��ΪMate20Pro',5499,5400,'images/goods/H-Mate20pro.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(2,'��ΪMate20X',4499,4499,'images/goods/H-Mate20X.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(2,'��ΪMate20X',4499,4400,'images/goods/H-Mate20X.jpg',1,0)

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(3,'��Ϊnova',1999,1999,'images/goods/H-nova.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(3,'��Ϊnova',1999,1900,'images/goods/H-nova.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(3,'��Ϊnova3i',1899,1899,'images/goods/H-nova3i.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(3,'��Ϊnova3i',1899,1700,'images/goods/H-nova3i.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(1,'��ΪP20',3088,3088,'images/goods/H-P20.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(1,'��ΪP20',3088,3000,'images/goods/H-P20.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(1,'��ΪP30',4288,4288,'images/goods/H-P30.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(1,'��ΪP30',4288,4000,'images/goods/H-P30.jpg',1,0)


insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(1,'��ΪP30pro',5488,5488,'images/goods/H-P30Pro.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(1,'��ΪP30Pro',5488,5400,'images/goods/H-P30Pro.jpg',1,0)



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

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(5,'����������桿OPPO Find X',9998,9998,'images/goods/O-FindXlanbo.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(5,'����������桿OPPO Find X',9998,9990,'images/goods/O-FindXlanbo.jpg',1,0)


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



--����

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


--С��

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(12,'С��9',2999,2999,'images/goods/M-9.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(12,'С��9',2999,2400,'images/goods/M-9.jpg',1,0)

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(12,'С��9 SE',1999,1999,'images/goods/M-9SE.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(12,'С��9 SE',1999,1900,'images/goods/M-9SE.jpg',1,0)

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(12,'С��8��Ļָ�ư�',2699,2699,'images/goods/M-8zhiwen.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(12,'С��8��Ļָ�ư�',2699,2600,'images/goods/M-8zhiwen.jpg',1,0)

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(12,'С��8SE',1399,1399,'images/goods/M-8SE.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(12,'С��8SE',1399,1300,'images/goods/M-8SE.jpg',1,0)

insert into goods(subId,goodsName,price,nowprice,picture,newsGoods,hit) values(12,'С��8�ഺ��',1699,1699,'images/goods/M-8young.jpg',1,0)
insert into goods(subId,goodsName,price,nowprice,picture,sale,hit) values(12,'С��8�ഺ��',1699,1500,'images/goods/M-8young.jpg',1,0)

--��Ϊ HUAWEI ��â7 6G+64G �Ⱥ��� ȫ��ͨ ǰ���ǻ�˫�� �ƶ���ͨ����4G�ֻ� ˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (1,6,'HUAWEI','�Ⱥ���','2340*1080','2400��+200������','2000������','�˺�','2.36 GHz','android','Լ172��','3750����','7.6mm','')

--��Ϊ HUAWEI ��â7 6G+64G �Ⱥ��� ȫ��ͨ ǰ���ǻ�˫�� �ƶ���ͨ����4G�ֻ� ˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (2,6,'HUAWEI','�Ⱥ���','2340*1080','2400��+200������','2000������','�˺�','2.36 GHz','android','Լ172��','3750����','7.6mm','')

--��Ϊ HUAWEI Mate 20 ����980AI����оƬȫ������΢��Ӱ�񳬴����⿨����6GB+128GB�����ȫ��ͨ��˫4G�ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (3,6,'HUAWEI','�����','2244*1080','2400������','600������+1200������+800������','�˺�','2.36 GHz','android','188g','4000����','8.3mm','')

--��Ϊ HUAWEI Mate 20 ����980AI����оƬȫ������΢��Ӱ�񳬴����⿨����6GB+128GB�����ȫ��ͨ��˫4G�ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (4,6,'HUAWEI','�����','2244*1080','2400������','600������+1200������+800������','�˺�','2.36 GHz','android','188g','4000����','8.3mm','')

--��Ϊ HUAWEI Mate 20 Pro (UD)����ָ�ư�����980оƬȫ�����������⿨����8GB+128GB����ɫȫ��ͨ˫4G�ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (5,8,'HUAWEI','����ɫ','2340*1080','2400������','4000��+2000��+800������','�˺�','2.36 GHz','android','Լ189��', '4200����','8.6mm','')

--��Ϊ HUAWEI Mate 20 Pro (UD)����ָ�ư�����980оƬȫ�����������⿨����8GB+128GB����ɫȫ��ͨ˫4G�ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (6,8,'HUAWEI','����ɫ','2340*1080','2400������','4000��+2000��+800������','�˺�','2.36 GHz','android','Լ189��', '4200����','8.6mm','')

--HUAWEI Mate20X ����980оƬȫ������΢��Ӱ�񳬴����⿨����6GB+128GB��ʯ��ȫ��ͨ��˫4G��Ϸ�ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (7,6,'HUAWEI','��ʯ��','2244*1080','2400������','4000+1600+800������','�˺�','12.36 GHz','android','232g','5000����','8.15mm','')
select * from goods

--HUAWEI Mate20X ����980оƬȫ������΢��Ӱ�񳬴����⿨����6GB+128GB��ʯ��ȫ��ͨ��˫4G��Ϸ�ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (8,6,'HUAWEI','��ʯ��','2244*1080','2400������','4000+1600+800������','�˺�','12.36 GHz','android','232g','5000����','8.15mm','')

--��Ϊ HUAWEI nova 4e 3200����������AI���������������4GB+128GBȸ����ȫ��ͨ��˫4G�ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (9,6,'HUAWEI','ȸ����','2312*1080','3200������','2400��+800��+200������','�˺�','2.36 GHz','android','159g','3340����','7.4mm','')

--��Ϊ HUAWEI nova 4e 3200����������AI���������������4GB+128GBȸ����ȫ��ͨ��˫4G�ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (10,6,'HUAWEI','ȸ����','2312*1080','3200������','2400��+800��+200������','�˺�','2.36 GHz','android','159g','3340����','7.4mm','')

--��Ϊ HUAWEI nova 3i ȫ��������������Ϸ�ֻ�4GB+128GB ����ɫ ȫ��ͨ�ƶ���ͨ����4G�ֻ�˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (11,6,'HUAWEI','�����','2340*1080','2400��+200������','1600��+200������','�˺�','2.36 GHz','android','Լ169��','3340����','7.6mm','')

--��Ϊ HUAWEI nova 3i ȫ��������������Ϸ�ֻ�4GB+128GB ����ɫ ȫ��ͨ�ƶ���ͨ����4G�ֻ�˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (12,6,'HUAWEI','�����','2340*1080','2400��+200������','1600��+200������','�˺�','2.36 GHz','android','Լ169��','3340����','7.6mm','')

--��Ϊ HUAWEI P20 AI�ǻ��⿨˫��ȫ������Ϸ�ֻ� 6GB+64GB ����ɫ ȫ��ͨ�ƶ���ͨ����4G�ֻ� ˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (13,6,'HUAWEI','����ɫ','2340*1080','2400������','2000+1200������','�˺�','2.36 GHz','android','165g','3650����','7.65mm','')

--��Ϊ HUAWEI P20 AI�ǻ��⿨˫��ȫ������Ϸ�ֻ� 6GB+64GB ����ɫ ȫ��ͨ�ƶ���ͨ����4G�ֻ� ˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (14,6,'HUAWEI','����ɫ','2340*1080','2400������','2000+1200������','�˺�','2.36 GHz','android','165g','3650����','7.65mm','')

--��Ϊ HUAWEI P30 ���й��⿨��������980AI����оƬȫ��������ָ�ư��ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (15,32,'HUAWEI','��ɫ','2340*1080','3200������','4000+1600+800������','�˺�','2.36 GHz','android','165g','3650����','7.7mm','')

--��Ϊ HUAWEI P30 ���й��⿨��������980AI����оƬȫ��������ָ�ư��ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (16,32,'HUAWEI','��ɫ','2340*1080','3200������','4000+1600+800������','�˺�','2.36 GHz','android','165g','3650����','7.7mm','')

--HUAWEI P30 Pro ���й��⿨����10����ϱ佹����980оƬ����ָ�� 8GB+128GB����ɫȫ��ͨ��˫4G�ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (17,8,'HUAWEI','����ɫ','2340*1080','2400������','2000+1200������','�˺�','2.36 GHz','android','192g','4200����','8.41mm','')

--HUAWEI P30 Pro ���й��⿨����10����ϱ佹����980оƬ����ָ�� 8GB+128GB����ɫȫ��ͨ��˫4G�ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (18,8,'HUAWEI','����ɫ','2340*1080','2400������','2000+1200������','�˺�','2.36 GHz','android','192g','4200����','8.41mm','')

--Apple iPhone XS (A2100) 64GB ��ɫ
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (19,64,'iphone','��ɫ','2436��1125','700������','˫1200������','16��','144HZ','ios','177g','4000����','7.7mm','')

--Apple iPhone XS (A2100) 64GB ��ɫ
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (20,64,'iphone','��ɫ','2436��1125','700������','˫1200������','16��','144HZ','ios','177g','4000����','7.7mm','')

--Apple iPhone XR (A2108) 64GB ��ɫ
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (21,64,'iphone','��ɫ','1792*828','700������','˫1200������','16��','144HZ','ios','194g','4000����','8.8mm','')

--Apple iPhone XR (A2108) 64GB ��ɫ
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (22,64,'iphone','��ɫ','1792*828','700������','˫1200������','16��','144HZ','ios','194g','4000����','8.8mm','')

--Apple iPhone X (A1865) 64GB ��ջ�ɫ
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (23,64,'iphone','��ջ�ɫ','2436��1125','700������','˫1200������','16��','144HZ','ios','174g','4000����','7.7mm','')

--Apple iPhone X (A1865) 64GB ��ջ�ɫ
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (24,64,'iphone','��ջ�ɫ','2436��1125','700������','˫1200������','16��','144HZ','ios','174g','4000����','7.7mm','')

--Apple iPhone 8 Plus (A1864)
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (25,64,'iphone','��ɫ','1920*1080','700������','˫1200������','16��','144HZ','ios','202g','4500����','7.5mm','')

--Apple iPhone 8 Plus (A1864)
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (26,64,'iphone','��ɫ','1920*1080','700������','˫1200������','16��','144HZ','ios','202g','4500����','7.5mm','')

--Apple iPhone 7 Plus (A1661) 128G
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (27,32,'iphone','��ɫ','1920*1080','700������','˫1200������','16��','144HZ','ios','188g','4000����','7.3mm','')

--Apple iPhone 7 Plus (A1661) 128G
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (28,32,'iphone','��ɫ','1920*1080','700������','˫1200������','16��','144HZ','ios','188g','4000����','7.3mm','')

--OPPO Reno
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (29,8,'OPPO','��ɫ','1920*1080','1600��-1999������','2000������','8��','2.8GHz','Android','560g','4000����','8.5mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (30,8,'OPPO','��ɫ','1920*1080','1600��-1999������','2000������','8��','2.8GHz','Android','560g','4000����','8.5mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (31,32,'OPPO','�������','2340*1080','2500������','2000��+1600������','8��','2.8GHz','Android','186g','3400����','7.3mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (32,32,'OPPO','�������','2340*1080','2500������','2000��+1600������','8��','2.8GHz','Android','186g','3400����','7.3mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (33,8,'OPPO','�������','2340*1080','2500������','2000��+1600������','8��','2.8GHz','Android','186g','3400mAh','9.6mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (34,8,'OPPO','�������','2340*1080','2500������','2000��+1600������','8��','2.8GHz','Android','186g','3400mAh','9.6mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (35,8,'OPPO','��','2340*1080','2500������','2000��+1600������','8��','2.8GHz','Android','182g','2��1850mAh','7.9mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (36,8,'OPPO','��','2340*1080','2500������','2000��+1600������','8��','2.8GHz','Android','182g','2��1850mAh','7.9mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (37,8,'OPPO','������','2340*1080','2500������','2000��+1600������','8��','1.95GHz','Android','188g','3600����','7.3mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (38,8,'OPPO','������','2340*1080','2500������','2000��+1600������','8��','1.95GHz','Android','188g','3600����','7.3mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (39,8,'OPPO','������ ','2340*1080','2500������','1600��+500������','8��','2.0GHz','Android','182g','3500����','7.5mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (40,8,'OPPO','������ ','2340*1080','2500������','1600��+500������','8��','2.0GHz','Android','182g','3500����','7.5mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (41,4,'OPPO','�ǿ���','2340*1080','1600������','1600+200������','8��','2.0GHz','Android','169g','3500����','7.99mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (42,4,'OPPO','�ǿ���','2340*1080','1600������','1600+200������','8��','2.0GHz','Android','169g','3500����','7.99mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (43,6,'OPPO','������','1520x720','1600������','1300+200������','8��','1.8GHz','Android','158g','4230����','8.1mm','')

insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (44,6,'OPPO','������','1520x720','1600������','1300+200������','8��','1.8GHz','Android','158g','4230����','8.1mm','')

--���� Galaxy S10 8GB+128GB̿���ڣ�SM-G9730��3D����������ָ�Ƴ��й�ȫ��������855˫��˫��ȫ��ͨ4G�ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (45,6,'����','̿����','3040*1440','1000������','1600��+1200��+1200������','�˺�','2.8 GHz','android','157g','3400mAh','7.8mm','')

--���� Galaxy S10 8GB+128GB̿���ڣ�SM-G9730��3D����������ָ�Ƴ��й�ȫ��������855˫��˫��ȫ��ͨ4G�ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (46,6,'����','̿����','3040*1440','1000������','1600��+1200��+1200������','�˺�','2.8 GHz','android','157g','3400mAh','7.8mm','')

--���� Galaxy S9+ 6GB+64GB Ϧ���� ��SM-G9650/DS��ȫ�������� ���ܿɱ��Ȧȫ��ͨ4G ��Ϸ�ֻ� ˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (47,6,'����','Ϧ���� ','2960 x 1440','800������','˫1200������','�˺�','2.8 GHz','android','189g','3500mAh','8.5mm','')

--���� Galaxy S9+ 6GB+64GB Ϧ���� ��SM-G9650/DS��ȫ�������� ���ܿɱ��Ȧȫ��ͨ4G ��Ϸ�ֻ� ˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (48,6,'����','Ϧ���� ','2960 x 1440','800������','˫1200������','�˺�','2.8 GHz','android','189g','3500mAh','8.5mm','')

--Galaxy S10e 6GB+128GB �����ƣ�SM-G9700�����й�ȫ���� ����855 ˫��˫�� ȫ��ͨ4G�ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (49,6,'����','������','2280x1080','1000������','1600��+1200������','�˺�','2.8 GHz','android','150g','3100mAh','7.9mm','')

--Galaxy S10e 6GB+128GB �����ƣ�SM-G9700�����й�ȫ���� ����855 ˫��˫�� ȫ��ͨ4G�ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (50,6,'����','������','2280x1080','1000������','1600��+1200������','�˺�','2.8 GHz','android','150g','3100mAh','7.9mm','')

--���� Galaxy A8s 8GB+128GB ��������SM-G8870����ͫȫ�����ֻ� ����710оƬ �������� ȫ��ͨ4G ˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (51,6,'����','������','2340*1080','2400������','2400������','�˺�','2.2 GHz','android','173g','3400mAh','7.4mm','')

--���� Galaxy A8s 8GB+128GB ��������SM-G8870����ͫȫ�����ֻ� ����710оƬ �������� ȫ��ͨ4G ˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (52,6,'����','������','2340*1080','2400������','2400������','�˺�','2.2 GHz','android','173g','3400mAh','7.4mm','')

--���� Galaxy A6s 6GB+64GB ������(SM-G6200) ȫ���� ����ɫ ȫ��ͨ4G ˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (53,6,'����','������','2160*1080','1200������','1200+500������','�˺�','2.2GHz','android','183g','3300mAh','8.4mm','')

--���� Galaxy A6s 6GB+64GB ������(SM-G6200) ȫ���� ����ɫ ȫ��ͨ4G ˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (54,6,'����','������','2160*1080','1200������','1200+500������','�˺�','2.2GHz','android','183g','3300mAh','8.4mm','')

--���� Galaxy A9s (SM-A9200)ȫ�����ֻ� �������� Bixby 6GB+128GB ���Ӻ� ȫ��ͨ4G ˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (55,6,'����','���Ӻ�','2220 x 1080','2400������','2400��+1000��+800��+500������','�˺�','2.2GHz','android','183g','3400mAh','7.8mm','')

--���� Galaxy A9s (SM-A9200)ȫ�����ֻ� �������� Bixby 6GB+128GB ���Ӻ� ȫ��ͨ4G ˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (56,6,'����','���Ӻ�','2220 x 1080','2400������','2400��+1000��+800��+500������','�˺�','2.2GHz','android','183g','3400mAh','7.8mm','')

--���� Galaxy Note9 8GB+512GB ����ڣ�SM-N9600������S Pen ��������� Һ��ɢ��ϵͳ ȫ��ͨ4G ˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (57,6,'����','�����','2960 x 1440','800������','˫1200������','�˺�','2.8 GHz','android','201g','4000mAh','8.8mm','')

--���� Galaxy Note9 8GB+512GB ����ڣ�SM-N9600������S Pen ��������� Һ��ɢ��ϵͳ ȫ��ͨ4G ˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (58,6,'����','�����','2960 x 1440','800������','˫1200������','�˺�','2.8 GHz','android','201g','4000mAh','8.8mm','')


--���� Galaxy Note8 6GB+128GB ��ҹ�ڣ�SM-N9500������˫��|IP68��������ˮ ȫ��ͨ4G ��Ϸ�ֻ� ˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (59,6,'����','��ҹ��','2960 x 1440','800������','˫1200������','�˺�','2.8 GHz','android','162.5g','3400mAh','8.6mm','')

--���� Galaxy Note8 6GB+128GB ��ҹ�ڣ�SM-N9500������˫��|IP68��������ˮ ȫ��ͨ4G ��Ϸ�ֻ� ˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (60,6,'����','��ҹ��','2960 x 1440','800������','˫1200������','�˺�','2.8 GHz','android','162.5g','3400mAh','8.6mm','')

--���� Galaxy A9s (SM-A9200)ȫ�����ֻ� �������� Bixby 6GB+128GB ���Ӻ� ȫ��ͨ4G ˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (61,6,'����','���Ӻ�','2220 x 1080','2400������','2400��+1000��+800��+500������','�˺�','2.2GHz','android','183g','3400mAh','7.8mm','')

--���� Galaxy A9s (SM-A9200)ȫ�����ֻ� �������� Bixby 6GB+128GB ���Ӻ� ȫ��ͨ4G ˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (62,6,'����','���Ӻ�','2220 x 1080','2400������','2400��+1000��+800��+500������','�˺�','2.2GHz','android','183g','3400mAh','7.8mm','')


--С��9 4800�򳬹������ 6GB+128GBȫϢ�ò��� ����855 ȫ��ͨ4G ˫��˫�� ˮ��ȫ����������Ϸ�����ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (63,6,'С��','�ò���','2340*1080','2000������','4800��+1600��+1200������','�˺�','2.36 GHz','android','173g','3300mAh','7.61mm','')

--С��9 4800�򳬹������ 6GB+128GBȫϢ�ò��� ����855 ȫ��ͨ4G ˫��˫�� ˮ��ȫ����������Ϸ�����ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (64,6,'С��','�ò���','2340*1080','2000������','4800��+1600��+1200������','�˺�','2.36 GHz','android','173g','3300mAh','7.61mm','')

--С��9 SE 4800�򳬹������ ����712 ˮ��ȫ���� ��Ϸ���������ֻ� 6GB+64GB ȫϢ�ò��� ȫ��ͨ4G˫��˫
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (65,6,'С��','�ò���','2340*1080','2000������','4800��+1300��+1200������','�˺�','2.36 GHz','android','155g','3070mAh','7.45mm','')

--С��9 SE 4800�򳬹������ ����712 ˮ��ȫ���� ��Ϸ���������ֻ� 6GB+64GB ȫϢ�ò��� ȫ��ͨ4G˫��˫
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (66,6,'С��','�ò���','2340*1080','2000������','4800��+1300��+1200������','�˺�','2.36 GHz','android','155g','3070mAh','7.45mm','')

--С��8��Ļָ�ư� 8GB+128GB ͸���� ȫ��ͨ4G ˫��˫�� ȫ����������Ϸ�����ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (67,6,'С��','�ò���','2230*1080','2000������','˫1200������','�˺�','2.36 GHz','android','170g','3000mAh','7.6mm','')

--С��8��Ļָ�ư� 8GB+128GB ͸���� ȫ��ͨ4G ˫��˫�� ȫ����������Ϸ�����ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (68,6,'С��','�ò���','2230*1080','2000������','˫1200������','�˺�','2.36 GHz','android','170g','3000mAh','7.6mm','')

--С��8SE ȫ����������Ϸ�����ֻ� 6GB+64GB ��ɫ ����710������ ȫ��ͨ4G ˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (69,6,'С��','��ɫ','����','2000������','1200+500������','�˺�','2.36 GHz','android','164g','3120mAh','7.5mm','')

--С��8SE ȫ����������Ϸ�����ֻ� 6GB+64GB ��ɫ ����710������ ȫ��ͨ4G ˫��˫��
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (70,6,'С��','��ɫ','����','2000������','1200+500������','�˺�','2.36 GHz','android','164g','3120mAh','7.5mm','')

--С��8�ഺ�� ���潥��AI˫�� 6GB+64GB ��ջ� ȫ��ͨ4G ˫��˫�� ȫ����������Ϸ�����ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (71,6,'С��','��ɫ','2280x1080','2400������','1200+500������','�˺�','2.36 GHz','android','169g','3350mAh','7.5mm','')

--С��8�ഺ�� ���潥��AI˫�� 6GB+64GB ��ջ� ȫ��ͨ4G ˫��˫�� ȫ����������Ϸ�����ֻ�
insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
values (72,6,'С��','��ɫ','2280x1080','2400������','1200+500������','�˺�','2.36 GHz','android','169g','3350mAh)','7.5mm','')

select * from goods
--��Ʒ����
insert into comment(goodsId,memberId,content) values(1,1,'��Ʒʵ���Ժ�')
insert into comment(goodsId,memberId,content) values(2,1,'��Ʒʵ���Ժ�')
insert into comment(goodsId,memberId,content) values(3,1,'��Ʒʵ���Ժ�')
insert into comment(goodsId,memberId,content) values(4,1,'��Ʒʵ���Ժ�')
insert into comment(goodsId,memberId,content) values(5,1,'��Ʒʵ���Ժ�')
insert into comment(goodsId,memberId,content) values(6,1,'��Ʒʵ���Ժ�')
insert into comment(goodsId,memberId,content) values(7,1,'��Ʒʵ���Ժ�')
insert into comment(goodsId,memberId,content) values(8,1,'��Ʒʵ���Ժ�')
insert into comment(goodsId,memberId,content) values(9,1,'��Ʒʵ���Ժ�')
insert into comment(goodsId,memberId,content) values(10,1,'��Ʒʵ���Ժ�')
insert into comment(goodsId,memberId,content) values(11,1,'��Ʒʵ���Ժ�')
insert into comment(goodsId,memberId,content) values(12,1,'��Ʒʵ���Ժ�')

select commentId,goodsId,memberId,conTime,content from comment
select goodsId,count(*) from comment group by goodsId order by count(*)
select goodsId,subId,goodsName,price,nowprice,picture,InTime,hit FROM (SELECT ROW_NUMBER() OVER ( ORDER BY nowPrice asc) AS ROWNUM,* FROM goods where goodsName like '%%')t WHERE t.ROWNUM >= 1 AND t.ROWNUM <=100 order by nowPrice asc

--�����Ʒ����

select introduceId,goodsId,memory,brand,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption from introduce where goodsId = 1
select introduceId,goodsId,memory,brand,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption FROM (SELECT ROW_NUMBER() OVER ( ORDER BY introduceId asc) AS ROWNUM,* FROM introduce)t WHERE t.ROWNUM >= 1 AND t.ROWNUM <=100
select goodsId,subId,goodsName,price,nowprice,picture,InTime,newsGoods,sale,hit from goods where goodsId in (select max(goodsId) from goods)
update introduce set memory=?,brand=?,color=?,distinguishability=?,front_camera=?,back_camera=?,cpu=?,rate=?,systems=?,heft=?,battery=?,thickness=?,caption=? where goodsId = ?

-- ��ջ�����Ϣ 
select max(goodsId) from goods
--�»���

select top 18 goodsId,subId,goodsName,introduce,nowPrice,picture,InTime,newsGoods,hit from goods where newsGoods = 1

select goodsId,subId,goodsName,nowPrice,picture,InTime,hit from goods where newsGoods = 0 and sale = 0

--����

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

--������Ϣ��

insert into shopOrder(bnumber,receiveName,addresses,tel,remark,memberId) values(1,'1','1','1','1',1)

delete from detailOrder where orderId = 1

delete from shopOrder where orderId = 1

select orderId,bnumber,receiveName,addresses,tel,orderDate,remark,memberId from shopOrder where orderId = 1

select orderId,bnumber,receiveName,addresses,tel,orderDate,remark,memberId FROM (SELECT ROW_NUMBER() OVER ( ORDER BY orderId ASC) AS ROWNUM,* FROM shopOrder where receiveName like '%%' and memberId = 1)t WHERE t.ROWNUM > 0 AND t.ROWNUM <= 10

select COUNT(*) from shopOrder where receiveName like '%%' and memberId = 1

--������Ϣ��ϸ��

insert into detailOrder(orderId,goodsId,price,number) values(1,1,1,1)

delete from detailOrder where detailOrderId = 1

select detailOrderId,orderId,goodsId,price,number from detailOrder

select detailOrderId,orderId,goodsId,price,number FROM (SELECT ROW_NUMBER() OVER ( ORDER BY detailOrderId ASC) AS ROWNUM,* FROM detailOrder where orderId = 3)t WHERE t.ROWNUM > 0 AND t.ROWNUM <= 10

select COUNT(*) from detailOrder

--����Ա��Ϣ��

select managerId,managerName,managerPwd from manager

insert into manager(ManagerName,managerPwd) values('admin','admin')


update introduce set caption='images/introduce/intro.png'