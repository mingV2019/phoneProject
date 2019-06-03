<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.utils.variable"%>
<%@page import="com.bean.Comment"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.Introduce"%>
<%@page import="com.bean.SuperType"%>
<%@page import="com.bean.SubType"%>
<%@page import="com.bean.Goods"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:useBean id="dao" scope="page" class="com.service.impl.GoodsServiceDaoImpl" />
<%int goodsId = Integer.parseInt(request.getParameter("goodsId"));
Goods goods = dao.getGoodsInfoByID(goodsId);
SubType subType = goods.getSubType();
SuperType superType = subType.getSuperType();
Introduce intro = dao.getIntroduceByGoodsId(goods.getGoodsId());
%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购买页面</title>
<link type="text/css" href="<%=basePath%>front/css/css.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=basePath%>front/css/normalize.css" />
<link rel="stylesheet" href="<%=basePath%>front/css/buyinfo-css/common.css">
<link rel="stylesheet" href="<%=basePath%>front/css/buyinfo-css/page-item.css">
<link rel="stylesheet" href="<%=basePath%>front/css/buyinfo-css/xzoom.css">
<link rel="shortcut icon" href="<%=basePath%>front/bitbug_favicon.ico" />
<script type="text/javascript" src="<%=basePath%>front/js/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>front/js/js.js"></script>
<script type="text/javascript" src="<%=basePath%>front/js/payfor.js"></script>
</head>
<body>
	<jsp:include page="common-header.jsp"></jsp:include>
	<div class="main">
		<div class="py-container">
			<div class="crumb-wrap">
				<ul class="sui-breadcrumb">
					<li><a href="<%=basePath%>goodsinfoservlet?superId=<%=superType.getSuperId()%>&&type=<%=0%>&&action=sort">
					<%=superType.getTypeName()%>
					</a></li>
					<li><a href="<%=basePath%>goodsinfoservlet?action=detailSort&&type=<%=0%>&&subId=<%=subType.getSubId()%>&&superId=<%=superType.getSuperId()%>">
					<%=subType.getTypeName()%></a></li>
					<li class="active"><%=goods.getGoodsName()%></li>
				</ul>
			</div>
			<!--product-info-->
			<div class="product-info">
				<div class="fl preview-wrap">
					<!--放大镜效果-->
					<div class="zoom">
						<!--默认第一个预览-->
						<div id="preview" class="spec-preview">
							<img class="xzoom" xoriginal="images/buy/b1.png"
								src="<%=basePath%><%=goods.getPicture()%>" width="100%">
						</div>
						<!--下方的缩略图-->
						<!-- 
						<div class="spec-scroll">
							<a href="<%=basePath%>front/images/buy/b1.png"><img
								class="xzoom-gallery"
								src="<%=basePath%>front/images/buy/s1.png" width="60"></a> <a
								href="<%=basePath%>front/images/buy/b2.png"><img
								class="xzoom-gallery"
								src="<%=basePath%>front/images/buy/s2.png" width="60"></a> <a
								href="<%=basePath%>front/images/buy/b3.png"><img
								class="xzoom-gallery"
								src="<%=basePath%>front/images/buy/s3.png" width="60"></a> <a
								href="<%=basePath%>front/images/buy/b1.png"><img
								class="xzoom-gallery"
								src="<%=basePath%>front/images/buy/s1.png" width="60"></a> <a
								href="<%=basePath%>front/images/buy/b2.png"><img
								class="xzoom-gallery"
								src="<%=basePath%>front/images/buy/s2.png" width="60"></a> <span
								class="prev"> <</span> <span class="next">> </span>
						</div> -->
					</div>
				</div>
				<div class="fr itemInfo-wrap">
					<div class="sku-name">
						<h4><%=goods.getGoodsName()%> <%=intro.getMemory()%><%=intro.getColor()%> 移动通信电信4G手机</h4>
					</div>
					<div class="summary">
						<div class="summary-wrap">
							<div class="fl title">
								<i>价 格</i>
							</div>
							<div class="fl price">
								<i>¥</i><em><%=goods.getNowPrice()%></em> <s>降价通知</s>
							</div>
							<div class="fr remark">
								<i>累计评价</i><em><%=dao.getCommentCountByGoodsId(goods.getGoodsId()) %></em>
							</div>
						</div>
						<div class="summary-wrap">
							<div class="fl title">
								<i>促 销</i>
							</div>
							<div class="fl price">
								<span>加价购</span>满999.00另加20.00元，或满1999.00另加30.00元，或满2999.00另加40.00元，<br />即可在购物车换购热销商品
								<a href="#">详情》</a>
							</div>
						</div>
					</div>
					<div class="support">
						<div class="summary-wrap">
							<div class="fl title">
								<i>支 持</i>
							</div>
							<div class="fl fix-width">
								<em class="t-gray">以旧换新，闲置手机回收 4G套餐超值抢 礼品购</em>
							</div>
						</div>
						<div class="summary-wrap">
							<div class="fl title">
								<i>配 送 至</i>
							</div>
							<div class="fl fix-width">
								<em class="t-gray">北京海淀区中关<i class="iconfont"></i>有货 支持
									99元免运费 |货到付款 |211限时达
								</em>
							</div>
							<div class="fl express">
								<em class="t-gray">由自营发货，并提供售后服务。11:00前完成下单，预计<strong>今天（08月10日）送达</strong></em>
							</div>
						</div>
					</div>
					<div class="clearfix choose">
						<div id="specification" class="summary-wrap clearfix">
							<dl>
								<dt class="fl title">
									<i>商品颜色</i>
								</dt>
								<dd>
									<a href="#" class="selected"><%=intro.getColor()%></a>
								</dd>
							</dl>
							<dl>
								<dt class="fl title">
									<i>选择版本</i>
								</dt>
								<dd>
									<a href="#" class="selected">公开版</a>
								</dd>
							</dl>
							<dl>
								<dt class="fl title">
									<i>内存容量</i>
								</dt>
								<dd>
									<a href="#" class="selected"><%=intro.getMemory()%></a>
								</dd>
							</dl>
							<dl>
								<dt class="fl title">
									<i>购买方式</i>
								</dt>
								<dd>
									<a href="#" class="selected">官方标配</a>
								</dd>
							</dl>
							<dl>
								<dt class="fl title">
									<i>套 装</i>
								</dt>
								<dd>
									<a href="#" class="selected">保护套装</a>
								</dd>
							</dl>
						</div>
						<div class="summary-wrap">
							<div class="controls">
								<input type="number" name="quantity" value="1" size="36" id="quantity" class="itxt" style="width: 60px;"> 
								<br> <input type="hidden" name="goodsId" id="goodsId" value="<%=goods.getGoodsId()%>" />
							</div>
							<a href="javascript:addCart();" class="sui-btn  btn-danger addshopcar">加入购物车</a>
						</div>
					</div>
				</div>
			</div>
			<!--product-detail-->
			<div class="clearfix product-detail">
				<div class="fl aside">
					<ul class="sui-nav nav-tabs tab-wraped">
						<!-- 第一个 -->
						<li class="active asideLi"><a href="#index" data-toggle="tab"><span>相关分类</span></a>
						</li>
						<!-- 第二个 -->
						<li class="asideLi"><a href="#profile" data-toggle="tab"><span>推荐品牌</span></a>
						</li>
					</ul>
					<div class="tab-content tab-wraped">
						<!-- 第一个 -->
						<div id="index" class="tab-pane active">
							<ul class="part-list unstyled">
								<%List<SubType> subsTypes = dao.getSubTypeBySuperID(superType.getSuperId());
								for(SubType sub : subsTypes) {%>
									<li>
										<a href="<%=basePath%>goodsinfoservlet?action=detailSort&&type=<%=0%>&&subId=<%=sub.getSubId()%>&&superId=<%=superType.getSuperId()%>">
											<%=sub.getTypeName()%>
										</a>
									</li>
								<%}%>
							</ul>
							<ul class="goods-list unstyled">
								<%List<Goods> goodses1 = dao.getRelatedGoods(5, subType.getSubId());
								for(Goods goods1 : goodses1) {
								%>
								<li>
									<div class="p-img">
										<img src="<%=basePath%><%=goods1.getPicture() %>"/>
									</div>
									<div class="attr">
										<em><%=goods1.getGoodsName() %></em>
									</div>
									<div class="price">
										<strong>￥<%=goods1.getNowPrice() %></strong>
									</div>
									<div class="operate">
										<a href="<%=basePath%>/front/goodsDetail.jsp?goodsId=<%=goods1.getGoodsId()%>" class="sui-btn btn-bordered">查看详情</a>
									</div>
								</li>
								<%} %>
							</ul>
						</div>
						<!-- 第二个 -->
						<div id="profile" class="tab-pane">
							<ul class="goods-list unstyled">
								<%List<Goods> goodses2 = dao.getHotGoods(5);
								for(Goods goods2 : goodses2) {
								%>
								<li>
									<div class="p-img">
										<img src="<%=basePath%><%=goods2.getPicture() %>"/>
									</div>
									<div class="attr">
										<em><%=goods2.getGoodsName() %></em>
									</div>
									<div class="price">
										<strong>￥<%=goods2.getNowPrice() %></strong>
									</div>
									<div class="operate">
										<a href="<%=basePath%>/front/goodsDetail.jsp?goodsId=<%=goods2.getGoodsId()%>" class="sui-btn btn-bordered">查看详情</a>
									</div>
								</li>
								<%} %>
							</ul>
						</div>
					</div>
				</div>
				<div class="fr detail">
					<ul class="sui-nav nav-tabs tab-wraped">
						<li class="active asideLi"><a href="#one" data-toggle="tab"><span>商品介绍</span></a></li>
						<li class="asideLi"><a href="#two" data-toggle="tab"><span>规格与包装</span></a></li>
						<li class="asideLi"><a href="#three" data-toggle="tab"><span>售后保障</span></a></li>
						<li class="asideLi"><a href="#four" data-toggle="tab"><span>商品评价</span></a></li>
					</ul>
					<div class="tab-content tab-wraped">
						<div id="one" class="tab-pane active">
							<ul class="goods-intro unstyled">
								<li>分辨率：<%=intro.getDistinguishability() %></li>
								<li>后置摄像头：<%=intro.getFront_camera() %></li>
								<li>前置摄像头：<%=intro.getBack_camera() %></li>
								<li>核 数：<%=intro.getCpu() %></li>
								<li>频 率：<%=intro.getRate() %></li>
								<li>品牌：<%=intro.getBrand() %></li>
								<li>商品名称：<%=goods.getGoodsName() %></li>
								<li>商品编号：<%=goods.getGoodsId() %></li>
								<li>商品毛重：<%=intro.getHeft() %></li>
								<li>商品产地：中国大陆</li>
								<li>机身厚度：<%=intro.getThickness() %></li>
								<li>系统：<%=intro.getSystems() %></li>
								<li>机身内存：<%=intro.getMemory() %></li>
							</ul>
							<div class="intro-detail">
								<img src="<%=basePath%><%=intro.getCaption()%>">
							</div>
						</div>
						<div id="two" class="tab-pane">
							<div class="Ptable">
								<div class="Ptable-item">
									<h3>基本信息</h3>
									<dl>
										<dl class="clearfix" style="margin:0">
											<dt>机身颜色</dt>
											<dd><%=intro.getColor() %></dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>机身长度（mm）</dt>
											<dd></dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>机身厚度（mm）</dt>
											<dd><%=intro.getThickness() %></dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>机身重量（g）</dt>
											<dd><%=intro.getHeft() %></dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>运营商标志或内容</dt>
											<dd class="Ptable-tips">
												<a href="#none"><i class="Ptable-sprite-question"></i></a>
												<div class="tips">
													<div class="Ptable-sprite-arrow"></div>
													<div class="content">
														<p>定制机往往会有运营商的元素在手机的某些位置，该属性会介绍这些元素出现的位置。</p>
													</div>
												</div>
											</dd>
											<dd>无</dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>机身材质分类</dt>
											<dd>其他</dd>
										</dl>
									</dl>
								</div>
								<div class="Ptable-item">
									<h3>存储</h3>
									<dl>
										<dl class="clearfix" style="margin:0">
											<dt>ROM</dt>
											<dd class="Ptable-tips">
												<a href="#none"><i class="Ptable-sprite-question"></i></a>
												<div class="tips">
													<div class="Ptable-sprite-arrow"></div>
													<div class="content">
														<p>机身的存储空间</p>
													</div>
												</div>
											</dd>
											<dd>64GB</dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>RAM</dt>
											<dd class="Ptable-tips">
												<a href="#none"><i class="Ptable-sprite-question"></i></a>
												<div class="tips">
													<div class="Ptable-sprite-arrow"></div>
													<div class="content">
														<p>机型的运行内存，决定机身的运行速度。</p>
													</div>
												</div>
											</dd>
											<dd><%=intro.getMemory() %></dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>存储卡</dt>
											<dd>支持MicroSD（TF）</dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>最大存储扩展容量</dt>
											<dd>256GB</dd>
										</dl>
									</dl>
								</div>

								<div class="Ptable-item">
									<h3>操作系统</h3>
									<dl>
										<dl class="clearfix" style="margin:0">
											<dt>操作系统</dt>
											<dd><%=intro.getSystems() %></dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>操作系统版本</dt>
											<dd>10.0.0</dd>
										</dl>
									</dl>
								</div>
								<div class="Ptable-item">
									<h3>主芯片</h3>
									<dl>
										<dl class="clearfix" style="margin:0">
											<dt>CPU品牌</dt>
											<dd><%=intro.getCpu() %></dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>CPU频率</dt>
											<dd><%=intro.getRate() %></dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>CPU核数</dt>
											<dd><%=intro.getCpu() %></dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>CPU型号</dt>
											<dd><%=intro.getCpu() %></dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>GPU型号</dt>
											<dd class="Ptable-tips">
												<a href="#none"><i class="Ptable-sprite-question"></i></a>
												<div class="tips">
													<div class="Ptable-sprite-arrow"></div>
													<div class="content">
														<p>GPU英文全称GraphicProcessingUnit，中文翻译为图形处理器。</p>
													</div>
												</div>
											</dd>
											<dd>0</dd>
										</dl>
									</dl>
								</div>

								<div class="Ptable-item">
									<h3>屏幕</h3>
									<dl>
										<dl class="clearfix" style="margin:0">
											<dt>主屏幕尺寸（英寸）</dt>
											<dd>6.2英寸</dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>分辨率</dt>
											<dd><%=intro.getDistinguishability() %></dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>屏幕材质类型</dt>
											<dd>TFT</dd>
										</dl>
									</dl>
								</div>
								<div class="Ptable-item">
									<h3>前置摄像头</h3>
									<dl>
										<dl class="clearfix" style="margin:0">
											<dt>前置摄像头</dt>
											<dd><%=intro.getFront_camera() %></dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>前摄光圈大小</dt>
											<dd>f/2.2</dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>拍照特点</dt>
											<dd>美颜；滤镜；微信小视频；水印</dd>
										</dl>
									</dl>
								</div>
								<div class="Ptable-item">
									<h3>后置摄像头</h3>
									<dl>
										<dl class="clearfix" style="margin:0">
											<dt>摄像头数量</dt>
											<dd class="Ptable-tips">
												<a href="#none"><i class="Ptable-sprite-question"></i></a>
												<div class="tips">
													<div class="Ptable-sprite-arrow"></div>
													<div class="content">
														<p>指的是后置摄像头的数量，不是所有摄像头的数量</p>
													</div>
												</div>
											</dd>
											<dd>2个</dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>后置摄像头</dt>
											<dd><%=intro.getBack_camera() %></dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>摄像头光圈大小</dt>
											<dd>f/2.2</dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>拍照特点</dt>
											<dd>美颜；全景；滤镜；微信小视频；水印</dd>
										</dl>
									</dl>
								</div>
								<div class="Ptable-item">
									<h3>电池信息</h3>
									<dl>
										<dl class="clearfix" style="margin:0">
											<dt>电池容量（mAh）</dt>
											<dd><%=intro.getBattery() %></dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>电池是否可拆卸</dt>
											<dd class="Ptable-tips">
												<a href="#none"><i class="Ptable-sprite-question"></i></a>
												<div class="tips">
													<div class="Ptable-sprite-arrow"></div>
													<div class="content">
														<p>不可拆卸电池手机更加节省内部空间，密封性更好，请勿在没有专业人士的帮助下自行拆卸。</p>
													</div>
												</div>
											</dd>
											<dd>否</dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>理论待机时间（小时）</dt>
											<dd>0</dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>理论通话时间（小时）</dt>
											<dd>0</dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>充电器</dt>
											<dd>5V/2A</dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>闪充</dt>
											<dd>不支持</dd>
										</dl>
										<dl class="clearfix" style="margin:0">
											<dt>无线充电</dt>
											<dd class="Ptable-tips">
												<a href="#none"><i class="Ptable-sprite-question"></i></a>
												<div class="tips">
													<div class="Ptable-sprite-arrow"></div>
													<div class="content">
														<p>无线充电只是个功能，请注意支持无线充电的产品其包装是否带有无线充电的配件，如没有需要自行单配哦。</p>
													</div>
												</div>
											</dd>
											<dd>不支持</dd>
										</dl>
									</dl>
								</div>

							</div>
						</div>
						<div id="three" class="tab-pane">

							<div class="mc">
								<div class="item-detail item-detail-copyright">
									<div class="serve-agree-bd">
										<dl>

											<dt>
												<i class="goods"></i> <strong>卖家服务</strong>
											</dt>
											<dd>
												全国联保<br />
											</dd>
											<dt>
												<i class="goods"></i> <strong>京东承诺</strong>
											</dt>
											<dd>
												京东平台卖家销售并发货的商品，由平台卖家提供发票和相应的售后服务。请您放心购买！<br />
												注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！
											</dd>
											<dt>
												<i class="goods"></i><strong> 正品行货 </strong>
											</dt>
											<dd>京东商城向您保证所售商品均为正品行货，京东自营商品开具机打发票或电子发票。</dd>
										</dl>
									</div>
									<div id="state">
										<strong>权利声明：</strong><br />京东上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是京东重要的经营资源，未经许可，禁止非法转载使用。
										<p>
											<b>注：</b>本站商品信息均来自于合作方，其真实性、准确性和合法性由信息拥有者（合作方）负责。本站不提供任何保证，并不承担任何法律责任。
										</p>
										<br /> <strong>价格说明：</strong><br />
										<p>
											<b>京东价：</b>京东价为商品的销售价，是您最终决定是否购买商品的依据。
										</p>
										<p>
											<b>划线价：</b>商品展示的划横线价格为参考价，并非原价，该价格可能是品牌专柜标价、商品吊牌价或由品牌供应商提供的正品零售价（如厂商指导价、建议零售价等）或该商品在京东平台上曾经展示过的销售价；由于地区、时间的差异性和市场行情波动，品牌专柜标价、商品吊牌价等可能会与您购物时展示的不一致，该价格仅供您参考。
										</p>
										<p>
											<b>折扣：</b>如无特殊说明，折扣指销售商在原价、或划线价（如品牌专柜标价、商品吊牌价、厂商指导价、厂商建议零售价）等某一价格基础上计算出的优惠比例或优惠金额；如有疑问，您可在购买前联系销售商进行咨询。
										</p>
										<p>
											<b>异常问题：</b>商品促销信息以商品详情页“促销”栏中的信息为准；商品的具体售价以订单结算页价格为准；如您发现活动商品售价或促销信息有异常，建议购买前先联系销售商咨询。
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="four" class="tab-pane">
						<div class="comment">
							<div class="com-tit">商品评价</div>
							<div class="com-tab-type">
								<ul class="type">
									<li class="current"><a href="#">全部评价(<%=dao.getCommentCountByGoodsId(goods.getGoodsId()) %>)</a></li>
								</ul>
								<div class="content">
									<%List<Comment> comments = dao.getCommentByGoodsId(goods.getGoodsId(), 0, 100);
										for(Comment comment : comments) {
									%>
									<div class="com-item">
										<div class="user-column">
											<div class="username">
												<img src="<%=basePath %>images/buy/photo.jpg"><%=comment.getMember().getUserName() %>
											</div>
											<div class="usernum"><%=comment.getMember().getMemberId() %></div>
										</div>
										<div class="user-info">
											<div class="stars star4"></div>
											<p><%=comment.getContent() %></p>
											<div class="guige">
												<ul class="mini">
													<li><%=goods.getGoodsName() %></li>
													<li><%=comment.getConTime() %></li>
												</ul>
												<div class="operate">
													<span id="collect"><i class="sui-icon icon-tb-like"></i>
														325</span> <span id="comment"><i
														class="sui-icon icon-tb-wang"></i>256</span>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
									</div>
									<%} %>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="common-footer.jsp"></jsp:include>
	<!-- 侧边开始 -->
	<div class="J-global-toolbar">
		<div class="toolbar-wrap">
			<div class="toolbar">
				<div class="toolbar-panels">
					<!-- 购物车 -->
					<div class="toolbar-panel tbar-panel-cart"
						style="visibility: hidden;">
						<h3 class="tbar-panel-header">
							<a class="title" href="cart.html"><i></i><em class="title">购物车</em></a>
							<span class="close-panel"></span>
						</h3>
						<div class="tbar-panel-main">
							<div class="tbar-panel-content">
								<div class="tbar-tipbox hide">
									<div class="tip-inner">
										<span class="tip-text">还没有登录，登录后商品将被保存</span> <a
											href="login.html" class="tip-btn">登录</a>
									</div>
								</div>
								<!-- 列表 -->
								<div class="tbar-cart-list"></div>
							</div>
						</div>
						<!-- 小计 -->
						<div class="tbar-panel-footer">
							<div class="tbar-checkout">
								<div class="jtc-number">
									<strong>0</strong>件商品
								</div>
								<div class="jtc-sum">
									共计：<strong>¥0</strong>
								</div>
								<a class="jtc-btn" href="cart.html">去购物车结算</a>
							</div>
						</div>
					</div>
					<!-- 我的关注 -->
					<div class="toolbar-panel tbar-panel-follow"
						style="visibility: hidden;">
						<h3 class="tbar-panel-header">
							<a class="title" href="#"><i></i><em class="title">我的关注</em></a>
							<span class="close-panel"></span>
						</h3>
						<div class="tbar-panel-main">
							<div class="tbar-panel-content"></div>
						</div>
					</div>
					<!-- 我的足迹 -->
					<div class="toolbar-panel tbar-panel-history"
						style="visibility: hidden;">
						<h3 class="tbar-panel-header">
							<a class="title" href="#"><i></i><em class="title">我的足迹</em></a>
							<span class="close-panel"></span>
						</h3>
						<div class="tbar-panel-main">
							<div class="tbar-panel-content">
								<div class="jt-history-wrap">
									<a class="history-bottom-more" href="#">查看更多足迹商品 &gt;&gt;</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 侧栏按钮 -->
				<div class="toolbar-tabs">
					<div class="toolbar-tab tbar-tab-cart" data-title="购物车"
						data-target="cart">
						<i class="tab-ico"></i><em class="tab-text"></em><span
							class="tab-sub">0</span>
					</div>
					<div class="toolbar-tab tbar-tab-follow" data-title="我的关注"
						data-target="follow">
						<i class="tab-ico"></i><em class="tab-text"></em>
					</div>
					<div class="toolbar-tab tbar-tab-history" data-title="我的足迹"
						data-target="history">
						<i class="tab-ico"></i><em class="tab-text"></em>
					</div>
				</div>
				<div class="toolbar-footer">
					<div class="toolbar-tab tbar-tab-top">
						<a href="#"><i class="tab-ico"></i><em class="footer-tab-text">顶部</em></a>
					</div>
					<div class="toolbar-tab tbar-tab-feedback">
						<a href="#"><i class="tab-ico"></i><em class="footer-tab-text">反馈</em></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="<%=basePath%>front/js/item.js"></script>
	<script type="text/javascript">
		function addCart() {
			var num = document.getElementById("quantity").value;//获取输入的商品数量
			var id = document.getElementById("goodsId").value;//获取商品ID
			//验证输入的数量是否合法
			if (num < 1) {//如果输入的数量不合法
				alert('数量不能小于1！');
				return;
			}
			window.location.href = "<%=basePath%>cartservlet?action=addCart&&goodsId="+id+"&&quantity=1&&url=/front/goodsDetail.jsp?goodsId=<%=goods.getGoodsId()%>";//调用添加购物车页面，实现将该商品添加到购物车
			return true;
		}
	</script>
</body>
</html>