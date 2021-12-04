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
				<i class="fas fa-comments"></i>공지사항 - 게시글 조회
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
				<textarea class="form-control" rows="12" name='content' readonly><c:out value='${board.content}'  /></textarea>
			</div>

			

			<div class="row " style="margin-top: 10px; margin-bottom: 10px;">
				<div class="col" align="right">
					<button type="button" class="btn btn-outline-primary btn_list">목록</button>
					<button type="button" class="btn btn-outline-primary btn_modify">수정</button>
					<button type="button" class="btn btn-outline-danger btn_remove">삭제</button>
				</div>
			</div>
			
			<!-- Page 264 조회페이지에서 <form>처리 -->
			<form id='actionForm' action="/board/notice/list" method='get'>
				<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno }"/>'>	
			</form>
			
			<form id='modifyForm' action="/board/notice/modify" method='get'>
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
			actionForm.append("<input type='hidden' name='type' value='notice'>");
			actionForm.attr("action", "/board/notice/list").submit();
		});
		
		$(".btn_modify").on("click", function(e){
			actionForm.append("<input type='hidden' name='type' value='qna'>");
			actionForm.attr("action", "/board/notice/modify").submit();
		});
		
		$(".btn_remove").on("click", function(e){
			var del = confirm("정말 삭제하시겠습니까?")
			if(del == true){
				actionForm.append("<input type='hidden' name='type' value='qna'>");
				actionForm.attr("action", "/board/notice/remove").attr("method", "post").submit();
			}
			else return;
		});
		


	});
</script>


<!-- Page 415 댓글 이벤트 처리 -->
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
	$(document).ready(function(){
		
		var bnoValue = '<c:out value="${board.bno}"/>';
		var replyUL = $(".chat");
		
		showList(1);	
			
		function showList(page){
			replyService.getList({bno : bnoValue, page : page || 1 }, function(replyCnt, list){
				
				console.log("댓글 수 : " + replyCnt);
				console.log("목록 : " + list);
				console.log(list);
				
				if(page == -1){
					pageNum = Math.ceil(replyCnt/10.0);
					showList(pageNum);
					return;
				}
				
				var str = "";
					if(list == null || list.length == 0){
						replyUL.html("");
						return;
					}
					
					for (var i=0, len=list.length || 0; i<len; i++){
						str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
						str += "		<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
						str += "			<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
						str += "		<p>"+list[i].reply+"</p></div></li>";
						
						console.log("list . reply = " + list[i].reply);
					}
					
					replyUL.html(str);
					
					showReplyPage(replyCnt);
				
				});
			}
		
		// Page 421 새로운 댓글의 추가 버튼 이벤트 처리
		var modal = $(".modal");
		var modalInputReply = modal.find("input[name='reply']");
		var modalInputReplyer = modal.find("input[name='replyer']");
		var modalInputReplyDate = modal.find("input[name='replyDate']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		
		// 댓글 작성 버튼 클릭
		$("#addReplyBtn").on("click", function(e){
			modal.find("input").val("");
			modalInputReplyDate.closest("div").hide();				// 작성일 입력폼 hide
			modal.find("button[id!='modalCloseBtn']").hide();		// 닫기버튼 제외 hide
			
			modalRegisterBtn.show();
			
			$(".modal").modal("show");
		});
		
		// 등록 버튼 클릭
		modalRegisterBtn.on("click", function(e){
			var reply = {
					reply : modalInputReply.val(),
					replyer : modalInputReplyer.val(),
					bno : bnoValue
			};
			
			replyService.add(reply, function(result){
				alert("등록  " + result);
				modal.find("input").val("");
				modal.modal("hide");
				showList(-1);
			});
			
		});
		
		
		// Page 424 특정 댓글의 클릭 이벤트 처리
		$(".chat").on("click", "li", function(e){
			var rno = $(this).data("rno");
			replyService.get(rno, function(reply){
			
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer);
				modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
				modal.data("rno", reply.rno);
				
				modal.find("button[id!='modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				
				$(".modal").modal("show");
				
			});
		});
		
		
		// Page 426 댓글의 수정/삭제 이벤트 처리
		modalModBtn.on("click", function(e){
			var reply = {rno : modal.data("rno"), reply : modalInputReply.val(), replyer : modalInputReplyer.val()};
			replyService.update(reply, function(result){
				alert("수정 " + result);
				modal.modal("hide");
				showList(pageNum);
			});
		});
		
		modalRemoveBtn.on("click", function(e){
			var rno = modal.data("rno");
			replyService.remove(rno, function(result){
				alert("삭제 " + result);
				modal.modal("hide");
				showList(pageNum);
			});
		});
		
		
		
		// Page 440 댓글 페이징
		var pageNum = 1;
		var replyPageFooter = $(".panel-footer");
		
		function showReplyPage(replyCnt){
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= replyCnt){
				endNum = Math.ceil(replyCnt / 10.0);
			}
			
			if(endNum * 10 < replyCnt){
				next = true;
			}
			
			var str ="<ul class='pagination pull-right'>";
			
			if(prev){
				str += "<li class='page-item'><a class='page-link' href='"+(startNum - 1)+"'>이전</a></li>";
			}
			
			for (var i = startNum; i <= endNum; i++){
				var active = pageNum == i ? "active" : "";
				
				str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			}
			
			if(next){
				str += "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>다음</a></li>";
			}
			
			str += "</ul></div>";
			
			console.log(str);
			
			replyPageFooter.html(str);
		}
		
		
		// 댓글 페이지 번호 이벤트 처리
		replyPageFooter.on("click", "li a", function(e){
			e.preventDefault();
			console.log("페이지 클릭");
			var targetPageNum = $(this).attr("href");
			console.log("누른 페이지 번호 : " + targetPageNum);
			pageNum = targetPageNum;
			showList(pageNum);
		});
		
	});
	
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
