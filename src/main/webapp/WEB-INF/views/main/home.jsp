<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb" %>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>메인 페이지</title>
</head>
<body>
	<div class="container">
		<nb:navbar></nb:navbar>			
		<h1>메인페이지입니다 </h1>
	</div>

<c:if test="${not empty qweasd}">
<script type="text/javascript">
alert("${qweasd}");
</script>
</c:if>		
</body>
</html>