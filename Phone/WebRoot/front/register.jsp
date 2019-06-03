<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%String message = (String)request.getAttribute("message");message = message==null?"":message; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户注册</title>
<meta name="keywords" content="三星手机,苹果,诺基亚手机,HTC手机,小米手机,中兴手机,华为手机等" />
<meta name="description" content="手机网上商城 " />
<link rel="stylesheet" href="<%=basePath%>front/css/basic.css" />
<link rel="stylesheet" href="<%=basePath%>front/css/style.css" />
<link rel="shortcut icon" href="<%=basePath%>front/bitbug_favicon.ico" />
</head>
<body id="body">
	<div class="hrader" id="header-top">
		<div class="topNav">
			<a href="<%=basePath%>front/prolist.jsp" style="color:#FD7306;">首页&nbsp;&nbsp;&nbsp;</a>
			<a href="<%=basePath%>manager/login_M.jsp">后台&nbsp;&nbsp;</a> <a
				href="vip.html">会员中心&nbsp;&nbsp;</a> <a href="#">&nbsp;</a> <a
				href="#" class="lan">中文&nbsp;&nbsp;</a> <a href="#" class="lan">English</a>
		</div>
		<!--topNav/-->
	</div>
	<!--hrader/-->
	<div class="clear w960 header">
		<div class="clear logo">
			<a href="<%=basePath%>front/prolist.jsp" class="image"> 
				<img alt="" src="<%=basePath%>images/Login/icon1.png" />
			</a>
			<p class="title">
				<img alt="" src="<%=basePath%>images/Login/icon14.png" />
			</p>
		</div>
		<div class="clear tab-page">
			<p class="tips">已有账号请直接登录吧</p>
			<a href="<%=basePath%>front/login.jsp" class="btn">登录</a>
		</div>
	</div>
	<div class="main">
		<div class="clear w960">

			<a target="_blank" href="javascript:void(0)" class="banner"> <!-- <img alt="" src="images/loginshouji.jpg" style="margin-top:50px;"/> -->
				<div class="iphone5s">
					<div class="listen"></div>
					<div class="speaker"></div>
					<div class="content">手机官网</div>
					<div class="home"></div>
				</div>
			</a>

			<div class="box">
				<form id="member-registration" action="<%=basePath%>memberservlet?action=register" method="post" id="frm" name="frm" onsubmit="return on_submit(this)">
				<center><font color="red"><%=message%></font></center>
				<div class="card J_card">
					<div class="input-group">
							<input type="text" id="username" name="username" placeholder="用户名" class="input key" aria-required="true" />
							<p id="pwdError" class="tips J_tips"></p>
					</div>
					<div class="input-group">
						<input type="text" id="truename" name="truename" placeholder="真实姓名" class="input key" aria-required="true" />
						<p id="pwdError" class="tips J_tips"></p>
					</div>
					<div class="input-group">
						<input type="password" id="pwd" name="pwd" placeholder="请设置密码" class="input key J_keyInput"  />
						<p id="pwdError" class="tips J_tips"></p>
					</div>
					<div class="input-group">
						<input type="password" id="repeatPwd" name="password" placeholder="请确认密码" class="input key J_reInput" />
						<p id="repeatPwdError" class="tips J_tips"></p>
					</div>
					<div class="input-group J_input-group">
						<input type="text" id="phone" name="tel" placeholder="请输入电话号码" class="input tel J_telInput" />
						<p id="phoneError" class="tips J_tips"></p>
					</div>
					<div class="input-group">
						<input type="text" id="email" name="email" placeholder="请输入邮箱" class="input key" aria-required="true" />
						<p id="pwdError" class="tips J_tips"></p>
					</div>
					<div class="choose">
						<label> <input type="checkbox" id="agreement" value="0"
							checked="checked" class="ckbox" />同意用户协议
						</label> <label style="margin-left:10px;"> <a target="_blank"
							style="color:red;" href="#">隐私政策</a>
						</label>
					</div>
					<a href="javascript:document.frm.submit();" id="loginBtn" class="main-button">点击注册</a>
				</div>
				</form>
			</div>
		</div>
	</div>
	<div class="footer">
		<p>
			<a href="#">关于我们</a> <span class="bar">|</span> <a href="#">联系我们</a>
			<span class="bar">|</span> <a href="#">人才招聘</a> <span class="bar">|</span>
			<a href="#">广告服务</a> <span class="bar">|</span> <a href="#">销售联盟</a>
			<span class="bar">|</span> <a href="#">法律申明</a> <span class="bar">|</span>
			<a href="#">用户体验提升计划</a>
		</p>
		<p class="copyright">毕云鹏 孙铭伟 季怀佳</p>
	</div>
</body>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript">
	//注册
	$("#registerBth")
			.click(
					function() {
						//location.href = "/RegisterFinish/reigstSuccess.aspx";
						var phone = $("#phone").val();
						var pwd = $("#pwd").val();
						var repeatPwd = $("#repeatPwd").val();
						var messageCode = $("#messageCode").val();
						if (phone == "") {
							$("#phoneError").text("手机号不能为空！");
							return;
						} else if (!telCheck(phone)) {
							return;
						} else if (pwd == "") {
							$("#pwdError").text("密码不能为空！");
							return;
						} else if (!keyCheck(pwd)) {
							return;
						} else if (!repeatPwdCheck(pwd, repeatPwd)) {
							return;
						} else if (messageCode == "" || messageCode.length < 4) {
							$("#messageCodeError").text("短信验证码不能为空！");
							return;
						} else if ($("#agreement:checked").val() == undefined) {
							alert("请勾选用户协议，确认你已阅读完用户协议！");
							return;
						} else {
							//信息都输入正确，则注册
							$
									.ajax({
										type : "POST",
										url : "UserRegister.html",
										data : {
											"phone" : phone,
											"pwd" : pwd,
											"repeatPwd" : repeatPwd,
											"messageCode" : messageCode,
											"agreementhuidou" : $(
													"#agreementhuidou:checked")
													.val() == undefined ? 1
													: $(
															"#agreementhuidou:checked")
															.val()
										},
										dataType : 'json',
										success : function(data) {

											//10 验证码输入不正确  -1用户输入信息不正确  1//注册失败
											if (data.State == 1
													|| data.State == 10
													|| data.State == -1) {
												$("#messageCodeError").text(
														data.Msg);
												return;
											}
											//手机号已经注册
											else if (data.State == 2) {
												$("#phoneError").text(data.Msg);
												return;
											}

											else {
												location.href = "/RegisterFinish/reigstSuccess.html";
											}
										}
									});
						}
					});

	//验证手机号
	$(".J_telInput").blur(function() {
		var telNum = $(this).val();
		telCheck(telNum);

	});

	//刷新验证码
	function verCodeLoad() {
		$("#verCode").attr("src", $("#verCode").attr("src") + 1);
	}

	telCheck = function(string) {
		var pattern = /^1[0-9]\d{9}$/;
		if (pattern.test(string)) {
			$(".J_telInput").next(".J_tips").text("");
			return true;
		} else {
			$(".J_telInput").next(".J_tips").text("您的手机号码不正确");
			return false;
		}
	};
	//验证密码
	$(".J_keyInput").blur(function() {
		var keyText = $(this).val();
		keyCheck(keyText);
	});
	keyCheck = function(string) {
		var pattern = /^\w{6,18}$/;
		if (pattern.test(string)) {
			$(".J_keyInput").next(".J_tips").text("");
			return true;
		} else {
			$(".J_keyInput").next(".J_tips").text("密码长度6-18位，不能有空格或其他特殊字符哦");
			return false;
		}
	};
	//重复密码
	$(".J_reInput").blur(function() {
		var keyText = $(".J_keyInput").val();
		var reText = $(this).val();
		repeatPwdCheck(keyText, reText);
	});
	repeatPwdCheck = function(keyText, reText) {
		if (reText === keyText && reText !== "") {
			$(".J_reInput").next(".J_tips").text("");
			return true;
		} else {
			$(".J_reInput").next(".J_tips").text("两次的密码不一致");
			return false;
		}
	}
	//获取验证码
	$(".J_msgBtn").on("click", getMsg);
	var fsindex = 1;
	function getMsg() {

		var phone = $("#phone").val();//手机号
		if (phone.length != 11) {
			$("#phoneError").text("请输入正确的手机号！");
			return;
		}

		var verCode = $("#imgCode").val(); //图形验证码
		if (verCode.length != 4) {
			$("#verCodeError").text("请先输入图形验证码！");
			return;
		}

		//初始化一下
		$("#verCodeError").text("");

		//发送验证码
		$.ajax({
			type : "POST",
			url : "/ashx/GetVerifyMsg.ashx",
			data : {
				"phone" : phone,
				"verCode" : verCode,
				"fstype" : fsindex
			},
			dataType : 'json',
			success : function(data) {
				fsindex = 2;
				//短信发送失败 1.失败, 2.未输入图形验证码 -1短信内部错误 3已注册过
				$("#messageCodeError").text(data.Msg);
			}
		});
		var msgNum = 60;
		var $this = $(this);
		var msgTimer = null;
		$this.off("click");
		$this.text("重新发送（" + msgNum + "s）");
		msgTimer = setInterval(function() {
			if (msgNum == 0) {
				msgNum = 60;
				$this.text("发送验证码");
				$(".J_msgBtn").on("click", getMsg);
				$("#messageCodeError").text("");
				clearInterval(msgTimer);
			} else {
				msgNum--;
				$this.text("重新发送（" + msgNum + "s）");
			}
		}, 1000);
	}

	//兼容低版本浏览器的placeholder
	var phdArr = [ "请输入短信", "请输入手机号" ];
	$(".J_input-group", ".J_card").each(function() {
		switch ($(this).index()) {
		case 0:
			$(this).find(".input").data("phd", phdArr[0]);
			break;
		case 4:
			$(this).find(".input").data("phd", phdArr[1]);
			break;
		}
		$(this).find(".input").val($(this).find(".input").data("phd")).css({
			"color" : "#999"
		});
	})

	$(".J_input-group", ".J_card").focusin(
			function() {
				if ($(this).find(".input").val() === $(this).find(".input")
						.data("phd")) {
					$(this).find(".input").val("").css({
						"color" : "#333"
					});
				}
			})
	$(".J_input-group", ".J_card").focusout(
			function() {
				if ($(this).find(".input").val() === "") {
					$(this).find(".input").val(
							$(this).find(".input").data("phd")).css({
						"color" : "#999"
					});
				}
			})
</script>
</html>
