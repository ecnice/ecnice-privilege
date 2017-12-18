<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/WEB-INF/page/share/taglib.jsp" %>
<title>修改系统配置</title>
</head>
<body>
	<center>
	<form id="formU">
		<input name="id" type="hidden" />
        <div style="margin:20px auto;">
            <table class="form-tb">
           		<tr>
                    <th><em class="cred">*</em>配置名称：</th>
                    <td>    
                        <input name="configName" type="text" class="ipt easyui-validatebox" data-options="required:true,missingMessage:'请输入配置名称'" />
                    </td>
                </tr>
           		<tr>
                    <th><em class="cred">*</em>配置标识：</th>
                    <td>    
                        <input name="configSn" type="text" class="ipt easyui-validatebox" data-options="required:true,missingMessage:'请输入配置标识',validType:'unique'" />
                    </td>
                </tr>
                <tr>
                    <th><em class="cred">*</em>配置key：</th>
                    <td>    
                        <input id="jsconfigkey" name="configKey" type="text" class="ipt easyui-validatebox" data-options="required:true,missingMessage:'请输入配置key',validType:'uniquekey'" />
                    </td>
                </tr>
                <tr>
                    <th><em class="cred">*</em>配置key的value值：</th>
                    <td>    
                        <input id="jsconfigvalue" name="configValue" type="text" class="ipt easyui-validatebox" data-options="required:true,missingMessage:'请输入配置key的value值'" />
                        <a id="uploadFile-1" style="display:none" iconcls="icon-upload" class="easyui-linkbutton jsUploadFile" href="javascript:void(0);">上传图片</a>
                    </td>
                </tr>
                <tr>
                    <th><em class="cred">*</em>排序号：</th>
                    <td>    
                    	<input name="configOrder" type="text" class="ipt easyui-numberbox" data-options="required:true,missingMessage:'请输入排序号',min:0"/>
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