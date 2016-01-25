<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/WEB-INF/page/share/taglib.jsp" %>
<title>添加模块权限值</title>
</head>
	<body>
	<center>
	<div class="tb_class">
		<input class="btn btnplan selectAllBtn" type="button" value="全选" style="cursor: pointer;"/>&nbsp;&nbsp;
		<input class="btn btnplan selectAllBtn" type="button" value="取消" style="cursor: pointer;"/>
	</div>
	<form id="formA" method="post">
        <div style="margin:20px auto;">
	        <c:forEach items="${priVals}" var="pval" varStatus="status">
	        	&nbsp;
	        	<label><input type="checkbox" name="pvs" value="${pval.position }" />&nbsp;${pval.name}</label>
	        	<%-- 6个换一行 --%>
	        	<c:if test="${(status.index+1)%6==0}">
	        	<br />
	        	</c:if>
	        </c:forEach>
        </div>
    </form>
    </center>
</body>
</html>