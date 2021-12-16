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
			<button type="button" class="btn btn-outline-primary" style="width:80%; height:50px; font-family:'Jua'; font-size:2.0em;" disabled>회원 정보</button>
		</div>
	

		<div class="mb-3">
			<label for="userId" class="form-label">아이디</label> 
			<input type="text" class="form-control" name="userId" id="userId" placeholder="userId" readonly value='<c:out value="${member.userId }"/>'>
		</div>

		<div class="mb-3">
			<label for="userName" class="form-label">이름</label> 
			<input type="text" class="form-control form-control-user"
					name="userName" id="userName" placeholder="userName" readonly value='<c:out value="${member.userName }"/>'>
		</div>

		<div class="mb-3">
			<label for="userPw" class="form-label">비밀번호</label> 
			<input type="password" class="form-control form-control-user"
				name="userPw" id="userPw" placeholder="userPw" readonly value='<c:out value="${member.userPw }"/>'>
		</div>
		
		<div class="row mb-3">
			<div class="col-md-4 mb-3 mb-sm-0">
				<label for="userGender" class="form-label">성별</label>
				<div class="col">
					<input type="text" class="form-control form-control-user" name="userGender" readonly value='<c:out value="${member.userGender }"/>' >
           	
				</div>
			</div>
			<div class="col-md-8 mb-3 mb-sm-0">
				<label for="userEmail" class="form-label">이메일</label>
				<input type="Email" class="form-control form-control-user"
					name="userEmail" id="userEmail" placeholder="userEmail" readonly value='<c:out value="${member.userEmail }"/>'>
			</div>
		</div>
				
		<div class="row mb-3">
			<div class="col-md-6 mb-3 mb-sm-0">
				<label for="userAddress1" class="form-label">주소</label> <input
					type="text" class="form-control form-control-user"
					name="userAddress1" id="userAddress1" placeholder="userAddress1" readonly value='<c:out value="${member.userAddress1 }"/>'>
			</div>
			<div class="col-md-6">
				<label for="userAddress2" class="form-label">&nbsp;</label> <input
					type="text" class="form-control form-control-user"
					name="userAddress2" id="userAddress2" placeholder="userAddress2" readonly value='<c:out value="${member.userAddress2 }"/>'>
			</div>
		</div>

		<div class="row mb-3">
			<div class="col-md-3 mb-3 mb-sm-0">
				<label for="number1" class="form-label">전화번호</label> 
				<select class="custom-select form-control form-control-user" id="number1" name="number1" disabled >
                   <option value="010">010</option>
                   <option value="011">011</option>
                  <option value="016">016</option>
              </select>
			</div>
			<div class="col-md-4">
				<label for="number2" class="form-label">&nbsp;</label>
				<input type="text" class="form-control form-control-user"
					name="number2" id="number2" placeholder="number2" readonly value='<c:out value="${member.number2 }"/>'>
			</div>
			<div class="col-md-4">
				<label for="number3" class="form-label">&nbsp;</label>
				<input type="text" class="form-control form-control-user"
					name="number3" id="number3" placeholder="number3" readonly value='<c:out value="${member.number3 }"/>'>
			</div>
		</div>
		
		<div class="mb-3">
			<label for="regDate" class="form-label">가입일자</label> 
			<input type="text" class="form-control form-control-user" name="regDate"
					id="regDate" placeholder="regDate"  readonly value='<fmt:formatDate pattern="yyyy년 MM월 dd일  HH시 mm분 ss초" value="${member.regDate }" />' >
		</div>
		
		<div class="mb-3">
			<label for="userAuth" class="form-label">회원 등급</label> 
			<input type="text" class="form-control form-control-user" name="userAuth"
					id="userAuth" placeholder="userAuth"  readonly value='<c:out value="${member.authList[0].userAuth}"/>' >
		</div>

				
		<div class="text-center py-5">
			<button type="button" class="btn btn-primary btn-user btn-block mx-3 btn_modify" >회원정보 수정</button>
			<button type="button" class="btn btn-danger btn-user btn-block mx-3 btn_remove" >회원 탈퇴</button>
		</div>
	</div>

</div>

<form id="actionForm" action="/memberPage/memberInfoModify"  method="get">
	<input type="hidden" name="mno" value='<c:out value="${member.mno }"/>'>
</form>




<script type="text/javascript">
$(document).ready(function(){
	
	var actionForm = $("#actionForm");
	
	var userid = null;
	var role = null;
	var originaluser = $("#userId").val();	
	
	<sec:authorize access="isAuthenticated()">
		userid = '<sec:authentication property = "principal.username" />';
		role = '<sec:authentication property = "principal.Authorities" />'
	</sec:authorize>
	
	console.log(userid);
	console.log(role.indexOf("ADMIN"));
	console.log(originaluser);
	
	$(".btn_modify").on("click", function(e){
		if(role.indexOf("ADMIN") != -1){
			actionForm.attr("action", "/memberPage/memberInfoModify").attr("method","get").submit();
			return;
		}
		
		if(userid == originaluser){
			actionForm.attr("action", "/memberPage/memberInfoModify").attr("method","get").submit();
		}
		else{
			alert("본인의 계정만 수정 할 수 있습니다.");
			return;
		}
	});

	$(".btn_remove").on("click", function(e){
		var del = confirm("정말 탈퇴하시겠습니까?")
		if(role.indexOf("ADMIN") != -1){
			actionForm.append("<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token }' />");
			actionForm.attr("action", "/memberPage/memberInfoRemove").attr("method", "post").submit();
			return;
		}
		
		if(userid == originaluser){
			if(del == true){
				actionForm.append("<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token }' />");
				actionForm.attr("action", "/memberPage/memberInfoRemove").attr("method", "post").submit();
			}
			else{
				return;
			}
		}
		else{
			alert("본인의 계정만 삭제 할 수 있습니다.");
			return;
		}
		
	});



	$("#number1 option").each(function(){

	    if($(this).val() == "${member.number1}"){

	      $(this).prop("selected","selected"); // attr적용안될경우 prop으로 

	    }

	  });
	

	

});
</script>



<%@ include file="/WEB-INF/views/include/footer.jsp"%>