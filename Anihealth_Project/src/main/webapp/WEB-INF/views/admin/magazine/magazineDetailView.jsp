<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANIHEALTH</title>

<style>
    .parent {
        width: 100%;
        padding-top: 100px;
        padding-bottom: 80px;
    }

    .parent-content {
        width: 70%;
        margin: 0 auto;
    }

    .header-faq {
        padding-bottom: 20px;
        margin-bottom: 10px;
    }

    .header-faq h1 {
        color: #57585c;
        text-align: center;
    }

    .gray-line {
        border-bottom: 2px solid lightgray;
    }

    .info-bar {
        display: flex;
        justify-content: space-between;
        font-size: large;
    }

    .info-bar .left-info {
        text-align: left;
    }

    .info-bar .right-info {
        text-align: right;
    }

    .info-bar span {
        margin-right: 10px;
    }

    .info-bar .right-info span:last-child {
        margin-right: 0;
    }

    .content-table {
        max-width: 80%;
        margin: 0 auto;
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-bottom: 40px; /* 추가 */
    }

    .content-table img {
        width: 52em;
        height: 450px; 
        display: block;
        margin: 0 auto;
    }

    .content-table p {
        white-space: pre-line;
        text-align: left;
        font-size: 120%;
    }

    .btn-list-container {
        width: 100%;
        text-align: center;
    }

    .btn-list > button {
        font-size: 120%;
        font-weight: bold;
        cursor: pointer; 
        border: 3px solid rgb(82, 166, 121);
        color: rgb(83, 88, 88);
        font-weight: 600;
        margin-top: 40px;
        margin : 0 10px;
    }
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />

	<div class="parent">
	    <div class="parent-content">
	        <div class="header-faq">
	            <h1>MAGAZINE</h1>
	            <br><br><br><br>
	            <div class="info-bar">
	                <div class="left-info">
	                    <span>No. ${requestScope.ma.magazineNo}</span>
	                </div>
	                <div class="right-info">
	                    <span>${requestScope.ma.magazineCreate}</span>
	                    <span>조회수 ${requestScope.ma.magazineCount}</span>
	                    <span>공개여부 ${requestScope.ma.magazineStatus}</span>
	                </div>
	            </div>
	            <div class="gray-line"></div>
	            <br>
	            <h2 align="center">${requestScope.ma.magazineTitle}</h2>
	            <br>
	            <div class="gray-line"></div>
	        </div>
	        <br>
	        <c:forEach var="lm" items="${requestScope.list}">
	            <div class="content-table">
	                <img src="${lm.magazinePath}" alt="${lm.magazinePath}">
	                <br>
	                <p>${lm.magazineContent}</p>
	            </div>
	        </c:forEach>
	        <div class="btn-list-container">
	            <div class="btn-list">
	                <button class="btn btn-lg" onclick="updateForm();">수정하기</button>
	                <button class="btn btn-lg" onclick="location.href='magazine.ad'">목록으로</button>
	                <c:choose>
	                	<c:when test="${ requestScope.ma.magazineStatus eq 'Y' }">
	                		<button class="btn btn-lg" onclick="deleteAlert();">삭제하기</button>
	                	</c:when>
	                	<c:otherwise>
	                		<button class="btn btn-lg" onclick="recoverAlert();">복구하기</button>
	                	</c:otherwise>
	                </c:choose>
	            </div>
	        </div>
	    </div>
	</div>
	
	<form action="" method="post" id="postForm">
		<input type="hidden" name="magazineNo" value="${ requestScope.ma.magazineNo }">
	</form>
	
	<script>
		// 수정 페이지 요청
		function updateForm() {
			
			$("#postForm").attr("action", "updateFormMaga.ad").submit();
			
		}
	
		// 삭제 클릭 시 알림창으로 한번 더 확인
		function deleteAlert() {
			
			if (window.confirm('매거진을 삭제하시겠습니까?')) {
				
				$("#postForm").attr("action", "deleteMaga.ad").submit();
				
			}
			
		}
		
		// 복구 클릭 시 알림창으로 한번 더 확인
		function recoverAlert() {
	   		
	   		if (window.confirm('매거진을 복구하시겠습니까?')) {
	   			
	   			$("#postForm").attr("action", "recoverMaga.ad").submit();
	   			
	   		}
	   		
	   	}
	</script>

</body>
</html>
