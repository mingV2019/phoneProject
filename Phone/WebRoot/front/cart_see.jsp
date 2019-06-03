<%@page import="com.bean.Introduce"%>
<%@page import="com.bean.Goods"%>
<%@page import="com.dao.impl.OrderDaoImpl"%>
<%@page import="com.dao.OrderDao"%>
<%@page import="com.bean.CartItem"%>
<%@page import="com.bean.Cart"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	String message = cart == null || cart.getCount() == 0 ? "购物车为空"
			: "";
	if ("".equals(message))
		money = cart.getTotal();
	if (cart == null)
		count = 0;
	else
		count = cart.getCount();
%>
<jsp:useBean id="dao" scope="page" class="com.service.impl.GoodsServiceDaoImpl" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的购物车</title>
<link type="text/css" href="<%=basePath%>front/css/css.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="<%=basePath%>front/css/buyinfo-css/common.css" />
<link rel="stylesheet" href="<%=basePath%>front/css/normalize.css" />
<link rel="shortcut icon" href="<%=basePath%>front/bitbug_favicon.ico" />
<!-- <script type="text/javascript" src="js/js/jquery-1.9.1.min.js"></script> -->

<script type="text/javascript" src="<%=basePath%>front/js/js.js"></script>
</head>
<body>
	<jsp:include page="common-header.jsp"></jsp:include>
	<div class="car">
		<div class="cont">
			<div class="carImg">
				<img src="<%=basePath%>images/main/car1.jpg" width="951" height="27" />
			</div>
			<div class="py-container goods-all">
				<%
					if ("".equals(message) == false) {
						out.println("<tr><td colspan='5' align='center'>" + message
								+ "</tr></td>");
					} else {
				%>
				<h4 class="all">
					全部商品 <span id="category_num"><%=count%></span>
				</h4>
				<table cellspacing="0" cellpadding="0" border="0" width="100%">
					<thead>
						<tr>
							<th width="10%"> </th>
							<th width="10%">商品图片</th>
							<th width="40%">商品描述</th>
							<th width="10%">单价（元）</th>
							<th width="10%">数量</th>
							<th width="10%">小计（元）</th>
							<th width="10%">操作</th>
						</tr>
					</thead>
					<tbody>
					<%
						for (CartItem cartItem : cart.getCartItems()) {
								Goods goods = cartItem.getGoods();
								Introduce intro = dao.getIntroduceByGoodsId(goods.getGoodsId());
					%>
					<tr>
						<td> </td>
						<td>
							<div class="good-item" style="float: auto 0;">
								<div class="item-img">
									<img src="<%=basePath%><%=goods.getPicture()%>" />
								</div>
							</div>
						</td>
						<td>
							<div class="good-item" style="float: auto 0;">
								<div class="item-msg"><%=goods.getGoodsName()%>
									<%=intro.getColor()%>（<%=intro.getCpu()%>）处理器/<%=intro.getMemory()%>内存
								</div>
							</div>
						</td>
						<td><span class="price"><%=goods.getNowPrice()%></span></td>
						<td>
							<div class="clearfix have">
								<div>
									<a href="<%=basePath%>cartservlet?action=saveCart&&method=sub&&number=<%=number%>" class="increment mins" type="mins"
										style="background-color: rgb(204, 204, 204); color: rgb(255, 255, 255); float: left;">-</a>
									<input autocomplete="off" type="text" value="<%=cartItem.getQuantity()%>" minnum="1" class="itxt">
									<a href="<%=basePath%>cartservlet?action=saveCart&&method=add&&number=<%=number%>" class="increment plus" type="plus"
										style="float: right;background-color: rgb(204, 204, 204); color: rgb(255, 255, 255);">+</a>
								</div>
								<input type="hidden" id="goodsId<%=count%>" name="goodsId<%=count%>" value="<%=cartItem.getGoods().getGoodsId()%>"/>
								<div class="youhuo">有货</div>
							</div>
						</td>
						<td><span class="sum"><%=cartItem.getTotal()%></span></td>
						<td>
							<div>
								<a type="delBtn" href="<%=basePath%>cartservlet?action=deleteCart&&goodsId=<%=goods.getGoodsId()%>">删除</a>
							</div>
							<div>
								<a href="#">移到我的关注</a>
							</div>
						</td>
					</tr>
					<%
						number++;}
					%>
					</tbody>
				</table>
				<div class="cart-tool clearfix">
					<div class="cart-tool-left clearfix fl">
						<a id="delAllBtn" href="<%=basePath%>cartservlet?action=clearCart">删除全部商品</a>
					</div>
					<div class="money-box" style="float: right;">
						<div class="sumprice"
							style="line-height: 26px; text-align: center">
							<div class="sumprice-top">
								<span>已选择 <strong id="totalNum">0</strong> 件商品
								</span> <span> <em style="text-align: right">总价（不含运费）：</em> <i
									id="totalPrice" class="summoney">¥<%=money%></i>
								</span>
							</div>
						</div>
						<div class="sumbtn">
							<a class="sum-btn" href="<%=basePath%>front/order.jsp">结算</a>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<jsp:include page="common-footer.jsp"></jsp:include>
</body>
</html>