<%@page import="com.bean.Introduce"%>
<%@page import="com.bean.SubType"%>
<%@page import="com.bean.PageInfo"%>
<%@page import="com.bean.Goods"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	String type = (String) request.getAttribute("type");
	type = type == null ? "" : type;
	String action = (String) request.getAttribute("action");
	String superId = (String) request.getAttribute("superId");
	String subId = (String) request.getAttribute("subId");
	String searchword = (String) request.getAttribute("searchword");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	List<Goods> goodses = (List<Goods>) request.getAttribute("goodses");
%>
<jsp:useBean id="dao" scope="page" class="com.service.impl.GoodsServiceDaoImpl" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>商品信息</title>
<link rel="stylesheet" href="<%=basePath%>front/css/css.css">
<link rel="stylesheet" href="<%=basePath%>front/css/normalize.css" />
<link rel="shortcut icon" href="<%=basePath%>front/bitbug_favicon.ico" />
<script type="text/javascript"
	src="<%=basePath%>front/js/js/jquery-1.9.1.min.js"></script>
</head>
<body>
	<jsp:include page="common-header.jsp"></jsp:include>
	<!-- collect开始 -->
	<div class="collectcart clear">
		<div class="col-con">
			<div class="bao">
				<div class="baobox">
					<h3 class="section-tit2">商品信息</h3>
					<ul class="bao-goodslist clear">
						<%
							for (Goods goods : goodses) {
								Introduce intro = dao.getIntroduceByGoodsId(goods.getGoodsId());
						%>
						<li>
							<a href="<%=basePath%>/front/goodsDetail.jsp?goodsId=<%=goods.getGoodsId()%>" target="_blank">
							<p class="goods-label goods-label1">商品信息</p>
							<p class="goods-tit"><%=goods.getGoodsName()%></p>
							<div class="imgbox">
								<img src="<%=basePath%><%=goods.getPicture()%>"
									alt="<%=goods.getGoodsName()%>" />
							</div>
							<p class="goods-desc"><%=intro.getCpu()%><%=intro.getFront_camera()%></p>
							<p class="goods-price">市场价 
								<span class="mallprice"><%=goods.getNowPrice()%>元</span> 
								<span class="lownum">直降 <i><%=goods.getNowPrice() - goods.getNowPrice()%></i>元</span>
							</p>
							<p class="goods-handprice">剁手价￥<%=goods.getNowPrice()%></p>
						</a></li>
						<%
							}
						%>
					</ul>
					<div style="text-align:center;">
						<div class="row pagination" style="display:inlineblock;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td height="30">当前页数：【<%=pageInfo.getPageThis()%>】&nbsp;&nbsp;
										<a
										href="<%=basePath%>pageservlet?pageThis=1&&action=<%=action%>&&type=<%=type%>&&searchword=<%=searchword%>">第一页</a>
										<a
										href="<%=basePath%>pageservlet?pageThis=<%=pageInfo.getPageThis()-1%>&&action=<%=action%>&&type=<%=type%>&&searchword=<%=searchword%>">上一页</a>
										&nbsp;&nbsp;&nbsp;&nbsp;共【<%=pageInfo.getRecordCount()%>】条数据&nbsp;&nbsp;&nbsp;&nbsp;
										<a
										href="<%=basePath%>pageservlet?pageThis=<%=pageInfo.getPageThis()+1%>&&action=<%=action%>&&type=<%=type%>&&searchword=<%=searchword%>">下一页</a>
										<a
										href="<%=basePath%>pageservlet?pageThis=<%=pageInfo.getPageEnd()%>&&action=<%=action%>&&type=<%=type%>&&searchword=<%=searchword%>">最后一页&nbsp;</a>
										&nbsp;&nbsp;共【<%=pageInfo.getPageTotal()%>】页
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="common-footer.jsp"></jsp:include>
</body>
</html>