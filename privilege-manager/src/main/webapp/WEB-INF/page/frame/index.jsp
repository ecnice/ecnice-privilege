<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
request.setAttribute("basePath",basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>${companyName}${plainName}</title>
    <meta http-equiv="X-UA-Compatible" content="chrome=1,IE=edge" />
	<meta name="renderer" content="webkit" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <script src="${basePath}/assets/js/check_browser.js"></script>
    <link rel="shortcut icon" href="${basePath}/images/favicon.ico" type="image/x-icon" />
    <link href="${basePath}/assets/css/base.css" rel="stylesheet" />
    <script src="${basePath}/resources/assets/boot.js?ver=${jscssvar}" type="text/javascript"></script>
    <script src="${basePath}/assets/js/index.js"></script>
    <script src="${basePath}/assets/js/libs/messenger.js"></script>
    <script src="${basePath}/resources/assets/js/common/common.js" type="text/javascript" ></script>
</head>
<body class="easyui-layout">
	<div class="header" data-options="region:'north',split:true,border:true" style="height:105px;">
		<div class="header_nav_index">
            <a class="logo" href="">logo</a>
            <div class="bd" style="text-align:right;">
            	<span>欢迎您,<font color="#1808dd">${login_user.realName }</font></span>
                <a id="lnkDesk" href="javascript:;">系统桌面</a> | <a href="help.html">帮助</a> |
                <a onclick="resetpassword()" href="javascript:void(0);">重置密码</a> | <a href="${basePath}/logout.do">[退出]</a>
            </div>
        </div>
        <div id="navMenu" class="nav-menu" style="position:relative;">
            <ul>
            	<c:forEach items="${systems }" var="system" varStatus="status">
	            	<c:if test="${status.index eq 0 }">
	            		<c:set var="systemId" scope="request" value="${system.id}"/>
	            		<c:set var="systemName" scope="request" value="${system.name}"/>
	            		<c:set var="systemUrl" scope="request" value="${system.url}"/>
	            	</c:if>	
					<li data-deskurl="${system.url}" data-sessionid="${sessionId}" data-url="${basePath}/managment/frame/systemTree.do?systemId=${system.id}&url=${system.url}&sessionId=${sessionId}" <c:if test="${status.index eq 0 }">class="curr" </c:if>>
						<a href="javascript:;"><span>${system.name}</span></a>
					</li>
				</c:forEach>
            </ul>
            <span id="moreMenu1" style="display:none;position:absolute;right:20px;top:2px;color:white;font-weight:bold;cursor:pointer;z-index:999;">&lt;&lt;</span>
            <span id="moreMenu" style="display:none;position:absolute;right:0;top:2px;color:white;font-weight:bold;cursor:pointer;z-index:999;">&gt;&gt;</span>
        </div>
	</div>   
    <div data-options="region:'south',split:true,border:false" style="height:36px;text-align:center;line-height:36px;">
    	${companyName}${plainName} <span class="arial">&copy; ${copy}</span>
    </div>
    <div id="leftMenuPanel" data-options="region:'west',title:'权限系统菜单',split:true,border:true" style="width:150px;">
    	<ul id="leftMenu" class="" url="${basePath}/managment/frame/systemTree.do?systemId=${systemId}&url=${systemUrl}&sessionId=${sessionId}" data-options="loadFilter : indexTreeLoadFilter" style="width:100%;height:100%;">
        </ul>
    </div>
    <div data-options="region:'center',border:true" style="background:#eee;">
    	<div id="mainTabs" class="easyui-tabs" data-options="border:false,fit:true,tools:'#tabsButtons'" >
            <div name="first" title="系统桌面" iconCls="icon-home" fit="true">
            	<iframe id="deskFrame" style="border:none;width:100%;height:100%;" src="${systemUrl}/index.do?sessionId=${sessionId}" frameborder="0" scrolling="none"></iframe>
            </div>
        </div>
    </div>
    <div id="tabsButtons" style="margin-top:1px;">
    	<a id="tabToolsFullScreen" class="easyui-linkbutton" iconCls="icon-window-max" plain="true" onclick="tabToolsFullScreenOnClick()">全屏</a>
	</div>
<script>
$.parser.parse();
function resetpassword(){
	$("body").append('<div id="resetpwd"></div>');
	$('#resetpwd').dialog({    
	    title: '重置密码',    
	    width: 500,    
	    height: 220,    
	    closed: false,    
	    cache: false,    
	    href: '${basePath}/managment/privilege/user/rePasswordUI.do?sessionId=${sessionId}',    
	    modal: true,
	    buttons : [{
			text:'保存',
			iconCls : 'icon-save',
			handler:function(){
				var form=$("#formA");
				if(form.form('validate')){
					$.messager.progress(); 
					var data=form.form("getData");
					$.post(
						'${basePath}/managment/privilege/user/rePassword.do?sessionId=${sessionId}',
						data,
						function(result){
							$.messager.progress('close');
							if(result.responseCode==100){
								$('#resetpwd').dialog('close');
								$('#resetpwd').remove();
							}else{
								$.messager.alert('信息','保存失败:'+result.responseMsg,'info');
							}
						},'json'
					);
				}
			}
		},{
			text:'关闭',
			iconCls : 'icon-cancel',
			handler:function(){$('#resetpwd').dialog('close');$('#resetpwd').remove();}
		}]
	});    
}

function indexTreeLoadFilter(data){
	return common.treeLoadFilter(data,{source:1});
}
</script>
</body>
</html>