<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

	<title>회원가입</title>
	
	<style type="text/css">
	
		body{
			background-color: #ececee;
			height: 100%;
	  	 	min-height: 100%;
			}
		.jumbotron{
	        background-color: #fff;
	        border: 1px solid #ddd;
	      }
      
	
		.btn-outline-secondary{
			background-color: #ececee;
		}
		.btn-outline-secondary:hover{
			background-color: #6d0d27;
		}
		.signupbtn{
			background-color: #6d0d27;
			color:#fff;
		}
		.signupbtn:hover{
			color:#fff;
		}
		.bkbtn{
			background-color:#daccc6;
		}
	</style>

	<script type="text/javascript">
		$(document).ready(function(){
			
			//DB작업하고나서 아이디중복체크할때 사용가능하면 밑에 사용가능하다는 문구표시예정 
			//var messageElem = $("#id-message");
			//if(){
				//messageElem.text("사용가능한 아이디 입니다.");					
			//}
			
			
			$("#signbtn").on("click", function(){
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
				if($("#pwchk").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#pwchk").focus();
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
</head>
<body>
	<div class="container">
		<div class="text-center p-3">
               <a href="${appRoot }/main/home">
              <img alt="gohome" width="150" src="${appRoot }/resources/img/gohomelogo.png"></a>
        </div>
		<div class="jumbotron" >
		   <div class="row justify-content-center ">
           	  <form class="col-5" action="${appRoot }/main/signup" method="post">
	           	  <div class="form-group">
						<h4>
						 회원정보를 입력해주세요. 
						</h4>
					</div>
	                <div class="form-group">
	                    <label class="control-label" for="id">아이디</label>
	                    <div class="input-group">
	                    <input class="form-control" type="text" id="id" name="id" />
							<button class="btn btn-outline-secondary" type="button"id="id-dup-btn">
									중복 체크        
							</button>
						</div>
							<small id="id-message" class="form-text"></small>
	                </div>
	                <div class="form-group">
	                    <label class="control-label" for="pw">비밀번호</label>
	                    <input class="form-control" type="password" id="pw" name="pw" />
	                </div>
	                <div class="form-group">
	                    <label class="control-label" for="pwchk">비밀번호 재확인 </label>
	                    <input class="form-control" type="password" id="pwchk" name="pwchk" />
	                </div>
	                <div class="form-group">
	                    <label class="control-label" for="userName">이름</label>
	                    <input class="form-control" type="text" id="userName" name="userName" />
	                </div>
	                <div class="form-group">
	                    <label class="control-label" for="userEmail">이메일</label>
	                    <input class="form-control" type="email"  id="userEmail" name="userEmail" />
	                </div>
	                <div class="form-group">
	                    <label class="control-label" for="userPhone">연락처</label>
	                    <input class="form-control" type="text" id="userPhone" name="userPhone" />
	                </div>
	                <div class="form-group">
	                    <button class="btn signupbtn" type="submit" id="signbtn">회원가입</button>
	                    <button class="btn bkbtn" style="float: right;" type="button" onclick="location.href='${appRoot}/main/login' ">취소</button>
	                </div>
          	  </form>
            </div>
       	 </div>
		</div>
</body>
</html>