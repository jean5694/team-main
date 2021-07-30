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
<meta charset="UTF-8">
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>
<style>
    #td { vertical-align : middle; }
</style>

<script>
$(function() {
	$("#callsec").on("show.bs.modal", function() {
		$("#readerTh").val("");
		$("#contentTh").val("");
		$("#sendbtnTh").prop("disabled", true);
		
		$("#contentTh").keyup(function(){
			$("#sendbtnTh").prop("disabled", false);	
		})
	});
})
</script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
<nb:navbar></nb:navbar>
<div class="d-flex justify-content-center p-0">
	<nav class="navbar navbar-expand-sm navbar-light">
		<ul  class="navbar-nav mr-auto text-center"> 
			<li class="nav-item">
	       			 <font size="4px">
		       			 <a class="nav-link" href="${appRoot }/main/mgreceive">받은쪽지함 </a>
	       			 </font>
	     	</li>
	     	<li class="nav-item">
	     			<font size="4px">
	       			 	<a class="nav-link" href="${appRoot }/main/mgsend">보낸쪽지함 </a>	     			
	     			</font>
	     	</li>	
	     	<li class="nav-item">
	     			<font size="4px">
	       			 	<a class="nav-link" type = "button" data-toggle="modal" data-target="#callsec"> 쪽지 보내기 </a>	     			
	     			</font>
	     	</li>
		</ul>
	</nav>
</div>

    <h3>받은 쪽지함</h3>
    <table class="table table-striped">
        <thead>
            <tr style="text-align :center">
                <th style="width: 8%">번호</th>
                <th style="width: 65%">내용</th>
                <th style="width: 15%">보낸사람</th>
                <th style="width: 12%">작성일</th>

            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listReceive }" var="message" varStatus="status">
                <script>
					$(document).ready(function(){
						
						$("#sendbtn${status.count }").click(function() {
							$('#call${status.count }').modal("hide");
						})
						
						$("#callse${status.count }").on("show.bs.modal", function(){
							console.log("답장하기");
							$("#content${status.count }").val("");							
							$("#sendbtnTw${status.count }").prop("disabled",true);
							
							$("#content${status.count }").keyup(function(){
								$("#sendbtnTw${status.count }").prop("disabled",false);
							})
						
						})
					});
				</script>
                <tr>
                    <td id="td"style="text-align :center"><!-- ${message.mno} 확인용 mno -->  ${status.count }</td>
                    <td id="td">
                    <a type="button" class="nav-link active" id="cnbtn1" data-toggle="modal" data-target="#call${status.count }">
					${message.content }
					</a>
                    </td> 
                    <td id="td"style="text-align :center">${message.writer }</td>
                    <td id="td"style="text-align :center"><fmt:formatDate pattern="yyyy-MM-dd [hh:mm]" value="${message.regdate }"/></td>
                </tr>
                <div class="modal fade" id="call${status.count }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">받은 쪽지함</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
								</div>
								<div class="modal-body">
										<div class="form-group">
											<label for="writer" class="col-form-label">보내는 사람</label>
											<input type="text" readonly class="form-control" id="writer" value="${message.writer}" name="writer">
										</div>
		
										<div class="form-group">
											<label for="reader" class="col-form-label">받는 사람</label>
											<input type="text" readonly class="form-control" id="reader" name="reader" value="${message.reader}">
										</div>
		
										<div class="form-group">
											<label for="content" class="col-form-label">내용</label>
											<textarea class="form-control" readonly id="content" name="content">${message.content}</textarea>
										</div>
						 
								<div class="modal-footer">
									<button type="button" class="btn btn-light" data-dismiss="modal" id="close1">Close</button>
									<button id="sendbtn${status.count }" type="button" class="btn btn-secondary" data-toggle="modal" data-target="#callse${status.count }">답장하기</button>
								</div>	
						</div>
						</div>
					</div>
				</div>
					<div class="modal fade" id="callse${status.count }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">쪽지 전송하기</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form action="${appRoot }/main/mgreceive" method="post">
										<div class="form-group">
											<label for="writer" class="col-form-label">보내는 사람</label>
											<input type="text" readonly class="form-control" id="writer" value="${uservo.userid}" name="writer">
										</div>

										<div class="form-group">
											<label for="reader" class="col-form-label">받는 사람</label>
											<input type="text" readonly class="form-control" id="reader" name="reader" value="${message.writer}">
										</div>

										<div class="form-group">
											<label for="content" class="col-form-label">내용</label>
											<textarea class="form-control"  id="content${status.count }" name="content"></textarea>
										</div>
									 
										<div class="modal-footer">
											<button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
											<button id="sendbtnTw${status.count }" type="submit" class="btn btn-secondary" >답장하기</button>
										</div>		
									</form>					
								</div>
							</div>
						</div>
					</div>
            </c:forEach>
        </tbody>
    </table>
    <div class="modal fade" id="callsec" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">쪽지 전송하기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="${appRoot }/main/mgsend" method="post">
						<div class="form-group">
							<label for="writer" class="col-form-label">보내는 사람</label>
							<input type="text" readonly class="form-control" id="writer" value="${uservo.userid}" name="writer">
						</div>
	
						<div class="form-group">
							<label for="reader" class="col-form-label">받는 사람</label>
							<input type="text"  class="form-control" id="readerTh" name="reader">
						</div>
	
						<div class="form-group">
							<label for="content" class="col-form-label">내용</label>
							<textarea class="form-control"  id="contentTh" name="content"></textarea>
						</div>
					 
						<div class="modal-footer">
							<button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
							<button id="sendbtnTh" type="submit" class="btn btn-secondary" >답장하기</button>
						</div>		
					</form>					
				</div>
			</div>
		</div>
	</div>								
<c:if test="${not empty message}">
<script type="text/javascript">
alert("${message}");
</script>
</c:if>
</div>
</body>
</html>