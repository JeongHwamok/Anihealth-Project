<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">

 <!-- 부트스트랩 연동 코드 (CDN방식)-->
 <!-- Latest compiled and minified CSS -->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 <!-- jQuery library -->
 <!-- 온라인 방식 -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 <!-- Popper JS -->
 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
 <!-- Latest compiled JavaScript -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
 <!-- Font Awesome CSS 포함 -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

 <title>마이페이지 메인</title>
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
	    margin-top : 50px;
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
          font-size: 25px;
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
          font-size: 18px;
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
          margin-bottom: 20px;
      }


      .form-actions {
          margin-top: 20px;
          display: flex;
          justify-content: center;
          gap: 20px;
      }

      #btn-update {
          padding: 10px 30px;
          border: none;
          border-radius: 4px;
          cursor: pointer;
          /*background-color: rgb(191, 216, 175);*/
          border: 1px solid rgb(191, 216, 175);
          color: black;
      }
      
      #btn-update:hover {
      	background-color: rgb(191, 216, 175);
      	color: white;
      }
      
      #btn-pwdUpdate{
     		padding: 10px 30px;
          border: none;
          border-radius: 4px;
          cursor: pointer;
          /*background-color: rgb(242, 133, 133);*/
          border: 1px solid rgb(191, 216, 175);
          color: black;
      }
      
      #btn-pwdUpdate:hover{
     		background-color: rgb(191, 216, 175);
      	color: white;
      }
      
      #btn-delete {
          padding: 10px 30px;
          border: none;
          border-radius: 4px;
          cursor: pointer;
          /*background-color: rgb(242, 133, 133);*/
          border: 1px solid rgb(242, 133, 133);
          color: black;
      }
      
      #btn-delete:hover {
          background-color: rgb(242, 133, 133);
          color: white;
      }
      
      

      #myPage_tb {
          width: 100%;
          border-collapse: collapse;
          margin-bottom: 20px;
      }

      #myPage_tb th, #myPage_tb td {
      padding: 10px;
      text-align: left;
	  }
	
	  #myPage_tb th {
	      width: 20%;
	  }
		
	  #myPage_tb td {
	      width: 80%;
		  border: none; /* 테두리 제거 */
	  	  }
	     .gray-line {
	      border-bottom: 2px solid lightgray;
	  }
	       
	  .form-buttons {
	      text-align: center;
	  }
	    
	  .btn {
	      display: inline-block;
	      margin: 0 5px;
	  }
	  
	  
	.outer {
		width: 100%;
        text-align: center;
        padding-top: 100px;
        padding-bottom: 80px;
	}
	
	#list-area {
		width: 100%;
        margin: 0 auto; 
        /* 부모 요소의 가운데 정렬을 위해 auto 마진 추가 */
        text-align: center;
	}
	
	/* 제목 영역 시작 */
 	.header-product {
        margin-left: auto;
        margin-right: auto;
        margin-bottom: 30px;   
    }

    .header-product h1 {
        color: #57585c;
        text-align: center;
    }
    /* 제목 영역 끝 */
    
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
   
   #list-area th {
    	padding : 20px 10px;
    }
    
    #list-area tbody tr:hover {
    	background-color : #f1f7ee;
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
   
   #list-area th {
    	padding : 20px 10px;
    }
    
    #list-area tbody .listTr:hover {
    	background-color : #f1f7ee;
    }
    
    #list-area tbody .noListTr:hover {
    	background-color : white;
    }
    
     #list-area tbody .noListTr td {
    	text-align : center;
    	padding-top : 50px;
    	font-size : 20px;
    }
</style>
</head>
<body>
    <!-- 헤더바 -->
    <jsp:include page="../../common/header.jsp" />
   
    <div class="mypage-panel-container-my">
        <div class="mypage-panel-my">
            <div class="sidebar-my">
                <nav-my>
                    <ul>
                        <li>
                        	<span>주문 정보</span> <br>
                        	<a href="order.ad">주문 관리</a> <br> 
                        	<a href="refund.ad">환불 관리</a> <br>
                        </li>	
                        <li>
                        	<span>배송 정보</span> <br> 
                        	<a href="payOrder.ad">결제완료</a> <br> 
                        	<a href="prepareOrder.ad">배송준비중</a> <br> 
                        	<a href="deliverOrder.ad">배송중</a> <br> 
                        	<a href="completeOrder.ad">배송완료</a> <br> 
                        </li>
                    </ul>
                </nav-my>
            </div>
            <div class="content-my">
                <div class="outer">
		
					<div class="header-product">
			            <h1>배송완료</h1>
			        </div>
                
                	<table class="table table-hover" id="list-area">
			        	<thead>
			        		<tr>
			        			<th>주문 번호</th>
			        			<th>주문 날짜</th>
			        			<th>회원 아이디</th>
			        			<th>배송 상태</th>
			        			<th>결제 가격</th>
			        		</tr>
			        	</thead>
			        	
		        		<tbody>
		        			<c:choose>
			        			<c:when test="${ requestScope.pi.listCount == 0 }">
					        		<tr class="noListTr">
					        			<td colspan="6">조회된 결과가 없습니다.</td>
					        		</tr>
					        	</c:when>
					        	<c:otherwise>
					        		<c:forEach var="o" items="${ requestScope.list }">
					        			<tr class="listTr">
					        				<td>${ o.orderNo }</td>
					        				<td>${ o.orderDate }</td>
					        				<td>${ o.userId }</td>
					        				<td>${ o.deliveryStatus }</td>
					        				<td>
					        					<fmt:formatNumber value="${ o.orderPrice }" type="number" groupingUsed="true" /> &nbsp;원
					        				</td>
					        			</tr>
					        		</c:forEach>
			        			</c:otherwise>
				        	</c:choose>
		        		</tbody>
			        	
			        </table>
			        
			        <c:choose>
			        	<c:when test="${ requestScope.pi.listCount != 0 }">
					        <!-- 페이징바가 보여질 부분 -->
					        <div align="center" class="paging-area">
					           <div class="paging-btns">
					           
					            <c:choose>
					                <c:when test="${ requestScope.pi.currentPage eq 1 }">
					                    <button onclick="" class="disabled">&lt;</button>
					                </c:when>
					                <c:otherwise>
					                    <button onclick="location.href='completeOrder.ad?cpage=${ requestScope.pi.currentPage - 1 }'">&lt;</button>
					                </c:otherwise>
					            </c:choose>
					            
					            <c:forEach var="p" begin="${ requestScope.pi.startPage }" 
					                           end="${ requestScope.pi.endPage }" step="1">
					                <c:choose>
					                    <c:when test="${ requestScope.pi.currentPage ne p }">
					                        <button onclick="location.href='completeOrder.ad?cpage=${ p }'">${ p }</button>
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
					                    <button onclick="location.href='completeOrder.ad?cpage=${ requestScope.pi.currentPage + 1 }'">&gt;</button>
					                </c:otherwise>
					            </c:choose>
					            
					           </div>
					       </div>
						</c:when>
				    </c:choose>
	            </div>
	        </div>
        
        <script>
	       // 상세조회 function
	       $(function() {
	         		
			 $("#list-area>tbody>.listTr").click(function() {
					
				let orderNo = $(this).children().eq(0).text();
				
				location.href="detailOrder.ad?ono=" + orderNo;
					
			 });            		
	          	
	       });
       </script>
       
    </div>
  
</body>
</html>
