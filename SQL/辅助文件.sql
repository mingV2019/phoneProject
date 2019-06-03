use Phone

if (exists(select * from  sys.objects where name='GetGoodsByPage'))
     drop proc GetGoodsByPage
go 
create proc GetGoodsByPage 
	 @goodsName varchar(200),
     @startIndex int,
     @endIndex int
 as
 begin 
     select goodsId,subId,goodsName,price,nowprice,picture,InTime,hit FROM (SELECT ROW_NUMBER() OVER ( ORDER BY nowPrice asc) AS ROWNUM,* FROM goods where goodsName like @goodsName)t WHERE t.ROWNUM > @startIndex AND t.ROWNUM <=@endIndex
 end
 go

if (exists(select * from  sys.objects where name='GetOrderByPage'))
     drop proc GetOrderByPage
go 
create proc GetOrderByPage 
	@goodsName varchar(200),
	@memberId int,
    @startIndex int,
    @endIndex int
 as
 begin 
     select orderId,bnumber,total,receiveName,addresses,tel,orderDate,remark,memberId FROM (SELECT ROW_NUMBER() OVER ( ORDER BY orderId ASC) AS ROWNUM,* FROM shopOrder where receiveName like @goodsName and memberId = @memberId)t WHERE t.ROWNUM > @startIndex AND t.ROWNUM <= @endIndex 
 end
 go

 create trigger trig_insert
 on goods
 after insert
 as
 begin
	declare @goodsId int;
	select @goodsId = MAX(goodsId) from goods
	insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) 
	values (@goodsId,0,'未知','未知֪','未知֪','未知','未知','未知','未知','未知','未知','未知','未知','')
 end

 CREATE RULE date_rule AS @InTime between '1900-01-01' and getdate()

create index GoodsInfoIndex on goods(goodsName)

use Phone
create login user1 with password='123456', default_database=Phone
create user user1 for login user1 with default_schema=user1
exec sp_addrolemember 'db_owner', 'user1'
GRANT INSERT ON phone.goods TO user1