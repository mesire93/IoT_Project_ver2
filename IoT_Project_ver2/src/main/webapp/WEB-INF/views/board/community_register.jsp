<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="/WEB-INF/views/include/header.jsp"  %>




	<div class="row">

		<!-- 왼쪽 사이드바 -->
		<div class="col-md-2 sidebar ">
			<a href="#"
				class="navbar-brand text-black text-center d-block mx-auto py-3 mb-4 ">
				<h4>
					<i class="fas fa-bullhorn"></i>공지사항
				</h4>
			</a> <a href="#"
				class="navbar-brand text-black text-center d-block mx-auto py-3 mb-4 ">
				<h4>
					<i class="fas fa-comments"></i>커뮤니티
				</h4>
			</a> <a href="#"
				class="navbar-brand text-black text-center d-block mx-auto py-3 mb-4">
				<h4>
					<i class="fas fa-question-circle"></i>질문답변
				</h4>
			</a>
		</div>
		<!-- 왼쪽 사이드바 종료 -->

		<div class="col-md-8">
			<div class="panel-heading">
				<h2 class="panel-title">
					<i class="fas fa-comments"></i>커뮤니티
				</h2>
			</div>
			
			<div class="panel-body">
				<form action="community_register" method="post">	
					<div class="mb-3">
  						<label class="form-label">제목</label>
  						<input type="text" class="form-control" name="title">
					</div>
					
					<div class="mb-3">
  						<label class="form-label">내용</label>
  						<textarea class="form-control" rows="6" name='content'></textarea>
					</div>

					<div class="mb-3">
  						<label class="form-label">작성자</label>
  						<input type="text" class="form-control" name="writer">
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
	
	// 글쓰기 버튼 클릭이벤트 
	$(".btn_cancel").on("click", function(){
		self.location = "/board/community";
	});

	
	
});
</script>




<%@ include file="/WEB-INF/views/include/footer.jsp"  %>