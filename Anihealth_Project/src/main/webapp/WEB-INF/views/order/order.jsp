<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANIHEALTH</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style>
        /* 메인 영역 시작 */
        .parent {
            width: 100%;
            text-align: center;
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
            margin-top: 50px;
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
            padding: 50px 100px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(67, 75, 73, 0.3);
            border-radius: 8px;
            box-sizing: border-box;
            position: relative;
        }

        .cart-table {
            width: 100%;
            border-collapse: collapse;
            margin: auto;
            text-align: center;
        }
        .cart-table th,
          .cart-table td  
        {
            padding: 15px;
            text-align: left;}

     .cart-table th {
            color: rgb(77, 75, 75);
            font-size: 160%;
            border-bottom: 3px solid rgb(82, 166, 121);
        }

        #product-header {
            padding-left: 10px; 
        }

        .cart-table-content td {
            vertical-align: middle; 
            height: 110%;
        }

        .cart-table-inner td{
            font-size: 100%;
        }

        .item-container {
            display: flex;
            align-items: center; 
            padding: 0px 10px; 
            flex-direction: row; 
        }
        .img-size {
            width: 110%;
            height: auto;
            object-fit: cover;
            max-width: 150px;
            border-radius: 10px;
        }
        .item-text {
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding-left: 40px; 
        }
        .item-title {
            font-weight: bold;
            font-size: large;
        }
        .item-subtitle {
            font-weight: bold;
            color: gray;
        }
        .total-price-container {
             display: flex;
            justify-content: space-between; 
            padding: 30px 70px; /* 패딩 적용 */
            width: 100%;
            border-top: 1.5px solid gray; /* rgb(82, 166, 121); */
            border-bottom: 1.5px solid gray; /* rgb(82, 166, 121); */
        }
        .cart-total-price td{
            padding: 20px;
        }
        .total-bold {
            color: rgb(77, 75, 75);
            font-weight: bold;
        }

        .grand-total {
            color: rgb(77, 75, 75);
            font-size: 20px;
            font-weight: bold;
        }
        .text-grand-total {
            margin-right: auto; 
            font-size: large;
            font-weight: bold;
            color: rgb(77, 75, 75);
        }
        #checkout-button {
             display: block;
            box-sizing: border-box;
            width: auto;
            margin: 20px;
            padding: 10px 50px;
            margin-left: 75%;
            border: 3px solid rgb(82, 166, 121);
            border-radius: 5px;
            cursor: pointer;
        }      
          #checkout-button:hover{
         	 background-color:rgb(82, 166, 121);
       	  color: white;
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
        .address-item {
            margin: 3px ;
        }  
        .form-control {
            max-width: 830px; 
         }

        /* 전체 내용 영역 끝 */
        /* 메인 영역 끝 */

    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />
<div class="parent">
    <div class="parent-content">
        <div class="header-faq">
            <h1>주문 / 결제 </h1>
        </div>
        <br>
        <div class="cart-background">
            <!-- 주문자 정보 테이블 -->
            <table class="cart-table" id="cart-table1" >              
                <thead>
                    <tr>
                        <th class="cart-table-item" colspan="4" id="product-header">주문자 정보</th>
                    </tr>
                </thead>
                <tbody class="cart-table-content" style="margin: 3px ;">
                    <tr class="cart-table-inner">
                        <td colspan="2" style="font-size: large;">
                          ${requestScope.orderItems[0].userName}
                        </td>
                        <td class="quantity-content" id="quantity-cell" style="font-size: large;">
                            <div class="quantity-wrapper">
                                <span id="quantity">${requestScope.orderItems[0].phone} </span>
                            </div>
                        </td>
                        <td class="total-price" data-unit-price="25000" style="font-size: large;">
                            ${requestScope.orderItems[0].email}
                        </td>  
                    </tr>
                </tbody>
            </table>
            <br><br><br>
            
            <!-- 배송지 정보 테이블 -->
            <table class="cart-table" id="cart-table2">
                <thead>
                    <tr>  
                        <th class="cart-table-item" colspan="4" id="product-header">배송지</th>
                    </tr>
                </thead>
                <tbody class="cart-table-content">
                    <tr class="cart-table-inner">
                        <td colspan="4">
                            <div class="address-item">
                                <span class="badge badge-pill" style="margin-bottom: 5px; ">배송지</span>
                                <select class="form-control" id="delivery-select" onchange="updateAddress()" style="margin-bottom: 15px;">
                                    <option value="">배송지를 선택해 주세요</option>
                                    <c:forEach var="address" items="${requestScope.deliveryList}">
                                        <option value="${address.deliveryNo}"
                                                data-address="${address.deliveryAddress}"
                                                data-phone="${address.deliveryZipcode}">
                                            ${address.deliveryName}
                                        </option>
                                    </c:forEach>
                                </select>
                                
                                <label for="address-details">º 이름 </label>
                                <input type="text" id="userName" class="form-control form-control address-details" value="" oninput="checkFormCompletion()" style="margin-bottom: 15px;">
                              
                                <label for="address-details">º 주소</label>
                                <input type="text" id="address-details" class="form-control form-control address-details" value="" oninput="checkFormCompletion()" style="margin-bottom: 15px;">
                               
                                <label for="zipCode">º 우편번호 </label>
                                <input type="text" id="zipCode" class="form-control form-control address-details" value="" oninput="checkFormCompletion()" style="margin-bottom: 15px;">
                               
                                <label for="phone">º 전화번호</label>
                                <input type="text" class="form-control form-control" id="phone" value="" oninput="checkFormCompletion()" placeholder="-포함하여 입력해주세요" style="margin-bottom: 15px;">
                              
                                <label for="delivery-request">º 배송 요청사항 </label>
                                <select id="delivery-request" class="form-control" style="margin-bottom: 15px;">
                                    <option value="배송요청사항 없음">배송요청사항 없음 </option>
                                    <option value="문앞에 놔주세요">문앞에 놔주세요</option>
                                    <option value="경비실에 맡겨주세요">경비실에 맡겨주세요</option>
                                </select>
                            </div>
                        </td>                                               
                    </tr>
                </tbody>
            </table>
            <br><br><br>

            <!-- 주문 상품 정보 테이블 -->
            <table class="cart-table" id="cart-table3">
                <thead>
                    <tr>   
                        <th class="cart-table-item" colspan="4" id="product-header">주문 상품</th>
                    </tr>
                </thead>
                <tbody class="cart-table-content">
                    <c:set var="totalPrice" value="0" />
                    <c:forEach var="oi" items="${requestScope.orderItems}">
                        <tr class="cart-table-inner">
                            <td colspan="2">
                                <div class="item-container">
                                    <img class="img-size" src="${oi.productThumbnailPath}" alt="영양제이미지">
                                    <div class="item-text">
                                        <p class="item-subtitle">${oi.category} 영양제 </p>
                                        <p class="item-title" style="font-size: large; font-weight: bold;">${oi.productName}</p>
                                    </div>
                                </div>
                            </td>
                            <td class="quantity-content" id="quantity-cell" style="font-size: large;">
                                <div class="quantity-wrapper">
                                    <span id="quantity">${oi.cartQuantity} 개</span>
                                </div>
                            </td>
                            <td class="total-price" data-unit-price="${oi.cartPrice}" style="font-size: large; font-weight: bold;">
                                &#8361;<fmt:formatNumber value="${oi.cartPrice * oi.cartQuantity}" type="number" groupingUsed="true"/> 원
                            </td>
                        </tr>
                        <c:set var="totalPrice" value="${totalPrice + (oi.cartPrice * oi.cartQuantity)}" />
                    </c:forEach>
                    <tr class="cart-total-price">
                        <td colspan="5">
                            <div class="total-price-container">
                                <div class="text-grand-total">총 가격</div>
                                <div class="grand-total">&#8361; <fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true"/> 원</div>
                                <input type="hidden" id="totalPrice" value="${totalPrice}" />
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
             <input type="hidden" id="productNos" value="<c:forEach var='oi' items='${requestScope.orderItems}'>${oi.productNo},</c:forEach>" />
        </div>
         <br>
        <button class="btn btn-lg right-button" id="checkout-button" onclick="payment()">결제하기</button>
        <br><br><br>
    </div>
</div>
<script>
function updateAddress() {
    var selectedOption = document.getElementById("delivery-select").selectedOptions[0];
    document.getElementById("address-details").value = selectedOption.getAttribute("data-address");
    document.getElementById("zipCode").value = selectedOption.getAttribute("data-phone");
    checkFormCompletion();
}

function payment() {
    var address = document.getElementById("address-details").value;
    var zipCode = document.getElementById("zipCode").value;
    var phone = document.getElementById("phone").value;
    var totalPrice = document.getElementById("totalPrice").value;

    if (!address || !zipCode || !phone) {
        alert("배송지 정보를 입력해야합니다.");
        return;
    }

    console.log("test");
    const delivery = document.getElementById("delivery-request").value;

    let random = Math.floor(Math.random() * 900000 + 100000);
    let random2 = Number("" + new Date().getTime() + random);
    console.log(random2);
    const IMP = window.IMP;
    IMP.init("imp70105832");
    IMP.request_pay(
        {
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid: random2,
            name: "영양제",
            amount: totalPrice,
            buyer_email: "${requestScope.orderItems[0].email}",
            buyer_name: "${requestScope.orderItems[0].userName}",
            buyer_tel: phone,
            buyer_addr: address,
            buyer_postcode: zipCode,
        },
        async (rsp) => {
            if (rsp.success) {
                console.log("결제성공");
                console.log(rsp);

                let orderItems = [];
                <c:forEach var="oi" items="${requestScope.orderItems}">
                    orderItems.push({
                        productNo: "${oi.productNo}",
                        cartQuantity: "${oi.cartQuantity}",
                        cartPrice: "${oi.cartPrice}",
                        cartNo : "${oi.cartNo}"
                    });
                </c:forEach>

                const orderData = {
                    orderNo: rsp.merchant_uid,
                    payCode: rsp.pg_tid,
                    orderPrice: totalPrice,
                    orderRequest: delivery,
                    orderPhone: phone,
                    orderAddress: address,
                    orderZipcode: zipCode,
                    orderItems: orderItems
                };

                $.ajax({
                    url: "order.in",
                    type: "post",
                    contentType: "application/json",
                    data: JSON.stringify(orderData),
                    success: function(result) {
                        console.log("결제저장 성공");
                        window.location.href = "${pageContext.request.contextPath}"; 
                    },
                    error: function() {
                        console.log("결제저장 실패");
                    }
                });
            } else {
                console.log("결제실패");
            }
        }
    );
}
</script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>