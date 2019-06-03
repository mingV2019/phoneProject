<%@page import="com.bean.Introduce"%>
<%@page import="com.bean.Goods"%>
<%@page import="com.bean.SubType"%>
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
<%int goodsId = Integer.parseInt(request.getParameter("goodsId"));
Introduce introduce = dao.getIntroduceByGoodsId(goodsId);
int superId = dao.getSubTypeById(introduce.getGoods().getSubType().getSubId()).getSuperType().getSuperId();%>
<html>
<head>
<title>手机商城――后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=basePath%>manager/CSS/style.css" rel="stylesheet">
<script language="javascript" src="<%=basePath%>manager/JS/jquery.min.js"></script>
</head>
<script language="javascript">
	function mycheck() {
		if (form1.memory.value == "") {
			alert("请输入内存！");
			form1.picture.focus();
			return false;
		}
		if (form1.brand.value == "") {
			alert("请输入品牌！");
			form1.picture.focus();
			return false;
		}
		if (form1.color.value == "") {
			alert("请输入颜色！");
			form1.picture.focus();
			return false;
		}
		if (form1.distinguishability.value == "") {
			alert("请输入分辨率！");
			form1.picture.focus();
			return false;
		}
		if (form1.front_camera.value == "") {
			alert("请输入前置摄像头！");
			form1.picture.focus();
			return false;
		}
		if (form1.back_camera.value == "") {
			alert("请输入后置摄像头！");
			form1.picture.focus();
			return false;
		}
		if (form1.cpu.value == "") {
			alert("请输入核数！");
			form1.picture.focus();
			return false;
		}
		if (form1.rate.value == "") {
			alert("请输入频率！");
			form1.picture.focus();
			return false;
		}
		if (form1.systems.value == "") {
			alert("请输入系统！");
			form1.picture.focus();
			return false;
		}
		if (form1.heft.value == "") {
			alert("请输入重量！");
			form1.picture.focus();
			return false;
		}
		if (form1.battery.value == "") {
			alert("请输入电池！");
			form1.picture.focus();
			return false;
		}
		if (form1.thickness.value == "") {
			alert("请输入机身厚度！");
			form1.picture.focus();
			return false;
		}
		if (form1.picture.value == "") {
			alert("请输入图片文件的路径！");
			form1.picture.focus();
			return false;
		}
		return true;
	}
</script>

<body>
	<jsp:include page="banner.jsp" />
	<table width="1280" height="288" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
		<tr>
			<td align="center" valign="top">
				<form action="<%=basePath%>goodsinfoservlet?action=updateIntroduceInfo" enctype="multipart/form-data" method="post" name="form1" id="form1" onsubmit="return mycheck();">
					<table width="94%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolordark="#FFFFFF">
						<tr>
							<td width="14%" height="27">&nbsp;商品名称：</td>
							<td height="27" colspan="3">&nbsp;
								<input name="goodsName" type="text" class="Sytle_text" id="goodsName" size="50" readonly="readonly" value="<%=introduce.getGoods().getGoodsName()%>">&nbsp;&nbsp;
								<input name="goodsId" type="hidden" id="goodsId" value="<%=introduce.getGoods().getGoodsId()%>"/>
							</td>
						</tr>
						<tr>
							<td height="27">&nbsp;内存：</td>
							<td width="31%" height="27">&nbsp; 
								<input type="text" class="Sytle_text" name="memory" value="<%=introduce.getMemory()%>"/>
							</td>
							<td width="13%" height="27">&nbsp;品牌：</td>
							<td width="42%" height="27">&nbsp; 
								<select name="brand" class="textarea" id="brand">
								<%List<SuperType> superTypes = dao.getSuperTypeAll();
									for(SuperType superType : superTypes) {%>
									<option value="<%=superType.getTypeName()%>" 
									<%=superType.getSuperId()==superId?"selected":""%>>
										<%=superType.getTypeName()%>
									</option>
									<%} %>
								</select>
							</td>
						</tr>
						<tr>
							<td height="27">&nbsp;颜色：</td>
							<td width="31%" height="27">&nbsp; 
								<input type="text" class="Sytle_text" name="color" value="<%=introduce.getColor()%>"/>
							</td>
							<td width="13%" height="27">&nbsp;分辨率：</td>
							<td width="42%" height="27">&nbsp; 
								<input type="text" class="Sytle_text" name="distinguishability" value="<%=introduce.getDistinguishability()%>"/>
							</td>
						</tr>
						<tr>
							<td height="27">&nbsp;前置摄像头：</td>
							<td width="31%" height="27">&nbsp; 
								<input type="text" class="Sytle_text" name="front_camera" value="<%=introduce.getFront_camera()%>"/>
							</td>
							<td width="13%" height="27">&nbsp;后置摄像头：</td>
							<td width="42%" height="27">&nbsp; 
								<input type="text" class="Sytle_text" name="back_camera" value="<%=introduce.getBack_camera()%>"/>
							</td>
						</tr>
						<tr>
							<td height="27">&nbsp;核数：</td>
							<td width="31%" height="27">&nbsp; 
								<input type="text" class="Sytle_text" name="cpu" value="<%=introduce.getCpu()%>"/>
							</td>
							<td width="13%" height="27">&nbsp;频率：</td>
							<td width="42%" height="27">&nbsp; 
								<input type="text" class="Sytle_text" name="rate" value="<%=introduce.getRate()%>"/>
							</td>
						</tr>
						<tr>
							<td height="27">&nbsp;系统：</td>
							<td width="31%" height="27">&nbsp; 
								<input type="text" class="Sytle_text" name="systems" value="<%=introduce.getMemory()%>"/>
							</td>
							<td width="13%" height="27">&nbsp;重量：</td>
							<td width="42%" height="27">&nbsp; 
								<input type="text" class="Sytle_text" name="heft" value="<%=introduce.getHeft()%>"/>
							</td>
						</tr>
						<tr>
							<td height="27">&nbsp;电池：</td>
							<td width="31%" height="27">&nbsp; 
								<input type="text" class="Sytle_text" name="battery" value="<%=introduce.getBattery()%>"/>
							</td>
							<td width="13%" height="27">&nbsp;机身厚度：</td>
							<td width="42%" height="27">&nbsp; 
								<input type="text" class="Sytle_text" name="thickness" value="<%=introduce.getThickness()%>"/>
							</td>
						</tr>
						<tr>
							<td colspan="1">&nbsp;图片文件：</td>
							<td colspan="3" width="42%">&nbsp;<input name="picture" type="file" class="Style_upload" id="picture"></td>
							<!-- <input name="picture" type="text" class="Style_upload" id="picture"> -->
						</tr>
						<tr>
							<td height="38" colspan="4" align="center">
								<input name="Button" type="submit" class="btn_bg_short" value="保存"> &nbsp; 
								<input name="Submit2" type="reset" class="btn_bg_short" value="重置"> &nbsp; 
								<input name="Submit3" type="button" class="btn_bg_short" value="返回" onClick="JScript:history.back(-1)">
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
