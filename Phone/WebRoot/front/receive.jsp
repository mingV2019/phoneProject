<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>
<%String goodsId = request.getParameter("goodsId"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>用户评论</title>
<link type="text/css" href="<%=basePath%>front/css/css.css" rel="stylesheet" />
<script type="text/javascript" src="<%=basePath%>front/js/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>front/js/js.js"></script>
<link rel="shortcut icon" href="<%=basePath%>front/bitbug_favicon.ico" />
</head>
<body>
	<jsp:include page="/front/common-header.jsp" />
	<form action="<%=basePath%>goodsinfoservlet?action=addContent" method="post">
	<div class="review-content">
		<div class="review-box">
			<div class="review-box-heading">
				<div class="review-box-heading-title">
					<div class="title-">
						<h3>宝贝评论</h3>
					</div>
				</div>
				<div class="dropbtn" id="dropbtn1">
					<div class="down-shark"></div>
					评论须知
				</div>
				<ul class="review-box-heading-nav">
					<li>卖家：<a href="#">admin</a></li>
					<li><a href="#" style="position: relative;width: auto"><img
							src="<%=basePath%>images/buy/和我联系1.png" height="17" width="73"
							style="position: absolute;top: 1px" ;/></a></li>
				</ul>
				<div id="myDropdown" class="dropdown-content">
					<div class="dropping-">
						<h3>评价须知（2009-2-15开始实行）：</h3>
						<p>请您根据本次交易，给予真实、客观、仔细地评价。您的评价将是其他会员的参考，也将影响卖家的信用。</p>
						<p>
							<strong>累积信用计分规则：</strong>中评不计分，但会影响卖家的好评率，请慎重给予。每个自然月中，相同买家和卖家之间的信用评价计分不超过6分。评价后30天内，您有一次机会删除给对方的中评或差评，或者修改成好评。
						</p>
						<p>
							<strong>动态店铺评分计分规则：</strong>店铺评分是匿名的。每个自然月中，相同买家和卖家之间的店铺评分计分次数不超过3次。店铺评分成功后无法修改。
						</p>
					</div>
				</div>
			</div>
			<div class="review-box-content">
				<div class="review-box-content-top">
					<div class="review-space">
						<div class="review-space-left">
							<div class="review-goods">
								<a href="#"><img src="<%=basePath%>images/buy/huawei.jpg" height="130" width="130" /></a>
								<h5>
									<a href="#">华为 Mate 20 全面屏</a>
								</h5>
							</div>
						</div>
						<div class="review-space-right">
							<div class="review-area">
								<input type="hidden" name="goodsId" id="goodsId" value="<%=goodsId%>"/>
								<textarea name="content" id="content" rows="7" cols="80" placeholder="亲，写一下评价吧！"></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="review-box-submit">
				<input class="review-box-button" type="submit" value="发表评论">
			</div>
		</div>
	</div>
	</form>
	<jsp:include page="/front/common-footer.jsp" />
</body>
<script>
	window.onload = function() {
		var droptn = document.getElementById("dropbtn1");
		droptn.onmouseenter = function() {
			myFunction();
		}
	}
	/* 下拉框 显示/隐藏 之间切换 */
	function myFunction() {
		document.getElementById("myDropdown").classList.toggle("show");
	}
	// 点击下拉框意外区域隐藏
	window.onclick = function(event) {
		if (!event.target.matches('.dropbtn')) {
			var dropdowns = document.getElementsByClassName("dropdown-content");
			var i;
			for (i = 0; i < dropdowns.length; i++) {
				var openDropdown = dropdowns[i];
				if (openDropdown.classList.contains('show')) {
					openDropdown.classList.remove('show');
				}
			}
		}
	}
	function starselect(act, fstar) { //onload 事件会在页面或图像加载完成后立即发生。
		var oAct = document.getElementById(act);
		var aStar = oAct.getElementsByTagName('b');
		var oTxt = document.getElementById(fstar);
		var aText = [ '非常差', '一般', '过得去', '很好', '不能再好了' ];
		var bOn = false;
		/*var html="<div id=\"Sharpbox\">\n" +
				"    <div class=\"triangle\"></div>\n" +
				"    <div class=\"triangle_outer\"></div>\n" +
				"    <span id=\"wenben\"></span>\n" +
		"</div>";*/
		for ( var i = 0; i < aStar.length; i++) {
			aStar[i].index = i;
			setStar(aStar[i]);
		}
		function setStar(li) {
			li.onmouseenter = function() { //onmouseenter 事件在鼠标指针移动到元素上时触发。
				if (bOn == false) {
					for ( var i = 0; i <= li.index; i++) {
						aStar[i].classList.remove('star-off');//移除元素的star-off样式
						aStar[i].classList.add('star-on');//修改元素的样式为star-on
					}
					oTxt.innerHTML = aText[li.index];
				}
			}
			li.onmouseleave = function() { //onmouseleave 事件在鼠标移除元素时触发
				if (bOn == false) {
					for ( var i = 0; i <= li.index; i++) {
						aStar[i].classList.remove('star-on');
						aStar[i].classList.add('star-off');
					}
					oTxt.innerHTML = '';
				}
			}
			li.onclick = function() { //onclick 事件会在元素被点击时发生。
				for ( var i = 0; i <= li.index; i++) {//改进
					aStar[i].classList.remove('star-off');
					aStar[i].classList.add('star-on');
				}
				oTxt.innerHTML = aText[li.index];
				bOn = true;
			}
		}
	}
</script>
</html>