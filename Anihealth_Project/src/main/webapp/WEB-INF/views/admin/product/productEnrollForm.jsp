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
	
	#detail-area-content, #detail-area-img  {
		width: 55%;
        margin: 0 auto; 
        /* 부모 요소의 가운데 정렬을 위해 auto 마진 추가 */
	}
	
	#detail-area-content th {
		text-align: center;
		padding-bottom : 18px;	
	}
	
	#detail-area-img img {
		display: block;
  		margin: 0 auto;
	}
	
	.effect-area label {
		margin-right : 50px;
	} 
	
	.effect-area input {
		margin-right : 5px;
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
    
    #detail-area-content input {
    	display : inline-block;
    }
    
    /* 버튼 영역 시작 */
    .btns a {
       border: none;
       background-color: #f0f0f0; 
       color: #202020; 
       padding: 10px 25px; 
       margin: 0 5px; 
       cursor: pointer;
       border-radius: 10px; 
       margin-right: 15px;
       border: 1px solid  rgb(82, 166, 121);
    }

    .btns a:hover {
       background-color:  rgb(198, 228, 212);
    }
   
	.btns button {
       border: none;
       background-color: #f0f0f0; 
       color: #202020; 
       padding: 10px 25px; 
       margin: 0 5px; 
       cursor: pointer;
       border-radius: 10px; 
       margin-right: 15px;
       border: 1px solid  rgb(82, 166, 121);
   }

   .btns button:hover {
       background-color:  rgb(198, 228, 212);
   }
   /* 버튼 영역 끝 */
</style>
</head>
<body>
	
	<jsp:include page="../../common/header.jsp" />
	
		<div class="outer">
	
		<div class="header-product">
            <h1>PRODUCT DETAIL</h1>
        </div>
        
        <form id="postForm" action="insertProduct.ad" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
	        <div class="detail-area">
		        <table id="detail-area-content" class="table">
		        	<thead>
			        	<tr>
			        		<th width="200px">카테고리</th>
			        		<td width="800px">
			        			<select class="form-control col-sm-3" name="category">
			        				<option>공통</option>
			        				<option>강아지</option>
			        				<option>고양이</option>
			        			</select>
			        		</td>
			        		<th width="150px">상품재고</th>
			        		<td width="250px">
			        			<input type="number" class="form-control col-sm-9" name="productStock" required> &nbsp;개
			        		</td>
			        	</tr>
			        	<tr>
			        		<th>상품명</th>
			        		<td colspan="3">
			        			<input type="text" class="form-control col-sm-9" name="productName" required>
			        		</td>
			        	</tr>
			        	<tr>
			        		<th>가격</th>
			        		<td colspan="3">
			        			<input type="number" class="form-control col-2" name="price" required> &nbsp;원
			        		</td>
			        	</tr>
			        	<tr class="effect-area effect">
			        		<th>효능</th>
			        		<td colspan="3">
			        			<input type="checkbox" name="effect" value="1" id="skin" class="form-check-inline">
			        			<label for="skin">피부</label>
			        			<input type="checkbox" name="effect" value="2" id="teeth" class="form-check-inline">
			        			<label for="teeth">치아</label>
			        			<input type="checkbox" name="effect" value="3" id="eye" class="form-check-inline">
			        			<label for="eye">눈</label>
			        			<input type="checkbox" name="effect" value="4" id="bone" class="form-check-inline">
			        			<label for="bone">뼈/관절</label>
			        			<input type="checkbox" name="effect" value="5" id="heart" class="form-check-inline">
			        			<label for="heart">심장</label>
			        			<input type="checkbox" name="effect" value="6" id="immunity" class="form-check-inline">
			        			<label for="immunity">면역력</label>
			        			<input type="checkbox" name="effect" value="7" id="stomach" class="form-check-inline">
			        			<label for="stomach">위/장</label>
			        			<input type="checkbox" name="effect" value="8" id="kidney" class="form-check-inline">
			        			<label for="kidney">신장/방광</label>
			        		</td>
		        		</tr>
		        		<tr class="effect-area sideEffect">
		        			<th>부작용</th>
			        		<td colspan="3">
			        			<input type="checkbox" name="sideEffect" value="1" id="side-skin" class="form-check-inline">
			        			<label for="side-skin">피부</label>
			        			<input type="checkbox" name="sideEffect" value="2" id="side-teeth" class="form-check-inline">
			        			<label for="side-teeth">치아</label>
			        			<input type="checkbox" name="sideEffect" value="3" id="side-eye" class="form-check-inline">
			        			<label for="side-eye">눈</label>
			        			<input type="checkbox" name="sideEffect" value="4" id="side-bone" class="form-check-inline">
			        			<label for="side-bone">뼈/관절</label>
			        			<input type="checkbox" name="sideEffect" value="5" id="side-heart" class="form-check-inline">
			        			<label for="side-heart">심장</label>
			        			<input type="checkbox" name="sideEffect" value="6" id="side-immunity" class="form-check-inline">
			        			<label for="side-immunity">면역력</label>
			        			<input type="checkbox" name="sideEffect" value="7" id="side-stomach" class="form-check-inline">
			        			<label for="side-stomach">위/장</label>
			        			<input type="checkbox" name="sideEffect" value="8" id="side-kidney" class="form-check-inline">
			        			<label for="side-kidney">신장/방광</label>
			        		</td>
		        		</tr>
			        </thead>
			        <tbody id="detail-area-img">
			        	<tr>
			        		<th width="200px">대표이미지</th>
			        		<td colspan="4">
								<img name="thumbnail" id="thumbnail" width="700px" height="400px" src="resources/rimg/noImage4.png">
			        		</td>
			        	</tr>
			        	<tr>
			        		<th>상세이미지</th>
			        		<td colspan="4">
			        			<img name="detail" id="detail" width="700px" height="400px" src="resources/rimg/noImage4.png">
			        		</td>
			        	</tr>
		        	</tbody>
		        </table>
		        
		        <div id="file-area" style="display : none">
		        	<input type="file" name="upfiles" id="productThumbnailPath" onchange="loadImg(this, 0);">
		        	<input type="file" name="upfiles" id="productDetailPath" onchange="loadImg(this, 1);">
		        </div>
	        </div>
	        
	        <br><br><br>
	        
	        <div class="btns" align="center">
	        	<button class="btn btn-lg" type="submit">등록</button>
	        	<button class="btn btn-lg" type="reset">초기화</button>
	        	<a class="btn btn-lg" href="product.ad">목록</a>
	        </div>
        </form>
        
        <script>
        	// 썸네일 이미지 태그 클릭시
        	$(document).on("click", "#thumbnail", function() {
        		var index = 0;
        		$("#file-area>input").eq(index).click();
        	});
        	
        	// 상세 이미지 태그 클릭시
			$(document).on("click", "#detail", function() {
        		var index = 1;
        		$("#file-area>input").eq(index).click();
        	});
        	
        	// 이미지 화면 업로드
        	function loadImg(inputFile, num) {
        		if(inputFile.files.length == 1) {
					let reader = new FileReader();
					reader.readAsDataURL(inputFile.files[0]);
					reader.onload = function(e) {
						switch(num){
							case 0 : $("#thumbnail").attr("src",e.target.result); break;
							case 1 : $("#detail").attr("src",e.target.result); break;
						}
					};
				} else { 
					switch(num){
						case 0 : $("#thumbnail").attr("src","resources/rimg/noImage4.png"); break;
						case 1 : $("#detail").attr("src","resources/rimg/noImage4.png"); break;
					}
				}
        	}
        	
        	// 필수요소  효능과 대표이미지, 상세이미지 입력유도
        	function validateForm() {
	            if ($('.effect input:checked').length === 0) {
	                alert('효능 중 최소한 하나를 선택해야 합니다.');
	                return false;
	            }

	            if ($('#thumbnail').attr('src') === "" || $('#thumbnail').attr('src') === "resources/rimg/noImage4.png" || $('#detail').attr('src') === "" || $('#detail').attr('src') === "resources/rimg/noImage4.png") {
	                alert('대표이미지와 상세이미지를 모두 선택해야 합니다.');
	                return false;
	            }

	            return true;
        	}
        </script>
	</div>

</body>
</html>