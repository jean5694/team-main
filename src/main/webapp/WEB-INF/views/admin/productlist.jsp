<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>


<title>고집 관리자페이지</title>
</head>
<style>
	#adminaddbtn {
		margin: 10px;
		padding: 5px;
	}
	
	td{
		text-align:center;
		valign : middle;
	}
	
	.btn-outline-secondary{
		background-color: #ececee;
	}
	
</style>
	
<script type="text/javascript">
	$(document).ready(function(){
		//로그아웃 동작 
	    $("#navbar-logout-link").click(function(e) {
	        e.preventDefault();
	        $("#navbar-logout-form").submit();
	   	});
	});
</script>
<body>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	<div class = "container">
	
		<!-- 상단 메뉴바 -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <a class="navbar-brand" href="${appRoot}/main/home">
			<img alt="gohome-logo" width="100" src="${appRoot }/resources/img/gohomelogo.png">
		  </a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		
		  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
		    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
		      <li class="nav-item ">
		        <a class="nav-link" href="${appRoot }/admin/home">회원 목록 </a>
		      </li>
		      <li class="nav-item ">
		        <a class="nav-link" href="${appRoot }/admin/complist">업체 목록</a>
		      </li>
		      <li class="nav-item active">
		        <a class="nav-link" href="${appRoot }/admin/productlist">상품 목록<span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item ">
		        <a class="nav-link" href="${appRoot }/admin/otolist">문의내역 목록</a>
		      </li>
		      <li class="nav-item ">
		        <a class="nav-link" href="${appRoot }/admin/adminlist">관리자 목록</a>
		      </li>
		    </ul>
		    <ul  class="navbar-nav">
				<li class="nav-item p-2">
					<span style="color:#6d0d27;"><b>현재 관리자로 로그인 중입니다</b></span>
		      	</li>
				<li class="nav-item">
       				<a class="nav-link" href="#" id="navbar-logout-link">로그아웃</a>
     			</li>
			</ul>
			<form action="${appRoot }/logout" method="post" id="navbar-logout-form"> </form>
		  </div>
		</nav>
		<hr style="border: solid 1px;">
		
		
		<!--  상품 목록 -->	
		<div class="row-12">
			<h3> 상품 목록 </h3>
			<button id="productaddbtn" type="button" class="btn btn-outline-secondary" style="float:right"
					data-toggle="modal" data-target="#productaddModal">상품 추가</button>
			<table class="table table-striped">
		        <thead>
		            <tr style="text-align :center">
		                <th style="width: 5%">#</th>
		                <th style="width: 40%">상품제목</th>
		                <th style="width: 15%">상품가격</th>
		                <th style="width: 10%">상품수량</th>
		                <th style="width: 10%">카테고리</th>
		                <th style="width: 20%">상품등록일</th>
		            </tr>
		        </thead>
		        <tbody>
		        	<c:forEach items="${Productlist }" var="product" varStatus="productstatus">
		        		<style>
		        			#overtitle${productstatus.count}{
								text-overflow: ellipsis;
								overflow: hidden;
								white-space: nowrap;
								width: 35%;
							}
		        		</style>
		        		<script>
							$(document).ready(function(){
								
								$("#call${productstatus.count }").on("show.bs.modal", function(){
									$("#title${productstatus.count }").val("${product.title }");
									$("#price${productstatus.count }").val("${product.price }");	
									$("#stock${productstatus.count }").val("${product.stock }");	
									$("#detail${productstatus.count }").val("${product.detail }");	
									
									if("${product.delivery}" == "일반배송"){
										$("#deliveryselect${productstatus.count }").val("일반배송").prop("selected", true);
									} else{
										$("#deliveryselect${productstatus.count }").val("무료배송").prop("selected", true);
									}
									
								})
								
								$("#productupdbtn${productstatus.count }").click(function(){
									
									alert("수정 완료됐습니다.")
								})
								
								$("#productdelbtn${productstatus.count }").click(function(){
									$("form").attr("action", "${appRoot}/admin/productdelete");
									alert("상품을 삭제 완료됐습니다.")
								})
								
							});
							
						</script>
						<tr>
							<td>${productstatus.count }</td>
		                    <td id="overtitle${productstatus.count}">
		                   		<a type="button" class="nav-link active" id="cnbtn1" data-toggle="modal" data-target="#call${productstatus.count }">
		                   			${product.title }
								</a>
		                    </td>
							<td>${product.price }</td>
							<td>${product.stock }</td>
							<td>${product.category }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${product.regdate }" /></td>
						</tr>
						
						<div class="modal fade" id="call${productstatus.count }" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="staticBackdropLabel">${product.title }</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						    			    <span aria-hidden="true">&times;</span>
						        		</button>
						      		</div>
						      		<div class="modal-body">
						      			<form method="post" action="${appRoot }/admin/productupdate">
						      				<div style="display:none;" class="form-group">
								      		 	<label class="control-label" for="pno">상품 번호</label>
							                    <input value="${product.pno }" class="form-control" type="text" id="pno${productstatus.count }" name="pno" />
							                </div>		  
								      		<div class="form-group">
								      		 	<label class="control-label" for="stock">상품 사진</label>
							                    <img alt="gohome-logo" width="466" src="${appRoot }/resources/img/gohomelogo.png">
							                </div>
								      		<div class="form-group">
								      		 	<label class="control-label" for="stock">상품 제목</label>
							                    <input value="${product.title }" class="form-control" type="text" id="title${productstatus.count }" name="title" />
							                </div>
							                <div class="form-group">
							                 	<label class="control-label" for="stock">상품 가격</label>
							                    <input value="${product.price }" class="form-control" type="text" id="price${productstatus.count }" name="price" />
							                </div>
							                <div class="form-group">
							                    <label class="control-label" for="stock">남은 수량</label>
							                    <input value="${product.stock }" class="form-control" type="text"  id="stock${productstatus.count }" name="stock" />
							                </div>
							                <div class="form-group">
							                    <label class="control-label" for="">배송방법</label>
							                    <select id="deliveryselect${productstatus.count }" name="delivery">
							                    	<option value="일반배송">일반배송</option>
							                    	<option value="무료배송">무료배송</option>	
							                    </select>
							                </div>
							                <div class="form-group">
							                    <label class="control-label" for="detail">상세설명 </label>
							                    <textarea style="height:200px;" class="form-control" id="detail${productstatus.count }" name="detail">${product.detail }</textarea>
							                </div>
								      		<div class="modal-footer">
												<button id="productdelbtn${productstatus.count }" type="submit" class="btn btn-danger mr-auto">삭제</button>
												<button id="productupdbtn${productstatus.count }" type="submit" class="btn btn-primary">수정</button>
												<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
									      	</div>
						                </form>
						      		</div>
						    	</div>.
							</div>
						</div>

					</c:forEach>
				</tbody>
			</table>
		</div>	
						
		<!-- 상품 추가 버튼 클릭시 나오는 모달 -->
		<div class="modal fade" id="productaddModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="productaddModaltitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="productaddModaltitle">상품 추가</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <form class="col-12" action="${appRoot }/admin/productlist" method="post">
	                <div class="form-group">
	                    <label class="control-label" for="addtitle">상품 제목</label>
	                    <input class="form-control" type="text" id="addtitle" name="title" />
	                </div>
	                <div class="form-group">
	                    <label class="control-label" for="addprice">상품 가격</label>
	                    <input class="form-control" type="text"  id="addprice" name="price"/>
	                </div>
	                <div class="form-group">
	                    <label class="control-label" for="addstock">상품 수량</label>
	                    <input class="form-control" type="text" id="addstock" name="stock"/>
	                </div>
	                <div class="form-group">
	                	<label class="control-label" for="category">카테고리</label>
	                	<select id="deliveryselect" name="category">
	                    	<option value="가구">가구</option>
	                    	<option value="수납">수납</option>
	                    	<option value="조명">조명</option>
	                    	<option value="가전">가전</option>
	                    	<option value="장식/소품">장식/소품</option>	
	                    </select>
	                </div>
	                <div class="form-group">
	                    <label class="control-label" for="adddetail">상세설명</label>
	                    <textarea style="height:200px;" class="form-control" id="adddetail" name="detail"></textarea>
	                </div>
                 
			      <div class="modal-footer">
			        <button type="submit" class="btn btn-primary" id="signbtn">상품 추가</button>
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			      </div>
	          	  </form>
		      </div>
		    </div>
		  </div>
		</div>				
		
		
		
		
		
		
		
		
		
		
		
		
	</div>
	</sec:authorize>
	<script>
	$(document).ready(function(){
		$("#returnbtn").click(function(){
			location.href="${appRoot }/main/home"; 
		})	
	})
	</script>
	<sec:authorize access="!hasRole('ROLE_ADMIN')">
	<div class = "container">
		<nb:navbar></nb:navbar>
		<h1 style="text-align:center"> 이곳은 고집 관리자페이지 입니다.</h1>
		<h3 style="text-align:center"> 접근 권한이 없습니다.</h3>
			<div style="text-align:center">
				<button id=returnbtn type="button" style="width:400px; height:100px; margin:0 auto;"><span style="font-size:30px">고홈 돌아가기</span></button>
			</div>
	</div>
	</sec:authorize>
</body>
</html>