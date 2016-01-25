<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/page/share/taglib.jsp"%>
<title>部门列表</title>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false">
		<div id="toolbar" class="easyui-toolbar">
			<c:if test="${my:hasPermission(sessionId,'privilege','dept', 0)}">
				<a href="javascript:;" iconCls="icon-add" plain="true" onclick="add()">添加</a>
				<a>-</a>
			</c:if>
			<c:if test="${my:hasPermission(sessionId,'privilege','dept', 2)}">
				<a href="javascript:;" iconCls="icon-edit" plain="true" onclick="edit()">修改</a>
				<a>-</a>
			</c:if>
			<c:if test="${my:hasPermission(sessionId,'privilege','dept', 3)}">
				<a href="javascript:;" iconCls="icon-del" plain="true" onclick="del()">删除</a>
				<a>-</a>
			</c:if>
			<a href="javascript:;" iconCls="icon-folder" plain="true" onclick="collapseAllTree()">合并</a>
			<a>-</a>
			<a href="javascript:;" iconCls="icon-folder-open" plain="true" onclick="expandAllTree()">展开</a>
			<a>-</a>
		</div>
	</div>
	<div data-options="region:'center',border:true">
		<table id="tg">
		</table>
	</div>
</body>
<script type="text/javascript">
	var collapseAndExpand=0; //1：展开，0：合并
	
	var sizeObject={width:500,height:280};
	$.parser.parse();
	var dataList=null;
	function parsePage() {
			dataList=$('#tg').treegrid({
			url: '${basePath}/managment/privilege/dept/ajaxlist.do?sessionId=${sessionId}',
			animate: false, //false:不需要动画效果
			rownumbers : true,
			collapsible: true,
			fitColumns:true,
			singleSelect : false,
			checkOnSelect : true,
			selectOnCheck : true,
			method: 'post',
			idField: 'id',
			treeField: 'name',
			loadFilter: pagerFilter,
			pagination: true,
			pageSize: 10,
			pageList: [10,20,50],
			columns : [ [ {
				checkbox : true
			}, {
				title : '名称',
				field : 'name',
				width : 100,
				align:'left'
			}, {
				title : '备注',
				field : 'note',
				width : 100,
				align:'left'
			}, {
				title : '添加子部门',
				field : 'operate',
				width : 30,
				formatter: function(value,row,index){
					return '<img title="添加子类" style="cursor:pointer;" onclick="add(\''+row.id+'\')" src="${basePath}/resources/assets/images/icons/add.gif" />';
				}
			} ] ],
			onLoadSuccess : function() {
			}
		});
	}
	function refreshGrid(){
		$.post('${basePath}/managment/privilege/dept/ajaxlist.do?sessionId=${sessionId}',{},function(data){
			$('#tg').treegrid("loadData",data);
		},'json');
	}
	function add(pid) {
		if(!pid){
			pid="";
		}
		$("body").append('<div id="addUI"></div>');
		$('#addUI').dialog({    
		    title: '新增部门',    
		    width: sizeObject.width,    
		    height: sizeObject.height,    
		    closed: false,    
		    cache: false,    
		    href: "${basePath}/managment/privilege/dept/insertUI.do?sessionId=${sessionId}&pid="+pid,    
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
							'${basePath}/managment/privilege/dept/insert.do?sessionId=${sessionId}',
							data,
							function(result){
								$.messager.progress('close');
								if(result.responseCode==100){
									$('#addUI').dialog('close');
									$('#addUI').remove();
									refreshGrid();
								}else{
									$.messager.alert('信息','保存失败！','info');
								}
							},'json'
						);
					}
				}
			},{
				text:'关闭',
				iconCls : 'icon-cancel',
				handler:function(){$('#addUI').dialog('close');$('#addUI').remove();}
			}]
		});    
	}
	
	function edit() {
		var data=dataList.treegrid("getSelected");
		if(!data){
			$.messager.alert('信息','请选择一条记录！','info');
			return;
		}
		$("body").append('<div id="editUI"></div>');
		$('#editUI').dialog({    
		    title: '编辑部门',    
		    width: sizeObject.width,    
		    height: sizeObject.height,    
		    closed: false,    
		    cache: false,    
		    href: "${basePath}/managment/privilege/dept/updateUI.do?sessionId=${sessionId}",    
		    modal: true,
		    buttons : [{
				text:'保存',
				iconCls : 'icon-save',
				handler:function(){
					var form=$("#formU");
					if(form.form('validate')){
						$.messager.progress(); 
						var fdata=form.form("getData");
						$.post(
							'${basePath}/managment/privilege/dept/update.do?sessionId=${sessionId}',
							fdata,
							function(result){
								$.messager.progress('close');
								if(result.responseCode==100){
									$('#editUI').dialog('close');
									$('#editUI').remove();
									refreshGrid();
								}else{
									$.messager.alert('信息','保存失败！','info');
								}
							},'json'
						);
					}
				}
			},{
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
			for(var i=0,len=rows.length;i<len;i++){
				if(rows[i].children){
					$.messager.alert('信息','请先删除子节点！','info');
					return;
				}
			}
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
						url : "${basePath}/managment/privilege/dept/delete.do?sessionId=${sessionId}&ids="+ id,
						dataType : 'json',
						success : function(text) {
							//使用'clearSelections':防止读取到了删除的数据
							dataList.datagrid("clearSelections");
							$.messager.progress('close');
							refreshGrid();
						}
					});
				}
			});
		} else {
			$.messager.alert('信息','请选择要删除的记录！','info');
		}
	}
	
	//合并
	function collapseAllTree(){
		$('#tg').treegrid('collapseAll');
	}
	
	//展开
	function expandAllTree(){
		$('#tg').treegrid('expandAll');
	}
	
	//合并or展开
	function collapseAndExpandAllTree(){
		if(collapseAndExpand==0){ //合并
			collapseAndExpand=1;
			$('#tg').treegrid('collapseAll');
			$('#jscollapseAndExpandAll').linkbutton({    
				text:'展开',
			    iconCls: 'icon-folder'   
			});  
		}else{ //展开
			collapseAndExpand=0;
			$('#tg').treegrid('expandAll');
			$('#jscollapseAndExpandAll').linkbutton({    
				text:'合并',
			    iconCls: 'icon-folder-open'   
			});  
		}
		
	}
	
	function pagerFilter(data){
        if ($.isArray(data)){    // is array  
            data = {  
                total: data.length,  
                rows: data  
            }; 
        }
        var dg = $(this);  
        var opts = dg.treegrid('options');  
        var pager = dg.treegrid('getPager');  
        pager.pagination({  
            onSelectPage:function(pageNum, pageSize){  
                opts.pageNumber = pageNum;  
                opts.pageSize = pageSize;  
                pager.pagination('refresh',{  
                    pageNumber:pageNum,  
                    pageSize:pageSize  
                });  
                dg.treegrid('loadData',data);  
            }  
        });  
        if (!data.topRows){  
        	data.topRows = [];
        	data.childRows = [];
        	for(var i=0; i<data.rows.length; i++){
        		var row = data.rows[i];
        		row._parentId ? data.childRows.push(row) : data.topRows.push(row);
        	}
			data.total = (data.topRows.length);
        }  
        var start = (opts.pageNumber-1)*parseInt(opts.pageSize);  
        var end = start + parseInt(opts.pageSize);  
		data.rows = $.extend(true,[],data.topRows.slice(start, end).concat(data.childRows));
		return data;
	}
</script>
</html>