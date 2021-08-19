<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>공지사항</title>
</head>
<body>
	<div class="container">
		<nb:navbar></nb:navbar>
		
		<div class="top_bg text-center ">
		
			<h3 class="p-4">공지사항</h3>
			
		</div>
		
		<!-- 관리자만 글 쓸 수 있는 권한 부여 -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<%-- <a href="${writeUrl }"><i class="fas fa-pen"></i> 글쓰기</a> --%>
		<a href="${appRoot }/cs/noticeWriting"><i class="fas fa-pen"></i> 글쓰기</a>
		</sec:authorize>
		
		<table class="table table-striped">
		<thead>
			<tr>
				<th>게시글 번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${list }" var="board" varStatus="boardStatus">
			<c:url value="/cs/noticeReading" var="getUrl">
			<c:param name="nno" value="${board.nno }" />
			</c:url>
				<tr>
					<td>${boardStatus.count }</td>
					<td><a href="${getUrl}">${board.ntitle }</a></td>
					<td>관리자</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.nregdate }"/></td>
				</tr>
			</c:forEach>			
		</tbody>
		</table>
</div>

<!--  pagenation -->
<div>
<nav aria-label="Page navigation example">
  <ul id="list-pagenation1" class="pagination justify-content-center">
  
  	<c:if test="${pageMaker.prev }">
	    <li class="page-item">
	      <a class="page-link" href="${pageMaker.startPage - 1 }">Previous</a>
	    </li>
  	</c:if>
	
	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
	
	<%-- href value
	href="${appRoot }/board/list?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}"
	 --%>
	 
	    <li class="page-item ${num == cri.pageNum ? 'active' : '' }"><a class="page-link" 
	    href="${num }">${num }</a></li>
	</c:forEach>

	<c:if test="${pageMaker.next }">
	    <li class="page-item">
	      <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a>
	    </li>
	</c:if>
  </ul>
</nav>

<%-- 페이지 링크용 form --%>
<%-- <div style="display: none;">
	<form id="actionForm" action="${appRoot }/board/list" method="get">
		<input name="pageNum" value="${cri.pageNum }" />
		<input name="amount" value="${cri.amount }" />
		<input name="type" value="${cri.type }" />
		<input name="keyword" value="${cri.keyword }" />
	</form>
</div>
</div> --%>


</body>
</html>