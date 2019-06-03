<%@page import="com.bean.SubType"%>
<%@page import="com.bean.SuperType"%>
<%@page import="com.bean.Introduce"%>
<%@page import="com.bean.Goods"%>
<%@page import="com.bean.PageInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	String type = (String)request.getAttribute("type"); type=type==null?"":type;
	String action = (String)request.getAttribute("action");
	String superId = (String)request.getAttribute("superId");
	String subId = (String)request.getAttribute("subId");
	String searchword = (String)request.getAttribute("searchword");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	List<Goods> goodses = (List<Goods>)request.getAttribute("goodses");
	List<SubType> subTypes = (List<SubType>)request.getAttribute("subTypes");
%>
<jsp:useBean id="dao" scope="page" class="com.service.impl.GoodsServiceDaoImpl"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>所有手机型号搜索列表</title>
<link type="text/css" href="<%=basePath%>front/css/css.css" rel="stylesheet" />
<link rel="shortcut icon" href="<%=basePath%>front/bitbug_favicon.ico" />
<script type="text/javascript" src="<%=basePath%>front/js/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>front/js/js.js"></script>

</head>

<body>
	<jsp:include page="common-header.jsp"></jsp:include>
	<form action="#" method="get" class="proDingzhi">
		<img src="images/main/dingzhi.jpg" width="972" height="167" />
		<div class="bdsharebuttonbox">
			<a href="#" class="bds_more" data-cmd="more"></a><a href="#"
				class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#"
				class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#"
				class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#"
				class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#"
				class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
		</div>
		<script>
			window._bd_share_config = {
				"common" : {
					"bdSnsKey" : {},
					"bdText" : "",
					"bdMini" : "2",
					"bdMiniList" : false,
					"bdPic" : "",
					"bdStyle" : "0",
					"bdSize" : "24"
				},
				"share" : {}
			};
			with (document)
				0[(getElementsByTagName('head')[0] || body)
						.appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='
						+ ~(-new Date() / 36e5)];
		</script>
		<table class="proDSel">
			<tr>
				<th>
					<h3>品牌</h3>
				</th>
				<td>
					<div class="proPosition">
						<ul class="xuan">
							<%List<SuperType> superTypes = dao.getSuperTypeAll();
							for(SuperType superType : superTypes) {%>
							<li>
								<input type="checkbox" /> 
								<a href="<%=basePath%>goodsinfoservlet?superId=<%=superType.getSuperId()%>&&type=<%=0%>&&action=sort">
									<%=superType.getTypeName()%>
								</a>
							</li>
							<%} %>
							<div class="clearfix"></div>
						</ul>
						<!--xuan/-->
						<span class="duoxuan"> 多选 </span>
						<!--duoxuan/-->
						<input type="image" src="<%=basePath%>images/main/queding.png" class="queen2" />
						<div class="more-shou">
							<span class="more"> 更多 &gt; </span>
							<span class="shou"> 收起&gt; </span>
						</div>
						<!--more-shou/-->
					</div>
				</td>
			</tr>
			<%if(subTypes!=null){ %>
			<tr>
				<th>
					<h3>详细品牌</h3>
				</th>
				<td>
					<div class="proPosition">
						<ul class="xuan">
							<%for(SubType subType : subTypes) {%>
							<li>
								<input type="checkbox" /> 
								<a href="<%=basePath%>goodsinfoservlet?action=detailSort&&type=<%=type%>&&subId=<%=subType.getSubId()%>&&superId=<%=subType.getSuperType().getSuperId()%>">
									<%=subType.getTypeName()%>
								</a>
							</li>
							<%} %>
							<div class="clearfix"></div>
						</ul>
						<!--xuan/-->
						<span class="duoxuan"> 多选 </span>
						<!--duoxuan/-->
						<input type="image" src="<%=basePath%>images/main/queding.png" class="queen2" />
						<div class="more-shou">
							<span class="more"> 更多 &gt; </span>
							<span class="shou"> 收起&gt; </span>
						</div>
						<!--more-shou/-->
					</div>
				</td>
			</tr>
			<%}%>
			<tr>
				<th>
					<h3>大家都在选</h3>
				</th>
				<td>
					<div class="proPosition">
						<ul class="xuan moreHeight">
							<li><input type="checkbox" /><a href="#">屏幕不错</a></li>
							<li><input type="checkbox" /><a href="#">电池耐用</a></li>
							<li><input type="checkbox" /><a href="#">系统流畅</a></li>
							<li><input type="checkbox" /><a href="#">外观靓丽</a></li>
							<li><input type="checkbox" /><a href="#">性能好</a></li>
							<li><input type="checkbox" /><a href="#">通话质量好</a></li>
							<li><input type="checkbox" /><a href="#">很轻便</a></li>
							<li><input type="checkbox" /><a href="#">性价比很高</a></li>
							<li><input type="checkbox" /><a href="#">外设不错</a></li>
							<li><input type="checkbox" /><a href="#">包装不错哦</a></li>
							<li><input type="checkbox" /><a href="#">包装不错哦</a></li>
							<div class="clearfix"></div>
						</ul>
						<!--xuan/-->
						<span class="duoxuan"> 多选 </span>
						<!--duoxuan/-->
						<input type="image" src="<%=basePath%>images/main/queding.png" class="queen2" />
						<div class="more-shou">
							<span class="more"> 更多 &gt; </span> <span class="shou"> 收起
								&gt; </span>
						</div>
						<!--more-shou/-->
					</div>
				</td>
			</tr>
			<tr>
				<th>
					<h3>价格</h3>
				</th>
				<td>
					<div class="proPosition">
						<ul class="xuan">
						<%for(int i = 0;i < 2000;i=i+500) {%>
							<li><a href="#"><%=i%>-<%=i+500%>元</a></li>
							<%} %>
							<div class="clearfix"></div>
						</ul>
						<!--xuan/-->
						<div class="jiage">
							<input type="text" />&nbsp;-&nbsp; <input type="text" />&nbsp;
							<input type="image" src="<%=basePath%>images/main/queding.png" class="queen" />
						</div>
						<!--jiage/-->
					</div>
				</td>
			</tr>
			<tr>
				<th>
					<h3>CPU</h3>
				</th>
				<td>
					<div class="proPosition">
						<ul class="xuan">
							<li><input type="checkbox" /><a href="#">八核</a></li>
							<li><input type="checkbox" /><a href="#">四核</a></li>
							<li><input type="checkbox" /><a href="#">双核</a></li>
							<li><input type="checkbox" /><a href="#">单核</a></li>
							<li><input type="checkbox" /><a href="#">其他</a></li>
							<div class="clearfix"></div>
						</ul>
						<!--xuan/-->
						<span class="duoxuan"> 多选 </span>
						<!--duoxuan/-->
						<input type="image" src="images/main/queding.png" class="queen2" />
					</div>
				</td>
			</tr>
			<tr>
				<th>
					<h3>特点</h3>
				</th>
				<td>
					<div class="proPosition">
						<ul class="xuan moreHeight">
							<li><input type="checkbox" /><a href="#">女性手机</a></li>
							<li><input type="checkbox" /><a href="#">儿童手机</a></li>
							<li><input type="checkbox" /><a href="#">儿童手机</a></li>
							<li><input type="checkbox" /><a href="#">儿童手机</a></li>
							<li><input type="checkbox" /><a href="#">3G视频通话</a></li>
							<li><input type="checkbox" /><a href="#">音乐手机</a></li>
							<li><input type="checkbox" /><a href="#">商务手机</a></li>
							<li><input type="checkbox" /><a href="#">手写输入</a></li>
							<div class="clearfix"></div>
						</ul>
						<!--xuan/-->
						<span class="duoxuan"> 多选 </span>
						<!--duoxuan/-->
						<input type="image" src="images/main/queding.png" class="queen2" />
						<div class="more-shou">
							<span class="more"> 更多 &gt; </span> <span class="shou"> 收起
								&gt; </span>
						</div>
						<!--more-shou/-->
					</div>
					</div>
				</td>
			</tr>
			<tr>
				<th>
					<h3>高级功能</h3>
				</th>
				<td>
					<div class="proPosition">
						<ul class="xuan moreHeight">
							<li><input type="checkbox" /><a href="#">双卡双待</a></li>
							<li><input type="checkbox" /><a href="#">高清视频</a></li>
							<li><input type="checkbox" /><a href="#">WIFI</a></li>
							<li><input type="checkbox" /><a href="#">前置摄像头</a></li>
							<li><input type="checkbox" /><a href="#">电视播放</a></li>
							<div class="clearfix"></div>
						</ul>
						<!--xuan/-->
						<span class="duoxuan"> 多选 </span>
						<!--duoxuan/-->
						<input type="image" src="images/main/queding.png" class="queen2" />
					</div>
				</td>
			</tr>
		</table>
		<!--proDSel/-->
		<div style="height:15px;">&nbsp;</div>
		<ul class="proSelect">
			<a href="<%=basePath%>goodsinfoservlet?action=indexGoods"><li>综合</li></a>
			<a href="<%=basePath%>goodsinfoservlet?action=indexGoods"><li>销量 &darr;</li></a>
			<a href="<%=basePath%>goodsinfoservlet?action=indexGoods"><li>评论 &darr;</li></a>
			<a href="<%=basePath%>goodsinfoservlet?action=indexGoods"><li>价格 &darr;</li>
			<div class="clears"></div>
		</ul>
		<!--proSelect/-->
		<div class="phoneBox">
			<%for(Goods goods:goodses){
					Introduce introduce = new Introduce();
					introduce = dao.getIntroduceByGoodsId(goods.getGoodsId());%>
			<dl>
				<dt>
					<a href="<%=basePath%>/front/goodsDetail.jsp?goodsId=<%=goods.getGoodsId()%>"><img src="<%=basePath%><%=goods.getPicture()%>" /></a>
				</dt>
				<dd>
					<h3>￥<%=goods.getNowPrice()%></h3>
					<div class="phonePars"><%=goods.getGoodsName()%> <%=introduce.getMemory()%>
						<%=introduce.getFront_camera()%>/<%=introduce.getBack_camera()%>/<%=introduce.getSystems()%>  <%=introduce.getColor()%></div>
					<!--phonePar/-->
					<div class="xiaoliang">
						<span class="blue"><%=dao.getCommentCountByGoodsId(goods.getGoodsId())%>条评价</span> <span class="pad">上海有货</span>
					</div>
					<!--xiaoliang/-->
					<div class="jiaru-shoucang">
						<span class="jiaruCar"><a
							href="quanjing/index.html">加入购物车</a></span> <span class="shoucangCar">
							<a href="quanjing/index.html">点此收藏</a></span>
						<div class="clears"></div>
					</div>
					<!--jiaru-shoucang/-->
				</dd>
			</dl>
			<%} %>
		</div>
		<div style="text-align:center;">
				<div class="row pagination" style="display:inlineblock;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"style="margin:0 auto;">
						<tr>
							<td height="30">当前页数：【<%=pageInfo.getPageThis()%>】&nbsp;&nbsp;
								<%if("indexGoods".equals(action)) {%>
									<a href="<%=basePath%>pageservlet?pageThis=1&&action=indexGoods">第一页</a>
									<a href="<%=basePath%>pageservlet?pageThis=<%=pageInfo.getPageThis() - 1%>&&action=indexGoods">上一页</a>
									&nbsp;&nbsp;&nbsp;&nbsp;共【<%=pageInfo.getRecordCount()%>】条数据&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="<%=basePath%>pageservlet?pageThis=<%=pageInfo.getPageThis() + 1%>&&action=indexGoods">下一页</a>
									<a href="<%=basePath%>pageservlet?pageThis=<%=pageInfo.getPageTotal()%>&&action=indexGoods">最后一页&nbsp;</a>
									&nbsp;&nbsp;共【<%=pageInfo.getPageTotal()%>】页
								<%}else if("sort".equals(action)){ %>
									<a href="<%=basePath%>pageservlet?pageThis=1&&action=<%=action%>&&type=<%=type%>&&superId=<%=superId%>">第一页</a> 
								 	<a href="<%=basePath%>pageservlet?pageThis=<%=pageInfo.getPageThis()-1%>&&action=<%=action%>&&type=<%=type%>&&superId=<%=superId%>">上一页</a>
									&nbsp;&nbsp;&nbsp;&nbsp;共【<%=pageInfo.getRecordCount()%>】条数据&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="<%=basePath%>pageservlet?pageThis=<%=pageInfo.getPageThis()+1%>&&action=<%=action%>&&type=<%=type%>&&superId=<%=superId%>">下一页</a>
									<a href="<%=basePath%>pageservlet?pageThis=<%=pageInfo.getPageTotal()%>&&action=<%=action%>&&type=<%=type%>&&superId=<%=superId%>">最后一页&nbsp;</a>
								<%}else if("detailSort".equals(action)){%>
									<a href="<%=basePath%>pageservlet?pageThis=1&&action=<%=action%>&&type=<%=type%>&&superId=<%=superId%>&&subId=<%=subId%>">第一页</a>
								 	<a href="<%=basePath%>pageservlet?pageThis=<%=pageInfo.getPageThis()-1%>&&action=<%=action%>&&type=<%=type%>&&superId=<%=superId%>&&subId=<%=subId%>">上一页</a>
								 	&nbsp;&nbsp;&nbsp;&nbsp;共【<%=pageInfo.getRecordCount()%>】条数据&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="<%=basePath%>pageservlet?pageThis=<%=pageInfo.getPageThis()+1%>&&action=<%=action%>&&type=<%=type%>&&superId=<%=superId%>&&subId=<%=subId%>">下一页</a>
									<a href="<%=basePath%>pageservlet?pageThis=<%=pageInfo.getPageTotal()%>&&action=<%=action%>&&type=<%=type%>&&superId=<%=superId%>&&subId=<%=subId%>">最后一页&nbsp;</a>
								<%}%>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="clears"></div>
		<!--phoneBox/-->
	</form>
	<!--proDingzhi/-->
	<jsp:include page="common-footer.jsp"></jsp:include>
</body>
</html>
