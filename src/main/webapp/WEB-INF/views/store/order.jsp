<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file = "/WEB-INF/subModules/bootstrapHeader.jsp" %>

<script>
$(document).ready(function(){
	
	/*포인트모두사용버튼  */
	$('#useMaxPointBtn').click(function () {
 		var totalP = $('#requireTotalPrice').val();
 		$('#usePoint').val(totalP);
 		console.log(totalP);
	});
	 /* 남은포인트 */
	 function reaminP() {
		var useP = $("#usePoint").val();
		var authP = $("#authPoint").val();
		Number(useP);
		Number(authP);
		$('#remainPoint').val(authP - useP);
		$('.remainPoint').html(authP - useP);
	 }
	 
	$("#usePoint").on('change',function(){
		reaminP();
	});
	$("#useMaxPointBtn").on('click',function(){
		reaminP();
	});
	
		/* 보내기전에 총금액과 사용금액이 다르면 안됨*/
		var authP = $('#requireTotalPrice').val();
		var useP = $('#usePoint').val();
		if(authP != useP){
			alert("구매 총 금액과 사용금액이 다릅니다");
			return
		}
		/*보내기전에 포인트보유가 마이너스면 안됨*/
		var remainP = $('#remainPoint').val();
		Number(remainP);
		if(remainP<0){
			alert("보유금액이부족합니다");
			return
		}
 		$('#form_order').submit();
	});
	
	
});
</script>


<title>주문/결제하기 페이지</title>
</head>
<body>
<div class= "container">
<nb:navbar/>
<nb:scroll />


<!-- jumbotron -->
<div class="jumbotron">
    <h1 class="display-4">Index Carts</h1>
    <p class="lead">views/carts/index.jsp</p>
    <hr class="my-4">
    <p>주문/결제하기 페이지</p>
</div>
<h2>주문/결제하기 페이지</h2>
<hr>
<table class="table">
    <thead class="thead-light">
    <tr>
      <th>#</th>
      <th>제품명</th>
      <th>상세설명</th>
      <th>가격</th>
      <th>수량</th>
    </tr>
  </thead>
  <tbody>
   <c:forEach var="order" items="${order}" varStatus="status">
        <tr>
            <th>${ status.count }</th>
            <th>${order.title }</th>
            <td>${order.detail }</td>
            <td><fmt:formatNumber pattern="#,###원" value="${order.price}" /></td>
            <td>${order.cartstock }</td>
        </tr>      
    </c:forEach> 
  </tbody>
  
   <tfoot>
    <tr>
        <td></td> 
		<td>주문금액 : </td>		
		<td><fmt:formatNumber pattern="#,###원" value="${sumMoney}" /></td>
		<td>내 보유 포인트 : </td>
		<td>${user.userpoint} 포인트</td>
    </tr>
  </tfoot>
</table>
<hr>
<form>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputid">수령인</label>
      <input type="text" class="form-control" id="inputid" value="${user.userName }" readonly>
    </div>
  </div>
  <div class="form-group">
    <label for="inputphone">연락처</label>
    <input type="text" class="form-control" id="inputphone" value="${user.userPhone }">
  </div>
  <div class="form-group">
    <label for="inputAddress">주소</label>
    <input type="text" class="form-control" id="inputAddress" value="${user.useradd }">
  </div>
</form>

<div class="jumbotron">
					<h5>결제 정보</h5><br>
					<hr>
						<table class="table1">
							<tbody>
								<tr>
									<th><label for="requireTotalPrice"> 총 금액</label></th>
									<td><input id="requireTotalPrice" name="requireTotalPrice" value="${sumMoney}"></td>
								</tr>								
								
								<tr>
									<th><p>보유 포인트</p></th>
									<td>
										<p class="text-right">${user.userpoint}</p>
										<input id="authPoint" value="${user.userpoint} " hidden="hidden">
									</td>
									<td><p>포인트</p></td>
								</tr>
								<tr>
									<th><p>사용 포인트</th>
									<td>
										<input class="text-right" id="usePoint" min="0" max="${user.userpoint}" name="usePoint" type="number"/>
									</td>
									<td><p>포인트  </p></td>
									<td><button id="useMaxPointBtn" class="btn_add btn btn-primary" type="button">포인트 모두 사용</button></td>
								</tr>
								<tr>
									<th><p>결제 후 포인트</th>
									<td>
										<p class="text-right"><span class="remainPoint"></span></p>
										<input hidden="hidden" class="text-right" id="remainPoint" name="remainPoint" type="number"/>
									</td>
									<td><p>포인트</p></td>
								</tr>
							</tbody>
						</table>

							<div class="my-5">
							</div>

</div>
				
<button type="submit" class="btn btn-lg btn-block btn-primary">주문완료</button>
<button onclick="history.back()" class="btn btn-warning">Back</button>

	<footer>
			<nb:footer/>
		</footer>

</div>
</body>
</html>