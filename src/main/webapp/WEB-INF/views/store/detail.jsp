<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 날짜 형식 fmt tag 사용하기 위해 import함 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>



<style type = "text/css">
.part-img img {
	max-width :100%;
	padding : 20px;
}
.carousel-item img {
	width :450px;
}
</style>



<title>상세페이지</title>
</head>
<body>
<div class="container">
<nb:navbar/>
<nb:scroll/>

	<h3>상품 페이지</h3>
	<hr> 	
	

	<div class="row">
	

					
			<div class="form-group col-6">
			<c:if test="${not empty store.fileName }">
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
			  <div class="carousel-inner">
			    
	           <c:forEach items="${store.fileName }" var="store_file" varStatus="status">
	           
	           <div class="carousel-item <c:if test='${status.first }' >active</c:if>"">
					<img src="${imgRoot}store/${store.pno }/${store_file}">
				</div>
			
				
	           </c:forEach>
	          
	           
	           
	           
	            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
				    <spa n class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a> 
	           
	           </div>
	           </div>
		    </c:if> 
			</div>
			<!-- <script type="text/javascript">
			$(function() {
			 $("#wish1").click(function(){
              $("form").attr("action", "${appRoot}/store/storewish");
             })
             $("#cart1").click(function(){
              $("form").attr("action", "${appRoot}/store/cart");
             })
             $("#buy1").click(function(){
              $("form").attr("action", "${appRoot}/store/storebuy");
             })
			})
			</script> -->
			
		<div class="part-detail col-6">
			
				<div class="form-group">
					<label for="title">상품명</label>
					<span>${store.title }</span>
				</div>	
					
				<div class="form-group">
					<label for="price">판매가</label>
					<span><fmt:formatNumber value="${store.price}" pattern="#,###원"/></span>
				</div>	
				<div class="form-group">
					<label for="stock">재고수량</label>
					<span>${store.stock }</span>
				</div>	
				
				<div class="form-group">
					<label for="keyword">키워드</label>
					<span>${store.keyword }</span>
				</div>	
					
				<div class="form-group">
					<label for="delivery">배송</label>
					<span>${store.delivery }</span>
				</div>	
				
				<button type = "submit" class="btn btncl" id = "wish1" ><i class="fas fa-heart"></i> 찜하기 </button>
		
		<form action="${appRoot }/store/cart" method="post">
				<input type = "hidden" name="pno" value = "${store.pno }">
				<select name = "cartstock" id = "cartstock">
					<c:forEach begin="1" end="10" var ="i">
						<option value="${i }">${i }</option>
					</c:forEach>
				</select>		
				
				<!-- 장바구니 진행 후 alert으로 성공, 실패 안내 띄우기, 비로그인 상태에서 장바구니 클릭시 로그인 페이지로 이동하는데, alert안내(회원만 사용할 수 있습니다.) 있으면 좋을 거 같음 -->
				<button type = "submit" id ="cart1" class="btn btncl"><i class="far fa-envelope"></i> 장바구니 </button>
		</form>
<!-- 첫번째 문제 스크립트 -->
				<button type = "submit" id ="buy1" class="btn btncl"><i class="far fa-envelope"></i> 구매하기 </button>
				
				<hr>
		</div>
</div>
</div>
<div class="container">				
				<h3>상품 정보</h3>
				<div class="form-group">
					<label for="detail">상품 소개</label>
					<textarea rows="5" cols="50" id="detail" class="form-control" name="detail" readonly>${store.detail }</textarea>
				</div>	
			
		<div>
			<c:url value="/store/modify" var="modifyUrl">
				<c:param name="pno" value="${store.pno }" />
				<c:param name="pageNum" value="${cri.pageNum }" />
				<c:param name="amount" value="${cri.amount }" />
			</c:url>
		
			<c:if test="${pinfo.user.userid eq store.userid }" >				
				<i class="far fa-edit"></i><a class="btn btncl" href="${modifyUrl }">수정</a>
			</c:if>	
		</div>
		<i class="fas fa-arrow-left"></i><button onclick="history.back()"class="btn btncl" >취소</button>		
</div>
	
</body>
</html>