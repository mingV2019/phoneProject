<%@page import="com.utils.variable"%>
<%@page import="com.bean.SuperType"%>
<%@page import="com.bean.Introduce"%>
<%@page import="com.bean.Goods"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:useBean id="dao" scope="page" class="com.service.impl.GoodsServiceDaoImpl" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主页</title>
<link rel="stylesheet" href="<%=basePath%>front/css/basic.css" />
<link rel="stylesheet" href="<%=basePath%>front/css/css.css" />
<link rel="shortcut icon" href="<%=basePath%>front/bitbug_favicon.ico" />
<link rel="stylesheet" href="<%=basePath%>front/css/normalize.css" />
<script type="text/javascript" src="<%=basePath%>front/js/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>front/js/js.js"></script>
<!--瀑布流效果-->
<script type="text/javascript" src="<%=basePath%>front/js/js/notification.js"></script>
<script type="text/javascript" src="<%=basePath%>front/js/js/bigimg.js"></script>
<script type="text/javascript" src="<%=basePath%>front/js/js/jquery.lazyload.min.js"></script>
<script type="text/javascript" src="<%=basePath%>front/js/js/blocksit.min.js"></script>
<script type="text/javascript" src="<%=basePath%>front/js/js/pubu.js"></script>
<link rel="stylesheet" href="<%=basePath%>front/css/css/bigimg.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>front/css/css/pubu.css" type="text/css"
	media='screen' />
</head>
<body>
	<jsp:include page="common-header.jsp"></jsp:include>
	<!-- 轮播广告及热门商品 -->
	<div class="proBox">
		<div class="banner">
			<div class="banLeft">
				<div class="focus">
					<ul class="rslides f426x240">
						<li><a href="#"><img src="<%=basePath%>images/img1.png" width="750" height="300" /></a></li>
						<li><a href="#"><img src="<%=basePath%>images/img2.png" /></a></li>
						<li><a href="#"><img src="<%=basePath%>images/img3.png" /></a></li>
						<li><a href="#"><img src="<%=basePath%>images/img4.png" /></a></li>
					</ul>
				</div>
				<!--focus/-->
			</div>
			<!--banLeft/-->
			<%List<Goods> goodses0 = dao.getHotGoods(2);
			for(Goods goods : goodses0) {%>
			<div class="banRight">
				<img src="<%=basePath%>images/main/xinpin.jpg" width="195" height="57" />
				<div class="newPhone">
					<a href="<%=basePath%>/front/goodsDetail.jsp?goodsId=<%=goods.getGoodsId()%>">
						<img src="<%=basePath%><%=goods.getPicture()%>" width="87"height="163" /></a>
				</div>
				<div class="phonePar">
					<span><%=goods.getGoodsName()%></span><br/> <strong class="cheng">￥<%=goods.getNowPrice()%></strong>
					<span class="hui">￥<%=goods.getPrice()%></span>
				</div>
				
				<!---->
			</div>
			<%}%>
			<!--banRight/-->
		</div>
		<!-- //轮播广告及热门商品  -->
		<!-- 最新上架及打折商品展示 -->
		<div class="bao">
			<div class="baobox">
				<h3 class="section-tit2">最新上架</h3>
				<ul class="bao-goodslist clear">
					<!-- 循环显示最新上架商品 ：添加12条商品信息-->
					<%
						List<Goods> goodses1 = dao.getNewGoodsAll();
							for (Goods goods : goodses1) {
								Introduce intro = dao.getIntroduceByGoodsId(goods.getGoodsId());
					%>
					<li><a href="<%=basePath%>/front/goodsDetail.jsp?goodsId=<%=goods.getGoodsId()%>" target="_blank">
							<p class="goods-label goods-label1">新品</p>
							<p class="goods-tit"><%=goods.getGoodsName()%></p>
							<div class="imgbox">
								<img src="<%=basePath%><%=goods.getPicture()%>"
									alt="<%=goods.getGoodsName()%>" />
							</div>
							<p class="goods-desc"><%=intro.getCpu()%> <%=intro.getFront_camera()%></p>
							<p class="goods-price">
								市场价 <span class="mallprice"><%=goods.getPrice()%>元</span> <span
									class="lownum">直降<i><%=goods.getPrice()-goods.getNowPrice()%></i>元
								</span>
							</p>
							<p class="goods-handprice">剁手价￥<%=goods.getNowPrice()%></p>
					</a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
		<!-- //最新上架及打折商品展示 -->
		<div class="bao">
			<div class="baobox">
				<h3 class="section-tit2">打折出售</h3>
				<ul class="bao-goodslist clear">
					<!-- 循环显示最新上架商品 ：添加12条商品信息-->
					<%
						List<Goods> goodses2 = dao.getDiscountAll();
						for (Goods goods : goodses2) {
							Introduce intro = dao.getIntroduceByGoodsId(goods.getGoodsId());
					%>
					<li><a href="<%=basePath%>/front/goodsDetail.jsp?goodsId=<%=goods.getGoodsId()%>" target="_blank">
							<p class="goods-label goods-label1">打折</p>
							<p class="goods-tit"><%=goods.getGoodsName()%></p>
							<div class="imgbox">
								<img src="<%=basePath%><%=goods.getPicture()%>"
									alt="<%=goods.getGoodsName()%>" />
							</div>
							<p class="goods-desc"><%=intro.getCpu()%> <%=intro.getFront_camera()%></p>
							<p class="goods-price">
								市场价 <span class="mallprice"><%=goods.getNowPrice()%>元</span> <span
									class="lownum">直降 <i><%=goods.getNowPrice() - goods.getNowPrice()%></i>元
								</span>
							</p>
							<p class="goods-handprice">
								剁手价￥<%=goods.getNowPrice()%></p>
					</a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
		<!-- //最新上架及打折商品展示 -->
		<!-- 专区 -->
		<%List<SuperType> supers = dao.getSuperTypeAll();
			for(SuperType superType : supers) {
		%>
		<div class="hitem item4 flower">
			<h3 class="itemtitle itemtitle4 clear">
				<span class="big">F5</span> <span class="big2"><%=superType.getTypeName()%>专区</span> <span
					class="sml sml4"><%=superType.getTypeName()%> 年年换新机</span>
			</h3>
			<div class="ulbox">
				<ul class="GoodsList clear">
					<%List<Goods> goodses3 = dao.getGoodsBySuperID(superType.getSuperId(), 0, variable.PAGECOUNT);
					for(Goods goods : goodses3) {
						Introduce intro = dao.getIntroduceByGoodsId(goods.getGoodsId());
					%>
					<li><a target="_blank" href="<%=basePath%>/front/goodsDetail.jsp?goodsId=<%=goods.getGoodsId()%>">
							<div class="imgbox">
								<img src="<%=basePath%><%=goods.getPicture()%>" alt="">
							</div>
							<p class="goodsinfo"><%=goods.getGoodsName()%></p>
							<p class="goodsdesc"><%=intro.getCpu()%> <%=intro.getFront_camera()%></p>
							<p class="goodsprice clear">
								￥<span><%=goods.getNowPrice()%></span> <span class="text">立即抢购</span>
							</p>
							<div class="hide">
								<div class="hidebox">
									<p class="goodsinfo"><%=goods.getGoodsName()%></p>
									<p class="goodsdesc"><%=intro.getCpu()%> <%=intro.getFront_camera()%></p>
								</div>
							</div>
					</a></li>
				<%}%>
				</ul>
			</div>
		</div>
		<%} %>
	</div>
	<!--proBox-->
	<!-- 版权栏 -->
	<jsp:include page="common-footer.jsp"></jsp:include>
	<!-- //版权栏 -->
	<script type="text/javascript">
		$('#shouji').addClass('on').siblings().removeClass('on');
		$(".GoodsList li").hover(function() {
			$(this).find(".hide").stop().css({
				height : 192,
				opacity : 1
			});
		}, function() {
			$(this).find(".hide").stop().css({
				height : 0,
				opacity : 0
			});
		});
		//louti
		$(".flowerslist li").hover(function() {
			//鼠标滑上去
			$(this).addClass("hover");
		}, function() {
			//鼠标移开
			$(this).removeClass("hover");
		});
		//鼠标点击
		var mark = 1;
		$(".flowerslist li").click(function() {
			mark = 2; //改变标记
			$(this).addClass("on").siblings().removeClass("on");
			//点击右边导航 然后跳到指定的楼层
			var $index = $(this).index(); //到了对应的序列号
			//alert($index);
			var $top = $(".flowersbox .flower").eq($index).offset().top; //获取制定div与浏览器上面的距离
			//alert($top);
			$("body,html").animate({
				scrollTop : $top
			}, 500, function() {
				mark = 1;
			}); //浏览器滚动的高度
		});
		//浏览器窗口滚动事件
		$(window).scroll(
				function() {
					var $t = $(this).scrollTop(); //获取滚动条滚动的高度
					if ($t < 173) {
						$(".flowerslist").hide();
					} else {
						$(".flowerslist").show();
					}
					if (mark == 1) {
						var $obj = $(".flowersbox .flower");
						//循环每一个div 然后找到最先满足条件的那个 div
						$obj.each(function() {
							var $index = $(this).index();
							//楼层与浏览器上面的高度
							var $height = $obj.eq($index).offset().top
									+ $(this).height() / 2;
							if ($t < $height) {
								$(".flowerslist li").eq($index).addClass("on")
										.siblings().removeClass("on");
								return false;
							}
						});
					}
				});
	</script>
</body>
</html>