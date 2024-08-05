
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        /* 콘텐츠 스타일 */
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
        .cart-background{
            margin-top: 20px;
        }

        .item-container {
            display: flex;
            align-items: center;
            padding: 0px 10px;
            flex-direction: row;
        }

        .img-size {
            height: 120px;
            width: 150px;
            border-radius: 10px;
            margin-right: 5px;
        }

        .item-text {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .item-text-name {
            display: flex;
            flex-direction: column;
            justify-content: left;
            text-align: left;
            font-weight: bold;
        }
        
        

        .item-title {
            font-weight: bold;
            margin: 5px;
        }

        .item-subtitle {
            color: gray;
            margin: 5px;
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
		}

        .cart-table td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #5a5b5a;
        }

        .cart-table th {
            background-color: #f3f7f1;
            color: rgb(104, 103, 103);
            font-size: large;
            font-weight: bold;
        }
        .cart-table-item{
          margin-left: 50px;
        }

        .cart-table-inner .btn{
            background-color: #599a83;
            color: aliceblue;
            margin: 5px;
        }

        .cart-table-content td {
            vertical-align: middle;
        }
        
        .gray-line {
            border-bottom: 2px solid lightgray;
        }
        
        #back {
        	border: 2px solid rgb(153, 188, 133);
        }
        

		#back:hover {
			background-color: rgb(153, 188, 133);
			color: white;
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
                    <h2>상세 주문 내역 <img src="resources/img/orderIcon.png" width="40px"></h2>
                    <br>
                    
                    <div class="cart-background">
                    
                    	<c:choose>
                           	<c:when test="${not empty requestScope.list }">
                           	<!-- 주문내역이 있을 경우 -->
		                        <table class="cart-table">
		                            <thead>
		                                <tr>
		                                    <th class="cart-table-item" colspan="2" width="150px;">제품</th>
		                                    <th>주문일자</th>
		                                    <th>주문 상태</th>
		                                    <th>후기</th>
		                                </tr>
		                            </thead>
		                            <tbody class="cart-table-content">
		                                <c:forEach var="op" items="${ requestScope.list }">
	                                		<tr class="cart-table-inner">
			                                    <td colspan="2">
			                                        <div class="item-container">
			                                            <a href="detail.pd?pno=${ op.productNo }"><img class="img-size" src="${ op.productThumbnailPath }" alt="영양제이미지"></a>
			                                            <div class="item-text-name">
			                                                <p class="item-title-name">&nbsp; ${ op.productName }</p>
			                                                <div class="item-details">
			                                                    <span class="item-subtitle"><fmt:formatNumber value="${ op.orderProductPrice }" type="number" groupingUsed="true" /> &nbsp;원</span>
			                                                    <span class="item-subtitle">${ op.orderQuantity }개</span>
			                                                </div>
			                                            </div>
			                                        </div>
			                                    </td>
			                                    <td>${ op.orderDate }</td>
			                                    <td>
			                                        <div class="item-text">
			                                        	<c:if test="${ op.orderCancle == 'Y' }">
			                                        		<p class="item-title">${ op.deliveryStatus }</p>
			                                        	</c:if>
			                                        	<c:if test="${ op.orderCancle == 'N' }">
			                                        		환불 완료
			                                        	</c:if>
			                                        	
			                                            
			                                        </div>
			                                    </td>
			                                     
			                                    <td style="text-align: center;">
			                                    <c:if test="${op.deliveryStatus == '배송완료' && op.orderContent == null}">
			                                        <button class="btn btn-sm" onclick="postReviewForm(${op.orderProductNo}, '${op.orderNo}');">후기작성</button>
			                                    </c:if>
			                                    <c:if test="${op.deliveryStatus != '배송완료' && op.orderContent == null}">
			                                    	배송중
			                                    </c:if>
			                                    
			                                    <c:if test="${op.orderContent != null && op.orderCancle == 'Y'}">
		                                    		환불 요청중
		                                    	</c:if>
		                                    	<c:if test="${op.orderContent != null && op.orderCancle == 'N'}">
		                                    		환불한 제품은 후기를 쓸 수 없습니다.
		                                    	</c:if>
			                                    </td>
			                                    
		                               		</tr>
		                                </c:forEach>
		                            </tbody>
		                        </table>
	                    	</c:when>
                        </c:choose>
                    </div>
                    <br><br>
                    <div class="gray-line"></div> 
                    <br><br>
                    <div align="center">
                    	<a href="myPageOrder.me" class="btn" id="back">뒤로가기</a>
                    </div>
                    <br><br>
                </div>
        </div>
        <div class="gray-line"></div>
    </div>

    <!-- 후기 작성 폼 -->
    <form id="reviewForm" action="insertForm.re" method="post" style="display: none;">
        <input type="hidden" name="orderProductNo" id="orderProductNo">
        <input type="hidden" name="orderNo" id="orderNo">
    </form>

    <script>
        function postReviewForm(orderProductNo, orderNo) {
            document.getElementById('orderProductNo').value = orderProductNo;
            document.getElementById('orderNo').value = orderNo;
            document.getElementById('reviewForm').submit();
        }
    </script>

    <br><br><br><br><br><br><br>
    <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
