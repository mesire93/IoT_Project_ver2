<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="/WEB-INF/views/include/header2.jsp"%>

<div class="row" >
	<div class="col-md-3"></div>
	<div class="col-md-6 p-5 my-5" style="border:1px solid skyblue; border-radius:20px;">

		<div class="text-center mb-5">
			<button type="button" class="btn btn-outline-primary" style="width:80%; height:50px; font-family:'Jua'; font-size:2.0em;" disabled>회원 정보 수정</button>
		</div>
<%-- 	
		<hr>
			<p>${member.userId }</p>
			<p>${member.userName }</p>
			<p>${member.userPw }</p>
			<p>${member.userGender }</p>
			<p>${member.userEmail }</p>
			<p>${member.number1 }</p>
			<p>${member.number2 }</p>
			<p>${member}</p>
		<hr>
 --%>
	

		<div class="mb-3">
			<label for="userId" class="form-label">아이디</label> <input
				type="text" class="form-control" name="userId" id="userId" placeholder="userId"  readonly value='<c:out value="${member.userId }"/>'>
		</div>

		<div class="mb-3">
			<label for="userName" class="form-label">이름</label> 
			<input type="text" class="form-control form-control-user" name="userName"
					id="userName" placeholder="userName" readonly  required value='<c:out value="${member.userName }"/>'>
		</div>

		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div class="mb-3">
			<label for="userAuth" class="form-label">회원 등급</label> 
			<input type="text" class="form-control form-control-user" name="userAuth"
					id="userAuth" placeholder="userAuth"  readonly  value='<c:out value="${member.authList[0].userAuth}"/>' >
		</div>
		</sec:authorize>
		
		<div class="text-center py-5">
			<button type="button" class="btn btn-primary btn-user btn-block mx-3 btn_modify" >수정</button>		
		</div>
		
	</div>

</div>


<form id="actionForm" action="/memberPage/memberInfoModify"  method="get">
	<input type="hidden" name="mno" value='<c:out value="${member.mno }"/>'>
</form>


<script type="text/javascript">
$(document).ready(function(){
	
	var actionForm = $("#actionForm");
	
	$(".btn_modify").on("click", function(e){
			
		actionForm.attr("action", "/memberPage/memberAuthModify").attr("method","get").submit();
	});
	
});
</script>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>