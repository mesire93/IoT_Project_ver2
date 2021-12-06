<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
	
	
<script type="text/javascript">
$(document).ready(function(){
	$("#regBtn").on("click", function(){
		self.location="/doglist";
	});
	
});
</script>
	
	
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
				<h1 class="fw-bolder">강아지 분양 등록</h1>
				<p class="lead mb-0"></p>
			</div>
		</div>
	</header>
      
<form action="/dogregister" method="post" >



<div class="container">
	<div class="row">
		<div class="col-lg-8"><!-- 없을경우 전체화면 가로차지한다 -->
			<div class="card-header">강아지 이름을 입력하세요</div>
			<input type="text" class="form-control" name="name" placeholder="강아지 이름을 입력하세요">
		</div>
	</div>
</div>
<br>
<br>
<div class="container">
	<div class="row">
		<div class="col-lg-8"><!-- 없을경우 전체화면 가로차지한다 -->
			<div class="card-header">강아지 체중을 입력하세요(소수점 첫자리까지만 입력해주세요)단위kg 생략</div>
			<input type="text" class="form-control" name="weight" placeholder="강아지 체중을 입력하세요">
		</div>
	</div>
</div>
<br>
<br> 

<div class="container">
<div class="row">
		<div class="col-lg-8">
			<div class="card-header">강아지 품종을 선택하세요</div>
			<label class="radio-inline"> <input type="radio" name="kind" id="kind" value="닥스훈트" checked> 닥스훈트 </label> 
			<label class="radio-inline"> <input type="radio" name="kind" id="kind" value="몰티즈"> 몰티즈</label>
			<label class="radio-inline"> <input type="radio" name="kind" id="kind" value="미니어처핀셔"> 미니어처 핀셔	</label>
			<label class="radio-inline"> <input type="radio" name="kind" id="kind" value="보스턴테리어"> 보스턴테리어</label>
			<label class="radio-inline"> <input type="radio" name="kind" id="kind" value="비숑프리제"> 비숑프리제</label> 
			<label class="radio-inline"> <input type="radio" name="kind" id="kind" value="시바이누"> 시바 이누</label> 
			<label class="radio-inline"> <input type="radio" name="kind" id="kind" value="진돗개"> 진돗개</label>
			<br>
			<label class="radio-inline">  <input type="radio" name="kind" id="kind" value=""> 그외  <input type="text"  name="kind" id="kind" ></label>
			<!-- 그외를 입력값으로 받는 radio 속성에도 name을 동일하게 줘야 라디오버튼 1개만 선택이 가능하다.-->
			<!-- value="" 값이 없더라도 입력을 해야 on 이라는 기본값이  DB에 들어가지 않는다. 그러나 여전히 ,는 남는다. -->
		</div>
	</div>
</div>
<br>
<br>

<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<div class="card-header">강아지 성별을 선택하세요</div>
			<div class="card-body radio">
				<label> <input type="radio" name="sex" id="sex1" value="남(수컷)" checked> 남(수컷)
				</label>
			</div>

			<div class="card-body radio">
				<label> <input type="radio" name="sex" id="sex2" value="여(암컷)"> 여(암컷)
				</label>
			</div>
		</div>
	</div>
</div>
<br>
<br>
<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<div class="card-header">강아지 나이를 선택하세요</div>
			<select name="age" class="form-control">
				<option value="1개월미만">1개월 미만</option>
				<option value="2개월미만">2개월 미만</option>
				<option value="3개월미만">3개월 미만</option>
				<option value="4개월">4개월</option>
				<option value="5개월">5개월</option>
				<option value="6개월">6개월</option>
				<option value="7개월">7개월</option>
				<option value="8개월">8개월</option>
				<option value="9개월">9개월</option>
				<option value="10개월">10개월</option>
				<option value="11개월">11개월</option>
				<option value="12개월">12개월</option>
				<option value="1살">1살</option>
				<option value="2살">2살</option>
				<option value="3살">3살</option>
				<option value="4살">4살</option>
				<option value="5살">5살</option>
				<option value="6살">6살</option>
				<option value="7살">7살</option>
				<option value="8살">8살</option>
				<option value="9살">9살</option>
				<option value="10살">10살</option>
				<option value="11살">11살</option>
				<option value="12살">12살</option>
				<option value="13살">13살</option>
				<option value="14살">14살</option>
			</select>
		</div>
	</div>
</div>
<br> 
<br>
<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<div class="card-header">강아지 사진을 올려주세요</div>
			<div class="form-group">
				<label><input type="file" name="fileName"> </label> 
			</div>
		</div>
	</div>
</div>

<br>
<br>
<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<div class="card-header">강아지 특징을 한줄로 요약해주세요</div>
			<input type="text" name="simple" class="form-control" placeholder="한줄로 요약해주세요">
		</div>
	</div>
</div>

<br>
<br>
<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<div class="card-header">강아지 특징을 적어주세요</div>
			<textarea class="form-control" name="feature" rows="7"></textarea>
		</div>
	</div>
</div>
		
<br>
<br>

<div class="container">
	<div class="row">
		<!-- Blog entries-->
		<div class="col-lg-8">
			<div class="card-header">강아지 건강상태를 선택해주세요(중복선택가능)</div>
			<div class="card-body">
				<div>
					<label> <input type="checkbox" value="종합백신" name="health">종합백신</label> 
					<label> <input type="checkbox" value="켄넬코프" name="health"> 켄넬코프</label>
					<label> <input type="checkbox" value="인플루엔자" name="health"> 인플루엔자</label>
					<label> <input type="checkbox" value="광견병"    name="health">광견병 </label> 
					<label> <input type="checkbox" value="외부기생충" name="health"> 외부기생충</label>
					<label> <input type="checkbox" value="코로나장염" name="health"> 코로나장염 </label>
					<br>
					<label> 그외  <input type="text" name="health"></label>
				</div>
			</div>
		</div>
	</div>
</div>
<br>
<br>


<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<button type="submit" class="btn btn-warning">위 내용으로 분양 강아지를 등록합니다</button>
			<button type="reset" class="btn btn-info">다시작성</button>
			<button type="button" id="regBtn" class="btn btn-success">목록으로</button>
		</div>
	</div>
</div>
</form>


</body>
</html>
