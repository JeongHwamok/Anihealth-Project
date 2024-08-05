<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANIHEALTH</title>
<style>
	.outer {
		width: 100%;
        padding-top: 100px;
        padding-bottom: 80px;
	}
	
	#list-area {
		width: 50%;
        margin: 0 auto; 
        /* 부모 요소의 가운데 정렬을 위해 auto 마진 추가 */
	}
	
	#detail-area-content th {
        margin: 0 auto; 
        text-align : center;
        /* 부모 요소의 가운데 정렬을 위해 auto 마진 추가 */
	}
	
	#detail-area-content #delivery {
        padding-top: 20px; 
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
   
   /* 배송지 스타일 시작 */
   .address-container {
	    border: 1px solid #ccc;
	    padding: 20px;
	    border-radius: 10px;
	    margin-bottom: 20px;
	    position: relative;
	}
	
	.address-item {
	    display: flex;
	    flex-direction: column;
	}
	
    .badge {
        display: inline;
        padding: 5px 7px;
        background-color: white;
        color: gray;
        border: 1px solid lightgray;
        border-radius: 10px;
        margin-right: 10px;
        font-size: 0.75em;
        max-width: 100px;
    }

    .address-name {
        font-weight: bold;
        margin-top: 10px;
        margin-bottom: 5px;
    }

    .address-details {
        margin: 5px 0;
    }
    /* 배송지 스타일 끝 */
    
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
   /* 버튼 영역 끝 */
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	
	<div class="outer">
	
		<div class="header-product">
            <h1>MEMBER DETAIL</h1>
        </div>
        
		<div id="list-area">
			<table id="detail-area-content" class="table">
				<!-- 기본 정보 -->
				<thead>
					<tr>
						<th width="250px">회원 번호</th>
						<td>${ requestScope.m.userNo }</td>
					</tr>
					<tr>
						<th>회원 아이디</th>
						<td>${ requestScope.m.userId }</td>
					</tr>
					<tr>
						<th>회원 이름</th>
						<td>${ requestScope.m.userName }</td>
					</tr>
					<tr>
						<th>회원 닉네임</th>
						<td>${ requestScope.m.userNick }</td>
					</tr>
					<tr>
						<th>회원 이메일</th>
						<td>${ requestScope.m.email }</td>
					</tr>
					<tr>
						<th>회원 전화번호</th>
						<td>${ requestScope.m.phone }</td>
					</tr>
					<tr>
						<th>회원 생년월일</th>
						<td>${ requestScope.m.userBirthday }</td>
					</tr>
					<tr>
						<th>회원 가입일</th>
						<td>${ requestScope.m.createDate }</td>
					</tr>
					<tr>
						<th>회원 활동여부</th>
						<td>${ requestScope.m.status }</td>
					</tr>
				</thead>
				
				<!-- 배송지 -->
				<tbody>
					<c:set var="list" value="${ requestScope.list }" />
					<c:set var="size" value="${ fn:length(list) }" />
					<tr>
						<th>배송지</th>
						<c:forEach var="d" items="${ requestScope.list }" varStatus="loop">
							<td id="delivery">
					            <div class="address-container">
					                <div class="address-item">
					                    <span class="badge badge-pill">배송지 ${loop.index + 1}</span>
					                    <p class="address-name">${ d.deliveryName }</p>
					                    <p class="address-details">${ d.deliveryZipcode }</p>
					                    <p class="address-details">${ d.deliveryAddress }</p>
					                </div>
				            	</div>
			            	</td>
		            	</c:forEach>
	            	</tr>
				</tbody>
				
				<!-- 활동 내역 -->
				<tfoot>
				
				</tfoot>
			</table>
		</div>
		
		<div class="btns" align="center">
        	<a class="btn btn-lg" onclick="postFormSubmit(1);">수정</a>
        	<a class="btn btn-lg" href="member.ad">목록</a>
        </div>
        
         <form id="postForm" action="" method="post">
        	<input type="hidden" name="userNo" value="${ requestScope.m.userNo }" >
        </form>
        
        <script>
        	function postFormSubmit(num) {
        		
        		if(num == 1) {
        		
        			$("#postForm").attr("action", "updateFormMember.ad").submit(); 
        			
        		}
        		
        	}
        </script>
		
	</div>
</body>
</html>