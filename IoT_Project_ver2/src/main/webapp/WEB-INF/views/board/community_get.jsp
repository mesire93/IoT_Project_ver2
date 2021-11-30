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
				
					<div class="mb-3">
  						<label class="form-label col-md-5">제목</label>
  						<input type="text" class="form-control" name="title" readonly value='<c:out value="${board.bno}"/>'>		
  					</div>
  					
  					<div class="col-md-4 mb-3">
  						<label class="form-label col-md-3">작성일</label>	
  						<input type="text" class="form-control" name="regDate" readonly
  									value='<fmt:formatDate pattern="yyyy-MM-dd  hh시 MM분 ss초"
									value="${board.regdate }" />'>
					</div>
					<div class="col-md-4 mb-3">			
						<label class="form-label col-md-3">수정일</label>	
  						<input type="text" class="form-control" name="updateDate" readonly
  									value='<fmt:formatDate pattern="yyyy-MM-dd  hh시 MM분 ss초"
									value="${board.updatedate }" />'>
					</div>
					
					
					<div class="mb-3">
  						<label class="form-label">내용</label>
  						<textarea class="form-control" rows="6" name='content' readonly><c:out value="${board.content}"/></textarea>
					</div>

					<div class="mb-3">
  						<label class="form-label">작성자</label>
  						<input type="text" class="form-control" name="writer" readonly value='<c:out value="${board.writer}"/>'>>
					</div>

					<div class="row" style="margin-top:10px; margin-bottom:10px;">
						<div class="col" align="right">
							<button type="submit" class="btn btn-outline-primary btn_register" >등록</button>
							<button type="button" class="btn btn-outline-danger btn_cancel">취소</button>
						
							<button data-oper='modify' class="btn btn-default" >Modify</button>
							<button data-oper='list' class="btn btn-info" >List</button>
						</div>
					</div>
		

			</div>
		</div>
	</div>






<%@ include file="/WEB-INF/views/include/footer.jsp"  %>
