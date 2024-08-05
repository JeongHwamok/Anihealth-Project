<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>애니헬스</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<!-- 별점 총 비율 조회  -->
<script type="text/javascript">
  // 리뷰 비율 조회
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
	  
	  $.ajax({
		  
		  url : "selectReview.ad",
		  type : "post",
		  success : function(result) {
			  
			  // 헤더를 추가
			  var dataArray = [
				  ['Task', 'Hours per Day']
			  ];
	
			  // 결과를 dataArray에 추가
			  for(let i in result) {
				  
				  dataArray.push([result[i].rating + ' 점', result[i].count]);
				  
			  }
	
			  var data = google.visualization.arrayToDataTable(dataArray);
			  
			  var options = {
				  height: 350,
				  title: '리뷰 별점별 비율',
			  }; 
	
			  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
	
			  chart.draw(data, options);
			  
		  },
		  error : function() {
			  console.log("리뷰조회 ajax 통신 실패!");
		  }
		  
	  })

  }
</script>
<script>
	// 6개월간 상품 매출액 조회
	google.charts.load('current', {packages:['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		
		$.ajax({
			url: "selectTotal.ad",
			type: "post",
			success: function(result) {
				
				console.log(result);
				
				// 헤더를 추가
				var dataArray = [
					['Month', 'Total Sales']
				];
				
				for(let i = 0; i < result.length; i++) {
					dataArray.push([result[i].MONTH, parseFloat(result[i].TOTAL_SALES)]);
				}
				
				var data = google.visualization.arrayToDataTable(dataArray);
				
				const options = {
				  title: '6개월 간 상품 매출액',
				  hAxis: {title: 'Month'},
				  vAxis: {title: 'Total Sales (원)'},
				  legend: 'none',
				  format: 'currency',
				  height : 350,
				  formatType: 'long'
				};
				
				const chart = new google.visualization.LineChart(document.getElementById('myChart'));
				chart.draw(data, options);
				
			},
			error: function() {
				console.log("매출조회 ajax 통신 실패!");
			}
			
		});
	
	}
</script>

<head>
<style>
	a {
		color: #57585c;
	}
	
	a:hover {
		color: gray;
		text-decoration: none;
	}
	
     div {
        box-sizing: border-box;
        /* border : 1px solid darkblue;  */
    }

    html,
    body {
        margin: 0;
        padding: 0;
    }

    .outer {
        width: 100%;
        padding-top: 10px;
        padding-bottom: 150px;
        text-align: center;
    }

    #main {
        width: 70%;
        margin: auto;
    }

    /* 제목 영역 시작 */
    .header-product {
        width: 68%;
        margin-bottom: 50px;
        margin: auto;
    }

    .header-product h1 {
        color: #57585c;
        text-align : left;
    }

    /* 제목 영역 끝 */

    .card {
        padding: 1rem;
        margin: 1rem 0;
        border: 1px solid transparent;
        /* 기본 보더를 투명으로 설정 */
        border-radius: 10px;
    }

    .card-body {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .content-center {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .icon {
        font-size: 1.5rem;
        color: #59595d;
        margin-bottom: 10px;
    }

    .total-user {
        font-weight: bold;
        color: #57585c;
    }

    .total-user-count {
        font-size: 1.5rem;
        font-weight: bold;
        color: #5a5c69;
    }

    .card-container {
        display: flex;
        justify-content: space-around;
        margin-bottom: 20px;
    }

    .card-item {
        flex: 1; /* 동일한 비율로 너비 설정 */
        margin: 0 10px; /* 좌우 마진 */
    }

   /* 각 카드 아이템 배경색 설정 */
    .card-item-1 { background-color: antiquewhite; }
    .card-item-2 { background-color: lightblue; }
    .card-item-3 { background-color: rgb(180, 236, 180); }
    .card-item-4 { background-color: rgb(245, 153, 153); }

  /* 차트 공통 스타일 */
    #chart1, #chart2 {
        display: flex; /* 플렉스박스 */
        justify-content: center; /* 가로 중앙 정렬 */
        /* border: 1px solid black; */ /* 검은색 테두리 */
        margin: 10px; /* 주변 여백 */
        height: 400px; /* 높이 */
        width: 100%; /* 너비 */
    }

    #chart1>.cart1-1, #chart1>.cart1-2 {
        width: 50%; /* 너비 50% */       
        padding: 10px; /* 내부 패딩 */
    }
    #chart1>.cart1-2{
        width: 48%;
        height: 93%;
        /* 월별매출액높이 */  
        padding: 10px;       
    }

    .cart1-1 {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }
    .cart1-1>div {
        width: 48%; 
        height: 48%; 
        display: flex; 
        justify-content: center; 
        align-items: center; 
        border-radius: 10px;
        background-color: #f8f9fa; 
    }

    .cart1-2 {
        background-color: #d4e5f7; 
        border-radius: 10px; 
    }

    .icon-small {
        font-size: 1.2rem;
        color: #59595d;
        margin-bottom: 5px;
    }

    .total-user-small {
        font-weight: bold;
        color: #57585c;
    }

    .total-user-count-small {
        font-size: 1.2rem;
        font-weight: bold;
        color: #5a5c69;
    }

    #chart2>div {
        width: 100%;
        max-width: 600px; /* 최대 너비를 600px로 제한 */
        margin: 0px 10px;
        height: 100%;
       /*  border: 1px solid black; */
    }
    /* 차트 2의 항목 스타일링 */
    #chart2 .cart1-2 {
        width: 48%; 
        height: 93%; /* 높이 조정, #chart1>.cart1-2 스타일을 참조 */
        margin: auto; 
        padding: 10px;
        background-color: #d4e5f7;
        border-radius: 10px; 
    }
    
    #chart2>div {
	    width: 150%;
	    max-width: 800px;  /* 기존 크기 유지 */
	    margin: 0px 10px;
	    height: 150%;
	    /* border: 1px solid black; */
	}

    .custom-size { margin: auto; /* 중앙 정렬 */}
    
    .rank {
    	border-bottom : 1px solid white;
    	border-top : 1px solid white;
    }
    
    /* 부트스트랩 테이블 선의 색 변경 */
    .rankTh {
        border-bottom: 2px solid white !important;
        border-top: 2px solid white !important;
    }
    
    .rankTd {
        border-bottom: 2px solid white !important;
    }
</style>
</head>
<body>

	<br>

    <div class="outer">
        <div class="header-product" align="center">
            <h1>Dashboard</h1>
        </div>

		<br>        

        <div id="main">
            <div class="card-container">
                <div class="card card-item card-item-1">
                    <div class="card-body">
                        <div class="content-center">
                            <i class="fas fa-dollar-sign icon"></i>
                            <div class="total-user">총 이용자수 / 총 회원수</div>
                            <div class="total-user-count" id="member"></div>
                        </div>
                    </div>
                </div>
                <div class="card card-item card-item-2">
                    <div class="card-body">
                        <div class="content-center">
                            <i class="fas fa-dollar-sign icon"></i>
                            <div class="total-user">미처리 문의글수</div>
                            <div class="total-user-count" id="inquiry"></div>
                        </div>
                    </div>
                </div>
                <div class="card card-item card-item-3">
                    <div class="card-body">
                        <div class="content-center">
                            <i class="fas fa-dollar-sign icon"></i>
                            <div class="total-user">환불 미처리건수</div>
                            <div class="total-user-count" id="refund"></div>
                        </div>
                    </div>
                </div>
                <div class="card card-item card-item-4">
                    <div class="card-body">
                        <div class="content-center">
                            <i class="fas fa-dollar-sign icon"></i>
                            <div class="total-user sales"></div>
                            <div class="total-user-count" id="sales"></div>
                        </div>
                    </div>
                </div>
            </div>

            <br>

            <div id="chart1">
                <div class="cart1-1">
                    <div>
                        <div class="content-center-small">
                            <i class="fas fa-shopping-cart icon-small"></i>
                            <div class="total-user-small">주문결제건수</div>
                            <div class="total-user-count-small" id="order"></div>
                        </div>
                    </div>
                    <div>
                        <div class="content-center-small">
                            <i class="fas fa-box icon-small"></i>
                            <div class="total-user-small">배송준비건수</div>
                            <div class="total-user-count-small" id="prepare"></div>
                        </div>
                    </div>
                    <div>
                        <div class="content-center-small">
                            <i class="fas fa-truck icon-small"></i>
                            <div class="total-user-small">배송중건수</div>
                            <div class="total-user-count-small" id="deliver"></div>
                        </div>
                    </div>
                    <div>
                        <div class="content-center-small">
                            <i class="fas fa-check icon-small"></i>
                            <div class="total-user-small">배송완료건수</div>
                            <div class="total-user-count-small" id="complete"></div>
                        </div>
                    </div>
                </div>
                <div class="cart1-2 custom-size">
                    <div class="">
                    	<h5>카테고리별 재고순위</h5>
                    	<table class="table">
                    		<thead>
	                    		<tr>
	                    			<th class="rankTh">순위</th>
	                    			<th class="rankTh">강아지</th>
	                    			<th class="rankTh">고양이</th>
	                    			<th class="rankTh">공통</th>
	                    		</tr>
	                    	</thead>
	                    	<tbody class="stockRank"></tbody>
                    	</table>
                    </div> 
                 </div>
                 
           	</div>

            <br>  <br>
            <div id="chart2">
                <div class="cart1-2">
                    <div>
                        <div id="myChart" style="width:100%;  height:100%;"></div>
	                </div>
		        </div>
                <div class="cart1-2">
                	<div id="piechart"  style="width:100%;  height:100%;"></div>
                </div>
            </div>
	
	       	<br><br>
	
        </div>
    </div>

	<script>
		// 회원 통계
		$(function () {
			
			$.ajax({
				
				url : "countMember.ad",
				type : "post",
				success : function(result) {
					
					let member = result.member;
					let activeMember = result.activeMember;
					
					$("#member").html("<a href='member.ad'>" + activeMember + " / " + member + "</a>");
					
				},
				error : function() {
					console.log("회원 수 조회 ajax 통신 실패!");
				}
				
			})
			
		}); 
	
		// 문의 통계
		$(function() {
			
			$.ajax({
				
				url : "countInquiry.ad",
				type : "post",
				success : function(result) {
					
					let inquiryCount = result.inquiry;
					
					$("#inquiry").html("<a href='inquiry.ad'>" + inquiryCount + " 건</a>" );
					
				},
				error : function() {
					console.log("문의 수 조회 ajax 통신 실패!");
				}
				
			})
			
		});
		
		// 문의 통계
		$(function() {
			
			$.ajax({
				
				url : "countRefund.ad",
				type : "post",
				success : function(result) {
					
					let refundCount = result.refund;
					
					$("#refund").html("<a href='refund.ad'>" + refundCount + " 건</a>" );
					
				},
				error : function() {
					console.log("환불 수 조회 ajax 통신 실패!");
				}
				
			})
			
		});
		
		// 배송 통계
		$(function() {
			
			$.ajax({
				
				url : "countDelivery.ad",
				type : "post",
				success : function(result) {
					
					let order = "";
					let prepare = "";
					let deliver = "";
					let complete = "";
					
					for(let i = 0; i < result.length; i++) {
							
						switch(result[i].DELIVERY_STATUS) {
						
						case '결제완료' : order = result[i].STATUS_COUNT; break;
						case '배송준비중' : prepare = result[i].STATUS_COUNT; break;
						case '배송중' : deliver = result[i].STATUS_COUNT; break;
						case '배송완료' : complete = result[i].STATUS_COUNT; break;
						
						}
					}
					
					$("#order").html("<a href='payOrder.ad'>" + order + " 건</a>");
					$("#prepare").html("<a href='prepareOrder.ad'>" + prepare + " 건</a>");
					$("#deliver").html("<a href='deliverOrder.ad'>" + deliver + " 건</a>");
					$("#complete").html("<a href='completeOrder.ad'>" + complete + " 건</a>");
					
				},
				error : function() {
					console.log("환불 수 조회 ajax 통신 실패!");
				}
				
			})
			
		});
		
		// 월 매출 통계
		$(function() {
			
			var date = new Date(); // 현재 날짜
			var year = date.getFullYear(); // 연도
			var month = date.getMonth() + 1; // 월
			
			$.ajax({
				
				url : "selectSales.ad",
				type : "post",
				data : {"year" : year, "month" : month},
				success : function(result) {
					
					// 가격을 포맷팅
                    let formattedPrice = parseFloat(result).toLocaleString('ko-KR');
					
					$(".sales").html(year + "년 " + month + "월 매출액");
					
					$("#sales").html(formattedPrice + " 원");
					
				},
				error : function() {
					console.log( "매출 조회 ajax 통신 실패!");
				}
				
			})
			
		});
		
		// 카테고리별 재고순위 통계
		$(function() {
			
			$.ajax({
				
				url : "rankStock.ad",
				type : "post",
				success : function(result) {
					
					let dog = [];
					let cat = [];
					let common = [];
					
					for(let i = 0; i < result.length; i++) {
						
						switch(result[i].CATEGORY) {
						
						case '강아지' : dog.push(result[i]); break;
						case '고양이' : cat.push(result[i]); break;
						case '공통' : common.push(result[i]); break;
						
						}
						
					}
					
					let str = "";
					
					for(let i = 0; i < 5; i++) {
						
						str += "<tr>"
							 +		"<td class='rankTd'>" + (i + 1) + "순위 </td>"
							 + 		"<td class='rankTd'>" + dog[i].PRODUCT_NAME + "  |  " + dog[i].PRODUCT_STOCK + " 개</td>"
							 + 		"<td class='rankTd'>" + cat[i].PRODUCT_NAME + "  |  " + cat[i].PRODUCT_STOCK + " 개</td>"
							 + 		"<td class='rankTd'>" + common[i].PRODUCT_NAME + "  |  " + common[i].PRODUCT_STOCK + " 개</td>"
							 + "<tr>"
						
					}
					
					$(".stockRank").html(str);
					
				},
				error : function() {
					console.log( "재고순위 조회 ajax 통신 실패!");
				}
				
			})
			
		});
	</script>

</body>
</html>