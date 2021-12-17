<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
 <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
 <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/> 
<title>프로젝트 : 쇼핑몰</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />


	
<!-- 부트스트랩 CSS, Fontawesome 아이콘, 제이쿼리, reply.js -->
<link href="/resources/css/styles.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<!-- 부트스트랩 CSS, Fontawesome 아이콘, 제이쿼리, reply.js -->


<!-- 부트스트랩 
<script src="./jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="./bootstrapt/css/bootstrap.min.css" />
<script src="./bootstrapt/js/bootstrap.min.js"></script>
-->

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!-- 폰트 -->

<!-- 카카오 맵 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9436ed92258399035e8417ecec3fe3a5"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9436ed92258399035e8417ecec3fe3a5&libraries=services,clusterer,drawing"></script>
<!-- 카카오 맵 API -->




<!-- <style>
body {
  background-image:url("/resources/img/dog/1.jpg") ,url("/resources/img/dog/3.jpg");	  
  background-repeat:no-repeat;
  background-position: 10px 400px, right 300px;
  background-attachment: fixed;
</style> -->

</head>



<body>
	<!-- 내비게이션 바 -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" >
		<div class="container">
			<a class="navbar-brand" href="/"><i class="fas fa-home"></i>&nbsp;&nbsp;HOME</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-md-0">

					<li class="nav-item"><a class="nav-link active" id="doglist" href="#"><i class="fas fa-paw"></i>&nbsp;상품</a></li>
					<li class="nav-item"><a class="nav-link active" id="dogcart" href="#"><i class="fas fa-shopping-basket"></i>&nbsp;장바구니</a></li>
					<li class="nav-item dropdown"><a class="nav-link active  dropdown-toggle board" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-comment"></i>&nbsp;게시판</a>
						 <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
       				     	<li><a class="dropdown-item" href="#" id="notice"><i class="fas fa-bullhorn"></i>&nbsp;공지사항</a></li>
      				   	 	<li><a class="dropdown-item" href="#" id="community"><i class="fas fa-comments"></i>&nbsp;커뮤니티</a></li>
      				  	    <li><a class="dropdown-item" href="#" id="qna"><i class="fas fa-question-circle"></i>&nbsp;질문답변</a></li>
       				  	 </ul>
       				</li>
					<sec:authorize access="isAnonymous()">
   				    	<li class="nav-item"><a class="nav-link" href="/user/customLogin"><i class="fas fa-key"></i>&nbsp;login</a></li>
			        	<li class="nav-item"><a class="nav-link" href="/user/joinForm"><i class="fas fa-user-plus"></i>&nbsp;join</a></li>    				
			        </sec:authorize>
					<sec:authorize access="isAuthenticated()">
			            <li class="nav-item"><a class="nav-link" href="/user/customLogout"><i class="fas fa-undo-alt"></i>&nbsp;Logout</a></li>
						<li class="nav-item" id="infoPage"><a class="nav-link active" href="/memberPage/infoPage" ><i class="fas fa-address-card"></i>&nbsp;마이페이지</a></li>
			        	<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li class="nav-item" id="adminPage"><a class="nav-link active" href="/memberPage/adminPage"><i class="fas fa-address-card"></i>&nbsp;관리자페이지</a></li>
						</sec:authorize>
			        </sec:authorize>
			        
				</ul>
			</div>
		</div>
	</nav>
	<!-- 내비게이션 바 -->
	
	<!-- 헤더 이미지 뷰-->
	<header class="py-4 ">	
		<div style="margin:0 auto; text-align: center;">
			<!-- <div style="width: 1300px; display: inline-block;"> -->
			<div class="col-xl-12 col-sm-12">
				<img src="/resources/dogimg/11.gif" style="width: 30%; height: 300px;">
				<img src="/resources/dogimg/12.gif" style="width: 30%; height: 300px;">
				<img src="/resources/dogimg/14.gif" style="width: 30%; height: 300px;">
			</div>
		</div>
	</header>
	<!-- 헤더 이미지 뷰-->
	

<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#board").on("click", function(){
		self.location = "/board/";
	});
	
	$("#notice").on("click", function(e){
		e.preventDefault();
		location.href="/board/notice/list?type=notice";
	});
	
	$("#community").on("click", function(e){
		e.preventDefault();
		location.href="/board/community/list?type=community";
	});
	
	$("#qna").on("click", function(e){
		e.preventDefault();
		location.href="/board/qna/list?type=qna";
	});
	
	
	$("#doglist").on("click", function(){
		self.location = "/doglist/";
	});
	
	
	$("#dogcart").on("click", function(){
		self.location = "/dogcart/";
	});
	
	$("#ddd").on("click", function(){
		self.location = "/dogorder/";
	});
	
	$("#ddd1").on("click", function(){
		self.location = "/doglist/";
	});
	
	$("#card").on("click", function(){
		self.location = "/card";
	});
	
	
	var role = null;
	
	<sec:authorize access="isAuthenticated()">
		role = '<sec:authentication property = "principal.Authorities" />'
	</sec:authorize>
			
	if(role.indexOf("ADMIN") == -1){
		$("#adminPage").hide();
	}
	else{
		$("#infoPage").hide();
	}
	
});
</script>