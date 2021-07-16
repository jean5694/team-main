<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="d-flex justify-content-end">
	<nav class="navbar navbar-expand-sm navbar-light">
		<ul  class="navbar-nav">
			<li class="nav-item">
       			 <a class="nav-link" href="#">로그인 </a>
     		 </li>
	      <li class="nav-item">
	        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">회원가입 </a>
	      </li>
		</ul>
		</nav>
</div>
<div class="d-flex justify-content-center">
<nav class="navbar navbar-expand-sm navbar-light">
	  <a class="navbar-brand"> 로고 </a>
	  <form class="form-inline">
	    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
	    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	  </form>
	  </nav>
</div>
  
<div class="d-flex justify-content-center">
<nav class="navbar navbar-expand-sm navbar-light">
    <ul class="navbar-nav mr-auto my-2 my-lg-0 navbar-nav-scroll" style="max-height: 100px;">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
          스토어 
        </a>
        <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
          <li><a class="dropdown-item" href="#">서브1 </a></li>
          <li><a class="dropdown-item" href="#">서브2 </a></li>
          <li><hr class="dropdown-divider"></li>
        </ul>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
          커뮤니티 
        </a>
        <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
          <li><a class="dropdown-item" href="#">자유게시판  </a></li>
          <li><a class="dropdown-item" href="#">중고마켓  </a></li>
          <li><hr class="dropdown-divider"></li>
        </ul>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
          업체  
        </a>
        <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
          <li><a class="dropdown-item" href="#">서브1  </a></li>
          <li><a class="dropdown-item" href="#">서브2   </a></li>
          <li><hr class="dropdown-divider"></li>
        </ul>
      </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
          고객센터  
        </a>
        <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
          <li><a class="dropdown-item" href="#">서브1 </a></li>
          <li><a class="dropdown-item" href="#">서브2 </a></li>
          <li><hr class="dropdown-divider"></li>
        </ul>
      </li>
      
    </ul>
	</nav>
  </div>