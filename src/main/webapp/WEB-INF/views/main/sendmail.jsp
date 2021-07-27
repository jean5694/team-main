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
#write_msg .col1 {width: 150px;}
 
/* 각 줄마다 아래쪽에 경계선 그리기 */
#write_msg li{border-bottom: solid 1px #dddddd; padding: 12px;}
 
/* input요소의 사이즈 */
#write_msg input {width: 500px; height: 25px;}
 
/* textarea의 사이즈*/
#write_msg textarea {width: 500px; height: 150px;}
 
/* textarea의 라벨글씨가 아래쪽에 배치되기에 이를 수정하기 위해 absolute position 사용*/
#write_msg #textarea {position: relative; height: 158px;}
#write_msg #textarea .col1 {position: absolute; top: 10px;}
#write_msg #textarea .col2 {position: absolute; left: 166px;}
 
/* 서밋버튼 */
#write_msg input[type="submit"]{margin: 30px 0 45px 165px; cursor: pointer;}
 
</style>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

    <meta charset="UTF-8">
    <title>쪽지</title>
 

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
                <h3 id="write_title">쪽지 보내기</h3>
                <div class="data">
                	<div class="align_cover">
                	<!-- 	<p class="send_date">
                			<span class="blind">받은 날짜 :</span>
                			"2021-07-26 (월) 14:43"
                		</p> -->
                	
                	</div>                
                </div>
 
                <!-- 쪽지함 이동 버튼 영역 -->
<!--                <ul class="top_buttons">
                    <li><a href="#">수신 쪽지함</a></li>
                    <li><a href="#">발신 쪽지함</a></li>
                </ul>
  -->
                <!-- message_insert.php를 통해 DB의 message테이블에 저장 : 송신id는 get방식으로 -->
           
                        <div id="write_msg">
                            <ul>
                                <li>
                                    <span class="col1">보내는 사람 : </span>
                                    <span class="col2"><input type="text" value="" readonly></span>
                                </li>
                                <li>
                                    <span class="col1">받는 사람 : </span>
                                    <span class="col2"><input type="text" value="" readonly></span>
                                </li>
                                <li>
                                    <span class="col1">제목 : </span>
                                    <span class="col2"><input type="text" name="subject"></span>
                                </li>
                                <li id="textarea">
                                    <span class="col1">내용 : </span>
                                    <span class="col2"><textarea name="content"></textarea></span>
                                </li>                                
                            </ul>
                            
                            <!-- 서밋버튼 -->
                            <input type="submit" value="보내기">
                        </div>
                </form>
            </div>
 
        </div>
 
    </section>
 

</body>
</html>









