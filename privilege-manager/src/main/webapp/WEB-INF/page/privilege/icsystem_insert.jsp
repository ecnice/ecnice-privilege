<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/WEB-INF/page/share/taglib.jsp" %>
<title>添加系统</title>
</head>
	<body>
	<center>
	<form id="formA">
        <div style="margin:20px auto;">
            <table class="form-tb">
             	<tr>
                    <th><em class="cred">*</em>名称：</th>
                    <td>    
                        <input name="name" type="text" class="ipt easyui-validatebox" data-options="required:true,missingMessage:'请输入系统名称'" />
                    </td>
                </tr>
             	<tr>
                    <th><em class="cred">*</em>标识：</th>
                    <td>    
                        <input name="sn" type="text" class="ipt easyui-validatebox" data-options="required:true,missingMessage:'请输入系统标识',validType:'unique'" />
                    </td>
                </tr>
                <tr>
                    <th><em class="cred">*</em>url前缀：</th>
                    <td>    
                    	<input name="url" type="text" class="ipt easyui-validatebox" data-options="required:true,missingMessage:'请输入url前缀'" />
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
                    	<textarea name="note" rows="2" cols="30"></textarea>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    </center>
</body>
</html>