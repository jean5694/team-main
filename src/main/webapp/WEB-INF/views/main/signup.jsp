<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/login";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#id").focus();
					return false;
				}
				if($("#pw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#pw").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				if($("#userEmail").val()==""){
					alert("이메일을 입력해주세요.");
					$("#userEmail").focus();
					return false;
				}
				if($("#userPhone").val()==""){
					alert("연락처를 입력해주세요.");
					$("#userPhone").focus();
					return false;
				}
			});
			
				
			
		})
	</script>
	<body>
        <section id="container">
            <form action="" method="post">
                <div class="form-group has-feedback">
                    <label class="control-label" for="id">아이디</label>
                    <input class="form-control" type="text" id="id" name="id" />
                </div>
                <div class="form-group has-feedback">
                    <label class="control-label" for="pw">패스워드</label>
                    <input class="form-control" type="password" id="pw" name="pw" />
                </div>
                <div class="form-group has-feedback">
                    <label class="control-label" for="userName">성명</label>
                    <input class="form-control" type="text" id="userName" name="userName" />
                </div>
                <div class="form-group has-feedback">
                    <label class="control-label" for="userEmail">이메일</label>
                    <input class="form-control" type="text" id="userEmail" name="userEmail" />
                </div>
                <div class="form-group has-feedback">
                    <label class="control-label" for="userPhone">연락처</label>
                    <input class="form-control" type="text" id="userPhone" name="userPhone" />
                </div>
                <div class="form-group has-feedback">
                    <button class="btn btn-success" type="submit" id="submit">회원가입</button>
                    <button class="cencle btn btn-danger" type="button">취소</button>
                </div>
            </form>
        </section>

    </body>

</html>