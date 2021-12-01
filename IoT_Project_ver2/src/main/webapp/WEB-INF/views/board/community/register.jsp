<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="/WEB-INF/views/include/header.jsp"  %>




	<div class="row">

	<%@ include file="/WEB-INF/views/include/leftSidebar.jsp"  %>	

		<div class="col-md-8">
			<div class="panel-heading">
				<h2 class="panel-title">
					<i class="fas fa-comments"></i>커뮤니티 - 게시글 등록
				</h2>
			</div>
			
			<div class="panel-body">
				<form action="/board/community/register" method="post" class="needs-validation" novalidate>	
					<div class="mb-3">
  						<label class="form-label" for="valid01">제목</label>
  						<input type="text" class="form-control" name="title" id="valid01" required>
  						<div class="invalid-feedback">제목을 입력하세요</div>
					</div>
					
					<div class="mb-3">
  						<label class="form-label" for="valid03">작성자</label>
  						<input type="text" class="form-control" name="writer" id="valid03" required>
  						<!-- 로그인 연동하면 readonly, value='<c:out value="${board.writer}"/>' -->
						<div class="invalid-feedback">작성자를 입력하세요</div>
					</div>
					
					<div class="mb-3">
  						<label class="form-label" for="valid02">내용</label>
  						<textarea class="form-control" rows="6" name='content' id="valid02" required></textarea>
						<div class="invalid-feedback">내용을 입력하세요</div>
					</div>


					<div class="row" style="margin-top:10px; margin-bottom:10px;">
						<div class="col" align="right">
							<button type="submit" class="btn btn-outline-primary" id="btn_register" >등록</button>
							<button type="button" class="btn btn-outline-danger btn_cancel">취소</button>
						</div>
					</div>
			</form>

			</div>
		</div>
	</div>



<script type="text/javascript">
$(document).ready(function(){
	
	
	$(".btn_cancel").on("click", function(){
		self.location = "/board/community/list";
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




<%@ include file="/WEB-INF/views/include/footer.jsp"  %>