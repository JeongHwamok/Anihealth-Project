<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            margin-bottom: 20px;
        }


        .form-actions {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        #btn-update,
        #nickCheck,
        #emailCheck,
        #nickOkBtn,
        #emailOkBtn,
        #emailSend {
            padding: 10px 30px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            border: 1px solid rgb(191, 216, 175);
            color: black;
        }
        
        #emailBtn,
        #emailSend {
        	padding: 10px 10px;
            border: none;
            cursor: pointer;
            background-color: rgb(191, 216, 175);
            color: white;
            height: 40px;
        }
        
        #btn-update:hover,
        #nickCheck:hover,
        #emailCheck:hover,
        #nickOkBtn:hover,
        #emailOkbtn:hover {
        	background-color: rgb(191, 216, 175);
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
			
		.d-inline{
			display: inline-block;
		}
		
		#emailNumberCheckBtn,
		#email {
			
			width: 70%;
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
                <h2>회원 정보 관리 <img src="resources/img/memIcon.png" width="40px"></h2>
                
                <form action="update.me">
                    <table id="myPage_tb">
                        <tr>
                            <th>아이디</th>
                            <td colspan="2">
                                <input type="text" class="form-control" value="${ sessionScope.loginUser.userId }" name="userId" id="userId" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>닉네임</th>
                            <td width="64%">
                                <input type="text" class="form-control" value="${ sessionScope.loginUser.userNick }" readonly>
                            </td>
                            <td>
                            	<button type="button" class="btn" id="nickCheck" data-toggle="modal" data-target="#nickUpdateForm">닉네임변경</button>
                            </td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td colspan="2">
                                <input type="text" class="form-control" value="${ sessionScope.loginUser.userName }" name="userName" id="userName" placeholder="이름을 입력해주세요" required>
                            </td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>
                                <input type="text" class="form-control" value="${ sessionScope.loginUser.email }" readonly>
                            </td>
                            <td>
                            	<button type="button" class="btn" id="emailCheck" data-toggle="modal" data-target="#emailUpdateForm">이메일변경</button>
                            </td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td colspan="2">
                                <input type="text" class="form-control" value="${ sessionScope.loginUser.phone }" name="phone" id="phone" placeholder="전화번호를 입력해주세요 (- 포함)" required>
                            </td>
                        </tr>
                        <tr>
                            <th>생년월일</th>
                            <td colspan="2">
                                <input type="date" class="form-control" value="${ sessionScope.loginUser.userBirthday }" id="userBirthday" name="userBirthday">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" height="10px"></td>
                        </tr>
                        <tr>
                            <td colspan="3" class="form-buttons" style="text-align: center;">
                                <button type="submit" class="btn" id="btn-update">수정하기</button>
                                
                                
                            </td>
                        </tr>
                    </table>
                </form>
                <div class="gray-line"></div>
            </div>
        </div>
    </div>
   
   <!-- 닉네임 수정 -->
    <div class="modal fade" id="nickUpdateForm">
        <div class="modal-dialog modal-m">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">닉네임 변경</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <form action="nickUpdate.me" method="post" id="nick-form">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div align="left">
                           	 변경할 닉네임을 입력해주세요.<br>
                        </div>
                        <br>
                            <input type="text" class="form-control mb-2 mr-sm-2" placeholder="닉네임을 입력해주세요" id="userNick" name="userNick" required> <br>
                    		<!-- 회원 탈퇴 시 PK 에 해당하는 회원의 아이디도 같이 넘겨야함 -->
                    		<input type="hidden" name="userId" id="userId" value="${ sessionScope.loginUser.userId }">
                    		<div id="nickCheckResult"
							 style="font-size: 0.8em;" display : none;"></div>
							
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn" id="nickOkBtn" disabled>확인</button>
                    </div>
                </form>
                
                <!-- 닉네임 중복체크 ajax -->	
					<script>
					
						$(function(){
							
							// 아이디를 입력하는 input 요소 객체를 변수에 담아두기
				       		const $nickInput = $("#nick-form input[name=userNick]");
				      		
				       		// 아이디를 입력할때마다 실시간으로 아이디 중복 체크
				       		// > "keyup" 이벤트 활용
				       		$nickInput.keyup(function() {
				       			
				       			// console.log($idInput.val());
				       			// > 사용자가 실시간으로 입력한 아이디값을 중복체크 시 요청값으로 넘기기
				       			
				       			// 우선, 아이디값이 최소 5글자 이상으로 입력되어 있을 때에만
				       			// ajax 를 요청해서 중복체크 하기!!
				       			
				       			if($nickInput.val().length >= 2) {
				       				// 5글자 이상일 때
				       				// > ajax 로 아이디 중복복확인 요청 보내기
				       				
				       				$.ajax({
				       					url : "nickCheck.me",
				       					type : "get",
				       					data : {
				       						checkNick : $nickInput.val()
				       					},
				       					success : function(result) {
				       						
				       						// console.log(result);
				       						
				       						if(result == "NNNNN") {
				       							// 사용 불가능한 아이디일 경우
				       							
				       							// 빨간색 메세지로 출력
				       							$("#nickCheckResult").show()
					       											 .css("color", "red")
					       											 .text("이미 사용중인 닉네임입니다. 다시 입력해주세요.");
				       							
				       							// 회원가입버튼 비활성화
				       							$("#enroll-form button[type=submit]").attr("disabled", true);
				       							
				       						} else {
				       							// 사용 가능한 아이디일 경우
				       							
				       							// 초록색 메세지로 출력
				       							$("#nickCheckResult").show();
				       							$("#nickCheckResult").css("color", "green");
				       							$("#nickCheckResult").text("사용 가능한 닉네임입니다.");
				       							
				       							// 회원가입버튼 활성화
				       							$("#nick-form button[type=submit]").attr("disabled", false);
				       							
				       						}
				       						
				       					},
				       					error : function() {
				       						console.log("닉네임 중복 체크용 ajax 통신 실패!");
				       					}
				       				});
				       				
				       			} else {
				       				// 2글자 미만
				       				
				       				// 회원가입버튼 비활성화
				       				$("#enroll-form button[type=submit]").attr("disabled", true);
				       				
				       				// 메세지 숨기기
				       				$("#nickCheckResult").hide();
				       				
				       			}
				       			
				       		});
						});
			       		</script>	
            </div>
        </div>
    </div>
    
    <!-- 이메일 수정 -->
    <div class="modal fade" id="emailUpdateForm">
        <div class="modal-dialog modal-m">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">이메일 변경</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <form action="emailUpdate.me" method="post" id="email-form">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div align="left">
                           	 변경할 이메일을 입력해주세요.<br>
                        </div>
                        <br>
                            <input type="email" class="form-control d-inline" placeholder="이메일을 입력해주세요" id="email" name="email" required>
                    		<!-- 회원 탈퇴 시 PK 에 해당하는 회원의 아이디도 같이 넘겨야함 -->
                    		<input type="hidden" name="userId" id="userId" value="${ sessionScope.loginUser.userId }">
                    		<button type="button" class="d-inline btn" id="emailSend" onclick="cert();">인증번호 발송</button>
                    		<div id="emailCheckResult"
							 style="font-size: 0.8em;" display : none;"></div>
                    		<div><br></div>
                    		
							<input type="text" disabled class="form-control d-inline" id="emailNumberCheckBtn" placeholder="인증번호를 입력해주세요.">
							<button class="d-inline btn" id="emailBtn" onclick="validate();" disabled>인증번호 확인</button>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn" id="emailOkBtn" disabled>확인</button>
                    </div>
                </form>
                
                <script>
				<!-- 이메일 중복체크 ajax -->
					$(function(){
						
						// 아이디를 입력하는 input 요소 객체를 변수에 담아두기
			       		const $emailInput = $("#emailUpdateForm input[name=email]");
			      		
			       		// 아이디를 입력할때마다 실시간으로 아이디 중복 체크
			       		// > "keyup" 이벤트 활용
			       		$emailInput.keyup(function() {
			       			
			       			// console.log($idInput.val());
			       			// > 사용자가 실시간으로 입력한 아이디값을 중복체크 시 요청값으로 넘기기
			       			
			       			// 우선, 아이디값이 최소 5글자 이상으로 입력되어 있을 때에만
			       			// ajax 를 요청해서 중복체크 하기!!
			       			
			       			if($emailInput.val().length >= 5) {
			       				// 5글자 이상일 때
			       				// > ajax 로 아이디 중복복확인 요청 보내기
			       				
			       				$.ajax({
			       					url : "emailCheck.me",
			       					type : "get",
			       					data : {
			       						checkEmail : $emailInput.val()
			       					},
			       					success : function(result) {
			       						
			       						// console.log(result);
			       						
			       						if(result == "NNNNN") {
			       							// 사용 불가능한 아이디일 경우
			       							
			       							// 빨간색 메세지로 출력
			       							$("#emailCheckResult").show()
				       											  .css("color", "red")
				       											  .text("이미 사용중인 이메일입니다. 다시 입력해주세요.");
			       							
			       							// 버튼 비활성화
			       							$("#emailUpdateForm button[type=submit]").attr("disabled", true);
			       							
			       						} else {
			       							// 사용 가능한 아이디일 경우
			       							
			       							// 버튼 활성화
			       							$("#emailUpdateForm button[type=submit]").attr("disabled", false);
			       							
			       						}
			       						
			       					},
			       					error : function() {
			       						console.log("이메일 중복 체크용 ajax 통신 실패!");
			       					}
			       				});
			       				
			       			} else {
			       				// 5글자 미만
			       				
			       				// 회원가입버튼 비활성화
			       				$("#emailUpdateForm button[type=submit]").attr("disabled", true);
			       				
			       				// 메세지 숨기기
			       				$("#emailCheckResult").hide();
			       				
			       			}
			       			
			       		});
					});
			       		
				
				
				function cert() {
					
					// ajax 요청 보내기
					$.ajax({
						url : "cert.do",
						type : "post", 
						data : {
							email : $("#email").val()
						},
						success : function(result) {
							
							alert(result);
							
							// 인증번호 발급 후 인증 관련 요소들 활성화
							$("#emailBtn").attr("disabled", false);
							$("#emailNumberCheckBtn").attr("disabled", false);
							
							// 이메일 인증번호 보내기 관련 요소들 비활성화
							$("#email").attr("readonly", true);
							$("#emailCheckBtn").attr("disabled", true);
							
						},
						error : function() {
							console.log("인증번호 발급용 ajax 통신 실패!");
						}
					});
					
				}
				
				function validate() {
					
					// ajax 요청 보내기
					$.ajax({
						url : "validate.do",
						type : "post",
						data : {
							email : $("#email").val(),
							checkNo : $("#emailNumberCheckBtn").val()
						},
						success : function(result) {
							
							alert(result);
							
							// 인증번호 대조 성공 후 인증 관련 요소 비활성화
							$("#emailCheck").attr("readonly", true);
							$("#emailNumberCheckBtn").attr("disabled", true);
							
							// 인증 실패 시
							// 다시 이메일 인증번호를 받을 수 있게끔 이메일 관련 요소들 활성화
							if(result == "인증 실패하였습니다.") {
								
								$("#emailCheck").val("");
								
								$("#email").attr("readonly", false);
								$("#email").val("");
								$("#emailCheckBtn").attr("disabled", false);
							}
							
						}, 
						error : function() {
							console.log("인증번호 대조용 ajax 통신 실패!");	
						}
					});
					
				}
				
				</script>
               	
            </div>
        </div>
    </div>

    <br><br><br><br><br><br><br><br>
    <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
