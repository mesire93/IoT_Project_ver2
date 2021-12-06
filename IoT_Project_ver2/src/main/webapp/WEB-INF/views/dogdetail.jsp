<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>


<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>애견분양 Mall</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="/resources/assets/favicon.ico">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/styles.css" rel="stylesheet">
</head>
<body>
	<!-- Responsive navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container">
		<a class="navbar-brand" href="#!">LOGO</a>
		<button class="navbar-toggler" type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#!">About</a></li>
				<li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#">Blog</a></li>
			</ul>
		</div>
	</div>
</nav>


<!-- Page header with logo and tagline-->
<header class="py-5 bg-light border-bottom mb-4">
	<div class="container">
		<div class="text-center my-5">
			<h1 class="fw-bolder">강아지 분양 상세보기 </h1>
			<p class="lead mb-0"></p>
		</div>
	</div>
</header>

<!-- 삭제처리를 위해 form 태그는 POST방식이용  -->
<form action="/dogremove" method="post"> 
<!-- 삭제처리를 위해 Controller 에서 Service.remove()처리를 위해 dno 값을 hidden으로 넘긴다. -->
<%-- <input type="hidden" id="dno" name="dno" value="{c:out value='${detail.dno}'/>"> JSTL <c:out> 태그사용시 hidden 값으로 넘어가진않는다 --%>
<input type="hidden" id="dno" name="dno" value="${detail.dno}">
<%-- <c:forEach items="${detail}" var="detail"> Model 객체로 service.get(dno) 넘어오기에 따로
<c:forEach> 설정하지 않아도된다. for문으로 돌리지 않고 등록글 한개의 컬럼=>프로퍼티만 가져올거니 사용하지 않는다 --%>
<!-- JSTL 사용시 items과 var 속성을 반드시 있어야 한다. -->

<div class="container">
	<div class="row">
		<!-- Blog entries-->
		<div class="col-lg-8">
			<!-- Featured blog post-->
			<div class="card mb-4">
				<a href="#!"><img class="card-img-top"
					src="resources/img/dog/골든리트리버.png" alt="..."></a>
				<div class="card-body">
				<%-- <div class="card-header"><!-- 강아지 특징 -->${dog.name } 특징</div> --%>
				<div class="card-header"><!-- 강아지 특징 --><c:out value="${detail.name }"/> 특징</div>
                        <div class="card-body"><!-- 털이 많고 밝은 성격 --><c:out value="${detail.feature }"/></div>
				
					<!-- <div class="small text-muted">January 1, 2021</div>
						<h2 class="card-title"></h2> 
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex
						quis soluta, a laboriosam. Dicta expedita corporis animi vero
						voluptate voluptatibus possimus, veniam magni quis!</p> -->
						
						
					<a class="btn btn-warning" href="#!">사진 더보기-></a>
				</div>
			</div>
		</div>
		<div class="col-lg-4">
			<!-- Search widget-->
			<div class="card mb-4">
				<div class="card-header"><c:out value="${detail.name }"/> 이름</div>
				<!-- <div class="card-header">${dog.name } 이름</div> -->
                <div class="card-body"><!-- 오월이 --><c:out value="${detail.name }"/></div>
			</div>

			<div class="card mb-4">
				<div class="card-header"><!-- 강아지 체중 --><c:out value="${detail.name }"/> 체중</div>
				<%-- <div class="card-header"><!-- 강아지 체중 -->${dog.name } 체중</div> --%>
                <div class="card-body"><!-- 8kg --><c:out value="${detail.weight }"/> kg</div>
			</div>
			
			<div class="card mb-4">
				<div class="card-header"><!-- 강아지 품종 --><c:out value="${detail.name }"/> 품종</div>
				<%-- <div class="card-header"><!-- 강아지 품종 --> ${dog.name } 품종</div> --%>
                <div class="card-body"><!-- 골든리트리버 --><c:out value="${detail.kind }"/></div>
			</div>
			
			<div class="card mb-4">
				<div class="card-header"><!-- 강아지 성별 --><c:out value="${detail.name }"/> 성별</div>
				<%-- <div class="card-header"><!-- 강아지 성별 --> ${dog.name } 성별</div> --%>
                <div class="card-body"><!-- 여(암컷) --><c:out value="${detail.sex }"/></div>
			</div>
			
			<div class="card mb-4">
				<div class="card-header"><!-- 강아지 나이 --> <c:out value="${detail.name }"/> 나이</div>
				<%-- <div class="card-header"><!-- 강아지 나이 --> ${dog.name } 나이</div> --%>
                <div class="card-body"><!-- 5살 --> <c:out value="${detail.age }"/></div>
			</div>
			
			<div class="card mb-4">
				<div class="card-header"><!-- 강아지 건강상태  --><c:out value="${detail.name }"/> 건강상태</div>
				<%-- <div class="card-header"><!-- 강아지 건강상태  --> ${dog.name } 건강상태</div> --%>
                <div class="card-body"><!-- 광견병 종합백신 --><c:out value="${detail.age }"/></div>
			</div>
		</div>
	</div>
</div>
<%-- </c:forEach> --%>

<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<!-- <button type="submit" class="btn btn-warning" onclick="location.href='/remove'">삭제합니다</button> -->
			<button type="submit" class="btn btn-warning">삭제합니다</button>
			<!-- 삭제처리를 위해  form 태그의 method 속성을 POST지정하고 submit 버튼 클릭시 Controller 에서 처리된다. -->
			
			
			
			<button type="button" class="btn btn-success" onclick="location.href='/doglist2'">목록으로</button>
			<!-- button의 onclick 속성은 redirect  개념으로 Controller에서 @GetMapping으로 처리 -->
		</div>
	</div>
</div>
</form>
</form>


<!-- Footer-->
<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright © Your Website 2021</p>
	</div>
</footer>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/resources/js/scripts.js"></script>



</body>
</html>