<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
		margin-right : 30px;
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
            <h1>PRODUCT MODIFICATION</h1>
        </div>
        	
        <form id="postForm" action="updateProduct" method="post" enctype="multipart/form-data">
        
        	<input type="hidden" name="productThumbnailPath" value="${ requestScope.p.productThumbnailPath }" >
       		<input type="hidden" name="productDetailPath" value="${ requestScope.p.productDetailPath }" >
       		<input type="hidden" name="productNo" value="${ requestScope.p.productNo }" >
        
	        <div class="detail-area">
		        <table id="detail-area-content" class="table">
		        	<thead>
			        	<tr>
			        		<th width="150px">상품번호</th>
			        		<td width="800px">${ requestScope.p.productNo }</td>
			        		<th width="150px" class="area-middle">카테고리</th>
			        		<td width="250px" class="area-middle">
			        			<select class="form-control col-sm-9" name="category" id="categorySelect">
			        				<option>공통</option>
			        				<option>강아지</option>
			        				<option>고양이</option>
			        			</select>
			        		</td>
			        	</tr>
			        	<tr>
			        		<th>상품명</th>
			        		<td colspan="3">
			        			<input type="text" class="form-control col-sm-5" name="productName" value="${ requestScope.p.productName }" required>
			        		</td>
			        	</tr>
			        	<tr>
			        		<th>상품재고</th>
			        		<td colspan="3">
			        			<input type="number" class="form-control col-sm-3" name="productStock" value="${ requestScope.p.productStock }" required> &nbsp;개
			        		</td>
			        	</tr>
			        	<tr>
			        		<th>가격</th>
			        		<td>
			        			<input type="number" class="form-control col-3" name="price" value="${ requestScope.p.price }" required> &nbsp;원
			        		</td>
			        		<th class="area-middle">공개여부</th>
			        		<td class="area-middle" style="padding-top : 20px;">${ requestScope.p.productStatus }</td>
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
			        		<th width="300px">대표이미지</th>
			        		<td colspan="4">
								<img src="${ requestScope.p.productThumbnailPath }" name="thumbnail" id="thumbnail"  width="90%" required>
			        		</td>
			        	</tr>
			        	<tr>
			        		<th>상세이미지</th>
			        		<td colspan="4">
			        			<img src="${ requestScope.p.productDetailPath }" name="detail" id="detail" width="90%" required>
			        		</td>
			        	</tr>
		        	</tbody>
		        </table>
		        
		        
		        <div id="file-area" style="display : none">
		        	<input type="file" name="upfiles" id="productThumbnailPath" onchange="loadImg(this, 0);">
		        	<input type="file" name="upfiles" id="productDetailPath" onchange="loadImg(this, 1);" >
		        </div>
		        
	        </div>
        </form>
        <div class="btns" align="center">
        	<a class="btn btn-lg" onclick="postFormSubmit();">수정</a>
        	<a class="btn btn-lg" href="product.ad">목록</a>
        	<c:choose>
        		<c:when test="${ requestScope.p.productStatus eq 'Y' }">
        			<a class="btn btn-lg" onclick="deleteAlert();">삭제</a>
        		</c:when>
        		<c:otherwise>
        			<a class="btn btn-lg" onclick="recoverAlert();">복구</a>
        		</c:otherwise>
        	</c:choose>
        </div>
        
       <script>
	     // postMapping 으로 요청
	        function postFormSubmit() {
	            // Check if at least one checkbox is selected in the "효능" section
	            if ($('.effect input:checked').length === 0) {
	                alert('효능 중 최소한 하나를 선택해야 합니다.');
	                return false;
	            }
	
	            // Check if both images are present
	            if ($('#thumbnail').attr('src') === "" || $('#detail').attr('src') === "") {
	                alert('대표이미지와 상세이미지를 모두 선택해야 합니다.');
	                return false;
	            }
	            
	            $("#postForm").attr("action", "updateProduct.ad").submit();
	            
	        }
	        	
	        	// 삭제 클릭 시 alert 로 한번 더 확인
	        	function deleteAlert() {
	        		
	        		if (window.confirm('제품을 삭제하시겠습니까?')) {
	        			$("#postForm").attr("action", "deleteProduct.ad").submit();
	        		}
	        		
	        	}
	        	
	        	// 복구 클릭 시 alert 로 한번 더 확인
	        	function recoverAlert() {
	        		
	        		if (window.confirm('제품을 복구하시겠습니까?')) {
	        			$("#postForm").attr("action", "recoverProduct.ad").submit();
	        		}
	        		
	        	}
	        	
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
	        		
	        		console.log(num);
	        		
	        		if(inputFile.files.length == 1) {
	
						let reader = new FileReader(); // 생성자함수
	
						reader.readAsDataURL(inputFile.files[0]);
	
						reader.onload = function(e) {
							
							switch(num){
								case 0 : $("#thumbnail").attr("src",e.target.result); break;
								case 1 : $("#detail").attr("src",e.target.result); break;
							}
						};
	
					} else { 
						
						switch(num){
							case 0 : $("#thumbnail").attr("src","https://i.ibb.co/fvw1Zv9/image.jpg"); break;
							case 1 : $("#detail").attr("src","https://i.ibb.co/fvw1Zv9/image.jpg"); break;
						}
					}
	        	}
	        	
	        	// 조회된 효능 체크박스 표시
	        	$(function() {
	        		
		            var effects = [];
		            
		            <c:forEach var="effect" items="${requestScope.e}">
		                effects.push(${effect.effectNo});
		            </c:forEach>
		
		            // 반복문을 사용하여 체크박스를 체크
		            for (var i = 0; i < effects.length; i++) {
		            	
		                $(".effect input[value='" + effects[i] + "']").attr("checked", true);
		                
		            }
		            
					var sideEffects = [];	
			            
		            <c:forEach var="sideEffect" items="${requestScope.se}">
		            	sideEffects.push(${sideEffect.effectNo});
		            </c:forEach>
		
		            // 반복문을 사용하여 체크박스를 체크
		            for (var i = 0; i < sideEffects.length; i++) {
		            	
		                $(".sideEffect input[value='" + sideEffects[i] + "']").attr("checked", true);
		                
		            }
	       		})
	        	
	        	// 조회된 카테고리 표시
	        	$(function() {
	        		
	        		var selectElement = document.getElementById('categorySelect');
	                selectElement.value = '${ requestScope.p.category }';
	        		
	        	})
	        </script>
        
	</div>

</body>
</html>