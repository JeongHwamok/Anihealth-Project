<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANIHEALTH</title>

<style>
 div {
            box-sizing: border-box;
            /* border : 1px solid darkblue;  */
        }

        html,
        body {
            margin: 0;
            padding: 0;
        }
  /* 메인 영역 시작 */
  .parent {
            width: 100%;
            text-align: center;
            padding: 40px;
        }

        .parent-content {
            width: 100%;
            margin: 0 auto;
            /* 부모 요소의 가운데 정렬을 위해 auto 마진 추가 */
            text-align: left;

        }


        /* faq 제목 시작 */
        .header-faq {
            margin-left: auto;
            margin-right: auto;
            margin-top: 30px;
            margin-bottom: 70px;
        }

        .header-faq h1 {
            color: #57585c;
            text-align: center;
        }

        /* faq 제목 끝 */


        .cart-background {
            width: 70%;
            height: auto;
            margin: auto;
            padding:30px 50px;
            background-color: #fff;
           box-shadow:0 0 8px 2px rgba(4, 4, 4, 0.1);
            border-radius: 10px;
            box-sizing: border-box;
            position: relative;
        }
        .cart-table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 10px;
        }

    
        .header-text {
            color: #696969;
        }

        .cart-table {
            width: 100%;
            border-collapse: collapse;
            margin:  20px 0;
            text-align: center;
          
        }

        .cart-table th,
        .cart-table td {
            padding: 15px 35px;
            text-align: left;
             border-bottom: 1.5px solid lightgray;
        }

        .cart-table thead {
             background-color:#e9f7e2;
            color:  #444;
            font-size: 115%;
        }
        .cart-table-content td {
            vertical-align: middle; 
            height: 100%;
            color:  #444;
        }

        .cart-table-inner td{
            font-size: 105%;
        }

	     .cart-table-content :hover {
	       background-color:  #f1faf7;
	       cursor: pointer;
		}
        .item-container {
            display: flex;
            align-items: center; 
            padding: 0px 10px; 
            flex-direction: row; 
        }

        #quantity-cell {
            padding-left: 0;
        }

        #title-iq{
           padding-left: 20px;
        }
        #checkout-button {
            display: block;
            box-sizing: border-box;
            width: auto;
           margin: 10px auto 20px;
            padding: 10px 30px;
            margin-left: 80%;
            background-color: #99BC85;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
		#checkout-button:hover {
		    background-color: #7b9a6a;
		}

        .content h2{
            color: #57585c;
            text-align: center;
        }

		 .gray-line {
            width: 100%; 
            margin: 0 auto;
            border-bottom: 2px solid lightgray;
            margin-top: 30px;
            margin-bottom: 30px;
        }

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
            background-color: rgb(198, 228, 212);
        }

        .paging-area button.active {
            background-color: rgb(198, 228, 212);
            color: #202020;
            cursor: default;
        }

        .paging-area button.active:hover {
            background-color: (198, 228, 212);
            color: #202020;
        }

        .paging-btns>button {
            background-color: rgb(249, 246, 246);
        }

        .paging-area {
            text-align: center;
            display: flex;
            justify-content: center;
            /* 페이지 버튼을 가운데 정렬 */
            align-items: center;
            margin-top: 20px;
            /* 푸터 위로 나오게 적절한 여백 추가 */
        }

        .paging-btns {
            display: flex;
            justify-content: center;
            /* 페이지 버튼을 가운데 정렬 */
        }

        .paging-btns button {
            font-size: 100%;
            font-weight: bold;
        }

        /* 페이징버튼 끌 *
		

        /* 전체 내용 영역 끝 */
        /* 메인 영역 끝 */

</style>

</head>
<body>

<jsp:include page="../common/header.jsp" />




<c:choose>
   <c:when test="${not empty sessionScope.loginUser}">
    
       <div class="parent">
          <div class="parent-content">
                <div class="header-faq">
                    <h1>1 : 1 문의</h1>
                </div>
                <br>

                <div class="cart-background">
                    <a class="btn btn-lg right-button" id="checkout-button" href="enrollForm.iq">문의하기</a>

					   <c:choose>
	                       
	                      <c:when test="${not empty requestScope.list}">    
			                    <table class="cart-table" id="cart-table1">
			                        <thead>
			                            <tr>    
			                             <th> <img src="resources/img/questionIcon.png" width="30px"></th>
			                                <th colspan="2" class="cart-table-item" 
			                                    id="product-header" 
			                                    style="text-align: center;">제목</th>
			                                <th style="text-align: right;  padding-right: 40px;">작성일</th>
			                                <th style="text-align: right;">답변상태</th>
			                            </tr>
			                        </thead>
			
			                        <tbody class="cart-table-content">
			                            <c:forEach var="iq" items="${requestScope.list}">
				                                <tr class="cart-table-inner">
				                              <td style="font-size: large; display:none;">${iq.inquiryNo}</td>
				                                 <td></td>
				                                    <td colspan="2" class="title-iq" style="text-align: center;">${iq.inquiryTitle}</td>
				                                    <td style="text-align: right;  padding-left: 50px;">${iq.inquiryCreate}</td>
				                                    <td style="text-align: right;">
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
				
				                    <form id="postForm" method="post" action="detail.iq" style="display:none;">
                        <input type="hidden" name="ino" id="ino">
                    </form>
                    <script>
                        $(function() {
                            $("#cart-table1>tbody>tr").click(function() {
                                let ino = $(this).children().eq(0).text();
                                $("#ino").val(ino);
                                $("#postForm").submit();
                            });
                        });
                    </script>
			                    
				                   
				                    <div align="center" class="paging-area">
				                        <div class="paging-btns">
				                            <c:choose>
				                                <c:when test="${pi.currentPage eq 1}">
				                                    <button class="disabled">&lt;</button>
				                                </c:when>
				                                <c:otherwise>
				                                    <button onclick="location.href='list.iq?cpage=${pi.currentPage - 1}'">&lt;</button>
				                                </c:otherwise>
				                            </c:choose>
				                            
				                            <c:forEach var="iq" begin="${pi.startPage}" end="${pi.endPage}" step="1">
				                                <c:choose>
				                                    <c:when test="${pi.currentPage ne iq}">
				                                        <button onclick="location.href='list.iq?cpage=${iq}'">${iq}</button>
				                                    </c:when>
				                                    <c:otherwise>
				                                        <button class="page-item active">${iq}</button>
				                                    </c:otherwise>
				                                </c:choose>
				                            </c:forEach>
				                            
				                            <c:choose>
				                                <c:when test="${pi.currentPage eq pi.maxPage}">
				                                    <button class="disabled">&gt;</button>
				                                </c:when>
				                                <c:otherwise>
				                                    <button onclick="location.href='list.iq?cpage=${pi.currentPage + 1}'">&gt;</button>
				                                </c:otherwise>
				                            </c:choose>
				                        </div>
				                    </div>  
	                     </c:when> 
	                      
	                      
		                        <c:otherwise>
		                        	<div class="gray-line"></div> 
		                            <div align="center" style="margin-top: 20px; color: #57585c;">
		                                 <h4>문의글 내역이 없습니다.</h4>
		                            </div>
		                            <div class="gray-line"></div> 
		                        </c:otherwise>
	                   </c:choose>  
	            </div>
	       </div>          
	    </div>
	</c:when> 
	 
	    <c:otherwise>       
	        <script>
	            alert('로그인이 필요합니다.');
	            window.location.href = 'loginPage.me'; // 로그인 페이지로 리다이렉트
	        </script>
	    </c:otherwise>
</c:choose>


		    <br><br><br>
		    
    
    	<jsp:include page="../common/footer.jsp" />
    	
    <style>
	    @media (max-width: 950px) {
	    .cart-background {
	        width: 100%;
	        padding: 20px;
	    }
	
	    .cart-table-header {
	        flex-direction: column;
	        align-items: flex-start;
	    }
	
	    .left-header, .right-header {
	        margin-bottom: 10px;
	    }
	
	    .item-container {
	        flex-direction: column;
	        align-items: flex-start;
	    }
	
	    .item-text {
	        padding-left: 0;
	        margin-top: 10px;
	    }
	
	    .quantity-wrapper {
	        justify-content: space-between;
	        width: 100%;
		    }
		}
    </style>
	
	

</body>
</html>