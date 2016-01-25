<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/page/share/taglib.jsp"%>
<title>用户角色分配</title>
<body class="easyui-layout" data-options="border:true">
	<div data-options="region:'north',border:true">
		<form name="searchFmRole" id="searchFmRole" method="post" onsubmit="return false;">
            <table class="search-tb">
                 <tbody>
                    <tr>
                    	<td>角色名称：
                    		<input class="ipt" name="name"/>
                    	</td>
                    	<td>角色标识：
                        	<input class="ipt" name="sn"/>
                        </td>
                        <td>
							<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" id="searchBtnRole">查询</a>
                        </td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div data-options="region:'center',border:true" style="height:93%">
		<table id="roledg">
		</table>
	</div>
</body>
</html>