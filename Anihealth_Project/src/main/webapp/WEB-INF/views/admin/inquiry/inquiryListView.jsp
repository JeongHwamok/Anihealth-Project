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
        text-align: center;
        padding-top: 100px;
        padding-bottom: 80px;
	}
	
	#list-area {
		width: 60%;
        margin: 0 auto; 
        /* 부모 요소의 가운데 정렬을 위해 auto 마진 추가 */
        text-align: center;
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
       margin-right: 6%;
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
   
   #list-area th {
    	padding : 20px 10px;
    }
    
    #list-area tbody tr:hover {
    	background-color : #f1f7ee;
    }
</style>
</head>
<body>
	
	<jsp:include page="../../common/header.jsp" />
	
	<div class="outer">
		
		<div class="header-product">
            <h1>1 : 1 INQUIRY</h1>
        </div>
        
        <div>
        	<table class="table table-hover" id="list-area">
        		<thead>
        			<tr>
        				<th>문의 번호</th>
        				<th>문의 제목</th>
        				<th>문의 작성자</th>
        				<th>문의 상태</th>
        				<th>문의 작성일</th>
        				<th>답변 상태</th>
        			</tr>
        		</thead>
        		<tbody>
        			<c:forEach var="iq" items="${ requestScope.list }">
        				<tr>
        					<td>${ iq.inquiryNo }</td>
        					<td>${ iq.inquiryTitle }</td>
        					<td>${ iq.userId }</td>
        					<td>${ iq.inquiryStatus }</td>
        					<td>${ iq.inquiryCreate }</td>
        					<td>
        						<c:choose>
        							<c:when test="${not empty iq.inquiryAnswer}">
        								답변 완료
        							</c:when>
        							<c:otherwise>
        								답변 대기
        							</c:otherwise>
        						</c:choose>
        					</td>
        				</tr>
        			</c:forEach>
        		</tbody>
        	
        	</table>
        	
        
        </div>
        
        <!-- 페이징바가 보여질 부분 -->
        <div align="center" class="paging-area">
           <div class="paging-btns">
           
            <c:choose>
                <c:when test="${ requestScope.pi.currentPage eq 1 }">
                    <button onclick="" class="disabled">&lt;</button>
                </c:when>
                <c:otherwise>
                    <button onclick="location.href='inquiry.ad?cpage=${ requestScope.pi.currentPage - 1 }'">&lt;</button>
                </c:otherwise>
            </c:choose>
            
            <c:forEach var="p" begin="${ requestScope.pi.startPage }" 
                           end="${ requestScope.pi.endPage }" step="1">
                <c:choose>
                    <c:when test="${ requestScope.pi.currentPage ne p }">
                        <button onclick="location.href='inquiry.ad?cpage=${ p }'">${ p }</button>
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
                    <button onclick="location.href='inquiry.ad?cpage=${ requestScope.pi.currentPage + 1 }'">&gt;</button>
                </c:otherwise>
            </c:choose>
            
           </div>
       </div>
       
       <script>
       // 상세조회 function
       $(function() {
         		
		$("#list-area>tbody>tr").click(function() {
				
			let inquiryNo = $(this).children().eq(0).text();
			
			location.href="detailInquiry.ad?ino=" + inquiryNo;
				
		});            		
          	
       });
       </script>
		
	</div>

</body>
</html>