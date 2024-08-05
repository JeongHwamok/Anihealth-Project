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

        .cart-background {
            width: 70%;
            height: auto;
            margin: auto;
            padding: 50px 80px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(67, 75, 73, 0.3);
            border-radius: 8px;
            box-sizing: border-box;
            position: relative;
        }
        .cart-table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0px 10px;
        }

        .left-header {
            display: flex;
            align-items: center;
        }

        .right-header {
            display: flex;
            align-items: center;
        }
        .header-text {
            color: #696969;
            font-size: 110%;
        }

        .left-header .header-text{
            margin-bottom: 0;
        }
        .right-header .header-text{
            background-color: #99BC85;
            color: white;
           margin-bottom: 5px;
        }


        .cart-table {
            width: 100%;
            border-collapse: collapse;
            margin: auto;
            text-align: center;
        }

        .cart-table th,
        .cart-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #63a07a;
        }

        .cart-table th {
            background-color:#eaf6e4;
            color: rgb(104, 103, 103);
            font-size: 130%;
        }
        .custom-checkbox {
        width: 15px; 
        height: 15px; 
       }


        #product-header {
            padding-left: 150px; 
        }
        
        #product-count{
            padding-left: 20px;
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
            width: 150px;
            height: 120px;
            /* object-fit: cover;
            max-width: 150px; */
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
        }

        .item-subtitle {
            font-weight: bold;
            color: gray;
        }
    

        /* 수량 버튼 및 콘텐츠 스타일링 */
        .quantity-content {
            padding-left: 0; /* 패딩 초기화 */
        }

        #quantity-cell {
            padding-left: 0; /* padding-left를 초기화 */
        }

        .quantity-wrapper {
            display: flex;
            align-items: center; 
            padding-left: 0px; 
             justify-content: center; /* Flexbox를 사용하여 버튼들을 중앙에 배치 */
		    width: 100%; /* 필요한 경우 width 조정 */
		    white-space: nowrap;
        }
         .total-price {
		     white-space: nowrap; /* 줄 바꿈 방지 */
		     width: 250px; /* 넉넉한 너비 설정 */
		 }

        #minus, #plus {
            background-color: #BFD8AF;
            color: white;
            width: 30px;
            height: 30px;
            border: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0;
            font-weight: bold;
        }

        .total-price-container {
            display: flex;
            justify-content: space-between; 
            padding: 5px 70px; /* 패딩 적용 */
            width: 100%;
        }
        .cart-total-price td{
            padding: 20px;
        }
        .total-bold {
            color: rgb(9, 80, 26);
            font-weight: bold;
        }

        .grand-total {
           font-size: 20px;
            font-weight: bold;
        }
        .text-grand-total {
            margin-right: auto; 
            font-size: large;
            font-weight: bold;
        }

        #checkout-button {
            display: block;
            box-sizing: border-box;
            width: auto;
            margin: 20px;
            padding: 10px 50px;
            margin-left: 75%;
             border-radius: 5px;
            cursor: pointer;
            border: 3px solid #99BC85;
        }
        
                  #checkout-button:hover {
          	cursor: pointer;
          	color: #fff;
          	background-color: #99BC85;
          }
          .quantity {
		    min-width: 30px; /* 충분한 공간 확보 */
		    display: inline-block;
		    text-align: center;
		}
		.cart-table th#product-count, .cart-table td#quantity-cell {
		  width: 200px;  /* 고정 너비 설정 */
		}
		
		.cart-table th:last-child, .cart-table td.total-price {
		    width: 200px; /* 가격 열의 고정 너비 설정 */
		}
		 .cart-table th, .cart-table td {
		    min-width: 60px; /* 최소 너비 설정 */
		    text-align: left; /* 정렬 방식 지정 */
		}
		  
		     /* 수량 헤더와 셀의 텍스트를 중앙으로 정렬 */
		.cart-table th#product-count, .cart-table td#quantity-cell {
		    text-align: center; /* 중앙 정렬 */
		    padding-left: 0; /* 추가된 패딩 제거 */
		}
		
		/* 수량 조절 버튼을 중앙 정렬 */
		.quantity-wrapper {
		    justify-content: center; /* Flexbox를 사용하여 버튼들을 중앙에 배치 */
		    width: 100%; /* 필요한 경우 width 조정 */
		}
		  #product-count, #quantity-cell {
		    padding-right: 90px; /* 패딩을 줄임으로써 수량을 왼쪽으로 이동 */
		}
		  
		  .cart-table th:last-child { /* 가정하에 마지막 th가 가격을 나타낸다고 할 때 */
		    padding-left: 50px; /* 가격 정보를 오른쪽으로 이동 */
		}
		


        /* 전체 내용 영역 끝 */
       
    </style>
    
</head>
<body>
<jsp:include page="../common/header.jsp" />
  
   <div class="parent">
    <div class="parent-content">
        <div class="header-faq">
            <h1>장바구니</h1>
        </div>
        <br>
        
        
        <div class="cart-background">
            <div class="cart-table-header">
                <div class="left-header">
                    <p class="header-text">전체선택</p>
                </div>
                <div class="right-header">
                    <button class="btn header-text" id="delete-selected">선택삭제</button>
                </div>
            </div>
            
	       
            <table class="cart-table">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="checkAll" class="custom-checkbox"></th>
                        <th class="cart-table-item" colspan="2" id="product-header">제품</th>
                        <th id="product-count">수량</th>
                        <th>가격</th>
                    </tr>
                </thead>
                 <c:choose>
	        		<c:when test="${not empty requestScope.list }">
                <tbody class="cart-table-content">
                    <c:forEach var="ca" items="${requestScope.list}">
                        <c:if test="${ca.userNo eq sessionScope.loginUser.userNo}">
                            <tr class="cart-table-inner">
                                <td>
                                    <input type="checkbox" class="custom-checkbox" name="selectedItems" value="${ca.cartNo}:${ca.cartQuantity}" checked data-item-id="${ca.productNo}" data-cart-no="${ca.cartNo}">
                                </td>
                                <td colspan="2">
                                    <div class="item-container">
                                        <img class="img-size" src="${ca.productThumbnailPath}" alt="영양제이미지">
                                        <div class="item-text">
                                            <p class="item-subtitle">${ca.category} 영양제</p>
                                            <p class="item-title" style="font-size: large;">${ca.productName}</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="quantity-content" id="quantity-cell" style="font-size: large;">
                                    <div class="quantity-wrapper">
                                        <button id="minus" class="btn btn-sm minus" data-cart-no="${ca.cartNo}"> - </button>&nbsp;&nbsp;
                                        <span id="quantity-${ca.cartNo}" class="quantity">${ca.cartQuantity}</span>&nbsp;&nbsp;
                                        <button id="plus" class="btn btn-sm plus" data-cart-no="${ca.cartNo}"> + </button>
                                    </div>
                                </td>
                                <td class="total-price" data-unit-price="${ca.cartPrice}" style="font-size: large;">
                                    &#8361;<fmt:formatNumber value="${ca.cartPrice * ca.cartQuantity}" type="number" groupingUsed="true"/> 원
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                    <tr class="cart-total-price">
                        <td colspan="5">
                            <div class="total-price-container">
                                <div class="text-grand-total">총 가격</div>
                                <div class="grand-total">&#8361; 0 원</div>
                            </div>
                        </td>
                    </tr>
                    
                    </c:when>
			       	<c:otherwise>
			       		<tr>
			       			<td colspan="5" height="120px">
			       				<h4 align="center" style="color: gray"><br>장바구니 목록이 존재하지 않습니다.<br></h4>
			       			</td>
			       		</tr>
			       	</c:otherwise>
		        </c:choose>
                </tbody>
                
            </table>
            
        </div>
        <br>
        <c:choose>
     		<c:when test="${not empty requestScope.list }">
        <form id="orderForm" method="post" action="order.re">
         <input type="hidden" id="userNo" name="userNo" value="${sessionScope.loginUser.userNo}" />
            <button type="submit" class="btn btn-lg right-button" id="checkout-button">결제하기</button>
        </form>
        </c:when>
        <c:otherwise>
     		<tr>
     			<td colspan="5" height="120px"></td>
     		</tr>
     	</c:otherwise>
     	</c:choose>
    </div>
</div>
<script>
    $(document).ready(function() {
        // 초기 설정: 전체 선택 체크박스와 모든 개별 체크박스 체크
        $('#checkAll').prop('checked', true);
        $('input:checkbox').not('#checkAll').prop('checked', true);
        updateTotalPrice();
        toggleCheckoutButton();

        // 전체선택 체크박스 클릭 시
        $('#checkAll').click(function() {
            $('input:checkbox').not(this).prop('checked', this.checked);
            updateTotalPrice();
            toggleCheckoutButton();
        });

        // 선택삭제 버튼 클릭 시
        $('#delete-selected').click(function() {
            $('input:checkbox:checked').not('#checkAll').each(function() {
                var cartNo = $(this).data('cart-no');
                $.ajax({
                    type: "POST",
                    url: "cart.de",
                    data: { cartNo: cartNo },
                    success: function(result) {
                        if (result.success) {
                            $('input:checkbox[data-cart-no="' + cartNo + '"]').closest('tr').remove();
                            updateTotalPrice();
                            toggleCheckoutButton();
                            alert("장바구니 삭제 성공");
                        } else {
                            console.log("삭제 실패");
                        }
                    },
                    error: function() {
                        console.log("삭제 실패");
                    }
                });
            });
        });

        // + 버튼 클릭 시 수량 및 총 가격 업데이트
        $(document).on('click', '.plus', function() {
            var quantityElement = $(this).siblings('.quantity');
            var quantity = parseInt(quantityElement.text()) + 1;
            quantityElement.text(quantity);
            var cartNo = $(this).data('cart-no');
            updateItemPrice($(this));
            updateTotalPrice();
            updateQuantityInDb(cartNo, quantity);
        });

        // - 버튼 클릭 시 수량 및 총 가격 업데이트
        $(document).on('click', '.minus', function() {
            var quantityElement = $(this).siblings('.quantity');
            var quantity = parseInt(quantityElement.text()) - 1;
            if (quantity > 0) {
                quantityElement.text(quantity);
                var cartNo = $(this).data('cart-no');
                updateItemPrice($(this));
                updateTotalPrice();
                updateQuantityInDb(cartNo, quantity);
            }
        });

        // 개별 체크박스 클릭 시 총 가격 업데이트
        $(document).on('change', '.custom-checkbox', function() {
            updateTotalPrice();
            toggleCheckoutButton();
        });

        // 항목별 가격 업데이트
        function updateItemPrice(element) {
            var quantity = parseInt(element.siblings('.quantity').text());
            var unitPrice = parseFloat(element.closest('tr').find('.total-price').data('unit-price'));
            var newPrice = quantity * unitPrice;
            element.closest('tr').find('.total-price').text('₩ ' + newPrice.toLocaleString() + ' 원');
        }

        // 총 가격 업데이트
        function updateTotalPrice() {
            var totalPrice = 0;
            $('.cart-table-inner').each(function() {
                if ($(this).find('.custom-checkbox').is(':checked')) {
                    var quantity = parseInt($(this).find('.quantity').text());
                    var unitPrice = parseFloat($(this).find('.total-price').data('unit-price'));
                    totalPrice += quantity * unitPrice;
                }
            });
            $('.grand-total').text('₩ ' + totalPrice.toLocaleString() + ' 원');
        }

        // 결제하기 버튼 상태 업데이트
        function toggleCheckoutButton() {
            var anyChecked = $('.custom-checkbox:checked').not('#checkAll').length > 0;
            $('#checkout-button').prop('disabled', !anyChecked);
        }

        // 수량 업데이트를 DB에 반영하는 함수
        function updateQuantityInDb(cartNo, newQuantity) {
            $.ajax({
                type: "POST",
                url: "cart.up",
                data: {
                    cartNo: cartNo,
                    newQuantity: newQuantity
                },
                success: function(result) {
                    console.log("성공");
                },
                error: function() {
                    console.log("수량설정 실패");
                }
            });
        }

        // orderForm 제출 전에 선택된 항목을 추가하는 함수
        $('#orderForm').submit(function(event) {
            event.preventDefault(); // 기본 제출 동작 방지

            // 기존 숨겨진 필드 제거
            $('#orderForm').find('input[name="selectedItems"]').remove();

            // 선택된 항목 추가
            $('input:checkbox:checked').not('#checkAll').each(function() {
                var cartNo = $(this).data('cart-no');
                var quantity = parseInt($(this).closest('tr').find('.quantity').text());
                $('<input>').attr({
                    type: 'hidden',
                    name: 'selectedItems',
                    value: cartNo + ':' + quantity
                }).appendTo('#orderForm');
            });

            this.submit(); // 폼 제출
        });

        // 초기 총 가격 설정
        updateTotalPrice();
        toggleCheckoutButton();
        
    });
</script>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="../common/footer.jsp" />
</body>
</html>