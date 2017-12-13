<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/WEB-INF/page/share/taglib.jsp" %>
<title>用户详情</title>
</head>
	<body>
	<center>
	<form id="formD">
        <div style="margin:20px auto;">
            <table class="form-tb">
            	<tr>
                    <th>用户名：</th>
                    <td>    
                        <input name="username" type="text" class="easyui-validatebox" data-options="required:true" />
                    </td>
                    <th>性别：</th>
                    <td>    
                        <input name="sex" type="radio" value="0" />男&nbsp;&nbsp;
                        <input name="sex" type="radio" value="1" />女
                    </td>
                </tr>
                <tr>
                    <th>真实姓名：</th>
                    <td>    
                        <input name="realName" type="text" class="easyui-validatebox" data-options="required:true" />
                    </td>
                    <th>座机：</th>
                    <td>    
                        <input name="phone" type="text" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <th>电话：</th>
                    <td>    
                        <input name="tel" type="text" class="easyui-textbox" />
                    </td>
                    <th>传真：</th>
                    <td>    
                        <input name="fax" type="text" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <th>手机：</th>
                    <td>    
                        <input name="mobile" type="text" class="easyui-numberbox" />
                    </td>
                    <th>所属部门：</th>
                    <td>    
                        <select style="width:160px;" name="departmentId" class="easyui-combotree" data-options="url:'${basePath}/managment/privilege/dept/ajaxlist.do?sessionId=${sessionId}',required:true,loadFilter:userPageTreeLoadFilter,readonly:true,panelHeight:200"></select>
                    </td>
                </tr>
             	<tr>
                    <th>邮箱：</th>
                    <td colspan="3">    
                        <input name="email" class="easyui-validatebox" data-options="required:true,validType:'email'" />
                    </td>
                </tr>
                <tr>
                    <th>地址：</th>
                    <td>  
                    	<textarea name="address" rows="2" cols="30"></textarea>
                    </td>
                </tr>
                <tr>
                    <th>所属系统：</th>
                    <td colspan="3">  
                    	<select name="systemIds" style="width:240px;" class="easyui-combotree" data-options="url:'${basePath}/managment/privilege/user/getUserSystemIds.do?sessionId=${sessionId}&userId=${userId }',required:true,loadFilter:pagerFilterSys,readonly:true,multiple:true,panelHeight:120"></select>
                    </td>
                </tr>
            </table>
        </div>      
    </form>
    </center>
    <script type="text/javascript">
		$("#formD input").attr("disabled","false");
		$("#formD textarea").attr("disabled","false");
	</script>
</body>
</html>