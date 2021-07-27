<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb" %>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<link="cssgroup.css" rel="stylesheet" type="text/css">

<style>
/* 쪽지 작성 영역 사이즈 및 가운데 정렬 */
#message_box {width: 800px; margin: 0 auto;}
 
/* 제목줄의 마진 및 아래 경계선 */
#message_box h3{margin-top: 30px; padding: 10px; border-bottom: solid 2px #516e7f; font-size: 20px;}
 
/* 인풋영역들의 좌우 패딩 */
#wirte_msg{padding: 0 20px;}
 
/* 라벨 영역과 input영역들의 span요소의 사이즈 조절을 위해 inline-block으로  */
#write_msg span{display: inline-block;}
 
/* 라벨영역 가로사이즈 */
#write_msg .col1 {text-align:center;width: 150px;}
 
/* 각 줄마다 아래쪽에 경계선 그리기 */
#write_msg li{border-bottom: solid 1px #dddddd; padding: 12px;}
 
/* input요소의 사이즈 */
#write_msg input {width: 800px; height: 25px;}
 
/* textarea의 사이즈*/
#write_msg textarea {width: 300px; height: 400px;}
 
/* 내용의 라벨글씨가 아래쪽에 배치되기에 이를 수정하기 위해 absolute position 사용*/
#write_msg #textarea {position: relative; height: 158px;}
#write_msg #textarea .col1 {position: absolute; top: 10px;}
#write_msg #textarea .col2 {position: absolute; left: 166px;}

 
/* 수신/송신 쪽지함 오른쪽 정렬 */
#message_box .top_buttons{text-align: right; margin: 20px 0px;}
#message_box .top_buttons li{display: inline; margin-right: 20px;}
#message_box .top_buttons li a:link{text-decoration: underline; color: green;}
#message_box .top_buttons li a:visited{text-decoration: underline; color: green;}
</style>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

    <meta charset="UTF-8">
    <title>상세페이지</title>
 

</head>

    <body style="background-color: #ececee;">
	<div class="container " >
        <div class="jumbotron" style="background-color:#fff;">
            <div class="text-center p-5">
                  <a href="${appRoot }/main/home">
                  <img alt="gohome" width="150" src="${appRoot }/resources/img/gohomelogo.png"></a>
    		</div>
    <section>
        <div id="main_content">
            <div id="message_box">
                <h3 id="write_title">에베베베</h3>
<!--                 <div class="data">
                	<div class="align_cover"> -->
                		<%-- <td>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/>
						</td> --%>
                		<!-- <p class="send_date">
                			<span class="blind">받은 날짜 :</span>
                			"2021-07-26 (월) 14:43"
                		</p> -->
				<div class="top_buttons">
				<tr>
				<td><button type="button" class="btn" onClick="location.href='${appRoot}/main/sendmail'">답장</button></td>
                <td><button type="button" class="btn" onClick="location.href='${appRoot}/main/mgreceive'">수신 쪽지함</button></td>
                <td><button type="button" class="btn" onClick="location.href='${appRoot}/main/mgsend'">발신 쪽지함</button></td>
                </tr>
                	
                	</div>                
                </div>
            </div>
            
        <div class="row">
		<div class="col-12">
			
				<div class="form-group">
					<label for="wrinput">보내는 사람</label>
					<input id="wrinput" class="form-control" name="writer">
				</div>
				<div class="form-group">
					<label for="reinput">받는 사람</label>
					<input id="reinput" class="form-control" name="reader">
				</div>
				<div class="form-group">
					<label for="tiinput3">제목</label>
					<input id="tiinput3" class="form-control" name="title">
				</div>
				<div class="form-group">
					<label for="coinput">내용</label>
					<textarea id="coinput" class="form-control" name="content"></textarea>
				</div>				
                </form>
            </div>
            </div>
 

 
    </section>
 

</body>
</html>









