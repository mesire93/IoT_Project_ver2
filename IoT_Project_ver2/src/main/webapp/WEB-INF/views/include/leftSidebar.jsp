<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


		<!-- 왼쪽 사이드바 -->
		<div class="col-md-2 sidebar ">
			<a href="#" id="notice"
				class="navbar-brand text-black text-center d-block mx-auto py-3 mb-4 ">
				<h4>
					<i class="fas fa-bullhorn"></i>공지사항
				</h4>
			</a> 
			<a href="#" id="community"
				class="navbar-brand text-black text-center d-block mx-auto py-3 mb-4 ">
				<h4>
					<i class="fas fa-comments"></i>커뮤니티
				</h4>
			</a> 
			<a href="#" id="qna"
				class="navbar-brand text-black text-center d-block mx-auto py-3 mb-4">
				<h4>
					<i class="fas fa-question-circle"></i>질문답변
				</h4>
			</a>
		</div>
		<!-- 왼쪽 사이드바 종료 -->
		
		
<script type="text/javascript">
$(document).ready(function(){
	
				
	$("#notice").on("click", function(){
		self.location = "/board/notice";
	});
	
	$("#community").on("click", function(){
		self.location = "/board/community";
	});
	
	$("#qna").on("click", function(){
		self.location = "/board/qna";
	});
	
	
});

</script>