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

<title>Q&A</title>

</head>
<body>
<div class="container">	
		
<nb:navbar/>
<nb:scroll />			  
		
<h3>Q&A</h3>
		

<div class="row row-cols-md-4">		  	
  
  <div class="col mb-4">
    <div class="card">
	     <div class="card-body">	
	 	 	<div class="card-title">Q. 아이디를 잊었어요.</div>     
	     </div>
	     <div class="form-group">
	     	<div class="card-add">A. 우측 상단의 '로그인'을 누르신 후 '아이디찾기'를 통해 찾으실 수 있습니다. 가입시 등록하신 성함과 전화번호를 정확히 입력해 주세요.</div>
	     </div>  
    </div>
  </div>
  
  <div class="col mb-4">
    <div class="card">
	     <div class="card-body">	
	 	 	<div class="card-title">Q. 비밀번호를 잊었어요.</div>     
	     </div>
	     <div class="form-group">
	     	<div class="card-add">A. 우측 상단의 '로그인'을 누르신 후 '비밀번호 찾기'를 통해 찾으실 수 있습니다. 가입시 등록하신 아이디와 이메일을 정확히 입력해 주세요. 입력하신 이메일로 임시 비밀번호가 전송됩니다.</div>
	     </div>  
    </div>
  </div>
  
  <div class="col mb-4">
    <div class="card">
	     <div class="card-body">	
	 	 	<div class="card-title">Q. 비밀번호를 변경하고 싶어요.</div>     
	     </div>
	     <div class="form-group">
	     	<div class="card-add">A. 로그인 하신 후  우측 상단의 '마이페이지-정보수정-비밀번호수정'을 누르시면 비밀번호 변경이 가능합니다.</div>
	     </div>  
    </div>
  </div>
 
</div>


</div>
</body>
</html>