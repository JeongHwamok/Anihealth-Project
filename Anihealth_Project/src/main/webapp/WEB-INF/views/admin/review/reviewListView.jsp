<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANIHEALTH</title>
<style>
	.outer {
		width: 100%;
        text-align: center;
        padding-top: 100px;
        padding-bottom: 80px;
	}
	
	#list-area {
		width: 60%;
        margin: 0 auto; 
        /* 부모 요소의 가운데 정렬을 위해 auto 마진 추가 */
        text-align: center;
        border-radius: 15px;
        padding : 10px;
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

	/* 페이징버튼 영역 시작 */
    .paging-btns button {
       border: none;
       background-color: #f0f0f0; 
       color: #202020; 
       padding: 10px 15px; 
       margin: 0 5px; 
       cursor: pointer;
       border-radius: 10px; 
       margin-right: 15px;
       border: 1px solid  rgb(82, 166, 121);
   }

   .paging-btns button:hover {
       background-color:  rgb(198, 228, 212);
   }

   .paging-area button.active {
       background-color: rgb(198, 228, 212);
       color: #202020; 
       cursor: default;
   }

   .paging-area button.active:hover {
       background-color:(198, 228, 212);
       color: #202020; 
   }

   .paging-btns>button {
       background-color:rgb(249, 246, 246);
   }

   .paging-area {
       text-align: center;
       display: flex;
       justify-content: center; 
       align-items: center;
       margin-top: 60px; 
   }

   .paging-btns {
       display: flex;
       justify-content: center; /* 페이지 버튼을 가운데 정렬 */
   }

   .paging-btns button{
       font-size: 105%;
       font-weight: 600;
   }
   /* 페이징버튼 끌 */
   
   /* 버튼 영역 시작 */
   .btn {
   	   padding-top : 0px;
   }
   
    .btns a {
       border: none;
       background-color: #f0f0f0; 
       color: #202020; 
       padding: 5px 15px; 
       margin: 0 5px; 
       cursor: pointer;
       border-radius: 10px; 
       border: 1px solid  rgb(82, 166, 121);
       font-size: 15px;
   }

   .btns a:hover {
       background-color:  rgb(198, 228, 212);
   }
   /* 버튼 영역 끝 */
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	
	<div class="outer">
		
		<div class="header-product">
            <h1>REVIEW</h1>
        </div>
        
        <c:forEach var="r" items="${ requestScope.list }">
	        <div id="list-area" style="border : 1px solid gray;">
	        	<table class="table" id="detail-area-content">
	 				<tr>
	 					<th>후기 번호</th>
	 					<td>${ r.reviewNo }</td>
	 					<th>회원 번호</th>
	 					<td>${ r.userNo }</td>	
	 					<th>회원 닉네임</th>
	 					<td>${ r.userNick }</td>
	 					<th class="centerTh">공개 여부</th>
	 					<td>${ r.reviewStatus }</td>			
	 				</tr>
	 				<tr>
	 					<th>주문상품번호</th>
	 					<td>${ r.orderProductNo }</td>
	 					<th>작성일</th>
	 					<td>${ r.reviewDate }</td>
	 					<th>별점</th>
	 					<td>${ r.rating }</td>
	 					<th>삭제 / 복구</th>
	 					<td class="btns" height="30px">
	 						<c:choose>
	 							<c:when test="${ r.reviewStatus eq 'Y' }">
		 							<a class="btn btn-lg" onclick="deleteAlert(${ r.reviewNo });">삭제</a>
		 						</c:when>
		 						<c:otherwise>
		 							<a class="btn btn-lg" onclick="recoverAlert(${ r.reviewNo });">복구</a>
		 						</c:otherwise>
						    </c:choose>
						    <form id="postForm" action="" method="post">
					        	<input type="hidden" name="reviewNo" value="${ r.reviewNo }" >
					       	</form>
	 					</td>
	 				</tr>
	 				<tr>
	 					<th>후기 제목</th>
	 					<td colspan="3" align="left">${ r.reviewTitle }</td>
	 					<th>상품명</th>
	 					<td colspan="3">${ r.productName }</td>
	 				</tr>
	 				<tr>
	 					<th>후기 내용</th>
	 					<td colspan="3" align="left">${ r.reviewContent }</td>
	 					<th>후기 사진</th>
	 					<td colspan="3">
	 						<img src="${ r.reviewFilePath }" width="80%" height="200px">
	 					</td>
	 				</tr>
	        	</table>
	        </div> <br><br>
        </c:forEach> 
        
        <!-- 페이징바가 보여질 부분 -->
        <div align="center" class="paging-area">
           <div class="paging-btns">
           
            <c:choose>
                <c:when test="${ requestScope.pi.currentPage eq 1 }">
                    <button onclick="" class="disabled">&lt;</button>
                </c:when>
                <c:otherwise>
                    <button onclick="location.href='review.ad?cpage=${ requestScope.pi.currentPage - 1 }'">&lt;</button>
                </c:otherwise>
            </c:choose>
            
            <c:forEach var="p" begin="${ requestScope.pi.startPage }" 
                           end="${ requestScope.pi.endPage }" step="1">
                <c:choose>
                    <c:when test="${ requestScope.pi.currentPage ne p }">
                        <button onclick="location.href='review.ad?cpage=${ p }'">${ p }</button>
                    </c:when>
                    <c:otherwise>
                        <button class="page-item active">${ p }</button>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            
            <c:choose>
                <c:when test="${ requestScope.pi.currentPage eq requestScope.pi.maxPage }">
                    <button onclick="" class="disabled">&gt;</button>
                </c:when>
                <c:otherwise>
                    <button onclick="location.href='review.ad?cpage=${ requestScope.pi.currentPage + 1 }'">&gt;</button>
                </c:otherwise>
            </c:choose>
            
            </div>
        </div>
        
	</div>
	
	<script>
	   	function deleteAlert(reviewNo) {
	   		
	   		$("input[name=reviewNo]").val(reviewNo);
	   		
	   		if (window.confirm('리뷰를 삭제하시겠습니까?')) {
	   			$("#postForm").attr("action", "deleteReview.ad").submit();
	   		}
	   		
	   	}
	   	
		function recoverAlert(reviewNo) {
			
			$("input[name=reviewNo]").val(reviewNo);
	   		
	   		if (window.confirm('리뷰를 복구하시겠습니까?')) {
	   			$("#postForm").attr("action", "recoverReview.ad").submit();
	   		}
	   		
	   	}
	</script>

</body>
</html>