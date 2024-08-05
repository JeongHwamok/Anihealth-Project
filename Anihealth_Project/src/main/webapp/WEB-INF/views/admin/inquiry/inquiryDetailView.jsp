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
        padding-top: 100px;
        padding-bottom: 80px;
	}
	
	#list-area {
		width: 50%;
        margin: 0 auto; 
        /* 부모 요소의 가운데 정렬을 위해 auto 마진 추가 */
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
    
    .detail-area-content th {
        margin: 0 auto; 
        text-align : center;
        /* 부모 요소의 가운데 정렬을 위해 auto 마진 추가 */
	}
	
	/* 버튼 영역 시작 */
    .btns .insertAnswer {
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

   .btns .insertAnswer:hover {
       background-color:  rgb(198, 228, 212);
   }
   /* 버튼 영역 끝 */
   
   #inquiryAnswer {
   		width : 100%;
		height : 200px; 
   }
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	
	<div class="outer">
	
		<div class="header-product">
            <h1>1 : 1 INQUIRY DETAIL</h1>
        </div>
        
        <div id="list-area">
        	<table class="detail-area-content table">
        		<thead>
	        		<tr>
	        			<th width="500px">${ requestScope.iq.inquiryTitle }</th>
	        			<th>${ requestScope.iq.inquiryCreate }</th>
	        			<th>
	        				<c:choose>
	        					<c:when test="${not empty requestScope.iq.inquiryAnswer }">
	        						답변완료
	        					</c:when>
	        					<c:otherwise>
	        						답변 대기
	        					</c:otherwise>
	        				</c:choose>
	        			</th>
	        		</tr>
	        	</thead>
	        	<tbody>
	        		<tr>
	        			<td colspan="3">
	        				<p style="white-space: pre-wrap;">${ requestScope.iq.inquiryContent }</p>
	        			</td>
	        		</tr>
	        	</tbody>
        	</table>
        	
        	<br><br>
        	
        	<form action="insertInquiry.ad" method="post" id="postForm">
        	
        		<input type="hidden" value="${ requestScope.iq.inquiryNo }" name="inquiryNo">
        		
	        	<c:choose>
	        		<c:when test="${not empty requestScope.iq.inquiryAnswer }">
	        			<table id="inquiryAnswer-area" class="detail-area-content table">
	        				<tr>
	        					<th width="600px">답변 내용</th>
	        					<th>${ requestScope.iq.inquiryAnswerContent }</th>
	        					<th>문의 상태 &nbsp;&nbsp;&nbsp; ${ requestScope.iq.inquiryStatus }</th>
	        				</tr>
	        				<tr>
	        					<td colspan="3">
	        						<p style="white-space: pre-wrap;" id="answerContent">${ requestScope.iq.inquiryAnswer }</p>
	        					</td>
	        				</tr>
	        			</table>
	        			
	        			<br><br>
	        			
	        			<div class="btns" align="center">
	        				<input type="button" value="답변 수정" class="insertAnswer" onclick="updateAnswer(${ requestScope.iq.inquiryNo });">
	        				<input type="button" value="문의 목록" class="insertAnswer" onclick="location.href='inquiry.ad'">
	        				<c:choose>
	        					<c:when test="${ requestScope.iq.inquiryStatus eq 'Y' }">
	        						<input type="button" value="문의 삭제" class="insertAnswer" onclick="deleteAlert();">
	        					</c:when>
	        					<c:otherwise>
	        						<input type="button" value="문의 복구" class="insertAnswer" onclick="recoverAlert();">
	        					</c:otherwise>
	        				</c:choose>
	        			</div>
	        		</c:when>
	        		<c:otherwise>
	        			<br>
	        			<div class="btns" align="center">
	        				<input type="button" value="답변 등록" class="insertAnswer" onclick="insertAnswer();">
	        				<input type="button" value="문의 목록" class="insertAnswer" onclick="location.href='inquiry.ad'">
	        			</div>
	        		</c:otherwise>
	        	</c:choose>
	        	
        	</form>
        	
        </div>
        
        <script>
        	// 답변 등록 클릭 시 답변 작성폼
        	function insertAnswer() {
        		
        		let target = window.event.target;

        		let str = "<table id='inquiryAnswer-area' class='table'>"
       					+  	"<tr>"
       					+ 		"<th>답변 내용 </th>"
       					+ 	"</tr>"
       					+  	"<tr>"
       					+		"<td><textarea class='form-control' id='inquiryAnswer' name='inquiryAnswer' style='resize : none;'></textarea></td>"
       					+ 	"</tr>"
       					+ "</table>"
       					+ "<div class='btns'>"
       					+ 	"<input type='submit' value='답변 등록' class='insertAnswer'>"
       					+	"<input type='reset' value='초기화' class='insertAnswer'>"
        				+ "</div>"
       					
        		$(target).closest(".btns").html(str);
				        		
        	}
        	
        	// 답변 수정 버튼 글릭시 답변 수정폼
        	function updateAnswer(num) {
        		
        		let target = window.event.target;
        		let answerContent = $(target).closest(".btns").siblings("#inquiryAnswer-area").find("#answerContent").text();
        		
        		$(target).closest(".btns").siblings("#inquiryAnswer-area").find("#answerContent").html("<textarea id='inquiryAnswer' class='form-control' name='inquiryAnswer' style='resize : none;'>" + answerContent + "</textarea>");
        		
        		let str = "<div class='btns'>"
	   					+ 	"<input type='submit' value='답변 수정' class='insertAnswer'>"
	   					+	"<input type='reset' value='초기화' class='insertAnswer'>"
	    				+ "</div>"
	    				
	    		$(target).closest(".btns").html(str);
        		
        	}
        	
        	// 삭제 클릭 시 알림창으로 한번 더 확인
        	function deleteAlert() {
        		
        		if (window.confirm('문의를 삭제하시겠습니까?')) {
        			
        			$("#postForm").attr("action", "deleteInquiry.ad").submit();
        			
        		}
        		
        	}
        	
        	// 복구 클릭 시 알림창으로 한번 더 확인
        	function recoverAlert() {
    	   		
    	   		if (window.confirm('문의를 복구하시겠습니까?')) {
    	   			
    	   			$("#postForm").attr("action", "recoverInquiry.ad").submit();
    	   			
    	   		}
    	   		
    	   	}
        </script>
	
	</div>

</body>
</html>