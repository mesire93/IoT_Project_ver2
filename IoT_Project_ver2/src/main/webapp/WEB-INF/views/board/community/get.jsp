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
				<i class="fas fa-comments"></i>커뮤니티 - 게시글 조회
			</h2>
		</div>

		<div class="panel-body">
			
			<div class="row">
				<div class="col-md-10 mb-3">
					<label class="form-label">제목</label> <input type="text"
						class="form-control" name="title" readonly
						value='<c:out value="${board.title}"/>'>
				</div>
				
				<div class="col-md-2 mb-3">
					<label class="form-label">번호</label> <input type="text"
						class="form-control" name="bno" readonly
						value='<c:out value="${board.bno}"/>'>
				</div>
			</div>

			<div class="row">
				<div class="mb-3 col">
					<label class="form-label ">작성일</label> <input type="text"
						class="form-control" name="regDate" readonly
						value='<fmt:formatDate pattern="yyyy-MM-dd  HH시 mm분 ss초"
									value="${board.regdate }" />'>
				</div>
				<div class="mb-3 col">
					<label class="form-label ">수정일</label> <input type="text"
						class="form-control" name="updateDate" readonly
						value='<fmt:formatDate pattern="yyyy-MM-dd  HH시 mm분 ss초"
									value="${board.updatedate }" />'>
				</div>
			</div>

			<div class="mb-3">
				<label class="form-label">작성자</label> <input type="text"
					class="form-control" name="writer" readonly
					value='<c:out value="${board.writer}"/>'>
			</div>

			<div class="mb-3">
				<label class="form-label">내용</label>
				<textarea class="form-control" rows="6" name='content' readonly><c:out
						value="${board.content}" /></textarea>
			</div>



			<div class="row " style="margin-top: 10px; margin-bottom: 10px;">
				<div class="col" align="right">
					<button type="button" class="btn btn-outline-primary btn_list">목록</button>
					<button type="button" class="btn btn-outline-primary btn_modify">수정</button>
					<button type="button" class="btn btn-outline-danger btn_remove">삭제</button>
				</div>
			</div>
			
			<!-- Page 264 조회페이지에서 <form>처리 -->
			<form id='actionForm' action="/board/community/list" method='get'>
				<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno }"/>'>	
			</form>
			
			<form id='modifyForm' action="/board/community/modify" method='get'>
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				
				<!-- Page 345 조회 페이지에서 검색 처리 -->
				<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
			</form>


		</div>
	</div>
</div>


<script type="text/javascript">
	$(document).ready(function(){
		
		var actionForm = $("#actionForm");
		
		
		$(".btn_list").on("click", function(e){
			actionForm.find("#bno").remove();
			actionForm.attr("action", "/board/community/list").submit();
		});
		
		$(".btn_modify").on("click", function(e){
			actionForm.attr("action", "/board/community/modify").submit();
		});
		
		$(".btn_remove").on("click", function(e){
			actionForm.attr("action", "/board/community/remove").attr("method", "post").submit();
			alert("삭제 완료");
		});
		


	});
</script>



<%@ include file="/WEB-INF/views/include/footer.jsp"%>
