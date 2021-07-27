<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>쪽지보내기</title>
</head>
 <body style="background-color: #ececee;">
	<div class="container " >
        <div class="jumbotron" style="background-color:#fff;">
            <div class="text-center p-5">
                  <a href="${appRoot }/main/home">
                  <img alt="gohome" width="150" src="${appRoot }/resources/img/gohomelogo.png"></a>
            </div>
<div class="container">
<form>
  <div class="form-group">
    <label for="exampleFormControlInput1">보내는 사람</label>
    <input type="text" value="" readonly>
  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect1">받는 사람</label>
    <input type="text" value="" readonly>
  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect2">제목</label>
    <input type="text" name="subject">
  </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1">내용</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
  </div>
</form>

</div>
</body>
</html>








