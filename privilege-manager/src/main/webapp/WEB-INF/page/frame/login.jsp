<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
request.setAttribute("basePath",basePath);
%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=edge">
<meta name="renderer" content="webkit">
<meta charset="UTF-8" />
<title>${companyName}${plainName}</title>
<script src="${basePath}/assets/js/check_browser.js"></script>
<link rel="shortcut icon" href="${basePath}/images/favicon.ico" type="image/x-icon" />
<link href="${basePath}/assets/css/base.css" rel="stylesheet" />
<link href="${basePath}/assets/css/login.css" rel="stylesheet" />
</head>
<body class="login-body">
	<div class="login-div">
		<div class="hd">
			<span class="hd-tt"><i></i>欢迎使用${companyName}${plainName}</span>
		</div>
		<div class="bd">
			<div class="login-box">
				<form id="myForm" method="post" action="${basePath}/login.do">
					<dl class="dl-lgn-form">
						<dd class="dd-user">
							<i></i> <input id="username" name="username" type="text"
								class="lgn-ipt" placeholder="请输入用户名" datatype="*4-16"
								value="${username }" nullmsg="用户名不能为空" errormsg="用户名必须为四位以上" />
						</dd>
						<dd class="mt20">
							<i></i> <input id="password" name="password" type="password"
								class="lgn-ipt" placeholder="请输入密码" datatype="*4-16"
								value="${password }" nullmsg="密码不能为空" errormsg="密码必须大于四位以上" />
						</dd>
						<dd class="mt20">
							<a href="javascript:;" class="btn-nrml btn-lgn fl"
								id="loginSubmit"><b>登录</b></a> <span class="fl ml10"
								style="margin-top: 8px;"> <input type="checkbox"
								id="reminedPwd" name="selectFlag" value="1"
								<c:if test="${selectFlag eq 1 }">checked="checked"</c:if> /> <label
								for="reminedPwd">记住密码</label> <span id="loginMsg" class="ml10">${message}</span>
							</span>
						</dd>
					</dl>
				</form>
			</div>
		</div>
		<div class="ft">
			${companyName} <span class="arial">&copy; ${copy}</span>
		</div>
	</div>
	<!--[if lt IE 7]>
<script src="assets/js/libs/pngfixed.js"></script>
<script type="text/javascript">
    DD_belatedPNG.fix('.login-box,.login-div .bd');
</script>
<![endif]-->
	<script src="${basePath}/assets/js/libs/jquery-1.6.2.min.js"></script>
	<script src="${basePath}/assets/js/libs/validform5.3.2.js"></script>
	<!--[if lt IE 9]>
<script src="assets/js/libs/placeholder.js"></script>
<![endif]-->
	<script>
		if (document.addEventListener) {
			//如果是Firefox  
			document.addEventListener("keypress", enterEvent, true);
		} else {
			//如果是IE
			document.attachEvent("onkeypress", enterEvent);
		}
		function enterEvent(evt) {
			if (evt.keyCode == 13) {
				if(checkcompany()){
					$('#loginSubmit').click();
				}
			}
		}
		$("#myForm").Validform(
			{
				ajaxPost : true,
				callback : function(data) {
					var sid = data.responseText;
					if(data=='-1'){
						$("#companyMsg").removeClass('loading16')
						.addClass("Validform_wrong").text(
								"您不属于该公司的成员！");
						return;
					}
					//请返回登录状态信息
					if (sid != null && sid != '0') {
						location.href = '${basePath}/managment/frame/index.do?sessionId='+sid;
					} else {
						$("#loginMsg").removeClass('loading16')
								.addClass("Validform_wrong").text(
										"用户名密码错误！");
						return;
					}
				}
			});
		$('#loginSubmit').click(function() {
			if(checkcompany()){
				$("#myForm").submit();
			}
		});
		function checkcompany(){
			var flag=true;
			var val=$("#company").val();
			if(val==0){
				$("#companyMsg").removeClass('loading16')
				.addClass("Validform_wrong").text(
						"请选择所属公司！");
				flag=false;
			}
			return flag;
		}
	</script>
</body>
</html>