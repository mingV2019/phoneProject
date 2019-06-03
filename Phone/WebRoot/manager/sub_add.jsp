<%@page import="com.bean.SuperType"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:useBean id="dao" scope="page" class="com.service.impl.GoodsServiceDaoImpl"></jsp:useBean>
<%
	List<SuperType> superTypes = dao.getSuperTypeAll();
%>
<html>
<head>
<title>手机商城――后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=basePath%>manager/CSS/style.css" rel="stylesheet">
</head>
<script language="javascript">
	function mycheck() {
		if (form1.typeName.value == "") {
			alert("请输入小分类名称！");
			form1.typename.focus();
			return;
		}
		form1.submit();
	}
</script>
<body>
	<jsp:include page="banner.jsp" />
	<table width="1280" height="288" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
		<tr>
			<td align="center" valign="top">
			<table width="100%" border="0" cellspacing="0">
					<tr>
						<td width="10" height="38" align="right">&nbsp;</td>
						<td colspan="3" class="tableBorder_B_dashed"><img src="<%=basePath%>manager/images/manage_ico1.GIF" width="11" height="11">&nbsp;
							<a href="<%=basePath%>manager/superType.jsp">[大分类信息管理]</a>
						</td>
						<td width="12">&nbsp;</td>
					</tr>
					<tr>
						<td align="right">&nbsp;</td>
						<td height="10" colspan="3">&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td height="29" align="right">&nbsp;</td>
						<td width="10" background="<%=basePath%>manager/images/manage_leftTitle_left.GIF">&nbsp;</td>
						<td width="1089" align="center" background="<%=basePath%>manager/images/manage_leftTitle_mid.GIF" class="word_white">
							<b>添加大分类信息</b>
						</td>
						<td width="10" background="<%=basePath%>manager/images/manage_leftTitle_right.GIF">&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
				<form action="<%=basePath%>goodsinfoservlet?action=insertSubType" method="post" name="form1">
					<table width="94%" border="0" align="right" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
						<tr>
							<td height="50">选择所属分类：</td>
							<td height="50">
								<select name="superInfo" id="superInfo">
									<%for(SuperType superType : superTypes) {%>
									<option value="<%=superType.getSuperId()%>"><%=superType.getTypeName()%></option>
									<%}%>
								</select>
							</td>
						</tr>
						<tr>
							<td height="50">输入小分类名称：</td>
							<td height="50"><input type="text" name="typeName" id="typeName" value=""></td>
						</tr>
						<tr>
							<td width="16%" height="82">&nbsp;</td>
							<td width="84%" height="82">&nbsp;</td>
						</tr>
						<tr align="center">
							<td height="38" colspan="3">
								<input name="Button" type="button" class="btn_bg_short" value="保存" onClick="mycheck()"> &nbsp; 
								<input name="Submit2" type="reset" class="btn_bg_short" value="重置"> &nbsp; 
								<input name="Submit3" type="button" class="btn_bg_short" value="返回" 
								onClick="JScript:window.location.href='<%=basePath%>manager/superType.jsp';">
							</td>
						</tr>
					</table>
				</form> 
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
