<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/WEB-INF/page/share/taglib.jsp" %>
<title>添加权限值</title>
</head>
<body>
	<center>
	<form id="formA">
        <div style="margin:20px auto;">
        <input name="systemId" type="hidden" value="${systemId }" />
            <table class="form-tb">
           		<tr>
                    <th><em class="cred">*</em>权限值名称：</th>
                    <td>
                    	<input name="name" type="text" class="ipt easyui-validatebox" data-options="required:true,missingMessage:'请输入权限值名称'" />
                    </td>
                </tr>
             	<tr>
                    <th><em class="cred">*</em>整型的位：</th>
                    <td>
                    	<input name="position" type="text" class="ipt easyui-numberbox" data-options="required:true,missingMessage:'请输入整型的位',validType:'unique'" />
                    </td>
                </tr>
             	<tr>
                    <th>排序号：</th>
                    <td>  
                    	<input name="orderNo" type="text" class="ipt easyui-numberbox" data-options="min:0"></input>
                    </td>
                </tr>
                <tr>
                    <th>描述：</th>
                    <td>  
                    	<textarea name="remark" rows="2" cols="30"></textarea>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    </center>
</body>
</html>