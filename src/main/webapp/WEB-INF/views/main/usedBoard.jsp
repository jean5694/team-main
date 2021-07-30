<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<head>
<style type="text/css">
#lgbtn {
	background-color: #daccc6;
	font-weight: 550;
	color: black;
}
#lgbtn1 {
	background-color: #daccc6;
	font-weight: 550;
	color: black;
}
</style>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<button type="button" class="btn" id="lgbtn1" data-toggle="modal" data-target="#call">연락 해라</button>

		<div class="modal fade" id="call" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">연락하기</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="${appRoot }/board/usedBoard" method="post">
							<div class="form-group">
								<label for="writer" class="col-form-label">보내는 사람</label> 
								<input type="text" readonly class="form-control" id="writer" value = "${uservo.userid}" name="writer">
							</div>

							<div class="form-group">
								<label for="reader" class="col-form-label">받는 사람</label>
								<input type="text" readonly class="form-control" id="reader" name = "reader" value = "${boardvo.writer}">
							</div>

							<div class="form-group">
								<label for="content" class="col-form-label">내용</label>
								<textarea class="form-control" id="content" name = "content"></textarea>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								<button id="lgbtn" type="submit" class="btn">연락하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<c:if test="${not empty message}">
<script type="text/javascript">
alert("${message}");
</script>
</c:if>
	
	
	
	
</body>
</html>