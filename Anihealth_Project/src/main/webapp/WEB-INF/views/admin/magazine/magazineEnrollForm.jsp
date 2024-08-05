<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANIHEALTH</title>
<style>
	.outer {
		width: 100%;
        /* text-align: center; */
        padding-top: 100px;
        padding-bottom: 150px;
	}
	
	.gray-line {
        border-bottom: 2px solid lightgray;
    }
    
     .detail-area {
        width: 70%;
        margin: 0 auto;
    }
    
    /* 제목 영역 시작 */
 	.header-product {
        margin-left: auto;
        margin-right: auto;
        margin-bottom: 50px;   
    }

    .header-product h1 {
        color: #57585c;
        text-align: center;
    }
    /* 제목 영역 끝 */
    
    #magazineTitle {
		height : 50px;
		padding : 10px;
		margin: 0 30px;
    }
    
    #magazineContent img {
    	width: 30em;
        height: 450px; 
        display: block;
        margin: 0 auto;
    }
    
    /* 버튼 영역 시작 */
    .btns button {
        font-size: 120%;
        font-weight: bold;
        cursor: pointer; 
        border: 3px solid rgb(82, 166, 121);
        color: rgb(83, 88, 88);
        font-weight: 600;
        margin-top: 40px;
        margin : 0 10px;
    }
    
    .btns a {
        font-size: 120%;
        font-weight: bold;
        cursor: pointer; 
        border: 3px solid rgb(82, 166, 121);
        color: rgb(83, 88, 88);
        font-weight: 600;
        margin-top: 40px;
        margin : 0 10px;
    }
   /* 버튼 영역 끝 */
</style>
</head>
<body>
	
	<jsp:include page="../../common/header.jsp" />
	
	<div class="outer">
		
		<div class="header-product">
            <h1>MAGAZINE ENROLL</h1>
        </div>
        
        <form id="postForm" action="insertMaga.ad" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
        	<div class="detail-area">
        		<div class="gray-line"></div>
	            <br>
	            <table align="center">
	            	<tr>
	            		<th style="font-size : 25px;">제목</th>
	            		<td width="600px"><input type="text" class="form-control col-lg" name="magazineTitle" id="magazineTitle" required></td>
	            	</tr>
	            </table>
	            <br>
	            <div class="gray-line"></div>
	            
	            <br>
	            
	            <div align="center" class="btns">
	            	<button type="button" class="btn" id="addContent">내용 추가</button>
	            	<button type="button" class="btn" id="deleteContent">내용 삭제</button>
	            </div>
	            
	            <br>
	            
	            <table id="magazineContent" class="table">
	            	<tr>
	            		<th>
	            			썸네일이미지 <br> <p style="font-size : 0.9em; color : red;">* 필수</p>
	            		</th>
	            		<td>
	            			<img name="thumbnail" class="imgContent" id="thumbnail" src="resources/rimg/noImage4.png">
	            		</td>
	            		<td>
	            			<div id="editor"></div>
	            			<textarea name="magazineContent" class="form-control content" cols="60" rows="18" style="resize: none;" required></textarea>
	            		</td>
	            	</tr>
	            </table>
	            
        	</div>
        	
        	<div id="file-area" style="display : none;">
	        	<input type="file" name="files" onchange="loadImg(this, 0);" required>
	        </div>
	        
	        <div class="btns" align="center">
	        	<button class="btn btn-lg" type="submit">등록하기</button>
	        	<a class="btn btn-lg" href="magazine.ad">목록으로</a>
	        	<button class="btn btn-lg" type="reset">초기화</button>
	        </div>
	        
        </form>
        
        <script>
        	// 매거진 내용 영역 추가 및 삭제
        	let fileCount = 0;
        	
			$("#addContent").click(function() {
				
				fileCount++;
				
				let str1 = "<tr>" 
						+ 	"<th>상세이미지" + fileCount + "</th>"
						+ 	"<td><img name='detail' class='detail imgContent' src='resources/rimg/noImage4.png'></td>"
						+ 	"<td><textarea name='magazineContent' class='form-control content' cols='60' rows='18' style='resize: none;' required></textarea></td>"
						+ "</tr>"
					
				$("#magazineContent").append(str1);
						
				let str2 = "<input type='file' name='files' onchange='loadImg(this, " + fileCount + ")'>"
				
				$("#file-area").append(str2);
				
			});        	
			
			$("#deleteContent").click(function() {
				
				if(fileCount != 0) {
					
					$("#magazineContent tr").eq(fileCount).remove();
					$("#file-area input").eq(fileCount).remove();
					fileCount--;
					
				}
				
			});
		</script>	
		<script>
	     	// 썸네일 이미지 태그 클릭시
	    	$(document).on("click", "#thumbnail", function() {
	    		var index = 0;
	    		$("#file-area>input").eq(index).click();
	    	});
	     	
	    	// 상세 이미지 태그 클릭시
			$(document).on("click", ".detail", function() {
	       		var index = $(".detail").index(this) + 1;
	       		$("#file-area>input").eq(index).click();
	       	});
	    	
	    	// 이미지 화면 업로드 
	    	function loadImg(inputFile, num) {
	    		
	    		if(inputFile.files.length == 1) {
	    			
	    			let reader = new FileReader();
	    			reader.readAsDataURL(inputFile.files[0]);
	    			reader.onload = function(e) {
	    				
	    				$(".imgContent").eq(num).attr("src", e.target.result);
	    				
	    			}
	    			
	    		} else { 
	
					$(".imgContent").eq(num).attr("src", "resources/rimg/noImage4.png");
					
				}
	    		
	    	}
	    	
	    	// 썸네일 이미지 유효성 검사
	    	function validateForm() {
	    		
	            var thumbnailSrc = $("#thumbnail").attr('src');
	            
	            if (thumbnailSrc === "" || thumbnailSrc === "resources/rimg/noImage4.png") {
	            	
	                alert('대표이미지를 선택해야 합니다.');
	                return false;
	                
	            }
	            return true;
	        }
		</script>	
	</div>

</body>
</html>