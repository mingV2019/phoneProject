<%@page import="com.bean.DetailOrder"%>
<%@page import="com.bean.PageInfo"%>
<%@page import="com.bean.ShopOrder"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>
<%
	int orderId = (Integer)request.getAttribute("orderId");
	List<DetailOrder> detailOrders = (List<DetailOrder>)request.getAttribute("detailOrders");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>我的购物车-51商城</title>
<link rel="stylesheet" href="<%=basePath%>front/css/mr-01.css" type="text/css">
<link type="text/css" href="<%=basePath%>front/css/css.css" rel="stylesheet" />
<link rel="shortcut icon" href="<%=basePath%>front/bitbug_favicon.ico" />
<script type="text/javascript" src="<%=basePath%>front/js/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>front/js/js.js"></script>

<script type="text/javascript">
	function altRows(id){
		if(document.getElementsByTagName){  
			
			var table = document.getElementById(id);  
			var rows = table.getElementsByTagName("tr"); 
			 
			for(i = 0; i < rows.length; i++){          
				if(i % 2 == 0){
					rows[i].className = "evenrowcolor";
				}else{
					rows[i].className = "oddrowcolor";
				}      
			}
		}
	}
	 
	window.onload=function(){
		altRows('alternatecolor');
	}
</script>
<style type="text/css">
	table.altrowstable {
		font-family: verdana,arial,sans-serif;
		font-size:11px;
		color:#333333;
		border-width: 1px;
		border-color: #a9c6c9;
		border-collapse: collapse;
	}
	table.altrowstable th {
		border-width: 1px;
		padding: 8px;
		border-style: solid;
		border-color: #a9c6c9;
	}
	table.altrowstable td {
		border-width: 1px;
		padding: 8px;
		border-style: solid;
		border-color: #a9c6c9;
	}
	.oddrowcolor{
		background-color:#d4e3e5;
	}
	.evenrowcolor{
		background-color:#c3dde0;
	}
</style>

</head>

<body>
	<jsp:include page="/front/order-search.jsp" />
	<!-- //网站头部 -->
	<center>
	<h1>我的订单</h1>	
	<table class="altrowstable" id="alternatecolor">
		<tr>
			<th>货物图片</th>
			<th>序号</th>
			<th>订单号</th>
			<th>货物名称</th>
			<th>货物单价</th>
			<th>货物数量</th>
			<th>总计</th>
			<th>评价</th>
		</tr>
		<%
			int count = 0;
			for (DetailOrder detailOrder : detailOrders) {
		%>
		<tr>
			<td><img src="<%=basePath%><%=detailOrder.getGoods().getPicture()%>"  style="width: 60px"/></td>
			<td><%=++count%></td>
			<td><%=detailOrder.getShopOrder().getOrderId()%></td>
			<td><%=detailOrder.getGoods().getGoodsName()%></td>
			<td><%=detailOrder.getPrice()%></td>
			<td><%=detailOrder.getNumber()%></td>
			<td><%=detailOrder.getTotal()%></td>
			<td><a href="<%=basePath%>front/receive.jsp?goodsId=<%=detailOrder.getGoods().getGoodsId()%>">评价</a></td>
		</tr>
		<%
			}
		%>
	</table>
	</center>
		<div style="text-align:center;">
			<div class="row pagination" style="display:inlineblock;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="30">当前页数：【<%=pageInfo.getPageThis()%>】&nbsp;&nbsp;
							<a href="<%=basePath%>pageservlet?pageThis=1&&action=detailOrder&&orderId=<%=orderId%>">第一页</a>
							<a href="<%=basePath%>pageservlet?pageThis=<%=pageInfo.getPageThis() - 1%>&&action=detailOrder&&orderId=<%=orderId%>">上一页</a>
							&nbsp;&nbsp;&nbsp;&nbsp;共【<%=pageInfo.getRecordCount()%>】条数据&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="<%=basePath%>pageservlet?pageThis=<%=pageInfo.getPageThis() + 1%>&&action=detailOrder&&orderId=<%=orderId%>">下一页</a>
							<a href="<%=basePath%>pageservlet?pageThis=<%=pageInfo.getPageTotal()%>&&action=detailOrder&&orderId=<%=orderId%>">最后一页&nbsp;</a>
							&nbsp;&nbsp;共【<%=pageInfo.getPageTotal()%>】页
						</td>
					</tr>
				</table>
			</div>
		</div>
		<br /> <br />
		<!-- //显示订单列表 -->
	<!-- 版权栏 -->
	<jsp:include page="/front/common-footer.jsp" />
	<!-- //版权栏 -->
</body>
</html>
