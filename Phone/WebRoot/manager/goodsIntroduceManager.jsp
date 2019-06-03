<%@page import="com.bean.Introduce"%>
<%@page import="com.bean.PageInfo"%>
<%@page import="com.bean.Member"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	String action = (String)request.getAttribute("action");
	String searchword = (String)request.getAttribute("searchword");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	List<Introduce> introduces = (List<Introduce>)request.getAttribute("introduces");
%>
<html>
<head>
<title>手机商城――后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=basePath%>manager/CSS/style.css" rel="stylesheet">
<script src="<%=basePath%>manager/JS/check.js"></script>
<script src="<%=basePath%>manager/onclock.JS"></script>
</head>

<body>
	<jsp:include page="/manager/banner.jsp" />
	<table width="1280" height="288" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
		<tr>
			<td align="center" valign="top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td align="right">&nbsp;</td>
						<td height="10" colspan="3">&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td height="29" align="right">&nbsp;</td>
						<td width="10" background="images/manage_leftTitle_left.GIF">&nbsp;</td>
						<td width="1089" align="center" background="<%=basePath%>manager/images/manage_leftTitle_mid.GIF" class="word_white">
							<b>商品详详情列表</b>
						</td>
						<td width="10" background="<%=basePath%>manager/images/manage_leftTitle_right.GIF">&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table> <!---->
				<table width="100%" height="14" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="13" align="center">&nbsp;</td>
					</tr>
				</table>
				<table width="96%" height="48" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#CCCCCC" bordercolorlight="#FFFFFF">
					<tr bgcolor="#eeeeee" align="center">
						<td width="10%" height="27" align="center">序号</td>
						<td width="10%" align="center">内存</td>
						<td width="10%" align="center">品牌</td>
						<td width="10%" align="center">颜色</td>
						<td width="10%" align="center">核数</td>
						<td width="10%" align="center">频率</td>
						<td width="10%" align="center">系统</td>
						<td width="10%" align="center">重量</td>
						<td width="10%" align="center">电池</td>
						<td width="10%" align="center">操作</td>
						<%--<td width="11%" align="center">冻结/解冻</td> --%>
					</tr>
					<!-- 用户信息遍历开始 -->
					<%int count = 1; for(Introduce intro : introduces) {%>
					<tr style="padding:5px;" bgcolor="#eeeeee" align="center">
						<td height="24" align="center">
							<a href="member_detail.jsp?ID=<%=count%>"><%=count%></a>&nbsp;</td>
						<td align="center"><%=intro.getMemory()%>&nbsp;</td>
						<td align="center"><%=intro.getBrand()%>&nbsp;</td>
						<td align="center"><%=intro.getColor()%>&nbsp;</td>
						<td align="center"><%=intro.getCpu()%>&nbsp;</td>
						<td align="center"><%=intro.getRate()%>&nbsp;</td>
						<td align="center"><%=intro.getSystems()%>&nbsp;</td>
						<td align="center"><%=intro.getHeft()%>&nbsp;</td>
						<td align="center"><%=intro.getBattery()%></td>
						<td align="center">
							<a href="<%=basePath%>manager/introduce_edit.jsp?goodsId=<%=intro.getGoods().getGoodsId()%>">修改</a><br>
						</td>
					</tr>
					<%count++;} %>
					<!-- 用户信息遍历结束 -->
				</table>
				<div style="text-align:center;">
					<div class="row pagination" style="display:inlineblock;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="27" align="center">当前页数：[<%=pageInfo.getPageThis()%>]&nbsp; 
								<a href="<%=basePath%>pageservlet?pageThis=1&&action=showGoodsIntroduce">第一页</a>
								<a href="<%=basePath%>pageservlet?pageThis=<%=pageInfo.getPageThis() - 1%>&&action=showGoodsIntroduce">上一页</a>
								&nbsp;&nbsp;&nbsp;&nbsp;共【<%=pageInfo.getRecordCount()%>】条数据&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="<%=basePath%>pageservlet?pageThis=<%=pageInfo.getPageThis() + 1%>&&action=showGoodsIntroduce">下一页</a>
								<a href="<%=basePath%>pageservlet?pageThis=<%=pageInfo.getPageTotal()%>&&action=showGoodsIntroduce">最后一页&nbsp;</a>
								&nbsp;&nbsp;共【<%=pageInfo.getPageTotal()%>】页
								</td>
							</tr>
						</table>
					</div>
				</div>
			</td>
			<td width="182" valign="top">
			<table width="100%" height="431" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="199" valign="top" bgcolor="#FFFFFF">
						<jsp:include page="/manager/navigation.jsp" />
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	<jsp:include page="/manager/copyright.jsp" />
</body>
</html>
