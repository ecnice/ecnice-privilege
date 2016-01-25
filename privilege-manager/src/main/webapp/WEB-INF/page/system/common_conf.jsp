<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/page/share/taglib.jsp"%>
<%@ include file="/WEB-INF/page/share/dosearch.jspf"%>
<c:set var="systemSn" value="privilege" scope="page" />
<c:set var="nameSpace" value="loginlog" scope="page" />
<title>登录日志列表</title>
</head>
<body class="easyui-layout">
	<!-- <div data-options="region:'north',border:true" class="toolbar-region">
		抬头  开始
		<div id="toolbar" class="easyui-toolbar">
		</div> 
		抬头  结束
	</div> -->
	<div data-options="region:'center',border:false">
		<!--subLayout start-->
		<div class="easyui-layout" data-options="" id="subLayout">
		
			<div id="commonPanel" class="easyui-panel"
				data-options="title:'上传个性化图标',cls:'mt20',plain:true,fitWidth:true">
				<table class="form-tb">
					<tbody>
						<tr>
							<th style="width: 120px;">左上角图片：</th>
							<td><img alt="" src="${basePath }/assets/images/ec-logo.png">
								<input type="file" name="">
								<a class="easyui-linkbutton ml10" id="genProDetailBtn"
								data-options="iconCls:'icon-start'">请选择</a></td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>

</body>
</html>