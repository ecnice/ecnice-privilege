<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/page/share/taglib.jsp"%>
<title>授权</title>
</head>
<body class="easyui-layout" data-options="border:false">
	<div class="easyui-layout" data-options="border:false" style="height:100%;">
		<div data-options="region:'west'" style="width:180px;">
	    	<ul id="systemMenu"></ul>
	    </div>
	    <div class="easyui-layout"  data-options="region:'center',border:false">
	    	<div data-options="region:'north'">
	    		<div id="selectAllBtn" class="tb_class">
					<input class="btn btnplan" type="button" value="全选" style="cursor: pointer;"/>&nbsp;&nbsp;
					<input class="btn btnplan" type="button" value="取消" style="cursor: pointer;"/>
				</div>
			</div>
			<div data-options="region:'center'">
	    		<table id="rmtg"></table>
	    	</div>
	    </div>
    </div>
</body>
</html>