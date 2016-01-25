<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/WEB-INF/page/share/taglib.jsp" %>
<title>添加用户</title>
</head>
	<body>
	<center>
	<form id="formA">
        <div style="margin:20px auto;">
            <table class="form-tb">
            	<tr>
                    <th><em class="cred">*</em>用户名：</th>
                    <td>    
                        <input name="username" type="text" class="ipt easyui-validatebox" data-options="required:true,validType:'unique'" />
                    </td>
                    <th><em class="cred">*</em>性别：</th>
                    <td>    
                        <input name="sex" type="radio" value="0" checked/>男&nbsp;&nbsp;
                        <input name="sex" type="radio" value="1" />女
                    </td>
                </tr>
                <tr>
                    <th><em class="cred">*</em>真实姓名：</th>
                    <td>    
                        <input name="realName" type="text" class="ipt easyui-validatebox" data-options="required:true" />
                    </td>
                    <th>座机：</th>
                    <td>    
                        <input name="phone" type="text" class="ipt easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <th>电话：</th>
                    <td>    
                        <input name="tel" type="text" class="ipt easyui-textbox" />
                    </td>
                    <th>传真：</th>
                    <td>    
                        <input name="fax" type="text" class="ipt easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <th>手机：</th>
                    <td>    
                        <input name="mobile" type="text" class="ipt easyui-numberbox" />
                    </td>
                    <th><em class="cred">*</em>所属部门：</th>
                    <td>    
                        <select style="width:160px;" name="departmentId" class="ipt easyui-combotree" data-options="url:'${basePath}/managment/privilege/dept/ajaxlist.do?sessionId=${sessionId}',required:true,loadFilter:userPageTreeLoadFilter,readonly:true,panelHeight:200"></select>
                    </td>
                </tr>
             	<tr>
                    <th><em class="cred">*</em>邮箱：</th>
                    <td colspan="3">    
                        <input name="email" class="ipt easyui-validatebox" data-options="required:true,validType:'email'" />
                    </td>
                </tr>
                <tr>
                    <th>地址：</th>
                    <td>  
                    	<textarea name="address" rows="2" cols="30"></textarea>
                    </td>
                </tr>
                <tr>
                    <th><em class="cred">*</em>所属系统：</th>
                    <td colspan="3">  
                    	<select name="systemIds" style="width:150px;" class="ipt easyui-combotree" data-options="url:'${basePath}/managment/privilege/user/getAllSystems.do?sessionId=${sessionId}',required:true,loadFilter:pagerFilterSys,multiple:true,readonly:true,panelHeight:120"></select>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    </center>
</body>
</html>