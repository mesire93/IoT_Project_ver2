<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>


<div class="row">

	<%@ include file="/WEB-INF/views/include/leftSidebar.jsp"%>

	<div class="col-md-8">
		<div class="panel-heading">
			<h2 class="panel-title">
				<i class="fas fa-comments"></i>질문답변 - 게시글 수정
			</h2>
		</div>

		<div class="panel-body">

		<form id="modifyForm" action="/board/community/modify" method="post" class="needs-validation"  novalidate>
			<div class="row">
				<div class="col-md-10 mb-3">
					<label class="form-label" for="valid01">제목</label>
					<input type="text" class="form-control" name="title" id="valid01" required value='<c:out value="${board.title}"/>' >
					<div class="invalid-feedback">제목을 입력하세요</div>
				</div>
				
				<div class="col-md-2 mb-3">
					<label class="form-label">번호</label> 
					<input type="text" class="form-control" name="bno" readonly value='<c:out value="${board.bno}"/>' >
				</div>
			</div>

			<div class="row">
				<div class="mb-3 col">
					<label class="form-label ">작성일</label> 
					<input type="text" class="form-control" name="regDate" readonly 
							value='<fmt:formatDate pattern="yyyy-MM-dd  HH시 mm분 ss초"
							value="${board.regdate }" />'>
				</div>
				<div class="mb-3 col">
					<label class="form-label ">수정일</label> 
					<input type="text"class="form-control" name="updateDate" readonly
							value='<fmt:formatDate pattern="yyyy-MM-dd  HH시 mm분 ss초"
							value="${board.updatedate }" />'>
				</div>
			</div>

			<div class="mb-3">
				<label class="form-label" >작성자</label> 
				<input type="text" class="form-control" name="writer" readonly
					value='<c:out value="${board.writer}"/>'>
			</div>

			<div class="mb-3">
				<label class="form-label" for="valid02">내용</label>
				<textarea class="form-control" rows="12" name='content'  id="valid02" required><c:out value="${board.content}" /></textarea>
				<div class="invalid-feedback">내용을 입력하세요</div>
			</div>



			<div class="row " style="margin-top: 10px; margin-bottom: 10px;">
				<div class="col" align="right">
					<button type="button" class="btn btn-outline-primary btn_list" data-oper="list">목록</button>
					<input type="submit" class="btn btn-outline-primary btn_modify" value="수정">
					<button type="button" class="btn btn-outline-danger btn_remove" data-oper="remove">삭제</button>
				</div>
			</div>
		</form>
			
			

		</div>
	</div>
</div>


<script type="text/javascript">
$(document).ready(function(){
	
	var modifyForm = $("#modifyForm");
	
	$('button').on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		if(operation === 'list'){
			modifyForm.append("<input type='hidden' name='type' value='qna'>").attr("method", "get");
			modifyForm.attr("action", "/board/community/list").attr("method", "get");
			modifyForm.empty().submit();
		}
		else if(operation === 'remove'){
			var del = confirm("정말 삭제하시겠습니까?")
			if(del == true){
				modifyForm.append("<input type='hidden' name='type' value='qna'>").attr("method", "get");
				modifyForm.attr("action", "/board/community/remove").submit();
			}
			else return;
		}
		
		
	});
	
	
	
	
	
	// 부트스트랩 유효성검사 시작
	(function () {
	  'use strict'

	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  var forms = document.querySelectorAll('.needs-validation')

	  // Loop over them and prevent submission
	  Array.prototype.slice.call(forms)
	    .forEach(function (form) {
	      form.addEventListener('submit', function (event) {
	        if (!form.checkValidity()) {
	          event.preventDefault()
	          event.stopPropagation()
	        }

	        form.classList.add('was-validated')
	      }, false)
	    })
	})()
	// 부트스트랩 유효성검사 종료

	
	
	
	

});
</script>



<%@ include file="/WEB-INF/views/include/footer.jsp"%>
