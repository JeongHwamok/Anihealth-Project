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
        /* text-align: center; */
        padding-top: 100px;
        padding-bottom: 150px;
	}
	
	.detail-area {
		width: 60%;
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
    
    #totalPrice {
   		font-size : 25px;
    }
    
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
            <h1>ORDER DETAIL</h1>
        </div>
        
        <div class="detail-area">
        	<table class="table">
        		<tr>
        			<th>주문 번호</th> 
        			<td>${ requestScope.o.orderNo }</td>
        			<th>회원 아이디</th>
        			<td>${ requestScope.o.userId }</td>
        			<th>주문 날짜</th>
        			<td>${ requestScope.o.orderDate }</td>
        		</tr>
        		<tr>
        			<th>전화번호</th>
        			<td>${ requestScope.o.orderPhone }</td>
        			<th>우편번호</th>
        			<td>${ requestScope.o.orderZipcode }</td>
        			<th>주소</th>
        			<td>${ requestScope.o.orderAddress }</td>
        		</tr>
        		<tr>
        			<th>배송 요청 사항</th>
        			<td colspan="3">${ requestScope.o.orderRequest }</td>
        			<th>배송 상태</th>
        			<td>
        				<form action="updateDelivery.ad" method="post">
						    <select name="deliveryStatus" class="custom-select col-5">
						        <option value="결제완료">결제완료</option>
                                <option value="배송준비중">배송준비중</option>
                                <option value="배송중">배송중</option>
                                <option value="배송완료">배송완료</option>
						    </select> &nbsp;
						    <button type="submit" class="btn btn-primary">변경</button>
						    <input type="hidden" name="orderNo" value="${ requestScope.o.orderNo }">
						  </form>
        			</td>
        		</tr>
        	</table>
        	
        	<br><br>
        	
        	<table class="table">
        		<c:forEach var="p" items="${ requestScope.list }">
        			<tr>
        				<td rowspan="3" align="left" width="300px">
        					<img src="${ p.productThumbnailPath }" width="100%" height="300px">
        				</td>
        				<th>상품명</th>
        				<td colspan="3">${ p.productName }</td>
        			</tr>
        			<tr>
        				<th rowspan="2">수량</th>
        				<td rowspan="2">${ p.orderQuantity }</td>
        				<th rowspan="2">가격</th>
        				<td rowspan="2">
        					<fmt:formatNumber value="${ p.orderProductPrice }" type="number" groupingUsed="true" /> 원
        				</td>
        			</tr>
        			<tr></tr>
        			<tr><th colspan="6"></th></tr>
        		</c:forEach>
        	</table>
        	
        	<br>
			 <div id="totalPrice" align="right">
			  	결제 가격 &nbsp; &nbsp; <fmt:formatNumber value="${requestScope.o.orderPrice}" type="number" groupingUsed="true" /> 원
			 </div>
        	<hr>
        	
        	<div class="btns">
	           	<a class="btn btn-lg" href="order.ad">주문 목록</a>
	        </div>
        	
        </div>
        <script>
        // 조회된 배송상태에 selected
        document.addEventListener("DOMContentLoaded", function() {

        	var deliveryStatus = "${requestScope.o.deliveryStatus}";

            var dropdown = document.querySelector("select[name='deliveryStatus']");

            for (var i = 0; i < dropdown.options.length; i++) {
                if (dropdown.options[i].value === deliveryStatus) {
                	
                    dropdown.options[i].selected = true;
                    
                    break;
                }
            }
        });
        </script>
       
	</div>

</body>
</html>

