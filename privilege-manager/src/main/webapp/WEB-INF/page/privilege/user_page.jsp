<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/page/share/taglib.jsp"%>
<%-- 查询js --%>
<%@ include file="/WEB-INF/page/share/dosearch.jspf"%>
<c:set var="systemSn" value="privilege" scope="page"/>
<c:set var="nameSpace" value="user" scope="page"/>
<title>用户管理</title>
</head>
<body class="easyui-layout">   
    <div data-options="region:'west',title:'部门列表',split:true" style="width:200px;">
    	<ul id="dept"></ul>
    </div>   
    <div data-options="region:'center'">
    	<div class="easyui-layout" data-options="fit:true">   
            <div data-options="region:'north'">
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
					<c:if test="${my:hasPermission(sessionId,systemSn,nameSpace, 1)}">
						<a href="javascript:;" iconCls="icon-search" plain="true" onclick="detail()">查看详情</a>
						<a>-</a>
					</c:if>
					<c:if test="${my:hasPermission(sessionId,systemSn,nameSpace, 2)}">
						<a href="javascript:;" iconCls="icon-aduit" plain="true" onclick="addrole()">分配角色</a>
						<a>-</a>
					</c:if>
					<c:if test="${my:hasPermission(sessionId,systemSn,nameSpace, 6)}">
						<a href="javascript:;" iconCls="icon-aduit" plain="true" onclick="adduseracl()">操作授权</a>
						<a>-</a>
					</c:if>
					<c:if test="${my:hasPermission(sessionId,systemSn,nameSpace, 2)}">
						<a href="javascript:;" iconCls="icon-edit" plain="true" onclick="updatePassword()">修改密码</a>
						<a>-</a>
					</c:if>
				</div>
				<div style="padding:10px;">
					<form name="searchFm" id="searchFm" method="post">
			                  <table class="search-tb">
			                     <tbody>
			                        <tr>
			                        	<td>用户名：
			                        		<input class="ipt" name="username"/>
			                        	</td>
			                            <td>姓名：
			                            	<input class="ipt" name="realName"/>
			                            </td>
			                        	<td>手机：
			                        		<input class="ipt" name="mobile"/>
			                        	</td>
			                            <td>邮箱：
			                            	<input class="ipt" name="email"/>
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
            <div data-options="region:'center'">
    			<table id="dg"></table>
            </div>   
        </div>
    </div>   
</body>
<script>
	var sizeObject={width:750,height:450};
	$.parser.parse();
	$('#dept').tree({
		loadFilter: userPageTreeLoadFilter,
		url:'${basePath}/managment/privilege/dept/ajaxlist.do?sessionId=${sessionId}',
		onSelect: function(node){
			//使用'clearSelections':防止读取到了删除的数据
			$('#dg').datagrid("clearSelections");
			$('#dg').datagrid("reload");
		},
		onLoadSuccess:function(node,data){  
	        $("#dept li:eq(0)").find("div").addClass("tree-node-selected");   //设置第一个节点高亮  
	        var n = $("#dept").tree("getSelected");  
	        if(n!=null){  
	            $("#dept").tree("select",n.target);    //相当于默认点击了一下第一个节点，执行onSelect方法  
	        }
	    }  
	});
	
	function userPageTreeLoadFilter(data){
		return common.treeLoadFilter(data,{source:2});
	}
	function pagerFilterSys(data){
        if ($.isArray(data)){    // is array  
        	for(var i=0; i<data.length; i++){
        		data[i].text = data[i].name;
        	}
        }
        return data;
	}
	
	$('#dg').datagrid({
		url:"${basePath}/managment/privilege/user/ajaxlist.do?sessionId=${sessionId}",
		singleSelect : false,
		fitColumns : true,
		checkOnSelect : true,
		selectOnCheck : true,
		pageSize: 20,
		pageList: [20,50,100],
		columns : [ [ {
			checkbox : true
		}, {
			title : '用户名',
			field : 'username',
			width : 50,
			align : 'center'
		}, {
			title : '姓名',
			field : 'realName',
			width : 30,
			align : 'left'
		}, {
			title : '性别',
			field : 'sex',
			width : 20,
			align : 'center',
			formatter: function(value,row,index){
				if(value == 0){
					return "男";
				}
				if(value == 1){
					return "女";
				}
				return value;
			}
		}, {
			title : '角色',
			field : 'roles',
			width : 50,
			align : 'left',
			formatter:function(value,row,index){
				//自动换行div
				var _autoHuanhangDivStart='<div style="width:120px;white-space: normal;">';
				var _autoHuanhangDivEnd='</div>';
				return _autoHuanhangDivStart+value+_autoHuanhangDivEnd;
			}
		} , {
			title : '手机',
			field : 'mobile',
			width : 50,
			align : 'left'
		}, {
			title : '座机',
			field : 'phone',
			width : 50,
			align : 'left'
		}, {
			title : '邮箱',
			field : 'email',
			width : 80,
			align : 'left'
		}, {
			title : '部门',
			field : 'deptName',
			width : 50,
			align : 'left'
		}] ],
		onLoadSuccess : function() {
			
		},
		onBeforeLoad : function(param) {
			var n = $("#dept").tree("getSelected");
			if(n!=null){  
				param.departmentId=n.id;
	        }else{
	        	return false;
	        }
		}
	});
	
	function add() {
		$("body").append('<div id="addUI"></div>');
		$.parser.parse($('#addUI'));
		$('#addUI').dialog({    
		    title: '新增用户',    
		    width: sizeObject.width,    
		    height: sizeObject.height,    
		    closed: false,    
		    cache: false,    
		    href: "${basePath}/managment/privilege/user/insertUI.do?sessionId=${sessionId}",    
		    modal: true,
		    buttons : [{
				text:'保存',
				iconCls : 'icon-save',
				handler:function(){
					var form=$("#formA");
					if(form.form('validate')){
						$.messager.progress(); 
						var data=form.serialize();
						$.post(
							'${basePath}/managment/privilege/user/insert.do?sessionId=${sessionId}',
							data,
							function(result){
								$.messager.progress('close');
								if(result.responseCode==100){
									//$('#addUI').dialog('close');
									$('#addUI').dialog('destroy');
									$('#addUI').remove();
									$('#dg').datagrid("reload");
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
				handler:function(){
					//$('#addUI').dialog('close');
					$('#addUI').dialog('destroy');
					$('#addUI').remove();
				}
			}]
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
	    		url:'${basePath}/managment/privilege/user/checkUserNameExsits.do?sessionId=${sessionId}',
	    		data:{username : value , id : formData.id},
	    		success:function(json){
	    			if(json==1){
	    				valid=false;
	    			}
	    		}
	    	});
	    	return valid;
	    },
	    message: '用户名不能重复!'
	    }
	});
	
	function edit() {
		var data=$('#dg').datagrid("getSelected");
		if(!data){
			$.messager.alert('信息','请选择一条记录！','info');
			return;
		}
		$("body").append('<div id="editUI"></div>');
		$.parser.parse($('#editUI'));
		$('#editUI').dialog({    
		    title: '编辑用户',    
		    width: sizeObject.width,    
		    height: sizeObject.height,    
		    closed: false,    
		    cache: false,    
		    href: '${basePath}/managment/privilege/user/updateUI.do?sessionId=${sessionId}&userId='+data.id,    
		    modal: true,
		    buttons : [{
				text:'保存',
				iconCls : 'icon-save',
				handler:function(){
					var form=$("#formU");
					if(form.form('validate')){
						$.messager.progress(); 
						var fdata=form.serialize();
						$.post(
							'${basePath}/managment/privilege/user/update.do?sessionId=${sessionId}',
							fdata,
							function(result){
								$.messager.progress('close');
								if(result.responseCode==100){
									//$('#editUI').dialog('close');
									$('#editUI').dialog('destroy');
									$('#editUI').remove();
									$('#dg').datagrid("reload");
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
				handler:function(){
					//$('#editUI').dialog('close');
					$('#editUI').dialog('destroy');
					$('#editUI').remove();
				}
			}],
			onLoad : function (){
				var form=$("#formU");
				form.form("load",data);
			}
		});    
	}
	
	function detail() {
		var data=$('#dg').datagrid("getSelected");
		if(!data){
			$.messager.alert('信息','请选择一条记录！','info');
			return;
		}
		$("body").append('<div id="detailUI"></div>');
		$.parser.parse($('#detailUI'));
		$('#detailUI').dialog({    
		    title: '用户详情',    
		    width: sizeObject.width,    
		    height: sizeObject.height,    
		    closed: false,    
		    cache: false,    
		    href: '${basePath}/managment/privilege/user/detailUI.do?sessionId=${sessionId}&userId='+data.id,    
		    modal: true,
		    buttons : [{
				text:'关闭',
				iconCls : 'icon-cancel',
				handler:function(){
					//$('#detailUI').dialog('close');
					$('#detailUI').dialog('destroy');
					$('#detailUI').remove();
				}
			}],
			onLoad : function (){
				var form=$("#formD");
				form.form("load",data);
			}
		});    
	}
	
	function del() {
		var rows=$('#dg').datagrid("getSelections");
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
						url : "${basePath}/managment/privilege/user/delete.do?sessionId=${sessionId}&ids="+ id,
						dataType : 'json',
						success : function(text) {
							$.messager.progress('close');
							if (text.responseCode == 101) {
								$.messager.alert(text.responseMsg);
							}else{
								//使用'clearSelections':防止读取到了删除的数据
								$('#dg').datagrid("clearSelections");
								$('#dg').datagrid("reload");
							}
						}
					});
				}
			});
		} else {
			$.messager.alert('信息','请选择要删除的记录！','info');
		}
	}
	
	function addrole() {
		var row=$('#dg').datagrid("getSelected"),roles=[];
		if(!row){
			$.messager.alert('信息','请选择一条记录！','info');
			return;
		}
		
		function addRoleInfo(_obj){//添加角色
			var rowData=_obj.rowData;
			for(var i=0,len=roles.length;i<len;i++){
				if(roles[i]==rowData.id){
					return;
				}
			}
			roles.push(rowData.id);
		}
		
		function delRoleInfo(_obj){//删除角色
			var rowData=_obj.rowData;
			for(var i=0,len=roles.length;i<len;i++){
				if(roles[i]==rowData.id){
					roles.splice(i, 1);
					return;
				}
			}
		}
		
		$("body").append('<div id="roleModuleUI"></div>');
		$.parser.parse($('#roleModuleUI'));
		$('#roleModuleUI').dialog({    
		    title: '给 <font color="red">'+row.realName+'</font> 分配角色',    
		    width: 750,    
		    height: sizeObject.height,    
		    closed: false,    
		    cache: false,    
		    href: "${basePath}/managment/privilege/user/insertRoleUI.do?sessionId=${sessionId}",
		    modal: true,
		    buttons : [{
				text:'保存',
				iconCls : 'icon-save',
				handler:function(){
					$.ajax({
						type:'post',
						url:'${basePath}/managment/privilege/user/saveUserRole.do?sessionId=${sessionId}',
						data:{userId:row.id,roleIds:roles.join(",")},
						dataType:'json',
						success:function(text){
							if(text.responseCode==100){
								//$('#roleModuleUI').dialog('close');
								$('#roleModuleUI').dialog('destroy');
								$('#roleModuleUI').remove();
								$('#dg').datagrid("reload");
							}else{
								$.messager.alert('信息','保存失败！','info');
							}
						}
					});
				}
			},{
				text:'关闭',
				iconCls : 'icon-cancel',
				handler:function(){
					//$('#roleModuleUI').dialog('close');
					$('#roleModuleUI').dialog('destroy');
					$('#roleModuleUI').remove();
				}
			}],
			onLoad : function (){
				$.ajax({
					async:false,
					type:'post',
					url:'${basePath}/managment/privilege/user/getRoleByUserId.do?sessionId=${sessionId}',
					data:{userId:row.id},
					dataType:'json',
					success:function(text){
						if(text && text.length>0){
							for(var i=0;i<text.length;i++){
								roles.push(text[i].id);
							}
						}
					}
				});
				$.parser.parse($('#roledg'));
				$('#roledg').datagrid({
					url: '${basePath}/managment/privilege/user/getRoles.do?sessionId=${sessionId}&userId='+row.id,
					method : 'post',
					singleSelect : false,
					idField : "id",
					fitColumns : true,
					checkOnSelect : true,
					selectOnCheck : true,
					collapsible : true,
					pagination : true,
					pageSize: 10,
					pageList: [10,20,50],
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
					onLoadSuccess : function(data) {
						 //选中角色
						 if ($.isArray(data)){    // is array  
							 for(var i=0;i<data.length;i++){
								 var row=data[i];
								 if(row.checked){
									 $('#roledg').datagrid("selectRecord",row.id);
								 }
							 }
						 }
					},
					onSelect : function(rowIndex, rowData){
						addRoleInfo({rowData:rowData});
					},
					onUnselect : function(rowIndex, rowData){
						delRoleInfo({rowData:rowData});
					},
					onSelectAll : function(rows){
						$.each(rows,function(index,rowData){
							if(rowData){
								addRoleInfo({rowData:rowData});
							}
						});
					} ,
					onUnselectAll : function(rows){
						$.each(rows,function(index,rowData){
							if(rowData){
								delRoleInfo({rowData:rowData});
							}
						});
					} 
				});
				
				//查询方法
				var doSearchRole = function doSearch(){
					var myForm = $('#searchFmRole');
					var data = myForm.serializeJson();
					$.each(data,function(index,dom){ //去空格
						if(index && dom){
							data[index]=$.trim(dom);
						}
					});
					/*$('#subDg').datagrid({
						url:basePath+'/search/sku/ajaxList.do',
						queryParams:data
					});*/
					$('#roledg').datagrid('load', data);
				};
				//查询按钮
				$('#searchBtnRole').click(function() {
					doSearchRole();
				});
				//回车事件
				$('#searchFmRole').on('keydown', function(event){
					if(event.keyCode == 13){
						doSearchRole();
					}
				});
			}
		});    
	}
	
	function adduseracl() {
		var row=$('#dg').datagrid("getSelected");
		if(!row){
			$.messager.alert('信息','请选择一条记录！','info');
			return;
		}
		$("body").append('<div id="roleModuleUI"></div>');
		$.parser.parse($('#roleModuleUI'));
		$('#roleModuleUI').dialog({    
		    title: '给 <font color="red"> '+row.realName+' </font>授权',    
		    width: 800,    
		    height: sizeObject.height,    
		    closed: false,    
		    cache: false,    
		    href: "${basePath}/managment/privilege/acl/roleModuleUI.do?releaseSn=role&sessionId=${sessionId}&id=" + row.id,
		    modal: true,
		    buttons : [{
				text:'关闭',
				iconCls : 'icon-cancel',
				handler:function(){$('#roleModuleUI').dialog('destroy');$('#roleModuleUI').remove();}
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
								} */
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
	
	function updatePassword() {
		var row=$('#dg').datagrid("getSelected");
		if(!row){
			$.messager.alert('信息','请选择一条记录！','info');
			return;
		}
		$("body").append('<div id="pwdUI"></div>');
		$.parser.parse($('#pwdUI'));
		$('#pwdUI').dialog({    
		    title: '修改密码',    
		    width: 400,    
		    height: 220,    
		    closed: false,    
		    cache: false,    
		    href: "${basePath}/managment/privilege/user/udpatePasswordUI.do?sessionId=${sessionId}",
		    modal: true,
		    buttons : [{
				text:'保存',
				iconCls : 'icon-save',
				handler:function(){
					var form=$("#formP");
					if(form.form('validate')){
						$.messager.progress(); 
						var fdata=form.serialize();
						$.post(
							'${basePath}/managment/privilege/user/updatePassowrd.do?sessionId=${sessionId}',
							fdata,
							function(result){
								$.messager.progress('close');
								if(result.responseCode==100){
									//$('#pwdUI').dialog('close');
									$('#pwdUI').dialog('destroy');
									$('#pwdUI').remove();
									$('#dg').datagrid("reload");
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
				handler:function(){
					//$('#pwdUI').dialog('close');
					$('#pwdUI').dialog('destroy');
					$('#pwdUI').remove();
				}
			}],
			onLoad : function (){
				var form=$("#formP");
				form.form("load",row);
			}
		}); 
	}
</script>
</html>
<!-- <script type="text/javascript">
	mini.parse();
	var grid = mini.get("userlist"),
		tree = mini.get("depttree");
	tree.on("nodeclick", function (e) {
        grid.load({departmentId:e.node.id});
    });
	//默认选中第一个节点
	tree.selectNode(tree.data[0].children[0]);
	grid.load({departmentId:tree.data[0].children[0].id});
	
	function ondrawcell(e){
		var field=e.field;
		if(field=='sex'){
			e.cellHtml=(e.value==0)?'男':'女';
		}
	}
	function add() {
		mini.open({
			url : "${basePath}/managment/privilege/user/insertUI.do?sessionId=${sessionId}",
			title : "新增用户",
			width : 750,
			height:550,
			ondestroy : function(action) {
				grid.reload();
			}
		});
	}
	function addrole() {
		var row = grid.getSelected();
		if (row) {
			mini.open({
				url : "${basePath}/managment/privilege/user/insertRoleUI.do?sessionId=${sessionId}&userId="+row.id,
				title : "分配角色",
				width : 700,
				onload : function() {
				 	var iframe = this.getIFrameEl();
					var data = {
						userId:row.id
					};
					iframe.contentWindow.SetData(data); 
				},
				ondestroy : function(action) {
					grid.reload();
				}
			});
		}else {
			mini.alert("请选中一条记录");
		}
	}
	function updatePassword() {
		var row = grid.getSelected();
		if (row) {
			mini.open({
				url : "${basePath}/managment/privilege/user/udpatePasswordUI.do?sessionId=${sessionId}",
				title : "修改密码",
				width : 400,
				height:220,
				onload : function() {
				 	var iframe = this.getIFrameEl();
					var data = {
						userId:row.id,
						username:row.username
					};
					iframe.contentWindow.SetData(data); 
				},
				ondestroy : function(action) {
					grid.reload();
				}
			});
		}else {
			mini.alert("请选中一条记录");
		}
	}
	function adduseracl() {
		var row = grid.getSelected();
		if (row) {
			mini.open({
				url : "${basePath}/managment/privilege/acl/roleModuleUI.do?releaseSn=user&sessionId=${sessionId}&id=" + row.id,
				title : "操作授权",
				width : 1024,
				height:500,
				onload : function() {
				 	var iframe = this.getIFrameEl();
					var data = {
						id : row.id,
						name : row.realName,
						releaseSn:'${nameSpace}'
					};
					iframe.contentWindow.SetData(data); 
				},
				ondestroy : function(action) {
					grid.reload();
				}
			});
		}else {
			mini.alert("请选中一条记录");
		}
	}
	function edit() {
		var row = grid.getSelected();
		if (row) {
			mini.open({
				url : "${basePath}/managment/privilege/user/updateUI.do?sessionId=${sessionId}&id=" + row.id,
				title : "编辑用户",
				width : 750,
				height:550,
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
	function detail() {
		var row = grid.getSelected();
		if (row) {
			mini.open({
				url : "${basePath}/managment/privilege/user/detailUI.do?sessionId=${sessionId}&id=" + row.id,
				title : "用户详情",
				width : 700,
				height:450,
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
						url : "${basePath}/managment/privilege/user/delete.do?sessionId=${sessionId}&ids="
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
		var name = mini.get("name").getValue();
		var node=tree.getSelectedNode();
		grid.load({
			realName : name,
			username : name,
			tel : name,
			phone : name,
			email : name,
			departmentId : node.id
		});
	}
	function onKeyEnter(e) {
		search();
	}
</script> -->