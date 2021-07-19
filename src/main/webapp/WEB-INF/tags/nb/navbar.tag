<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="d-flex justify-content-end">
	<nav class="navbar navbar-expand-sm navbar-light">
		<ul  class="navbar-nav">
			<li class="nav-item">
       			 <a class="nav-link" href="${appRoot }/main/login">로그인 </a>
     		 </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${appRoot }/main/tos" tabindex="-1" aria-disabled="true">회원가입 </a>
	      </li>
		</ul>
		</nav>
</div>
<div class="navbar row justify-content-center p-0">
		<div class="col-md-3 text-center p-0">
		  <a class="navbar-brand" href="${appRoot}/main/home"> 
		  	<img alt="gohome-logo" width="150" src="${appRoot }/resources/img/gohomelogo.png">
		  </a>
		</div>
		
		<div class="form-group col-md-6 text-center m-1">
			<form class="form-inline text-center">
			<div class="input-group">
		  	  <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
		  	  <div class="input-group-append">
		  	  	<button class="btn btn-outline-secondary"type="button"id="toggle-password-btn">
							      <i class="fas fa-search"></i>
				</button> 
		  	  </div>
			</div>
		 	 </form>
		</div>
</div>
  
<div class="navbar row justify-content-center p-0">
	<nav class="navbar navbar-expand-sm navbar-light">
    <ul class="navbar-nav mr-auto text-center">
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
          <li><a class="dropdown-item" href="#">인테리어 </a></li>
          <li><a class="dropdown-item" href="#">이사  </a></li>
          <li><hr class="dropdown-divider"></li>
        </ul>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="${appRoot }/help/cs"  role="button"  aria-expanded="false">
          고객센터  
        </a>
      </li>
      
    </ul>
    </nav>
  </div>
  <hr>