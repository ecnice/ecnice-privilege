/**
 * Created by xiao.y on 14-3-31.
 */
var Index = {
    tabs:null,
    init: function () {
        var tree = $("#leftMenu");
        this.tabs = $("#mainTabs");

        //节点点击事件
        tree.tree({
        	onClick: function(node){
        		if(tree.tree("isLeaf",node.target)){
        			addBlankTab(node);
        		}
        	}
        });

        //导航点击
        $('#navMenu li').bind('click',
            function () {
                var _this = $(this);
                _this.addClass('curr').siblings().removeClass('curr');
                var _tt = _this.find('span').text();
                var _url = _this.attr('data-url');
                var _deskUrl=_this.attr('data-deskurl');
                var _sessionId = _this.attr('data-sessionid');
                $('#west').find('.mini-layout-region-title').html(_tt + '菜单');
                tree.tree("options").url=_url;
                $("#leftMenuPanel").panel({
                	title:_this.html().trim()+"菜单"
                });
                tree.tree("reload");
                $('#deskFrame').attr('src',_deskUrl+"/index.do?sessionId="+_sessionId);
                return false;
        });

        //系统桌面点击
        $('#lnkDesk').click(function(){
            Index.tabs.tabs('select',0);
        });
    }
};

//全拼切换
var maxTab = false;//最大化
function tabToolsFullScreenOnClick(){
	if (maxTab) {
        maxTab = false;
        $("body").layout('expand','north');
        $("body").layout('expand','south');
        $("body").layout('expand','west');
        $("#tabToolsFullScreen").linkbutton({
    		iconCls: 'icon-window-min',
    		text: '正常'
    	});
    } else {
        maxTab = true;
        $("body").layout('collapse','north');
        $("body").layout('collapse','south');
        $("body").layout('collapse','west');
        $("#tabToolsFullScreen").linkbutton({
    		iconCls: 'icon-window-min',
    		text: '全屏'
    	});
    }
}

function closeTab() {
	Index.tabs.removeTab(currentTab);
}

function closeAllBut() {
	var but = [currentTab];            
    but.push(Index.tabs.getTab("first"));
    Index.tabs.removeAll(but);
}

function closeAll() {
	var but = [];            
    but.push(Index.tabs.getTab("first"));
    Index.tabs.removeAll(but);
}


function refreshMainTab(title){
	if(title=="current"){
		currentTab=Index.tabs.getActiveTab();
	}else{
		currentTab=getTabByTitle(title);
	}
	Index.tabs.reloadTab(currentTab);
}


function closeMainTab(title) {
	if (title == "current") {
		currentTab = Index.tabs.getActiveTab();
	} else {
		currentTab = getTabByTitle(title);
	}
	Index.tabs.tabs('close',currentTab);
}

//关闭一个没有id的tab
function closeMainTabForNoteIdIsNull(obj) {
	var title = $.trim(obj.title).slice(1,-1); 
	if (title == "current") {
		currentTab = Index.tabs.getActiveTab();
	} else {
		title+='<span style=\'display:none;\'>undefined</span>';
		currentTab = getTabByTitle(title);
	}
	Index.tabs.tabs('close',currentTab);
}

function getTabByTitle(title){
	//var tabs=Index.tabs.getTabs();
	var tabs=Index.tabs.tabs('tabs');
	var currentTab=null;
	for(var i=0,j=tabs.length;i<j;i++){
		if($.trim(tabs[i].panel('options').title)==$.trim(title)){
			currentTab=$.trim(tabs[i].panel('options').title);
			return currentTab;
		}
	}
	return currentTab;
};



$(function(){
    Index.init();
    var $allLi=$("#navMenu li");
    if($allLi && $allLi.length>0){
    	for(var i=0;i<$allLi.length-2;i++){
    		var before=$($allLi[i]).position().left;
    		var after=$($allLi[i+1]).position().left;
    		if(before>after){
    			$("#moreMenu").show();
    			$("#navMenu ul").width($allLi.length*160);
    		}
    	}
    }
    $("#moreMenu").click(function(){
    	$("#navMenu li").animate({left:"-=100px"});
    	$("#moreMenu1").show();
    	var lastLi=$($allLi[$allLi.length-1]).position().left;
    	var mMenu=$("#moreMenu").position().left;
    	if(lastLi<mMenu){
    		$("#moreMenu").hide();
    	}
    });
    $("#moreMenu1").click(function(){
    	$("#navMenu li").animate({left:"+=100px"});
    	var first=$($allLi[0]).position().left;
    	if(first>=0){
    		$("#navMenu li").animate({left:"-=100px"});
    		$("#moreMenu1").hide();
    		return;
    	}
    	var lastLi=$($allLi[$allLi.length-1]).position().left;
    	var mMenu=$("#moreMenu").position().left;
    	if(lastLi>mMenu){
    		$("#moreMenu").show();
    	}
    });
    //跨域调用方法
    var messenger = new Messenger('parent', 'MessengerIcEasy');
    messenger.listen(function (msgs) {
    	var arrMsg=msgs.split('{|}');
    	var t=arrMsg[0];
    	var msg=arrMsg[1];
        switch(t){
        case "showSuc":
        	showSuc(msg);
        	break;
        case "showInfo":
        	showMsg(msg,"info");
        	break;
        case "showWarn":
        	showMsg(msg,"warn");
        	break;
        case "showError":
        	showMsg(msg,"error");
        	break;
        case "showTab":
        	addBlankTab(msg);
        	break;	
        case "refreshTab":
        	refreshMainTab(msg);
        	break;	
        case "closeTab":
        	closeMainTab(msg);
        	break;
        case "closeTabEx": //需要在其他系统的 base.js中定义这个方法
        	closeMainTabForNoteIdIsNull({title:msg});
        	break;
        }
        
    });
    
});


function showSuc(msg){
    top.mini.showTips({
        content: '<b>提示</b> <br/>'+msg,
        state: 'info',
        x:'right',
        y: 'bottom',
        timeout:1000
    });
}


function showMsg(msg,t){
	var _iconCls="";
	switch(t){
	case "info":
		_iconCls="mini-messagebox-info";
		break;
	case "warn":
		_iconCls="mini-messagebox-warning";
		break;
	case "error":
		_iconCls="mini-messagebox-error";
		break;
	}
	var _w=400;
	if(msg.length>300){
		_w=650;
        msg="<div style='width:100%;height:250px;overflow:auto;word-break:break-all;float:left;'>"+msg+"</div>";
    }
	
	mini.showMessageBox({
        width: _w,
        title: "提示",
        buttons: ["ok"],
        message: msg,
        iconCls:_iconCls
    });
	
}

function addBlankTab(node) {
	if(!node.text){
		node=eval("("+node+")"); //转成对象
	}
	var _title=node.text+"<span style='display:none;'>"+node.id+"</span>";
	var _content= '<iframe style="border:none;width:100%;height:100%;" src="'+node.url+'" frameborder="0" scrolling="none"></iframe>';
	
	var tab=Index.tabs.tabs('getTab',_title);
	if(!tab){
		Index.tabs.tabs('add',{
			title: _title,
			fit: true,
			closable:true,
			content:_content
		});
		$.messager.progress('close');
	}else{
		Index.tabs.tabs('select',node.text+"<span style='display:none;'>"+node.id+"</span>");
		
		//更新内容
		if(node.refresh){
			Index.tabs.tabs('update',{
				tab: tab,
				options: {
					title: _title,
					content: _content
				}
			});
		}
	}
}
