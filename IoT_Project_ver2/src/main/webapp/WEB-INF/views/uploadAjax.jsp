<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"  %>
	
<style>
	.uploadResult{
		width:100%;
		/* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#ffffff+0,e5e5e5+100;White+3D */
		background: rgb(255,255,255); /* Old browsers */
		background: -moz-linear-gradient(top,  rgba(255,255,255,1) 0%, rgba(229,229,229,1) 100%); /* FF3.6-15 */
		background: -webkit-linear-gradient(top,  rgba(255,255,255,1) 0%,rgba(229,229,229,1) 100%); /* Chrome10-25,Safari5.1-6 */
		background: linear-gradient(to bottom,  rgba(255,255,255,1) 0%,rgba(229,229,229,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#e5e5e5',GradientType=0 ); /* IE6-9 */

	}
	.uploadResult ul{
		display:flex;
		flex-flow:row;
		justify-content:start;
		align-items:stretch;
	}
	.uploadResult ul li{
		list-style:none;
		padding:10px;
	}
	.uploadResult ul li img{
		width:200px;
	}
	.iploadResult ul li span{
		color:white;
	}
	
	.bigPictureWrapper{
		position:absolute;
		display:none;
		justify-content:center;
		align-items:center;
		top:0%;
		width:100%;
		height:100%;
		background-color:gray;
		z-index:100;
		background:rgba(255,255,255,0.5);
	}
	.bigPicture{
		position:relative;
		display:flex;
		justify-content:center;
		align-items:center;
	}
	.bigPicture img{
		width:600px;
	}
	
</style>

	

	
	
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header with-border ">
				<h5 class="card-title" style="margin-top:10px; margin-bottom:10px;">
					<i class="fas fa-folder-open"></i>&nbsp;첨부파일
				</h5>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="uploadResult" id="uploadResult">
						<ul>
						
						</ul>
					</div>
				
					<div class="uploadDiv">
						<input type="file" name="uploadFile" multiple>
					</div>
				</div>
				<button class="btn btn-info btn_upload">업로드</button>
			</div>

		</div>
	</div>
		

	<script
	  src="https://code.jquery.com/jquery-3.6.0.js"
 	 integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	  crossorigin="anonymous">
	</script>
	
	<script>
		$(document).ready(function(){
			
			//<input type="file"> 초기화
			var cloneObj = $(".uploadDiv").clone();
			
			$(".btn_upload").on("click", function(){
				
				var formData = new FormData();
				
				var inputFile = $("input[name='uploadFile']");
				
				var files = inputFile[0].files;
				
				console.log(files);
				
				for (var i=0; i < files.length; i++){
					
					if(!checkFile(files[i].name, files[i].size)){
						return false;
					}
					
					formData.append("uploadFile", files[i]);
				}
				
				$.ajax({
					url : "/uploadAjaxAction",
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result){
						console.log("RESULT : " + result);
						showUploadFile(result);
						$(".uploadDiv").html(cloneObj.html());
						alert("업로드 성공");
					}
				});
				
			});
			
			
			
			//파일의 확장자와 사이즈 처리
			var reg = new RegExp("(.*?)\.(exe|sh|zip|alz)");
			var maxSize = 5242880;
			
			function checkFile(fileName, fileSize){
				
				if(fileSize >= maxSize){
					alert("파일사이즈 초과! 최대용량은 5MB로 설정되어있습니다.");
					return false;
				}
				
				if(reg.test(fileName)){
					alert("해당 확장자의 파일은 업로드 할 수 없습니다.");
					return false;
				}
				return true;
			}
			
			
			// 첨부파일 이름 출력
			var uploadResult = $(".uploadResult ul");
			
			function showUploadFile(uploadResultArr){
				
				var str="";
				
				$(uploadResultArr).each(function(i, obj){
					
					if(!obj.image){
						var fileCallPath = encodeURIComponent( obj.uploadPath + "/" + obj.uuid.substring(0, 6) + "_" + obj.fileName);
						var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
						
						
						console.log("fileCallPath : " + fileCallPath);
						console.log("fileLink : " + fileLink);
						console.log(obj.fileName);
						
						str += "<li><div>"+
									"<a href='/download?fileName="+fileCallPath+"'>"+
									"<i class='far fa-file-alt'></i>" + obj.fileName + "</a>"+
									"<span data-type='file' data-file=\'"+fileCallPath+"\'>X</span>"+
								  "</div></li>";		
					}
					else{
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid.substring(0, 6) + "_" + obj.fileName);
						var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
						originPath = originPath.replace(new RegExp(/\\/g),"/");			
						
						console.log("originPath : " + originPath);
						console.log("fileCallPath : " + fileCallPath);
						console.log(obj.fileName);
						
						
						str += "<li>"+
									"<a href=\"javascript:showImage(\'" +originPath+ "\')\">"+
									"<img src='/display?fileName="+fileCallPath+"'></a>"+
									"<span data-type='image' data-file=\'"+fileCallPath+"\'>X</span>"+
								   "</li>";
					}
				});
				
				uploadResult.append(str);
			}
			
			
			
		});
		
	
	</script>


</body>
</html>