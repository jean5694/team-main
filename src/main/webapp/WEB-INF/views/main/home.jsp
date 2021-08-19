<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb"%>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>


<title>고 집</title>
</head>
<body>
	<div class="container">
		<nb:navbar></nb:navbar>

		<a href="${appRoot }/store/home"><h1>스토어</h1></a>
		<div class="row row-cols-md-4">		  	
<!-- 상품 -->
	<c:forEach items="${storelist }" var="store">
		 <c:url value="/store/detail" var="getUrl">
		<c:param name="pno" value="${store.pno }" />
		</c:url>	   

		<a href="${getUrl}">	
	  <div class="col mb-3">
	    <div class="card">

	    	<%-- <img src="${imgRoot}store/${store.pno }/${store.fileName[0]}" class="card-img-top" > --%>
	    	<img alt="iphone" 
								src="${appRoot }/resources/img/iphone.jpg">
	     	<div class="card-body" style="text-align: center">	
	     		<input type="hidden" class="card-text" value="${store.pno }"/>
	 	     	<div class="card-title" >상품명 : ${store.title }</div>     
	       	</div>

	       <div class="form-group  m-0" id="card-detail" >
		        <div class="card-text" style="text-align: center">가격 : <fmt:formatNumber pattern="#,###원" value="${store.price }"/></div>
		   </div>     
	      		<hr>
	       <div id="card-address">
	       		<div class="card-add" style="text-align: center">${store.delivery }</div>
	       </div>  
    </div>
  </div>
	 	</a> 
	 </c:forEach>
</div>

		<hr>

		<%-- <a href="${appRoot }/market/main"><h1>중고마켓</h1></a>
		<table class="table table-hover">
		<img alt="iphone" width="150"
				src="${appRoot }/resources/img/iphone.jpg">
			<thead>
				<tr>
					<th style="width: 5%">#</th>
					<th style="width: 25%">제목</th>
					<th style="width: 30%">내용</th>
					<th style="width: 20%">상품상태</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${marketlist }" var="market">
					<tr>
						<td>${market.mno }</td>
						<td><c:url value="/market/detail" var="getUrl">
								<c:param name="mno" value="${market.mno }" />
							</c:url> <a href="${getUrl}"> ${market.mtitle } </a></td>
						<td>${market.mdetail }</td>
						<td>${market.mstate }</td>
						<td>${market.mprice }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table> --%>
		<a href="${appRoot }/market/main"><h1>중고마켓</h1></a>
<div class="container">
	<div class="card">
		<div class="row row-cols-md-4">
			<!-- 상품 -->
			<c:forEach items="${marketlist }" var="market">
				<c:url value="/market/detail" var="getUrl">
					<c:param name="mno" value="${market.mno }" />
				</c:url>
				<a href="${getUrl}">
					<div class="col mb-4">
						<div class="card" style="text-align: center">
							<img alt="iphone" 
								src="${appRoot }/resources/img/iphone.jpg">
							<div class="card-body" style="text-align: center">
								<input type="hidden" class="card-text" value="${market.mno }" />
								<div class="card-title" >상품명 : ${market.mtitle }</div>
							</div>

							<div class="form-group" id="card-detail" style="text-align: center">
								<span class="card-text">가격 : <fmt:formatNumber pattern="#,###원" value="${market.mprice }" /></span>
								<span class="card-time-before" style="float: right;">${market.mregdate }</span>
							</div>
							<hr>
							<div id="card-address">
								<div class="card-add" style="text-align: center">거래지역 : ${market.maddress }</div>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
</div>

		<hr>

		<a href="${appRoot }/community/cbhome"><h1>자유게시판</h1></a>
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width: 15%">#</th>
					<th style="width: 25%">제목</th>
					<th style="width: 40%">내용</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cboardList }" var="cboard">
					<tr>
						<td>${cboard.bno }</td>
						<td><c:url value="/community/cbreading" var="getUrl">
								<c:param name="bno" value="${cboard.bno }" />
							</c:url> <a href="${getUrl}"> ${cboard.title } </a></td>
						<td>${cboard.content }</td>
						<td>${cboard.writer }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<hr>

		<a href="${appRoot }/cs/notice"><h1>공지사항</h1></a>
		<table class="table table-striped">
		<thead>
			<tr>
				<th style="width: 15%">게시글 번호</th>
				<th style="width: 25%">제목</th>
				<th style="width: 40%">작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${noticelist }" var="notice" >
			<c:url value="/cs/noticeReading" var="getUrl">
			<c:param name="nno" value="${notice.nno }" />
			</c:url>
				<tr>
	<%-- 				<td>${notice.count }</td> --%>
					<th>${notice.nno }</td>
					<td><a href="${getUrl}">${notice.ntitle }</a></td>
					<td>${notice.userid }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.nregdate }"/></td>
				</tr>
			</c:forEach>			
		</tbody>
		</table>

		<br>



		<footer>
			<nb:footer></nb:footer>
		</footer>
	</div>





	<c:if test="${not empty qweasd}">
		<script type="text/javascript">
			alert("${qweasd}");
		</script>
	</c:if>
</body>
</html>