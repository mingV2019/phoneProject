<%@page import="com.bean.Introduce"%>
<%@page import="com.bean.Goods"%>
<%@page import="com.dao.impl.OrderDaoImpl"%>
<%@page import="com.dao.OrderDao"%>
<%@page import="com.bean.CartItem"%>
<%@page import="com.bean.Cart"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	int money = 0, count = 0, number = 0;
	OrderDao Odao = new OrderDaoImpl();
	Cart cart = (Cart) request.getSession().getAttribute("cart");
	String message = cart == null || cart.getCount() == 0 ? "购物车为空" : "";
	if ("".equals(message))
		money = cart.getTotal();
	if (cart == null)
		count = 0;
	else
		count = cart.getCount();
%>
<jsp:useBean id="dao" scope="page" class="com.service.impl.GoodsServiceDaoImpl" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>核对订单</title>
<link type="text/css" href="css/css.css" rel="stylesheet" />
<link rel="shortcut icon" href="bitbug_favicon.ico" />
<link rel="stylesheet" href="css/normalize.css" />
<script type="text/javascript" src="js/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/js.js"></script>

</head>
<body>
	<jsp:include page="common-header.jsp"></jsp:include>
	<div class="car">
		<div class="cont">
			<h4 class="orderTitle">购物清单</h4>
			<table class="orderList">
				<tr>
					<th width="20"></th>
					<th width="430">商品</th>
					<th width="120">单价</th>
					<th width="120">数量</th>
					<th width="120">总金额</th>
					<th> </th>
				</tr>
				<%
					for (CartItem cartItem : cart.getCartItems()) {
							Goods goods = cartItem.getGoods();
							Introduce intro = dao.getIntroduceByGoodsId(goods.getGoodsId());
				%>
				<tr>
					<td> </td>
					<td>
						<dl>
							<dt>
								<a href="<%=basePath%>/front/goodsDetail.jsp?goodsId=<%=goods.getGoodsId()%>">
									<img src="<%=basePath%><%=goods.getPicture() %>" width="85" height="85" /></a>
							</dt>
							<dd>
								<%=goods.getGoodsName() %><br /> <span class="red">有货</span>
							</dd>
							<div class="clears"></div>
						</dl>
					</td>
					<td><strong class="red">￥<%=goods.getNowPrice()%></strong></td>
					<td>
						<div class="jia_jian">
							<%=cartItem.getQuantity() %>
						</div>
					</td>
					<td><strong class="red">￥<%=cartItem.getTotal()%></strong></td>
					<td> </td>
				</tr>
				<%} %>
			</table>
			<h4 class="orderTitle">收货地址</h4>
			<form id="goodsform" name="goodsform" method="post">
			<table class="orderList">
				<tr>
					<td> </td>
					<td width="50%">
						<dl>
							<dt>
								<a href="proinfo.html"><img src="<%=basePath%>images/main/pp.jpg"
									width="85" height="85" /></a>
							</dt>
							<dd>
								收件人姓名：<br /> <span class="red"></span>
							</dd>
							<div class="clears"></div>
						</dl>
					</td>
					<td>
						<div class="jia_jian">
							<input type="text" class="shuliang" value="" id="recevieName" name="recevieName" />
						</div>
					</td>
				</tr>
				<tr>
					<td> </td>
					<td width="50%">
						<dl>
							<dt>
								<a href="proinfo.html"><img src="<%=basePath%>images/main/pp.jpg"
									width="85" height="85" /></a>
							</dt>
							<dd>
								收货人手机：<br /> <span class="red"></span>
							</dd>
							<div class="clears"></div>
						</dl>
					</td>
					<td>
						<div class="jia_jian">
							<input type="text" class="shuliang" value="" id="tel" name="tel" />
						</div>
					</td>
				</tr>
				<tr>
					<td> </td>
					<td width="50%">
						<dl>
							<dt>
								<a href="proinfo.html"><img src="<%=basePath%>images/main/pp.jpg"
									width="85" height="85" /></a>
							</dt>
							<dd>
								收货人地址：<br /> <span class="red"></span>
							</dd>
							<div class="clears"></div>
						</dl>
					</td>
					<td>
						<div class="jia_jian">
							<input type="text" class="shuliang" value="" id="address" name="address" />
						</div>
					</td>
				</tr>
				<tr>
					<td> </td>
					<td width="50%">
						<dl>
							<dt>
								<a href="proinfo.html"><img src="<%=basePath%>images/main/pp.jpg"
									width="85" height="85" /></a>
							</dt>
							<dd>
								备注：<br /> <span class="red"></span>
							</dd>
							<div class="clears"></div>
						</dl>
					</td>
					<td>
						<div class="jia_jian">
							<input type="text" class="shuliang" value="" id="remark" name="remark" />
						</div>
					</td>
				</tr>
				<tr>
					<td> </td>
					<td width="50%">
						商品总价：
					</td>
					<td>
						<strong class="red"><%=cart.getTotal()%></strong>
					</td>
				</tr>
			</table>
			</form>
			<input type="hidden" value="<%=message%>" id="message" name="message" />
			<a href="javascript:zhifu();"><img src="<%=basePath%>images/main/tijao.png" width="142" height="32" />
			</a>
			<!--zongjia/-->
			<div class="clears"></div>
		</div>
		<!--cont/-->
	</div>
	<jsp:include page="common-footer.jsp"></jsp:include>
	<script type="text/javascript">
	function zhifu() {
		
		var message = document.getElementById('message').value;
		if(message != "") {
			alert("请添加物品至购物车");
			return;
		}
		
		//验证收货人姓名
		if ($('#recevieName').val() == "") {
			alert('收货人姓名不能为空！');
			return;
		}
		//验证收货人手机
		if ($('#tel').val() == "") {
			alert('收货人手机不能为空！');
			return;
		}
		//验证手机号是否合法
		if (isNaN($('#tel').val())) {
			alert("手机号请输入数字");
			return;
		}
		//验证收货人地址
		if ($('#address').val() == "") {
			alert('收货人地址不能为空！');
			return;
		}
		
		document.getElementById('goodsform').action="<%=basePath%>orderservlet?action=addOrder";
		document.getElementById('goodsform').submit();
	}
</script>
</body>
</html>