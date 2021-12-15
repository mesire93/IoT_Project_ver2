<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="/WEB-INF/views/include/header2.jsp"%>

<div class="row " align=center>
	<div class="col-md-12">
		<span class="badge rounded-pill bg-danger align-middle fs-2 " style="width:300px; margin:auto; text-align:center;">관리자 페이지</span>
	</div>
	<div class="col-md-2"></div>
	<div class="col-md-8 p-5 my-5" style="border:1px solid skyblue; border-radius:20px;">

		<div class="text-center mb-5">
			<button type="button" class="btn btn-outline-primary" style="width:400px; height:50px; font-family:'Jua'; font-size:2.0em;" disabled>회원 정보</button>
		</div>
		



		<table class="table mb-none table-hover table-striped" >
			<thead>
				<tr style="border-top:2px solid black;">
					<th>회원번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>계정상태</th>
					<th>가입일자</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td><c:out value="${list.mno}" /></td>
					<td>
						<a class='move' style="text-decoration:none;" href='<c:out value="${list.mno}"/>'>
							<c:out value="${list.userId}" />
						</a>
					</td>
					<td><c:out value="${list.userName}" /></td>
					<td><c:out value="${list.enabled }"/></td>
					<td><small><fmt:formatDate pattern="yyyy.MM.dd HH:mm:ss" value="${list.regDate }" /></small></td>
					<td>

					</td>
				</tr>				
			</c:forEach>
			</tbody>
		</table>



	<form id="actionForm" action="/myPage/myInfo" method="get">
		<input type="hidden" name="mno">
	</form>
		
	</div>

</div>



<script type="text/javascript">
$(document).ready(function(){
 
	var actionForm = $("#actionForm");
	
	$(".move").on("click", function(e){
		e.preventDefault();
		actionForm.find("input[name='mno']").val($(this).attr("href"));
		actionForm.attr("action", "/myPage/myInfo");
		actionForm.submit();
	});
	
});
</script>



<%@ include file="/WEB-INF/views/include/footer.jsp"%>