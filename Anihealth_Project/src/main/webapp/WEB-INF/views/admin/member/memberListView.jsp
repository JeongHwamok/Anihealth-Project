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
		width: 70%;
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
   
   #list-area th {
    	padding : 20px 10px;
    }
    
    #list-area tbody tr:hover {
    	background-color : #f1f7ee;
    }
    
    /* 검색 스타일 */
    .search-container {
        margin-left: auto;
        /* 오른쪽 끝으로 이동 */
        float: right;
        margin-bottom : 10px;
    }
    
    .search-container .navbar {
        display: flex;
        justify-content: flex-end;
        /* 오른쪽 정렬 */
    }

    .search-container .navbar .form-control,
    .search-container .navbar .btn {
        font-size: 110%;
        /* 글자 크기 10% 증가 */
    }
    
    .form-control{
    	 margin-left: 5px;
    }

    .sea1rch-container .navbar {
        display: flex;
        justify-content: flex-end;
        /* 오른쪽 정렬 */
    }


    #btn-search {
        border: 3px solid rgb(82, 166, 121);
        color: rgb(83, 88, 88);
        font-weight: 600;
        margin-left: 5px;
    }
      #btn-search:hover {
   	  background-color:rgb(82, 166, 121);
   	  color: white;
    }
    
    #search-area {
    	width : 70%;
    	margin: 0 auto; 
    }
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	
	<div class="outer">
		
		<div class="header-product">
            <h1>MEMBER</h1>
        </div>
        
        <div id="search-area">
        	<div class="search-container">
	            <nav class="navbar">
	                <form class="form-inline" action="member.ad" method="get">
	                    <input class="form-control" 
	                           type="text"
	                           placeholder="검색어를 입력해주세요" 
	                           name="keyword" value="${ requestScope.keyword }">
	                    <button class="btn btn-search" id="btn-search" type="submit">검색</button>
	                </form>
	            </nav>
	        </div>
        
        </div>
        
        <table class="table table-hover" id="list-area">
        	<thead>
        		<tr>
        			<th>회원번호</th>
        			<th>회원아이디</th>
        			<th>회원닉네임</th>
        			<th>가입일</th>
        			<th>활동여부</th>
        		</tr>
        	</thead>
        	<tbody>
        		<c:forEach var="m" items="${ requestScope.list }">
        			<tr>
        				<td>${ m.userNo }</td>
        				<td>${ m.userId }</td>
        				<td>${ m.userNick }</td>
        				<td>${ m.createDate }</td>
        				<td>${ m.status }</td>
        			</tr>
        		</c:forEach>
        	</tbody>
        </table>
        
        <!-- 페이징바가 보여질 부분 -->
        <div align="center" class="paging-area">
           <div class="paging-btns">
           
            <c:choose>
                <c:when test="${ requestScope.pi.currentPage eq 1 }">
                    <button onclick="" class="disabled">&lt;</button>
                </c:when>
                <c:otherwise>
                    <button onclick="location.href='member.ad?cpage=${ requestScope.pi.currentPage - 1 }&keyword=${ requestScope.keyword != null ? requestScope.keyword : ''}'">&lt;</button>
                </c:otherwise>
            </c:choose>
            
            <c:forEach var="p" begin="${ requestScope.pi.startPage }" 
                           end="${ requestScope.pi.endPage }" step="1">
                <c:choose>
                    <c:when test="${ requestScope.pi.currentPage ne p }">
                        <button onclick="location.href='member.ad?cpage=${ p }&keyword=${ requestScope.keyword != null ? requestScope.keyword : ''}'">${ p }</button>
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
                    <button onclick="location.href='member.ad?cpage=${ requestScope.pi.currentPage + 1 }&keyword=${ requestScope.keyword != null ? requestScope.keyword : ''}'">&gt;</button>
                </c:otherwise>
            </c:choose>
            
           </div>
       </div>
       
       <!-- 검색 결과가 없는 경우 알림 표시 -->
	   <c:if test="${not empty noResults}">
	   		<script>
		        alert("검색 결과가 없습니다. 다른 검색어를 입력해주세요.");
		        window.location.href = 'member.ad';
		    </script>
		</c:if>
       
       <script>
       // 상세조회 function
       $(function() {
         		
		$("#list-area>tbody>tr").click(function() {
				
			let userNo = $(this).children().eq(0).text();
			
			location.href="detailMember.ad?mno=" + userNo;
				
		});            		
          	
       });
       </script>
	
	</div>

</body>
</html>