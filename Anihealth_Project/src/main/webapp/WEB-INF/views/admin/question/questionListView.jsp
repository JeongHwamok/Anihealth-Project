<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ANIHEALTH</title>
    <style>
        #navi {
            float: left;
            border-left: 1px solid #000;
            width: 30%;
        }

        /* 메인 faq 영역 시작 */
        .parent{
            width: 100%;
            text-align: center;
            padding-top: 100px;
            padding-bottom: 80px;
        }

        .parent-content {
            width: 50%;
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
            border-radius: 10px; 
            margin-bottom: 40px; /* 정민 */
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
            padding: 40px 20px; /*정민*/
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
        
        /* 모달 작성 시작 */
        .faq-insertQuestion {
        	width: 100%;
            padding: 15px 20px;
            color: #484848; 
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            font-size: 110%; 
            position: relative;
        }
        
        .faq-insertQuestion .question-label {
        	color: #66b59d; 
            font-weight: bold;
            font-size: 110%; 
        }
        
        .faq-insertAnswer {
            width: 90%;
            padding: 40px 20px; /*정민*/
            background-color: rgb(244, 251, 248);
            font-size: 16px;
            color: #333;
            border-radius: 10px;
            font-size: 110%; 
        }

        .faq-insertAnswer .answer-label {
            color: #66b59d;   
            font-weight: bold;
            font-size: 110%; 
            float : left;
        }

        .faq-insertAnswer p {
            margin: 0;
        }
        /* 모달 작성 끝 */
        
        /* 작성 버튼 */
        #insertBtn {
        	float : right;
        }
        
        /* 수정, 삭제 버튼 */
        .changeBtn {
        	float : right;
        }
        
        .faq-status {
        	display : inline-block;
        	float : right;
        	margin-right : 10px;
        }
		
		/* FAQ 수정 스타일 */
		#faqTitle {
			width : 600px;
			height : 35px; 
		}
		
		#faqContent {
			width : 600px;
			height : 200px; 
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
        /* 페이징버튼 끌 */

        /* 메인 faq 영역 끝 */
        
        .updateBtn {
        	margin-right : 10px;
        }
    </style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	
      <div class="parent">
	    <div class="parent-content">
	        <div class="header-faq">
	            <h1>FAQ</h1>
	        </div>
	        
	        <c:if test="${ not empty sessionScope.loginUser && sessionScope.loginUser.userId eq 'admin'}">
		        <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
		        <a class="btn btn-secondary" style="float:right;" data-toggle="modal" data-target="#enrollFAQForm">글쓰기</a>
		   		<br><br>
	        </c:if>
	
	        <div class="faq-container">
	        
	        	<form method="post" action="updateFAQ.ad" id="postForm">
		            <c:forEach var="q" items="${ requestScope.list }">
		            	
		            	<input type="hidden" name="faqNo" value="${ q.faqNo }">
		            	
		                <div class="faq-item">
		                     <div class="faq-question">
		                        <span class="question-label">Q. &nbsp;&nbsp;</span>
		                        <span id="questionReadonly">${ q.faqTitle }</span>
		                        <div class="faq-status">
		                           	상태 &nbsp;&nbsp; | &nbsp;&nbsp; ${ q.faqStatus }
		                        </div>
		                     </div>
		                     <div class="faq-answer"> 
		                        <span class="answer-label">A. &nbsp;&nbsp;</span> 
		                        <span>${ q.faqContent }</span>
		                        <br>
		                        <div class="changeBtn">
		                            <input type="button" value="수정" class="updateBtn" onclick="updateFormQuestion(${ q.faqNo });">
		                            
		                            <c:choose>
			 							<c:when test="${ q.faqStatus eq 'Y' }">
			 								<input type="button" value="삭제" class="deleteBtn" onclick="deleteAlert(${ q.faqNo });"> 
				 						</c:when>
				 						<c:otherwise>
				 							<input type="button" value="복구" class="deleteBtn" onclick="recoverAlert(${ q.faqNo });"> 
				 						</c:otherwise>
								    </c:choose>
		                            
		                            	
		                        </div>
		                     </div>
		                </div>
		               
		            </c:forEach>
	            </form>
				
			
	            <!-- 페이징바가 보여질 부분 -->
	            <div align="center" class="paging-area">
	               <div class="paging-btns">
	               
	                <c:choose>
	                    <c:when test="${ requestScope.pi.currentPage eq 1 }">
	                        <button onclick="" class="disabled">&lt;</button>
	                    </c:when>
	                    <c:otherwise>
	                        <button onclick="location.href='faq.ad?cpage=${ requestScope.pi.currentPage - 1 }'">&lt;</button>
	                    </c:otherwise>
	                </c:choose>
	                
	                <c:forEach var="p" begin="${ requestScope.pi.startPage }" 
	                               end="${ requestScope.pi.endPage }" step="1">
	                    <c:choose>
	                        <c:when test="${ requestScope.pi.currentPage ne p }">
	                            <button onclick="location.href='faq.ad?cpage=${ p }'">${ p }</button>
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
	                        <button onclick="location.href='faq.ad?cpage=${ requestScope.pi.currentPage + 1 }'">&gt;</button>
	                    </c:otherwise>
	                </c:choose>
	                
	               </div>
	           </div>
	           
	        </div>
	    </div>
	</div>
	
	

	<script>
	    $(function() {
	    	
	        $(".faq-question").click(function(event) {
	            if (!$(event.target).hasClass('updateBtn') && !$(event.target).hasClass('deleteBtn') && !$(event.target).closest(".faq-item").find("textarea").length) {
	                var $answer = $(this).next(".faq-answer");
	                if ($answer.css("display") == "none") {
	                    $(".faq-answer").slideUp(300);
	                    $answer.slideDown(300);
	                } else {
	                    $answer.slideUp(300);
	                }
	            }
	        });
	    });
	
	    // FAQ 수정폼
	    function updateFormQuestion(faqNo) {
	    	
	        let target = window.event.target;
	        let faqTitle = $(target).closest('.faq-item').find('#questionReadonly').text();
	        let faqContent = $(target).closest('.faq-answer').find('span').eq(1).text();
	        
	        $("input[name=faqNo]").val(faqNo);
	
	        // FAQ 제목 수정
	        $(target).closest('.faq-item').find('#questionReadonly').html("<textarea id='faqTitle' name='faqTitle' style='resize : none;'>" + faqTitle + "</textarea>");
	        
	        // FAQ 내용 수정
	        $(target).closest('.faq-answer').find('span').eq(1).html("<textarea id='faqContent' name='faqContent' style='resize : none;'>" + faqContent + "</textarea><br>"
	                                                    + "<div class='changeBtn'><input type='submit' value='수정' class='updateBtn'>"
	                                                    + "<input type='button' value='취소' class='deleteBtn' onclick=''></div>");
	        
	        $(target).css("display", "none");
	        $(target).next().css("display", "none");
	    }
	    
	    // FAQ 삭제 및 복구
	    function deleteAlert(faqNo) {
	   		
	    	$("input[name=faqNo]").val(faqNo);
	    	
	   		if (window.confirm('FAQ를 삭제하시겠습니까?')) {
	   			$("#postForm").attr("action", "deleteFAQ.ad").submit();
	   		}
	   		
	   	}
	   	
		function recoverAlert(faqNo) {
	   		
			$("input[name=faqNo]").val(faqNo);
			
	   		if (window.confirm('FAQ를 복구하시겠습니까?')) {
	   			$("#postForm").attr("action", "recoverFAQ.ad").submit();
	   		}
	   		
	   	}
	</script>
	
	 <!-- FAQ 작성 모달 -->
		<div class="modal" id="enrollFAQForm">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title"> FAQ 작성 </h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
			  <form action="insertFAQ.ad" method="post">
			      <!-- Modal body -->
			     
			      <div class="modal-body">
			        <div class="faq-item">
	                     <div class="faq-insertQuestion">
	                        <span class="question-label">Q. &nbsp;&nbsp;</span>
	                        <input id="faqTitle" type="text" name="faqTitle" placeholder="FAQ 제목을 작성해주세요.">
	                     </div>
	                     <div class="faq-insertAnswer"> 
	                        <span class="answer-label">A. &nbsp;&nbsp;</span> 
	                        <textarea id="faqContent" name="faqContent" style="resize : none;" placeholder="FAQ 내용을 작성해주세요."></textarea>
	                        <br>
	                     </div>
	                </div>
	                
			      </div>
			      <!-- Modal footer -->
			      <div class="modal-footer">
			        <button type="submit" class="btn btn-primary">작성</button>
	                <button type="reset" class="btn btn-danger">초기화</button>
			      </div>
		      </form>
		
		    </div>
		  </div>
		</div>
    
</body>
</html>