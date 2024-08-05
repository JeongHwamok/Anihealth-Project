<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANIHEALTH</title>
<style>
  /* 메인 faq 영역 시작 */
        .parent{
            width: 100%;
            text-align: center;
            padding-top: 100px;
            padding-bottom: 80px;
        }

        .parent-content {
            width: 65%;
            margin: 0 auto; 
            /* 부모 요소의 가운데 정렬을 위해 auto 마진 추가 */
            text-align: left;
        }

        /* faq 제목 시작 */
        .header-faq {
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 50px;   
        }

        .header-faq h1 {
            color: #57585c;
            text-align: center;
        }
         /* faq 제목 끝 */
 
         .gray-line {
            width: 100%; 
            margin: 0 auto;
            border-bottom: 3px solid lightgray; 
            margin-bottom: 50px;
        }

         /* 전체 faq 내용 영역 시작 */
        .faq-container {
            margin: 0 auto;
            box-shadow: 0 4px 8px rgba(4, 4, 4, 0.1);
            border-radius: 10px;
            background-color: #fff;
            padding: 10px;
        }

        .faq-item {
            width: 100%;
            margin: 20px 0;
            padding-bottom: 10px;
            transition: all 0.3s ease;
            border-bottom: 2px solid #cfe8e1;
            /* color: #484848; */
            border-radius: 10px; 

        }

        .faq-question {
            width: 100%;
            padding: 15px 20px;
            color: #484848; 
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            font-size: 110%; 
            position: relative;
        }

        .faq-question .question-label {
            color: #66b59d; 
            font-weight: bold;
            font-size: 110%; 
        }

        .faq-answer {
            width: 100%;
            padding: 15px 20px;
            background-color: rgb(244, 251, 248);
            display: none;
            font-size: 16px;
            color: #333;
            border-radius: 10px;
            font-size: 110%; 
        }

        .faq-answer .answer-label {
            color: #66b59d;   
            font-weight: bold;
            font-size: 110%; 
            align-self: flex-start; /* 상단 정렬 */
        }

        .faq-answer p {
            margin: 0;
        }
         /* 전체 faq 내용 영역 끝 */

   
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
        .current-page{
        background-color: #007bff;
        }
        /* 페이징버튼 끌 */

     /* 메인 faq 영역 끝 */
</style>
</head>
<body>

<jsp:include page="../common/header.jsp" />
<!-- 24/6/2 해준  -->
<div class="parent" >
    <div class="parent-content">
                    <div class="header-faq">
                        <h1>FAQ</h1>
                    </div>

                    <!-- <div class="gray-line"></div>  -->
            
				
                <div class="faq-container">
                <c:forEach var="f" items="${ requestScope.list }">
                    <div class="faq-item">
                        <div class="faq-question">
                            <span class="question-label">Q. &nbsp;&nbsp;</span>
                           	${ f.faqTitle }
                            <!-- <span class="question-label-down">﹀ &nbsp;&nbsp;</span> -->              
                        </div>
                        <div class="faq-answer">
                            <span class="answer-label">A. &nbsp;&nbsp;</span> 
                            ${ f.faqContent }
                        </div>
                    </div>
					</c:forEach>
            </div>

                           <!-- 페이징바가 보여질 부분 -->
                           <div align="center" class="paging-area">
                            <div class="paging-btns">
                            	
                            	<c:choose>
                            	<c:when test="${ requestScope.pi.currentPage eq 1 }">	
                                <button onclick="" class="disabled">&lt;</button>
                                </c:when>
                                <c:otherwise>
                                <button onclick="location.href=`faq.bo?cpage=${ requestScope.pi.currentPage - 1 }`">&lt;</button>
                                </c:otherwise>
                                </c:choose>
                                
                                <c:forEach var="p" begin="${ requestScope.pi.startPage }"
                                end="${ requestScope.pi.endPage }"
                    		   step="1">
                    		   <c:choose>	
                    		   <c:when test="${ requestScope.pi.currentPage ne p }">
                    		   <button onclick="location.href='faq.bo?cpage=${ p }'">${ p }</button>
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
                                 <button onclick="location.href=`faq.bo?cpage=${ requestScope.pi.currentPage + 1 }`">&gt;</button>
                                </c:otherwise>
                                </c:choose>
                            </div>
                        </div>      
   </div>
</div>    
    <script>
        $(function() {
            $(".faq-question").click(function() {
                var $answer = $(this).next(".faq-answer");

                if ($answer.css("display") == "none") {
                    $(".faq-answer").slideUp(300);
                    $answer.slideDown(300);
                } else {
                    $answer.slideUp(300);
                }
            });
        });
    </script>

<jsp:include page="../common/footer.jsp" />



</body>
</html>