<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/page/share/taglib.jsp"%>
<%-- 查询js --%>
<%@ include file="/WEB-INF/page/share/dosearch.jspf"%>
<c:set var="systemSn" value="privilege" scope="page"/>
<c:set var="nameSpace" value="loginlog" scope="page"/>
<title>登录日志列表</title>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false">
		<div id="toolbar" class="easyui-toolbar">
			<%-- 重置，刷新 --%>
			<%@ include file="/WEB-INF/page/share/toolbar_common.jspf"%>
			<c:if test="${my:hasPermission(sessionId,systemSn,nameSpace, 0)}">
				<a href="javascript:;" iconCls="icon-add" plain="true" onclick="edit()">查看</a>
				<a>-</a>
			</c:if>
			<c:if test="${my:hasPermission(sessionId,systemSn,nameSpace, 3)}">
				<a href="javascript:;" iconCls="icon-del" plain="true" onclick="del()">删除</a>
				<a>-</a>
			</c:if>
		</div>
		<%--搜索start--%>
		<div class="search-div">
			<%-- onsubmit="return false;" 防止回车的时候提交表单而去刷新页面 【避免请求两次】--%>
			<form name="searchFm" id="searchFm" method="post" onsubmit="return false;">
                  <table class="search-tb">
                  	 <col width="70" />
					 <col />
                     <tbody>
                        <tr>
                        	<th>用户名：</th>
                        	<td>
                        		<input class="ipt" name="operationUsername"/>
                        	</td>
                        	<th></th>
                            <td>
								<a iconCls="icon-search" class="easyui-linkbutton" id="searchBtn" data-options="iconCls:'icon-search'">查询</a>
                            </td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<%--搜索end--%>
	</div>
	<div data-options="region:'center',border:true">
		<table id="dg">
		</table>
	</div>
</body>
<script type="text/javascript">
	var dataList=null;
	function parsePage() {
		dataList=$('#dg').datagrid({
			url: '${basePath}/managment/system/loginLog/ajaxList.do?sessionId=${sessionId}',
			singleSelect : false,
			fitColumns : true,
			checkOnSelect : true,
			selectOnCheck : true,
			pageSize: 20,
			pageList: [20,50,100],
			columns : [ [ {
				checkbox : true
			}, {
				title : 'IP地址',
				field : 'ip',
				width : 70,
				align : 'left'
			}, {
				title : '用户名',
				field : 'operationUsername',
				width : 50,
				align : 'left'
			}, {
				title : '真实姓名',
				field : 'operationPerson',
				width : 50,
				align : 'left'
			}, {
				title : '操作行为',
				field : 'operationContent',
				width : 100,
				align : 'left'
			}, {
				title : '操作时间',
				field : 'operationTimeStr',
				width : 100,
				align : 'left'
				//formatter: common.formatterDateTime
			}] ],
			onLoadSuccess : function() {
			}
		});
	}

	function edit() {
		var data=dataList.datagrid("getSelected");
		if(!data){
			$.messager.alert('信息','请选择一条记录！','info');
			return;
		}
		$("body").append('<div id="editUI"></div>');
		$('#editUI').dialog({    
		    title: '查看详情',    
		    width: 500,    
		    height: 300,    
		    closed: false,    
		    cache: false,    
		    href: '${basePath}/managment/system/loginLog/updateUI.do?sessionId=${sessionId}',    
		    modal: true,
		    buttons : [{
				text:'关闭',
				iconCls : 'icon-cancel',
				handler:function(){$('#editUI').dialog('close');$('#editUI').remove();}
			}],
			onLoad : function (){
				var form=$("#formU");
				form.form("load",data);
			}
		});    
	}
	
	function del() {
		var rows=dataList.datagrid("getSelections");
		if (rows && rows.length > 0) {
			$.messager.confirm("信息", "确定删除选中记录？", function(r) {
				if (r) {
					$.messager.progress(); 
					var ids = [];
					for ( var i = 0, l = rows.length; i < l; i++) {
						var r = rows[i];
						ids.push(r.id);
					}
					var id = ids.join(',');
					$.ajax({
						url : "${basePath}/managment/system/loginLog/delete.do?sessionId=${sessionId}&idStrs="+ id,
						dataType : 'json',
						success : function(text) {
							$.messager.progress('close');
							if (text.responseCode == 101) {
								$.messager.alert(text.responseMsg);
							}else{
								//使用'clearSelections':防止读取到了删除的数据
								dataList.datagrid("clearSelections");
								dataList.datagrid("reload");
							}
						}
					});
				}
			});
		} else {
			$.messager.alert('信息','请选择要删除的记录！','info');
		}
	}
</script>
</html>
<!-- <script type="text/javascript">
	mini.parse();
	var grid = mini.get("loginLogList");
	grid.load();
	
	function edit() {
		var row = grid.getSelected();
		if (row) {
			mini.open({
				url : "${basePath}/managment/system/loginLog/updateUI.do?sessionId=${sessionId}&id=" + row.id,
				title : "查看登录日志",
				width : 700,
				height : 360,
				onload : function() {
					var iframe = this.getIFrameEl();
					var data = {
						action : "edit",
						id : row.id
					};
					iframe.contentWindow.SetData(data);
				},
				ondestroy : function(action) {
					grid.reload();
				}
			});

		} else {
			mini.alert("请选中一条记录");
		}
	}
	
	function remove() {
		var rows = grid.getSelecteds();
		if (rows.length > 0) {
			mini.confirm("确定删除选中记录？", "确定？", function(action) {
				if (action == "ok") {
					var ids = [];
					for ( var i = 0, l = rows.length; i < l; i++) {
						var r = rows[i];
						ids.push(r.id);
					}
					var id = ids.join(',');
					$.ajax({
						url : "${basePath}/managment/system/loginLog/delete.do?sessionId=${sessionId}&idStrs="
								+ id,
						dataType : 'json',
						success : function(text) {
							if (text.responseCode == 101) {
								mini.alert(text.responseMsg);
							}
							grid.reload();
						}
					});
				}
			});
		} else {
			mini.alert("请选中一条记录");
		}
	}
	
	function search() {
		var operationUsername = mini.get("operationUsername").getValue();
		grid.load({
			operationUsername : operationUsername
		});
	}
	
	function onKeyEnter(e) {
		search();
	}
</script> -->