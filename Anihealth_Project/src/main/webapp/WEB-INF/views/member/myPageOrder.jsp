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
        }

        .item-title {
            font-weight: bold;
            margin: 5px;
            text-align: left;
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
                    <h2>주문 내역 <img src="resources/img/orderIcon.png" width="40px"></h2>
                    <br>
                    
                    <div class="cart-background">
                    
                    	<c:choose>
                           	<c:when test="${not empty requestScope.list }">
                           	
                           	<!-- 주문내역이 있을 경우 -->
		                        <table class="cart-table">
		                            <thead>
		                                <tr>
		                                    <th class="cart-table-item" colspan="2" width="100px;">주문 일자</th>
		                                    <th width="140px">결제 금액</th>
		                                    <th width="150px">배송 상태</th>
		                                    <th width="250px">배송지</th>
		                                    <th width="200px">배송 요청사항</th>
		                                    <th width="150px">환불</th>
		                                </tr>
		                            </thead>
		                            
		                            <tbody class="cart-table-content">
		                           		<c:forEach var="o" items="${ requestScope.list }">
		                                	<tr>
		                                		<div>
		                                		<td colspan="5" style="text-align: left; padding-bottom: 0; border-bottom-color: lightgray">주문번호 : ${ o.orderNo }</td>
		                                		<td colspan="2" style="text-align: right; padding-bottom: 0; border-bottom-color: lightgray">
		                                			<a href="javascript:void(0);" onclick="postOrderDetail('${o.orderNo}');" style="text-decoration: none; color: black;">주문 상세보기 ></a>
		                                		</td>
		                                		</div>
		                                	</tr>
	                                		<tr class="cart-table-inner">
			                                    <td colspan="2">
			                                        <div class="item-container">
			                                            <div class="item-text">
			                                                <p class="item-title">${ o.orderDate }</p>
			                                                
			                                            </div>
			                                        </div>
			                                    </td>
			                                    <td>
			                                    	<span class="item-subtitle"><fmt:formatNumber value="${ o.orderPrice }" type="number" groupingUsed="true" /> &nbsp;원</span>
			                                    </td>
			                                    <td>
			                                    	<c:if test="${ o.orderCancle == 'Y' }">
			                                    		${ o.deliveryStatus }
			                                    	</c:if>
			                                    	<c:if test="${ o.orderCancle == 'N' }">
			                                    		주문 취소
			                                    	</c:if>
			                                    	
			                                    </td>
			                                    <td>
			                                        <div class="item-text">
			                                            <p class="item-title">
			                                            	${ o.orderZipcode } <br>
			                                            	${ o.orderAddress }
			                                            </p>
			                                        </div>
			                                    </td>
			                                    <td>
			                                    	${ o.orderRequest }
			                                    </td>
			                                    <td>
			                                    	<c:if test="${o.orderContent == null}">
		                                    			<button type="button" class="btn" id="btn-refund" data-toggle="modal" data-target="#refundForm" data-order-no="${ o.orderNo }">환불하기</button>
			                                    	</c:if>
			                                    	<c:if test="${o.orderContent != null && o.orderCancle == 'Y'}">
			                                    		환불 요청중
			                                    	</c:if>
			                                    	<c:if test="${o.orderContent != null && o.orderCancle == 'N'}">
			                                    		환불 완료
			                                    	</c:if>
			                                    	
			                                    </td>
		                               		</tr>
		                               		
		                               		<!-- 환불모달 -->
										    <div class="modal fade" id="refundForm">
										        <div class="modal-dialog modal-m">
										            <div class="modal-content">
										
										                <!-- Modal Header -->
										                <div class="modal-header">
										                    <h4 class="modal-title">환불하기</h4>
										                    <button type="button" class="close" data-dismiss="modal">&times;</button>
										                </div>
										
										                <form action="refund.me" method="post">
										                    <!-- Modal body -->
										                    <div class="modal-body">
										                        
										                        <br>
										                            <label for="userPwd" class="mr-sm-2">환불사유 </label>
										                            <input type="text" class="form-control mb-2 mr-sm-2" placeholder="환불사유를 입력해주세요." id="orderContent" name="orderContent" required> <br>
										                    		<!-- 회원 탈퇴 시 PK 에 해당하는 회원의 아이디도 같이 넘겨야함 -->
										                    		<input type="hidden" id="refundOrderNo" name="orderNo" value="">
										                    </div>
										                    <!-- Modal footer -->
										                    <div class="modal-footer" align="center">
										                        <button type="submit" class="btn btn-danger">환불</button>
										                    </div>
										                </form>
										            </div>
										        </div>
										    </div>
							                            
							                <script>
										    	$(function() {
										            $("tbody>tr>td>button").click(function() {
										            	// console.log($(this)[0].dataset.orderNo);
										                // 글번호 : 현재 클릭된 tr의 첫번째 자손 td의 내용물
										               $(".modal-body>input[name=orderNo]").val($(this)[0].dataset.orderNo);
										            });
			
										        })
									    	</script>   		
		                               		
										    
		                                </c:forEach>
		                            </tbody>
		                        </table>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<h4 align="center" style="color: gray">주문내역이 존재하지 않습니다.</h4>
	                    	</c:otherwise>
                        </c:choose>
                        
                        
	                  
	                    
                    </div>
                    <br><br>
                    <div class="gray-line"></div> 
                </div>
        </div>
        <div class="gray-line"></div>
    </div>

    <br><br><br><br><br><br><br>
    <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />

    <!-- 주문 상세보기 폼 -->
    <form id="orderDetailForm" action="myPageOrderDetail.me" method="post" style="display: none;">
        <input type="hidden" name="ono" id="ono">
    </form>

    <script>
        function postOrderDetail(orderNo) {
            document.getElementById('ono').value = orderNo;
            document.getElementById('orderDetailForm').submit();
        }
    </script>

</body>
</html>
