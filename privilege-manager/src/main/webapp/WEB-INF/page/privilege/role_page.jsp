<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/page/share/taglib.jsp"%>
<%-- 查询js --%>
<%@ include file="/WEB-INF/page/share/dosearch.jspf"%>
<c:set var="systemSn" value="privilege" scope="page"/>
<c:set var="nameSpace" value="role" scope="page"/>
<title>角色管理</title>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false">
		<div id="toolbar" class="easyui-toolbar">
			<%-- 重置，刷新 --%>
			<%@ include file="/WEB-INF/page/share/toolbar_common.jspf"%>
			<c:if test="${my:hasPermission(sessionId,systemSn,nameSpace, 0)}">
				<a href="javascript:;" iconCls="icon-add" plain="true" onclick="add()">添加</a>
				<a>-</a>
			</c:if>
			<c:if test="${my:hasPermission(sessionId,systemSn,nameSpace, 2)}">
				<a href="javascript:;" iconCls="icon-edit" plain="true" onclick="edit()">修改</a>
				<a>-</a>
			</c:if>
			<c:if test="${my:hasPermission(sessionId,systemSn,nameSpace, 3)}">
				<a href="javascript:;" iconCls="icon-del" plain="true" onclick="del()">删除</a>
				<a>-</a>
			</c:if>
			<c:if test="${my:hasPermission(sessionId,systemSn,nameSpace, 6)}">
				<a href="javascript:;" iconCls="icon-aduit" plain="true" onclick="roleModuleUI()">操作授权</a>
				<a>-</a>
			</c:if>
		</div>
		<div style="padding:10px;">
		<form name="searchFm" id="searchFm" method="post">
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
								<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" id="searchBtn">查询</a>
                            </td>
						</tr>
					</tbody>
				</table>
		</form>
		</div>
	</div>
	<div data-options="region:'center',border:true">
		<table id="dg">
		</table>
	</div>
</body>
<script type="text/javascript">
	var sizeObject={width:500,height:280};
	var dataList=null;
	function parsePage() {
			dataList=$('#dg').datagrid({
			url: '${basePath}/managment/privilege/role/ajaxlist.do?sessionId=${sessionId}',
			singleSelect : false,
			fitColumns : true,
			checkOnSelect : true,
			selectOnCheck : true,
			pageSize: 20,
			pageList: [20,50,100],
			columns : [ [ {
				checkbox : true
			}, {
				title : '角色名称',
				field : 'name',
				width : 100,
				align : 'left'
			}, {
				title : '角色标识',
				field : 'sn',
				width : 50,
				align : 'left'
			}, {
				title : '备注',
				field : 'note',
				width : 100,
				align : 'left'
			} ] ],
			onLoadSuccess : function() {
			}
		});
	}
	
	//验证标识的唯一性
	$.extend($.fn.validatebox.defaults.rules, {
	    unique: {
	    validator: function(value, param){
	    	var valid=true;
	    	var formData=$("#formU").form("getData");
	    	$.ajax({
	    		async:false,
	    		url:'${basePath}/managment/privilege/role/checkSnExsits.do?sessionId=${sessionId}',
	    		data:{sn : value,id : formData.id},
	    		success:function(json){
	    			if(json==1){
	    				valid=false;
	    			}
	    		}
	    	});
	    	return valid;
	    },
	    message: '标识不能重复!'
	    }
	});
	
	function add() {
		$("body").append('<div id="addUI"></div>');
		$('#addUI').dialog({    
		    title: '新增角色',    
		    width: sizeObject.width,    
		    height: sizeObject.height, 
		    closed: false,    
		    cache: false,    
		    href: '${basePath}/managment/privilege/role/insertUI.do?sessionId=${sessionId}',    
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
							'${basePath}/managment/privilege/role/insert.do?sessionId=${sessionId}',
							data,
							function(result){
								$.messager.progress('close');
								if(result.responseCode==100){
									$('#addUI').dialog('close');
									$('#addUI').remove();
									dataList.datagrid("reload");
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
		var data=dataList.datagrid("getSelected");
		if(!data){
			$.messager.alert('信息','请选择一条记录！','info');
			return;
		}
		$("body").append('<div id="editUI"></div>');
		$('#editUI').dialog({    
		    title: '编辑角色',    
		    width: sizeObject.width,    
		    height: sizeObject.height, 
		    closed: false,    
		    cache: false,    
		    href: '${basePath}/managment/privilege/role/updateUI.do?sessionId=${sessionId}',    
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
							'${basePath}/managment/privilege/role/update.do?sessionId=${sessionId}',
							fdata,
							function(result){
								$.messager.progress('close');
								if(result.responseCode==100){
									$('#editUI').dialog('close');
									$('#editUI').remove();
									dataList.datagrid("reload");
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
						url : "${basePath}/managment/privilege/role/delete.do?sessionId=${sessionId}&ids="+ id,
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
	function roleModuleUI() {
		var row=dataList.datagrid("getSelected");
		if(!row){
			$.messager.alert('信息','请选择一条记录！','info');
			return;
		}
		$("body").append('<div id="roleModuleUI"></div>');
		$('#roleModuleUI').dialog({    
		    title: '给 <font color="red">'+row.name+' </font>授权',    
		    width: 800,    
		    height: 450,    
		    closed: false,    
		    cache: false,    
		    href: "${basePath}/managment/privilege/acl/roleModuleUI.do?releaseSn=role&sessionId=${sessionId}&id=" + row.id,
		    modal: true,
		    buttons : [{
				text:'关闭',
				iconCls : 'icon-cancel',
				handler:function(){$('#roleModuleUI').dialog('close');$('#roleModuleUI').remove();}
			}],
			onLoad : function (){
				//系统菜单
				$('#systemMenu').tree({
					url:'${basePath}/managment/privilege/module/getsystems.do?sessionId=${sessionId}',
					onSelect: function(node){
						//取消绑定的click事件
						$("#selectAllBtn .btn,.mbtn").unbind("click"); 
						//重新加载treegrid的数据
						$.post("${basePath}/managment/privilege/module/getAllPriValBySystemSn.do?sessionId=${sessionId}",{systemSn : node.sn, type: '${nameSpace}', releaseId : row.id},function(data){
							$('#rmtg').treegrid("loadData",data);
						},'json');
					},
					onLoadSuccess:function(node,data){  
				        $("#systemMenu li:eq(0)").find("div").addClass("tree-node-selected");   //设置第一个节点高亮  
				        var n = $("#systemMenu").tree("getSelected");  
				        if(n!=null){  
				             $("#systemMenu").tree("select",n.target);    //相当于默认点击了一下第一个节点，执行onSelect方法  
				        }
				    }  
				});
				//权限值
				$('#rmtg').treegrid({
					rownumbers : true,
					fit:true,
					fitColumns : true,
					pagination : false,
					idField:'id',    
				    treeField:'name',
					columns : [ [ {
						title : '名称',
						field : 'name',
						width : 60,
						align : 'left'
					}, {
						title : ' 权限值',
						field : 'pvs',
						width : 150,
						align : 'left',
						formatter: function(value,row,index){
							var list=value,
								btnValue='全选',
								htmltext='',
								vflag=true;
							for(var i=0,len=list.length;i<len;i++){
								htmltext+='<label class="function-item">'+
								'<input class="jsrmtg" type="checkbox" name="'+row.id+'" sn="'+row.sn+'" value="'+list[i].position+'"';
								if(list[i].flag==true){
									htmltext+='checked=checked';
								}else{
									vflag=false;
								}
								htmltext+=' />&nbsp;'+list[i].name+'</label>';
								/* if((i+1)%6==0){//6个换一行
									htmltext+='<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
								}  */
							}
							if(vflag){
								btnValue='取消';
							}
							var btnhtml='<input class="mbtn btn btnplan" id="'+row.id+'" type="button" value="'+btnValue+'" style="cursor:pointer;"/>';
							//自动换行div
							var _autoHuanhangDivStart='<div style="width:370px;white-space: normal;">';
							var _autoHuanhangDivEnd='</div>';
							return _autoHuanhangDivStart+btnhtml+htmltext+_autoHuanhangDivEnd;
						}
					}] ],
					onLoadSuccess : function() {
						var node=$('#systemMenu').tree("getSelected");
						$(":checkbox").click(function(){
							var name=this.name,
								moduleSn=$(this).attr('sn'),
								value=this.value,
								yes=false;
							if(this.checked){
								yes=true;
							}
							$.ajax({
								type:'post',
								url:'${basePath}/managment/privilege/acl/setAcl.do?sessionId=${sessionId}',
								data:{releaseId:row.id,releaseSn:'${nameSpace}',systemSn:node.sn,moduleId:name,moduleSn:moduleSn,position:value,yes:yes}
							});
						});
						
						$(".mbtn").click(function(){
							var chks=document.getElementsByName(this.id),
								yes=false;
							if(this.value == '全选'){
								this.value='取消',yes=true;
								for(var i=0,len=chks.length;i<len;i++){
									chks[i].checked = true;
								}
							}else{
								this.value='全选';
								for(var i=0,len=chks.length;i<len;i++){
									chks[i].checked = false;
								}
							}
							$.ajax({
								type:'post',
								url:'${basePath}/managment/privilege/acl/setAclByModule.do?sessionId=${sessionId}',
								data:{releaseId:row.id,releaseSn:'${nameSpace}',systemSn:node.sn,moduleId:this.id,yes:yes}
							});
						});
						
						$("#selectAllBtn .btn").click(function(){
							var yes=true;
							if(this.value == '全选'){
								//全选
								$(".jsrmtg:checkbox").attr("checked","true");
								$(".mbtn").val("取消");
							}else{
								//全不选
								yes=false;
								$(".jsrmtg:checkbox").removeAttr("checked");
								$(".mbtn").val("全选");
							}
							$.ajax({
								type:'post',
								url:'${basePath}/managment/privilege/acl/setAllAcl.do?sessionId=${sessionId}',
								data:{releaseId:row.id,releaseSn:'${nameSpace}',systemSn:node.sn,yes:yes}
							});
						});
					}
				});
			}
		});    
	}
</script>
</html>