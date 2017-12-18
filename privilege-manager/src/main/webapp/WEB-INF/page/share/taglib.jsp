<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.ecnice.com/privilege/functions" prefix="my"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
request.setAttribute("basePath",basePath);
%>
<link rel="stylesheet" type="text/css" href="${basePath}/assets/css/ecnice.css"/>
<script src="${basePath}/resources/assets/boot.js" type="text/javascript"></script>
<script src="${basePath}/resources/assets/js/common/common.js" type="text/javascript" ></script>
