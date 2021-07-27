<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>
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
		</ul>
	</nav>
</div>
<body>

    <h2>보낸 쪽지함</h2>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <%--
                <th>수정일</th>
                 --%>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list }" var="board">
                <tr>
                    <td>${board.bno }</td>
                    <td>

                    <c:url value="/board/get" var="getUrl">
                        <c:param name="bno" value="${board.bno }" />
                        <c:param name="pageNum" value="${pageMaker.cri.pageNum }" />
                        <c:param name="amount" value="${pageMaker.cri.amount }" />
                        <c:param name="type" value="${pageMaker.cri.type }"    />
                        <c:param name="keyword" value="${pageMaker.cri.keyword }" />
                    </c:url>

                    <a href="${getUrl}">
                        ${board.title } 
                    </a>
                    <c:if test="${board.replyCnt > 0 }">
                        <i class="far fa-comment-dots"></i> ${board.replyCnt }
                    </c:if>


                    </td>
                    <td>${board.writerName }</td>
                    <td>
      <%--                   <fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/> --%>
                    </td>
                    <%--
                    <td>
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }"/>
                    </td>
                     --%>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>