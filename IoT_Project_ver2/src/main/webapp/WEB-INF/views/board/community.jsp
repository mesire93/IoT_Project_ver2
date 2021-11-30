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


		<div class="col-md-10">
			<header class="panel-heading">

				<h2 class="panel-title">
					<i class="fas fa-comments"></i>커뮤니티
				</h2>
			</header>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table mb-none table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th colspan=2>제목</th>
								<th>작성자</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="board">
								<tr>
									<td><c:out value="${board.bno}" /></td>
									<!-- Page 254 목록 페이지와 뒤로가기 문제 -->
									<td colspan=2>
										<a class='move' href='<c:out value="${board.bno}"/>'>
										<c:out value="${board.title}" />
										</a>
									</td>
									<td><c:out value="${board.writer}" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd  hh시 MM분 ss초"
											value="${board.regdate }" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>


			<div class="row" style="margin: 10px;">
				<div class="col" align="right">
					<button type="button" class="btn btn-outline-primary " id="btn_register">글쓰기</button>
				<!-- 	
					<button type="button" class="btn btn-outline-info ">수정</button>
					<button type="button" class="btn btn-outline-danger ">삭제</button>
				 -->
				</div>
			</div>

			<div class="row">
				<div class="col">
					<ul class="pagination justify-content-center">
						
						<c:if test="${pageMaker.prev}">
							<li class="page-item"><a class="page-link"  href="${pageMaker.startPage -1}">이전</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="page-item  ${pageMaker.cri.pageNum == num ? 'active' : ''} ">
								<a class="page-link" href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="page-item"><a class="page-link" href="${pageMaker.endPage +1 }">다음</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			
			<!-- Page 311 페이지 번호 이벤트 처리 -->
			<form id='actionForm' action="/board/community" method='get'>
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				
				<!-- Page 344 검색조건, 키워드 처리
				<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type }"/>'>
				<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>' >
				 -->
			</form>


			<div class="row justify-content-center" style="margin-top: 20px;">
				<div class="col-md-8 col-md-offset-3  ">

					<div class="input-group ">
						<input type="hidden" name="page" value="1">
						<div class="input-group-prepend ">
							<select class="custom-select" name="type" style="height: 38px;">
								<option selected="${pageRequestDTO.type == null}">== 선택
									==</option>
								<option value="t" selected="${pageRequestDTO.type == 't'}">
									제목</option>
								<option value="c" selected="${pageRequestDTO.type == 'c'}">
									내용</option>
								<option value="w" selected="${pageRequestDTO.type == 'w'}">
									작성자</option>
								<option value="tc" selected="${pageRequestDTO.type == 'tc'}">
									제목+내용</option>
								<option value="tcw" selected="${pageRequestDTO.type == 'tcw'}">
									제목+내용+작성자</option>
							</select>
						</div>

						<input class="form-control" name="keyword"
							value="${pageRequestDTO.keyword}"
							style="margin: 0px 12px 0px 0px;" placeholder="검색">


						<div class="input-group-append" id="button-addon4">
							<button class="btn btn-outline-secondary btn-search"
								type="button">
								<i class="fa fa-search"></i>검색
							</button>
							<button class="btn btn-outline-secondary btn-clear" type="button">
								clear</button>
						</div>
					</div>

				</div>
			</div>

		</div>
	</div>


	<div class="row">
		<br> <br>
	</div>



<script type="text/javascript">
$(document).ready(function(){
	
	
	// 글쓰기 버튼 클릭이벤트 
	$("#btn_register").on("click", function(){
		self.location = "/board/community_register";
	});
	
	
	// Page 306 페이지 번호 이벤트 처리 
	var actionForm = $("#actionForm");

	$(".page-item a").on("click",function(e) {
				e.preventDefault();
				console.log('click');
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
	});
	
	$(".move").on("click", function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action", "/board/community_get");
		actionForm.submit();
	});
	
	
	
});

</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"  %>