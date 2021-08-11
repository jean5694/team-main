<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>중고마켓 글쓰기</title>
</head>
<body>
	<nb:navbar />

	<div class="container">

		<h1>글 쓰기</h1>

		<div class="row">
			<div class="col-12">
				<form action="${appRoot }/board/write" method="post" enctype="multipart/form-data">
				
					<div class="form-group">
						<label for="mtitle">제목</label>
						<input id="mtitle" class="form-control" name="mtitle">
					</div>
					
					<div class="form-group">
						<label for="mwriter">작성자</label>
						<input id="mwriter" class="form-control" name="mwriter">
					</div>


					<div class="form-group">
						<label for="mdetail">상품상태</label>

						<!-- 중복체크 방지 -->
						<div class="form-check">
							<input class="form-check-input" type="radio" name="mstate" id="mstate1" value="새 상품" checked>
							<label class="form-check-label" for="mstate1"> 새 상품 </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="mstate" id="mstate2" value="중고 상품">
								<label class="form-check-label" for="mstate2"> 중고 상품 </label>
						</div>
					</div>
					
					<div class="form-group">
						<label for="msold">판매/나눔</label>

						<!-- 중복체크 방지 -->
						<div class="form-check2">
							<input class="form-check-input2" type="radio" name="msold" id="msold1" value="판매" checked>
							<label class="form-check-label2" for="mstate1"> 판매 </label>
						</div>
						<div class="form-check2">
							<input class="form-check-input2" type="radio" name="msold" id="msold2" value="나눔">
								<label class="form-check-label2" for="msold2"> 나눔 </label>
						</div>
					</div>
					
						<div class="form-group">
							<label for="mprice">상품가격</label>
							<input id="mprice" class="form-control" name="mprice">
						</div>
						
						<!-- 은비 파일 -->
						<div class="form-group">
						<label for="market_file">파일</label>
						<!-- type file로 지정, multiple 멀티플로 어셉트 이미지 -->
						<input id="market_file" class="form-control" type="file" name="market_file" multiple="multiple" accept="image/*">
						</div>

						<div class="form-group">
							<label for="maddress">거래지역</label>
							<input id="maddress" class="form-control" name="maddress">
						</div>
						
						
						<div class="form-group">
							<label for="mdetail">상세 설명</label>
							<textarea id="mdetail" class="form-control" name="mdetail"></textarea>
						</div>
						<input class="btn btn-primary" type="submit" value="작성" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>