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
			<button type="button" class="btn btn-outline-primary" style="width:400px; height:50px; font-family:'Jua'; font-size:2.0em;" disabled>회원 정보</button>
		</div>
		
		<hr>
		userId : ${member.userId }
		userName : ${member.userName }
		<hr>

		<div class="mb-3">
			<label for="userId" class="form-label">아이디</label> 
			<input type="text" class="form-control" name="userId" id="userId" placeholder="userId" readonly value="${member.userId }">
		</div>

		<div class="mb-3">
			<label for="userName" class="form-label">이름</label> 
			<input type="text" class="form-control form-control-user"
					name="userName" id="userName" placeholder="userName" readonly>
		</div>

		<div class="mb-3">
			<label for="userPw" class="form-label">비밀번호</label> 
			<input type="password" class="form-control form-control-user"
				name="userPw" id="userPw" placeholder="userPw" readonly>
		</div>
		
		<div class="row mb-3">
			<div class="col-md-4 mb-3 mb-sm-0">
				<label for="userGender" class="form-label">성별</label>
				<div class="col">
           			<input class="form-check-input" type="radio" id="userGender" name="userGender" autocomplete="off" value="man"  checked="checked" disabled>남성     	     		
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="form-check-input" type="radio" id="userGender" name="userGender" autocomplete="off" value="woman" disabled>여성
				</div>
			</div>
			<div class="col-md-8 mb-3 mb-sm-0">
				<label for="userEmail" class="form-label">이메일</label>
				<input type="text" class="form-control form-control-user"
					name="userEmail" id="userEmail" placeholder="userEmail" readonly>
			</div>
		</div>

		
		<div class="row mb-3">
			<div class="col-md-6 mb-3 mb-sm-0">
				<label for="userAddress1" class="form-label">주소</label> <input
					type="text" class="form-control form-control-user"
					name="userAddress1" id="userAddress1" placeholder="userAddress1" readonly>
			</div>
			<div class="col-md-6">
				<label for="userAddress2" class="form-label">&nbsp;</label> <input
					type="text" class="form-control form-control-user"
					name="userAddress2" id="userAddress2" placeholder="userAddress2" readonly>
			</div>
		</div>

		<div class="row mb-3">
			<div class="col-md-3 mb-3 mb-sm-0">
				<label for="number1" class="form-label">전화번호</label> 
				<select class="custom-select form-control form-control-user" id="number1" name="number1" disabled>
                <option selected="selected">010</option>
                  <option>011</option>
                  <option>016</option>
              </select>
			</div>
			<div class="col-md-4">
				<label for="number2" class="form-label">&nbsp;</label>
				<input type="text" class="form-control form-control-user"
					name="number2" id="number2" placeholder="number2" readonly>
			</div>
			<div class="col-md-4">
				<label for="number3" class="form-label">&nbsp;</label>
				<input type="text" class="form-control form-control-user"
					name="number3" id="number3" placeholder="number3" readonly>
			</div>
		</div>

		<div class="text-center py-5">
			<button type="button" class="btn btn-primary btn-user btn-block mx-3" onclick="location.href='/myPage/myInfoModify'">회원정보 수정</button>
		
			<button type="button" class="btn btn-danger btn-user btn-block mx-3" >회원 탈퇴</button>
		</div>
	</div>

</div>




<%@ include file="/WEB-INF/views/include/footer.jsp"%>