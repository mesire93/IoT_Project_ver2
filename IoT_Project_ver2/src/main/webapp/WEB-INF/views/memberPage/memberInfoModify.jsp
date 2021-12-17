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
	<form class="memberInfoModify" action="/memberPage/memberInfoModify" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
		<input type="hidden" name="mno" value="${member.mno }">

		<div class="mb-3">
			<label for="userId" class="form-label">아이디</label> 
			<input type="text" class="form-control" name="userId" id="userId" placeholder="userId"  readonly value='<c:out value="${member.userId }"/>'>
		</div>

		<div class="mb-3">
			<label for="userName" class="form-label">이름</label> 
			<input type="text" class="form-control form-control-user" name="userName"
					id="userName" placeholder="userName"  required value='<c:out value="${member.userName }"/>'>
		</div>

		<div class="mb-3">
			<label for="userPw" class="form-label">비밀번호</label> 
			<input type="password" class="form-control form-control-user" name="userPw"
				id="userPw" placeholder="userPw"  readonly  value='<c:out value="${member.userPw }"/>'>
		</div>
		
		<div class="row mb-3">
			<div class="col-md-4 mb-3 mb-sm-0">
				<label for="userGender" class="form-label">성별</label>
				<div class="col">
           			<input class="form-check-input" type="radio"  name="userGender" autocomplete="off" value="man"  checked="checked"  >남성     	     		
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="form-check-input" type="radio"  name="userGender" autocomplete="off" value="woman"  >여성
				</div>
			</div>
			<div class="col-md-8 mb-3 mb-sm-0">
				<label for="userEmail" class="form-label">이메일</label>
				<input type="Email" class="form-control form-control-user" name="userEmail"
					id="userEmail" placeholder="userEmail"  required value='<c:out value="${member.userEmail }"/>'>
			</div>
		</div>

		
		<div class="row mb-3">
			<div class="col-md-6 mb-3 mb-sm-0">
				<label for="userAddress1" class="form-label">주소</label> <input
					type="text" class="form-control form-control-user" name="userAddress1"
					id="userAddress1" placeholder="userAddress1"  required value='<c:out value="${member.userAddress1 }"/>'>
			</div>
			<div class="col-md-6">
				<label for="userAddress2" class="form-label">&nbsp;</label> <input
					type="text" class="form-control form-control-user" name="userAddress2"
					id="userAddress2" placeholder="userAddress2" required  value='<c:out value="${member.userAddress2 }"/>'>
			</div>
		</div>

		<div class="row mb-3">
			<div class="col-md-3 mb-3 mb-sm-0">
				<label for="number1" class="form-label">전화번호</label> 
				<select class="custom-select form-control form-control-user" id="number1" name="number1"  >
                <option selected="selected">010</option>
                  <option>011</option>
                  <option>016</option>
              </select>
			</div>
			<div class="col-md-4">
				<label for="number2" class="form-label">&nbsp;</label>
				<input type="text" class="form-control form-control-user" name="number2"
					id="number2" maxlength='4' placeholder="number2"  required value='<c:out value="${member.number2 }"/>'>
			</div>
			<div class="col-md-4">
				<label for="number3" class="form-label">&nbsp;</label>
				<input type="text" class="form-control form-control-user" name="number3"
					id="number3" maxlength='4' placeholder="number3" required  value='<c:out value="${member.number3 }"/>'>
			</div>
		</div>
		
		<div class="mb-3">
			<label for="regDate" class="form-label">가입일자</label> 
			<label class="form-control form-control-user" name="regDate"
					id="regDate" readonly><fmt:formatDate pattern="yyyy년 MM월 dd일  HH시 mm분 ss초" value="${member.regDate }" /></label>
		</div>
		
		<div class="mb-3">
			<label for="userAuth" class="form-label">회원 등급</label> 
			<label class="form-control form-control-user" name="userAuth"
					id="userAuth" readonly><c:out value="${member.authList[0].userAuth}"/></label>
		</div>


		<div class="text-center py-5">
			<button type="submit" class="btn btn-primary btn-user btn-block mx-3" >수정</button>		
			<button type="reset" class="btn btn-danger btn-user btn-block mx-3" >리셋</button>
		</div>
	</form>
		
	</div>

</div>




<%@ include file="/WEB-INF/views/include/footer.jsp"%>