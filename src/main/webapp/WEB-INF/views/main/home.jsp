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


<title>고 집</title>
</head>
<body>
	<div class="container">
		<nb:navbar></nb:navbar>			
  <h1>스토어</h1>
		<div class="card">
  <img alt="iphone" width="150" src="${appRoot }/resources/img/iphone.jpg">
  <div class="card-body">
    <h5 class="card-title">의 자</h5>
    <p class="card-text">단단하다.</p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">An item</li>
    <li class="list-group-item">A second item</li>
    <li class="list-group-item">A third item</li>
  </ul>
  <div class="card-body">
    <a href="#" class="card-link">스토어</a>
  </div>
</div>
<hr>
  <h1>중고마켓</h1>
<div class="card" style="width: 70rem;">
  <img alt="samsung" width="150" src="${appRoot }/resources/img/samsung.jpg">
  <div class="card-body">
    <h5 class="card-title">책 상</h5>
    <p class="card-text">튼튼하다.</p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">An item</li>
    <li class="list-group-item">A second item</li>
    <li class="list-group-item">A third item</li>
  </ul>
  <div class="card-body">
    <a href="#" class="card-link">중고마켓</a>
  </div>
</div>
<hr>
<h1>자유게시판</h1>
<ul class="list-group">
  <li class="list-group-item disabled" aria-disabled="true">자유게시판</li>
  <li class="list-group-item">1.에베베</li>
  <li class="list-group-item">1.에베베</li>
  <li class="list-group-item">1.에베베</li>
  <li class="list-group-item">1.에베베</li>
</ul>
<hr>
<h1>공지사항</h1>
<ul class="list-group">
  <li class="list-group-item disabled" aria-disabled="true">공지사항</li>
  <li class="list-group-item">1.에베베</li>
  <li class="list-group-item">1.에베베</li>
  <li class="list-group-item">1.에베베</li>
  <li class="list-group-item">1.에베베</li>
</ul>
	</div>
	

<c:if test="${not empty qweasd}">
<script type="text/javascript">
alert("${qweasd}");
</script>
</c:if>		
</body>
</html>