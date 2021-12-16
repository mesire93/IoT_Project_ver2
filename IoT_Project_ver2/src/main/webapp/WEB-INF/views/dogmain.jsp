<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<!-- 메인상품 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Stylish&display=swap" rel="stylesheet">


<!-- 상품목록 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">



<style>
p {font-family: 'Cute Font', cursive; font-family: 'Stylish', sans-serif; font-size:1.4em; font-weight:200;}
.h4 {font-family: 'Poor Story', cursive; font-size:1.9em; font-weight:800;}
.kind {font-family: 'Poor Story', cursive; font-size:1.6em; font-weight:700;}

</style>
<!-- ================================================================== -->

<div style="margin:0 auto; text-align: center;">
	<div><h2 class="h4" style="padding: 30px; font-family:'Jua';">상품 목록</h2></div>
	<!-- <div style="width: 1300px; display: inline-block; border: 1px solid red;"> -->

<div class="container">
	<div class="row">	
		<c:forEach items="${dog1List}" var="dog1List">
			<div class="col-lg-3">
				<div class="card mb-3">
					<div class="card-body">					
						<!-- <div style="border: 1px solid blue; float: left; width: 260px; margin: 30px;"> -->
						<div><img src="/resources/img/dog/<c:out value="${dog1List.fileName}"/>" style="width: 100%; height: 100%;"></div>
						<br>
						<h2 class="card-title h4 kind">
							<%-- 콤마 있어서 JSTL 변경 <br> 품종 : <c:out value="${dog1List.kind}"/> --%>
							품종 : <c:out value="${fn:replace(dog1List.kind, ',', '')}"/>
						</h2>
						<p class="card-text" style="text-align:left;">		
							나이 : <c:out value="${dog1List.age}"/>
							<br> 성별 : <c:out value="${dog1List.sex}"/>
							<br> 이름 : <c:out value="${dog1List.name}"/>
							<br> 분양가 : <fmt:formatNumber value="${dog1List.price}" pattern="#,###,###"/> 원
							<br>
						</p>	
					<button type="button"  class="btn btn-outline-warning" onclick="location.href='/dogdetail?dno=${dog1List.dno}'">상세보기</button>
						
					</div><!-- 끝 <div class="card-body"> -->
				</div>	<!-- 끝 <div class="card mb-3"> -->
			</div><!--끝 <div class="col-lg-3"> -->
		</c:forEach>
	</div><!-- 끝 <div class="row">	 -->
</div><!--끝 <div class="container"> -->
<!-- ================================================================== -->


<%-- 
<!-- ================================================================== -->
<div style="margin:0 auto; text-align: center;">
	<div><h2 style="padding: 30px; font-family:'Jua';">상품 목록</h2></div>
	<div style="width: 1300px; display: inline-block; border: 1px solid red;">
	
	<c:forEach items="${dog1List}" var="dog1List">
		<div style="border: 1px solid blue; float: left; width: 260px; margin: 30px;">
			<div><img src="/resources/img/dog/<c:out value="${dog1List.fileName}"/>" style="width: 160px; height: 100px;"></div>
			<div><c:out value="${dog1List.name}"/></div>
			<div><c:out value="${dog1List.price}"/></div>
			<br>
			<button type="button" onclick="location.href='/dogdetail?dno=${dog1List.dno}'">상세보기</button>
		</div>
		 
	</c:forEach>
	</div>
</div>
<!-- ================================================================== --> --%>
<!-- 지도, 공지사항 -->
<div class="row mx-5 my-5">

	<div class="map_wrap col-md-6 ml-5 mb-3">
		<h2 class="panel-title" style="font-family:'Jua'; ">본사 위치입니다</h2>
		<div id="map" style="width:95%;height:600px;"></div>
	</div>

	<div class="col-md-6">
		<section class="panel">
			<header class="panel-heading">
				<h2 class="panel-title" style="font-family:'Jua'; ">공지사항</h2>
			</header>
			
			<div class="panel-body">
				<div class="table-responsive" style="height:600px;">
					<table class="table table-hover mb-none" >
						<thead>
							<tr>
								<th width=20>번호</th>
								<th width=60>제목</th>
								<th width=20>조회수</th>
							</tr>
						</thead>
						<tbody>
						
						<c:forEach items="${list}" var="board">
							<tr>
								<td><c:out value="${board.bno }"/></td>
								<td><a class='move'  style="text-decoration:none;" href='<c:out value="${board.bno}"/>' >
										<c:out value="${board.title}" /></a></td>
								<td><c:out value="${board.viewcnt}"/></td>
							</tr>
						</c:forEach>
						
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</div>
	
</div>
<!-- 지도, 공지사항 -->


<form id='actionForm' action="/board/notice/list" method='get'>
	<input type="hidden" name="bno">
</form>



             
<script>
$(document).ready(function(){ 
	$("#submit").click(function(){
			
			main.submit();
		 
	});
	
	
	
	
	var actionForm = $("#actionForm");
		
		$(".move").on("click", function(e){
			e.preventDefault();
			actionForm.find("input[name='bno']").val($(this).attr("href"));
			actionForm.attr("action", "/board/notice/get");
			actionForm.submit();
		});
	
		var container = document.getElementById('map');
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(35.207447, 129.070227), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();
	
		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(35.207447, 129.070227); 
	
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition,
		    clickable:true
		});
	
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
		var iwContent = '<div style="padding:5px; height:30px;">5층으로 오세요</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    content : iwContent,
		    removable : iwRemoveable
		});
	
		// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {
		      // 마커 위에 인포윈도우를 표시합니다
		      infowindow.open(map, marker); 
		});
	
	
});

/* 
	$.ajax({
 	url : '/main2',
	processData : false,
	contentType : false,
	data : formData,
	type : 'POST',
	dataType : 'json',
	
}); 
*/
</script>

     

<%@ include file="/WEB-INF/views/include/footer.jsp"%>