<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%String message = (String)request.getAttribute("message"); message = message==null?"":message;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta property="qc:admins" content="352230531564101647676375" />
    <title>用户登录 </title>
    <meta name="keywords" content="手机网上商城,三星手机,苹果,诺基亚手机,HTC手机,小米手机等一堆" />
    <meta name="description" content="手机网上商城 " />
    <link rel="stylesheet" href="<%=basePath%>front/css/basic.css" />
    <link rel="shortcut icon" href="<%=basePath%>front/bitbug_favicon.ico" />
    <link rel="stylesheet" href="<%=basePath%>front/css/style.css" />
    
</head>
<body id="body">
     <div class="hrader" id="header-top">
         <div class="topNav">
            <a href="<%=basePath%>front/prolist.jsp" style="color:#FD7306;">首页&nbsp;&nbsp;&nbsp;</a>
            <a href="<%=basePath%>manager/login_M.jsp">后台&nbsp;&nbsp;</a>
            <a href="#">会员中心&nbsp;&nbsp;</a>
            <a href="#">&nbsp;</a>
            <a href="#" class="lan">中文&nbsp;&nbsp;</a>
            <a href="#" class="lan">English</a>
         </div><!--topNav/-->
    </div><!--hrader/-->
    <div class="clear w960 header">
        <div class="clear logo">
            <a href="<%=basePath%>front/prolist.jsp" class="image">
                <img alt="" src="<%=basePath%>images/Login/icon1.png"/>
            </a>
            <p class="title">
                <img alt="" src="<%=basePath%>images/Login/icon15.png"/>
            </p>
        </div>
        <div class="clear tab-page">
            <p class="tips">注册~</p>
            <a href="<%=basePath%>front/register.jsp" class="btn" id="zhuce">注册</a>
        </div>
    </div>
    <div class="main">
        <div class="clear w960">
            <a target="_blank" href="javascript:void(0)" class="banner">
              <div class="iphone5s">
                    <div class="listen"></div>
                    <div class="speaker"></div>
                    <div class="content">手机官网</div>
                    <div class="home"></div>
                </div>
            </a>
            <div class="box J_box">
                <div class="card J_card">
                	<form action="<%=basePath%>memberservlet?action=login" method="post" id="frm" name="frm" onsubmit="return on_submit(this)">
                		<center><font color="red"><%=message%></font></center>
	                    <div class="input-group J_input-group">
	                        <input type="text" id="phone" name="username" placeholder="请输入 用户名" class="input tel J_telInput"/>
	                        <p id="phoneError" class="tips J_tips"></p>
	                    </div>
	                    <div class="input-group">
	                        <input type="password" id="pwd" name="password" placeholder="请输入密码" class="input key"/>
	                        <p id="pwdError" class="tips"></p>
	                    </div>
	                    <div class="input-group">
	                        <input type="text" name="checkCode" id="checkCode" value="" style="float: left;height: 43px;border: 1px;background-color:#CCC" title="验证码区分大小写" size="24" maxlength="4" required="required" aria-required="true"/> 
							<!-- 显示验证码 -->
							<img src="<%=basePath%>CheckCode" name="checkCode" onClick="myReload()" width="116" height="43" class="img_checkcode" id="img_checkCode" />
	                    </div>
	                    <div class="choose">
	                        <label>
	                            <input type="checkbox" class="ckbox" checked="checked" value="0" id="aotuLogin"/>自动登录
	                        </label>
	                    </div>
	                    <a href="javascript:document.frm.submit();" id="loginBtn" class="main-button">登录</a>
                    </form>
                    <div class="other-login" style="display:none;">
                        <h3 class="title">使用合作网站账号</h3>
                        <div class="clear list" >
                            <a href="javascript:void(0)" id="WXinLoginBth" class="item" onclick="window.location='https://pc.weixin.qq.com/';return false;">
                                <img alt="" src="images/Login/icon8.png"/>
                            </a>
                            <a href="javascript:void(0)" id="weiboLoginBtn" class="item" onclick="window.location='http://baidu.com';return false;">
                                <img alt="" src="images/Login/icon9.png" />
                            </a>
                            <a href="javascript:void(0)" id="qqLoginBtn" class="item" onclick="window.location='http://www.qq.com';return false;">
                                <img alt="" src="images/Login/icon7.png"/>
                            </a>
                        </div>
                    </div>
                    <a href="javascript:void(0);" class="toggle J_toggle"  style="display:none;">
                        <img alt="" src="<%=basePath%>images/Login/icon10.png"/>
                    </a>
                </div>
                <div class="toggle-tips" style="display:none;">
                    <p>二维码<br/>快速登录</p>
                    <img alt="" src="<%=basePath%>images/Login/icon11.png" class="arrow"/>
                </div>
                <p class="message">公共场所不建议自动登录，以防账号丢失</p>
            </div>
            <div class="box last J_box">
                <div class="card">
                    <div class="qr-code">
                        <h3 class="title">*********</h3>
                        <div class="code">
                            <img alt="" src="/images/Login/icon12.png"/>
                        </div>
                        <a href="#" class="main-button">刷新二维码</a>
                        <p class="tips">
                            <a href="#">查看使用帮助</a>
                        </p>
                    </div>
                    <a href="javascript:void(0);" class="toggle J_toggle">
                        <img alt="" src="/images/Login/icon13.png"/>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <p>
            <a href="#">关于我们</a>
            <span class="bar">|</span>
            <a href="#">联系我们</a>
            <span class="bar">|</span>
            <a href="#">人才招聘</a>
            <span class="bar">|</span>
            <a href="#">广告服务</a>
            <span class="bar">|</span>
            <a href="#">销售联盟</a>
            <span class="bar">|</span>
            <a href="#">法律申明</a>
            <span class="bar">|</span>
            <a href="#">用户体验提升计划</a>
        </p>
        <p class="copyright">毕云鹏 孙铭伟 季怀佳</p>
    </div>
</body>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/layer/layer.js"></script>
<script type="text/javascript">
    var url = location.href;
    var index = url.indexOf('backurl=');
    var backurl = index > 0 ? url.substr(index + 8) : "";
    $('#zhuce').attr('href', 'UserRegister.html?backurl=' + backurl);
    //用户登录
    $("#loginBtn").click(function() {
        var phone = $("#phone").val();//手机号
        var pwd = $("#pwd").val();//密码
        var code = "";// $("#code").val();//验证码
        if (phone == "") {
            $("#phoneError").text("用户名不能为空！");
            return;
        }
        //验证手机号是否正确
        if (telCheck(phone)==false) {
            return;
        }
        if (pwd == "") {
            $("#pwdError").text("密码不能为空！");
            return;
        } else {
            $("#pwdError").text("");
        }
        //if (code == "") {
        //    $("#codeError").text("验证码不能为空！");
        //    verCodeLoad();
        //    return;
        //} if (code.length < 4) {
        //    $("#codeError").text("验证码不正确！");
        //    verCodeLoad();
        //    return;
        //}
        //登陆
        $.ajax({
            type: "POST",
            url: "UserLogin.html",
            data: { "phone": phone, "pwd": pwd, "code": code, "aotuLogin": $("#aotuLogin:checked").val() == undefined ? 1 : $("#aotuLogin:checked").val(), "autoHuidouLogin": $("#autoHuidouLogin:checked").val() == undefined ? 1 : $("#autoHuidouLogin:checked").val() },
            dataType: 'json',
            success: function (data) {
                //验证码是否正确
                if (data.State == 10) {
                    $("#codeError").text(data.Msg);
                    verCodeLoad();
                    $("#code").val("");
                    return;
                }
                //手机号或密码是否正确
                else if (data.State == 1) {
                    $("#phoneError").text(data.Msg);
                    verCodeLoad();
                    $("#code").val("");
                    $("#codeError").text("");
                    return;
                } else {  
                    window.location.href = (backurl !== "") ? backurl : "#";
                }
            }
        });
    }); 
    //二维码切换登录
    //$(".J_toggle").click(function() {
    //    $(this).closest(".J_box").hide().siblings(".J_box").show(450);
    //});
    //验证手机号
    $(".J_telInput").blur(function() {
        var telNum = $(this).val();
        telCheck(telNum);
    });
    telCheck = function (string) {
        var pattern = /^1[34578]\d{9}$/;
        if (pattern.test(string)) {
            $(".J_telInput").next(".J_tips").text("");
            return true;
        } else {
            $(".J_telInput").next(".J_tips").text("");
            return false;
        }
    };

    //刷新验证码
    function verCodeLoad() {
        $("#verCode").attr("src", $("#verCode").attr("src") + 1);
    }
    $(".input", ".card").focus(function () {
        $(this).val("").css("color","#333");
    });
    //兼容低版本浏览器的placeholder
    var phdArr = ["请输入手机号", "请输入验证码"];
    $(".J_input-group", ".J_card").each(function () {
        switch ($(this).index()) {
            case 0:
                $(this).find(".input").data("phd", phdArr[0]);
                break;
            case 2:
                $(this).find(".input").data("phd", phdArr[1]);
                break;
        }
        $(this).find(".input").val($(this).find(".input").data("phd")).css({ "color": "#999" });
    });

    $(".J_input-group", ".J_card").focusin(function () {
        if ($(this).find(".input").val() === $(this).find(".input").data("phd")) {
            $(this).find(".input").val("").css({ "color": "#333" });
        }
    });
    $(".J_input-group", ".J_card").focusout(function () {
        if ($(this).find(".input").val() === "") {
            $(this).find(".input").val($(this).find(".input").data("phd")).css({ "color": "#999" });
        }
    });
    
  	//刷新验证码
	function myReload() {
		document.getElementById("img_checkCode").src = document.getElementById("img_checkCode").src + "?nocache=" + new Date().getTime();
	}
	
	function login() {
		return true;
	}
</script>
</html>

