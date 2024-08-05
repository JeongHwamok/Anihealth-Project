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
        /* 공통 스타일 */
        div {
            box-sizing: border-box;
        }

        html,
        body {
            margin: 0;
            padding: 0;
        }

        .mypage-panel-container-my {
            display: flex;
            justify-content: center; 
            width: 100%;
        }

        .mypage-panel-my {
            display: flex;
            justify-content: center; 
            width: 80%;
        }

        .sidebar-my {
		    width: 20%;
		    padding: 20px;
		    height: 400px;
		    overflow: hidden;
		    position: relative;
		    left: -3%;
		}

        .sidebar-my h3 {
            margin-top: 0;
        }

        nav-my ul {
            list-style-type: none;
            padding: 0;
            margin-left: 4px;
            margin-top: 20px;
        }

        nav-my ul li {
            margin-bottom: 15px;
            font-size: large;
        }

		nav-my ul li span {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }
		

        nav-my ul li a {
            text-decoration: none;
            color: #333;
            font-weight: normal;
            font-size: small;
        }

        nav-my ul li a:hover {
            color: rgb(67, 104, 80);
            text-decoration: none;
        }

        .content-my {
            width: 70%;
            margin: 0 auto;
            margin-left: 10px;
        }

        .content-my h2 {
            margin-top: 0;
            padding-bottom: 20px;
            border-bottom: 2px solid lightgray;
        }

        .cart-background {
            margin-top: 20px;
        }

        .item-container {
            display: flex;
            align-items: center;
            padding: 0px 10px;
            flex-direction: row;
        }

        .img-size {
            height: auto;
            object-fit: cover;
            max-width: 100px;
            border-radius: 10px;
            margin-right: 5px;
        }

        .item-text {
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-align: center;
            font-weight: bold;
            vertical-align: middle;
        }

        .item-title {
        	text-align: left;
            font-weight: bold;
            margin: 5px;
        }

        .item-subtitle {
            color: gray;
            margin: 5px;
            text-align: left;
        }

        .item-details {
            display: flex;
            align-items: center;
        }

        .cart-background {
            box-sizing: border-box;
            position: relative;
        }

        .cart-table {
            width: 100%;
            border-collapse: collapse;
            margin: auto;
            text-align: center;
        }

		.cart-table th {
			padding: 15px;
            border-bottom: 1px solid #5a5b5a;
            background-color: #f3f7f1;
            color: rgb(104, 103, 103);
            font-size: large;
            font-weight: bold;
		}

        .cart-table td {
            padding: 15px;
            text-align: center;
            border-top: 1px solid #4ca64c;
        }

        .cart-table tbody:last-child {
            border-bottom: 1px solid #4ca64c;
        }

        .cart-table-item{
          margin-left: 50px;
        }
        

        .cart-table-inner .btn {
            background-color: #599a83;
            /* color: aliceblue; */
            margin: 5px;
            color: white;
        }

        .cart-table-content td {
            vertical-align: middle;
        }

        .gray-line {
            border-bottom: 2px solid lightgray;
        }
        
        
		

    </style>
</head>
<body>
    <!-- 헤더바 -->
    <jsp:include page="../common/header.jsp" />
   
    <div class="mypage-panel-container-my">
        <div class="mypage-panel-my">
            <div class="sidebar-my">
                <h3>
                    <span style="color: rgb(67, 104, 80);"><b>${ sessionScope.loginUser.userNick }</b></span>님의 <br>
                    마이페이지 <br>
                </h3>
                
                <nav-my>
                    <ul>
                        <li>
                        	<span>나의 정보</span> <br>
                        	<a href="myPage.me">회원 정보 관리</a> <br> 
                        	<a href="myPageDelivery.me">배송지 관리</a> <br>
                        </li>	
                        <li>
                        	<span>나의 쇼핑정보</span> <br> 
                        	<a href="myPageOrder.me">주문 내역</a> <br> 
                        	<a href="myPageReview.me">후기 내역</a> <br> 
                        	<a href="myPageWish.me">찜한 제품</a> <br> 
                        </li>
                        
                        <li>
                        	<span>나의 문의정보</span> <br> 
                        	<a href="myPageQuestion.me">1 : 1 문의</a> <br> 
                        </li>
                    </ul>
                </nav-my>
            </div>
            <div class="content-my">
                    <h2>1:1 문의 <img src="resources/img/questionIcon.png" width="40px"></h2>
                    <br>
                    
                    <div class="cart-background">
                    	<c:choose>
                           	<c:when test="${not empty requestScope.list }">
                           	<!-- 주문내역이 있을 경우 -->
                    
		                        <table class="cart-table">
		                        	<thead>
		                                <tr>
		                                    <th class="cart-table-item" width="360px;">문의 내역</th>
		                                    <th>작성일</th>
		                                    <th width="360px;">답변 상태</th>
		                                    
		                                </tr>
		                            </thead>
		                            <tbody class="cart-table-content">
		                            	<c:forEach var="i" items="${ requestScope.list }">
		                            		<tr>
		                                		<div>
		                                		<td colspan="3" style="text-align: right; padding-bottom: 0; border-bottom-color: lightgray">
												    <form action="detail.iq" method="post">
												        <input type="hidden" value="${i.inquiryNo}" name="ino" id="ino">
												        <button type="submit" class="btn">문의 상세보기 ></button>
												    </form>
												</td>
		                                		</div>
		                                	</tr>
			                                <tr class="cart-table-inner">
			                                    <td>  
				                                    <div class="item-text">
				                                        <p class="item-title">${ i.inquiryTitle }</p>
				                                        <div class="item-details">
				                                            <span class="item-subtitle">${ i.inquiryContent }</span>
				                                        </div>
				                                    </div>
			                                        
			                                    </td>
			                                    <td>${ i.inquiryCreate }</td>
			                                    <c:choose>
				                                    <c:when test="${ i.inquiryAnswer == null }">
				                                    	<td>답변 되지 않은 문의글입니다.</td>
				                                    </c:when>
				                                    <c:otherwise>
				                                    	<td>답변이 완료된 문의글입니다.</td>
				                                    </c:otherwise>
			                                    </c:choose>
			                                    
			                                </tr>
										</c:forEach>
		                            </tbody>
	                        	</table>
                    		</c:when>
                    		<c:otherwise>
	                    		<h4 align="center" style="color: gray">문의내역이 존재하지 않습니다.</h4>
	                    	</c:otherwise>
                    	</c:choose>
                    </div>
                    <br><br>
                    <div class="gray-line"></div> 
                </div>
        </div>
    </div>

    <br><br><br><br><br><br><br>
    <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
