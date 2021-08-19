<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb"%>


<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<style type="text/css">
hr {
	margin: 0px;
}
a {
	color: black;
}
a:hover {
	color: black;
	text-decoration: none;
}
.card-body {
	padding: 10px;
}
.card-title {
	font-size: 22px;
}
#card-detail, #card-address {
	padding: 10px;
}
.card-img-top {
	width: 300px;
}
.card-img-top img {
	max-width: 100%;
}
</style>



<!-- timeago -->
<script src="${appRoot }/resources/js/date.js"></script>

<script>
	$(document).ready(function() {
		$("#list-pagenation1 a").click(function(e) {
			// 기본 액션 중지 (hyperlink 역할 안함)
			e.preventDefault();
			//console.log("a요소 클릭됨");
			var actionForm = $("#actionForm");
			// form의 pageNum input의 값을 a 요소의 href값으로 변경
			actionForm.find("[name=pageNum]").val($(this).attr("href"));
			// submit
			actionForm.submit();
		});
	});
</script>


<title>스토어</title>

</head>
<body>
	<div class="container">
		<nb:navbar />
		<nb:scroll />

		<div class="row">
			<div class="col-2">
				<ul class="nav flex-column">
					<li class="nav-item"><a
						class="nav-link btn-outline-secondary "
						href="${appRoot }/store/home">카테고리</a></li>
					<li class="nav-item"><a class="nav-link btn-light active"
						href="${appRoot }/store/home2">가구</a></li>
					<li class="nav-item"><a class="nav-link btn-outline-secondary"
						href="#">수납</a></li>
					<li class="nav-item"><a class="nav-link btn-outline-secondary"
						href="#">조명</a></li>
					<li class="nav-item"><a class="nav-link btn-outline-secondary"
						href="#">가전</a></li>
					<li class="nav-item"><a class="nav-link btn-outline-secondary"
						href="#">장식/소품</a></li>
				</ul>
			</div>


			<div class="col-10">

				<!-- 키워드 -->
				<ul class="nav nav-pills">
					<li class="nav-item"><a class="nav-link active" href="#">Active</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">#침실</a></li>
					<li class="nav-item"><a class="nav-link" href="#">#서재</a></li>
					<li class="nav-item"><a class="nav-link disabled" href="#"
						tabindex="-1" aria-disabled="true">Disabled</a></li>
				</ul>



				<!-- 상품 목록 -->
				<h4>오늘의 상품 추천</h4>

				<div class="row row-cols-md-4">
					<!-- 상품 -->
					<c:forEach items="${list }" var="store">
						<c:url value="/store/detail" var="getUrl">
							<c:param name="pno" value="${store.pno }" />
							<c:param name="pageNum" value="${pageMaker.cri.pageNum }" />
							<c:param name="amount" value="${pageMaker.cri.amount }" />
						</c:url>



						<a href="${getUrl}">
							<div class="col mb-3">
								<div class="card">

									<img src="${imgRoot}store/${store.pno }/${store_file[0]}"
										class="card-img-top">
									<div class="card-body">
										<input type="hidden" class="card-text" value="${store.pno }" />
										<div class="card-title">${store.title }</div>
									</div>

									<div class="form-group" id="card-detail">
										<div class="card-text">
											<fmt:formatNumber pattern="#,###원" value="${store.price }" />
										</div>
									</div>
									<hr>
									<div id="card-address">
										<div class="card-add">${store.delivery }</div>
									</div>
								</div>
							</div>
						</a>
					</c:forEach>
				</div>

				<!--  pagenation -->
				<div>
					<nav aria-label="Page navigation example">
						<ul id="list-pagenation1"
							class="pagination justify-content-center">
							<c:if test="${pageMaker.prev }">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.startPage - 1 }">Previous</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="num">
								<%-- href value 	
	   href="${appRoot }/board/list?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}"	 
	   --%>
								<li class="page-item"><a class="page-link" href="${num }">${num }</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next }">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.endPage + 1 }">Next</a></li>
							</c:if>
						</ul>
					</nav>

					<div style="display: none;">
						<form id="actionForm" action="${appRoot }/store/main" method="get">
							<input name="pageNum" value="${pageMaker.cri.pageNum }" /> <input
								name="amount" value="${pageMaker.cri.amount }" />
						</form>
					</div>


				</div>

			</div>

</div>
			<footer>
				<nb:footer />
			</footer>


		</div>
</body>
</html>