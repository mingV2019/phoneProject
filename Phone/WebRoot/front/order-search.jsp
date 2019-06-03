<%@page import="com.bean.Member"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%Member member = (Member)request.getSession().getAttribute("memberSession");%>
<div class="hrader" id="header">
	<div class="top">
		<%if(member == null) {%>
			<a href="<%=basePath%>front/login.jsp" style="color:#C94E13;">请登录</a>
			<a href="<%=basePath%>front/register.jsp">注册</a>
			<%}else { %>
				您好，<%=member.getUserName()%>
				&nbsp; &nbsp;<a href="<%=basePath%>front/modifyMember.jsp">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="<%=basePath%>memberservlet?action=destroy">退出</a>
			<%}%>
			<ul class="topNav">
				<li class="kefus"><a href="#">联系客服</a></li>
				<li><a href="#" class="lan">中文</a></li>
				<li><a href="#" class="lan">English</a></li>
				<div class="clears"></div>
			</ul>
		<!--topNav/-->
	</div>
	<!--top/-->
</div>
<!--hrader/-->
<div class="mid">
	<h1 class="logo" style="text-align:left;">
		<a href="<%=basePath%>goodsinfoservlet?action=indexGoods"><img src="<%=basePath%>images/main/dingzhi.jpg" width="304" height="74" /></a>
	</h1>
	<form action="<%=basePath%>orderservlet?action=showShopOrder" method="post" class="subBox">
		<div class="subBox2">
			<input type="text" name="searchword" class="subText"/> 
				<input type="image" src="<%=basePath%>images/main/sub.jpg" width="95" height="32" class="subImg" />
			<!--hotci/-->
		</div>
		<!--subBox2/-->
	</form>
	<!--subBox/-->
	<div class="ding-gou">
		<%if(member!=null) {%>
		<div class="ding">
			<a href="<%=basePath%>orderservlet?action=showShopOrder">
				<img src="<%=basePath%>images/main/dingdan.jpg" width="106" height="32" />
			</a>
		</div>
		<div class="gou">
			<a href="<%=basePath%>front/cart_see.jsp">
				<img src="<%=basePath%>images/main/gouwuche.jpg" width="126" height="32" />
			</a>
		</div>
		<%}else{ %>
		<div class="ding">
			<a href="<%=basePath%>front/login.jsp">
				<img src="<%=basePath%>images/main/dingdan.jpg" width="106" height="32" />
			</a>
		</div>
		<div class="gou">
			<a href="<%=basePath%>front/login.jsp">
				<img src="<%=basePath%>images/main/gouwuche.jpg" width="126" height="32" />
			</a>
		</div>
		<%}%>
		
		<div class="clears"></div>
	</div>
</div>
<!--mid-->
<div class="nav-top">
	<ul>
		<li><a href="<%=basePath%>goodsinfoservlet?action=indexGoods"> <span>首页</span>
		</a></li>
		<li><a href="<%=basePath%>manager/login_M.jsp"> <span>后台</span>
		</a></li>
		<li><a href="#"> <span>帮助与反馈</span>
		</a></li>
		<li><a href="#"> <span>会员中心</span>
		</a></li>
	</ul>
</div>