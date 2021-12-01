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
				<i class="fas fa-comments"></i>커뮤니티 - 게시글 수정
			</h2>
		</div>

		<div class="panel-body">

		<form id="modifyForm" action="/board/community_modify" method="post">
			<div class="row">
				<div class="col-md-10 mb-3">
					<label class="form-label">제목</label> <input type="text"
						class="form-control" name="title" 
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
				<textarea class="form-control" rows="6" name='content' ><c:out
						value="${board.content}" /></textarea>
			</div>



			<div class="row " style="margin-top: 10px; margin-bottom: 10px;">
				<div class="col" align="right">
					<button type="button" class="btn btn-outline-primary btn_list" data-oper="list">목록</button>
					<button type="button" class="btn btn-outline-primary btn_modify" data-oper="modify">수정</button>
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
			modifyForm.attr("action", "/board/community").attr("method", "get");
			modifyForm.empty().submit();
		}
		else if(operation === 'modify'){
			modifyForm.submit();
			alert("수정 완료");
		}
		else if(operation === 'remove'){
			modifyForm.attr("action", "/board/community_remove").submit();
			alert("삭제 완료");
		}
		
		
		});
	

		

});
</script>



<%@ include file="/WEB-INF/views/include/footer.jsp"%>
