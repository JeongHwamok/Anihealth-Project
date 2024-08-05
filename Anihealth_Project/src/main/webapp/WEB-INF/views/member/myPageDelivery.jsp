<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 다음 주소 API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
            margin-bottom: 20px;
        }

        .address-container {
		    border: 1px solid #ccc;
		    padding: 20px;
		    border-radius: 10px;
		    margin-bottom: 20px;
		    position: relative;
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

        .address-details {
            margin: 5px 0;
        }

        .btn {
		    margin-top: 10px;
		    display: inline-block;
		}
		
		#btn-edit {
		    position: absolute;
		    top: 24px;
		    right: 40px;
		    border: 2px solid rgb(153, 188, 133);
		    color: gray;
		  
		}
		
		#btn-edit:hover {
			background-color: rgb(153, 188, 133);
			color: white;
		}
		
		#btn-delete {
			border: 2px solid rgb(242, 133, 133);
			color: gray;
		}
		
		#btn-delete:hover {
		 	background-color: rgb(242, 133, 133);
		 	color: white;
		}
		
        
        #update-btn,
        #insert-btn {
        	background-color: #599a83;
            /* color: aliceblue; */
            margin: 5px;
            color: white;
        }

        #btn-add {
            display: block;
            margin: 0 auto;
            padding: 10px 30px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            /*background-color: rgb(191, 216, 175);*/
            border: 1px solid rgb(191, 216, 175);
            color: black;
        }
        
        #btn-add:hover {
        	background-color: rgb(191, 216, 175);
        	color: white;
        }
        
        .gray-line {
            border-bottom: 2px solid lightgray;
        }
			
		#updateDeli-form input {
			width: 615px;
			height: 40px;
			margin: auto;
			border-top-right-radius: 5px;
			border-bottom-right-radius: 5px;
			border-top-left-radius: 5px;
			border-bottom-left-radius: 5px;
			border: 1px solid lightgray;
		}
		
		.delete-form {
		    position: absolute;
		    top: 67px; /* 수정 버튼 아래로 이동 */
		    right: 40px; /* 수정 버튼과 같은 우측 정렬 */
		}
		
		.btn-delete {
		    background-color: #dc3545; /* 삭제 버튼의 색상 */
		    color: white;
		}
		
		.deliverydropdown {
			width: 60px;
			height: 35px;
			border-top-right-radius: 5px;
			border-bottom-right-radius: 5px;
			border-top-left-radius: 5px;
			border-bottom-left-radius: 5px;
			border-color: lightgray;
		}
		#header_2{}
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <!-- 헤더바 -->
   
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
	            <h2>배송지 관리 <img src="resources/img/deliIcon.png" width="40px"></h2> 
	            <br>
	            
	            <c:set var="list" value="${ requestScope.list }" />
				<c:set var="size" value="${ fn:length(list) }" />
	            
	            
		              	<c:forEach var="d" items="${ requestScope.list }" varStatus="loop">
				            <div class="address-container">
				                <div class="address-item">
					                    <span class="badge badge-pill">배송지 ${loop.index + 1}</span>
					                    <p class="address-name"><img src="resources/img/deliIcon2.png" width="20px"> ${ d.deliveryName }</p>
					                    <p class="address-details">${ d.deliveryZipcode }</p>
					                    <p class="address-details">${ d.deliveryAddress }</p>
					                    <button class="btn btn-edit" id="btn-edit" data-toggle="modal" data-target="#deliveryUpdate-form" data-delivery-no="${d.deliveryNo}">수정</button>
					            	
					            	<c:if test="${loop.index > 0}">
						                <!-- 2번째 배송지부터 삭제 버튼과 함께 hidden input을 추가 -->
						                <form id="deleteForm${loop.index}" action="deleteDelivery.me" method="post" class="delete-form">
						                    <input type="hidden" name="deletedeliveryNo" id="deletedeliveryNo" value="${d.deliveryNo}">
						                    <button type="submit" class="btn btn-delete" id="btn-delete">삭제</button>
						                </form>
						            </c:if>
						            
						          
				                </div>
			            	</div>
			            
				            <!-- 수정 모달 -->
						    <div class="modal fade" id="deliveryUpdate-form">
						        <div class="modal-dialog modal-m" height="500px">
						            <div class="modal-content">
						
						                <!-- Modal Header -->
						                <div class="modal-header">
						                    <h4 class="modal-title">배송지 수정</h4>
						                    <button type="button" class="close" data-dismiss="modal" onclick="clearInputFields()">&times;</button>
						                </div>
						                
						                <form action="updateDelivery.me" method="post">
						                    <!-- Modal body -->
						                    <div class="modal-body">
						                        <div>
						                        	<br>
						                        	<table width="465px" id="updateDeli-form">
						                        		<tr>
						                        			<td width="200px">
						                        				<input type="text" id="sample6_postcode" name="deliveryZipcode" placeholder="&nbsp;우편번호" readonly required style="width: 100%;">
						                        			</td>
						                        			<td width="100px">
						                        				<input type="button" id="post-btn" height="50px" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width: 100%;">
						                        			</td>
						                        			<td></td>
						                        		</tr>
						                        		<tr>
						                        			<td colspan="3">
						                        				<input type="text" id="address1" name="address1" placeholder="&nbsp;주소" readonly required style="width: 100%;">
						                        			</td>
						                        		</tr>
						                        		<tr>
						                        			<td colspan="3">
						                        				<input type="text" id="address2" name="address2" placeholder="&nbsp;상세주소" required style="width: 100%;">
						                        			</td>
						                        		</tr>
						                        		<tr>
						                        			<td colspan="3">
						                        				<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
						                        			</td>
						                        		</tr>
						                        	</table>
						                        	<input type="hidden" id="updateDeliveryNo" name="updateDeliveryNo">
						                        	<br>
						                        </div>
						                    </div>
						                    
						                    <!-- Modal footer -->
						                    <div class="modal-footer" align="center">
						                        <button type="submit" class="btn" id="update-btn">수정하기</button>
						                    </div>
						                </form>
							                
					                </div>
					    	 	</div>
					    	</div>
					    	
					    	<script>
						    	$(document).ready(function() {
						    	    // 모든 수정 버튼에 이벤트 리스너 추가
						    	    $('.btn-edit').on('click', function() {
						    	        // 버튼의 data-delivery-no 속성에서 deliveryNo 값을 가져옴
						    	        var deliveryNo = $(this).data('delivery-no');
						    	        // 모달의 hidden input에 deliveryNo 값을 설정
						    	        $('#updateDeliveryNo').val(deliveryNo);
						    	    });
						    	});
						    	
					    	</script>
			            
		            	</c:forEach>
	            	
	            <br>
	            <div class="gray-line"></div> 
	            <br><br>
	            <c:choose>
	            	<c:when test="${ size < 3 }">
	            		<button class="btn" id="btn-add" data-toggle="modal" data-target="#deliveryInsert-form">+ 배송지 추가</button>
	            	</c:when>
	            </c:choose>
	            
	            <!-- 추가 모달 -->
			    <div class="modal fade" id="deliveryInsert-form">
			        <div class="modal-dialog modal-m" height="500px">
			            <div class="modal-content">
			
			                <!-- Modal Header -->
			                <div class="modal-header">
			                    <h4 class="modal-title">배송지 추가</h4>
			                    <button type="button" class="close" data-dismiss="modal" onclick="clearInputFields()">&times;</button>
			                </div>
			                
			                <form action="insertDelivery.me" method="post">
			                    <!-- Modal body -->
			                    <div class="modal-body">
			                        <div>
			                        	<br>
			                        	
			                        	<table width="465px" id="updateDeli-form">
			                        		<tr>
			                        			<td colspan="4">
			                        				<select class="deliverydropdown" name="deliveryName">
				                        					<c:forEach var="d" items="${ requestScope.deliList }">
			                        						<c:set var="sized" value="${ fn:length(deliList) }" />
					                        				<c:choose>
						                        					<c:when test="${sized == 1}">
					                        							<option>회사</option>
					                        							<option>기타</option> 
						                        					</c:when>
						                        					<c:when test="${d eq '기타'}">
						                        						<option>회사</option>
						                        					</c:when>
						                        					<c:when test="${d eq '회사'}">
						                        						<option>기타</option>
						                        					</c:when>
																	<c:otherwise>
																	<!-- 	<option>회사</option>
						                        						<option>기타</option> -->
																	</c:otherwise>			                        					
					                        				</c:choose>
				                        						</c:forEach>
			                        				</select>
			                        				<br>
			                        			</td>
			                        		</tr>
			                        		<tr>
			                        			<td width="200px">
			                        				<input type="text" id="insertPostcode" name="deliveryZipcode" placeholder="&nbsp;우편번호" readonly required style="width: 100%;">
			                        			</td>
			                        			<td width="100px">
			                        				<input type="button" id="insertPost-btn" height="50px" onclick="insert_execDaumPostcode()" value="우편번호 찾기" style="width: 100%;">
			                        			</td>
			                        			<td></td>
			                        		</tr>
			                        		<tr>
			                        			<td colspan="3">
			                        				<input type="text" id="insertAddress1" name="insertAddress1" placeholder="&nbsp;주소" readonly required style="width: 100%;">
			                        			</td>
			                        		</tr>
			                        		<tr>
			                        			<td colspan="3">
			                        				<input type="text" id="insertAddress2" name="insertAddress2" placeholder="&nbsp;상세주소" required style="width: 100%;">
			                        			</td>
			                        		</tr>
			                        		<tr>
			                        			<td colspan="3">
			                        				<input type="hidden" id="insert_extraAddress" placeholder="참고항목">
			                        			</td>
			                        		</tr>
			                        		<tr>
			                        			<td colspan="4" ><p style="font-size: small;">* 배송지는 집 / 회사 / 기타 최대 3개까지 추가 가능합니다.</p></td>
			                        		</tr>
			                        	</table>
			                        	
			                        	
			                        </div>
			                    </div>
			                    
			                    <!-- Modal footer -->
			                    <div class="modal-footer" align="center">
			                        <button type="submit" class="btn" id="insert-btn">추가하기</button>
			                    </div>
			                </form>
				                
		                </div>
		    	 	</div>
		    	</div>
	           
	            
	        </div>
        </div>
        <div class="gray-line"></div>
        
        <br>
        
    </div>
    
              <script>
             // 모달창 닫기 눌렀을때 input에 배송지 수정 값 넣었던거 없애기
              function clearInputFields() {
                  // input 요소들의 값을 비움
                  document.getElementById('sample6_postcode').value = '';
                  document.getElementById('address1').value = '';
                  document.getElementById('address2').value = '';
                  document.getElementById('sample6_extraAddress').value = '';
              }
             
              function clearInputFields2() {
                  // input 요소들의 값을 비움
                  document.getElementById('insertPostcode').value = '';
                  document.getElementById('insertAddress1').value = '';
                  document.getElementById('insertAddress2').value = '';
                  document.getElementById('insert_extraAddress').value = '';
              }
             </script>
             
             <script>
				// 다음 주소 api 수정
			    function sample6_execDaumPostcode() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var addr = ''; // 주소 변수
			                var extraAddr = ''; // 참고항목 변수
			
			                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    addr = data.roadAddress;
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    addr = data.jibunAddress;
			                }
			
			                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			                if(data.userSelectedType === 'R'){
			                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있고, 공동주택일 경우 추가한다.
			                    if(data.buildingName !== '' && data.apartment === 'Y'){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                    if(extraAddr !== ''){
			                        extraAddr = ' (' + extraAddr + ')';
			                    }
			                    // 조합된 참고항목을 해당 필드에 넣는다.
			                    document.getElementById("sample6_extraAddress").value = extraAddr;
			                
			                } else {
			                    document.getElementById("sample6_extraAddress").value = '';
			                }
			
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById('sample6_postcode').value = data.zonecode;
			                document.getElementById("address1").value = addr;
			                // 커서를 상세주소 필드로 이동한다.
			                document.getElementById("address2").focus();
			            }
			        }).open();
			    }
				
				// 추가
			    function insert_execDaumPostcode() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var addr = ''; // 주소 변수
			                var extraAddr = ''; // 참고항목 변수
			
			                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    addr = data.roadAddress;
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    addr = data.jibunAddress;
			                }
			
			                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			                if(data.userSelectedType === 'R'){
			                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있고, 공동주택일 경우 추가한다.
			                    if(data.buildingName !== '' && data.apartment === 'Y'){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                    if(extraAddr !== ''){
			                        extraAddr = ' (' + extraAddr + ')';
			                    }
			                    // 조합된 참고항목을 해당 필드에 넣는다.
			                    document.getElementById("insert_extraAddress").value = extraAddr;
			                
			                } else {
			                    document.getElementById("insert_extraAddress").value = '';
			                }
			
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById('insertPostcode').value = data.zonecode;
			                document.getElementById("insertAddress1").value = addr;
			                // 커서를 상세주소 필드로 이동한다.
			                document.getElementById("insertAddress2").focus();
			            }
			        }).open();
			    }
		</script>
           
    <br><br><br><br><br><br><br><br>
    <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
