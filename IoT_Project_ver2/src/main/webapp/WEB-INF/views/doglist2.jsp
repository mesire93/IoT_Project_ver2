<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>    



<script type="text/javascript">

$(document).ready(function(){
	//제이쿼리 ->$ 알려주고 있다. 문법
	var result ="<c:out value='${registerdno}'/>";
	//Controller 에서 값을 들고오는 $. addFlashAttribute 1번만 값을 전송하라. 
	
	checkModal(result);
	
	history.replaceState({},null,null);
	
	function checkModal(result){
		
		if(result==='' || history.state) return;
		//if(parseInt(result) >0 ) $("#registerModal").modal();
		 
		 
		if(parseInt(result) > 0 ){
			$(".modal-body").html("강아지 분양등록이 이루어졌습니다.");
		}		
			$("#registerModal").modal("show"); 
	}
	
	//doglist 아래 상세보기 버튼 클릭시 자바스크립트로 이동
	$("#detailBtn").on("click", function(){
		self.location="/dogdetail";
	});
	
	//doglist 아래 장바구니 버튼 클릭시 자바스크립트로 이동
	$("#bagBtn").on("click", function(){
		self.location="/";
	});
	
	//doglist 위의 등록하기 버튼 클릭시 자바스크립트로 이동처리
	$("#regBtn").on("click", function(){
		self.location="/dogregister";
	});
	
/* var actionForm =$("#actionForm");
$(".paginate_button a").on("click",function(e){
	e.preventDefault(); //보호해제
	console.log('click');//개발자도구에서 보이는  console 자바스크립트 블록안이라서
	actionForm.find("input[name='pageNum']")
	.val($(this).attr("href"));
//val=value , a가 this 객체가 된다.
}); */
	
	/* $(".paginate_button a").on("click",function(e){
		e.preventDefault();
		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});//이 처리를 해줘야 페이지가 이동된다. */
	
	/* $(".move").on("click", function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+"'>");
		//제목의 하이퍼링크 속성 클릭=this
		actionForm.attr("action","/board/get");
		actionForm.submit();
	}); */
	
});
</script>


<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>애견분양 Mall</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/styles.css" rel="stylesheet">


</head>
 <body>
     <!-- Responsive navbar-->
       <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
           <div class="container">
               <a class="navbar-brand" href="#!">LOGO</a>
               <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
               <div class="collapse navbar-collapse" id="navbarSupportedContent">
                   <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                       <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                       <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                       <li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
                       <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Blog</a></li>
                   </ul>
               </div>
           </div>
       </nav>
   

       <header class="py-5 bg-light border-bottom mb-4">
           <div class="container">
               <div class="text-center my-5">
                   <h1 class="fw-bolder">애견분양Mall</h1>
                   <p class="lead mb-0">환영합니다</p>
               </div>
           </div>
       </header>
       
       
       
<div class="container">
	<div class="row">

		<div class="col-lg-4 " >
			<button id="regBtn" type="button" class="btn btn-primary" onclick="location.href='/dogregister'"> 강아지 분양등록하기</button>
		</div>

	</div>
</div>
		
<br>

<form action="/dogdetail" method="post">

<div class="container">
	<div class="row">
		 <c:forEach items="${registerdno}" var="list">
		<%-- <c:forEach items="${registerdno}"> 화면이 안나온다--%>
			<div class="col-lg-4">
				<div class="card mb-4">
					<a href="#"><img class="card-img-top" src="resources/img/dog/닥스훈트.png" style="object-fit: scale-down"
						alt="..."></a>
					<div class="card-body">
						<div class="small text-muted">
							등록일자 :
							<fmt:formatDate pattern="yyy-MM-dd" value="${list.regdate}" />
						</div>
						<div>
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</div>
						<h2 class="card-title h4">
							품종 :
							<a href='/dogdetail?dno=<c:out value="${list.dno}"/>'>
							<c:out value="${list.kind}" /></a>
						</h2>
						<p class="card-text">
							나이 :
							<c:out value="${list.age}" />
							<br> 성별 :
							<c:out value="${list.sex}" />
							<br> 특징:
							<c:out value="${list.simple}" />

						</p>
						
						<!-- <div class="card-body"> 안에 위치해야 한다. -->
						

						<button type="submit" id="detailBtn" class="btn btn-outline-warning">상세보기</button>
						<input type="hidden" value="<c:out value='${list.dno}'/>"><!--${registerdno} 값으로는 페이지 이동불가 -->
						<button type="button" id="bagBtn" class="btn btn-outline-danger">장바구니담기</button>
					</div>	
				</div>
			</div>		

			
				<%-- <button type="button" id="detailBtn"
				class="btn btn-outline-warning"><a href='/dogdetail?dno=<c:out value="${register.dno}"/>'
				target='_blank'>상세보기</a></button> --%>
				
				<%-- <form action="/dogdetail" method="get">
				<input type="hidden" value="{c:out value='${detail.dno}'/>">
				<button type="button" id="bagBtn" class="btn btn-outline-warning">상세보기</button>
				</form> 이 방법 안됨 레이아웃 비틀어짐--%>
				
		</c:forEach>
	</div>
</div>
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
	

         
<!-- Modal 추가 -->
<div class="modal fade" id="registerModal" tabindex="-1" data-toggle="modal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">알림창</h4>
			</div>
			<div class="modal-body">
				<p>강아지 분양등록이 이루어졌습니다.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- 
<div class="modal fade" id="myModal" tabindex="-1" 
aria-labelledby="myModalLabel" aria-hidden="true" data-toggle="modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">분양등록이 이루어졌습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>			
		</div>
	/.modal-content
	</div>
	/.modal-dialog
</div> -->
<!-- /.modal --> 
 


</body>
</html>


