<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ANIHEALTH</title>
	<style>
       	@font-face {
            font-family: 'WavvePADO-Regular';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2404@1.0/WavvePADO-Regular.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

		* {
			font-family: 'WavvePADO-Regular';
		}


		.outer {
			width: 1200px;
			margin: auto;
		}


		#logo {
			width: 20%;
			height: auto;
			margin: auto;
		}

		#enroll-text {
			width: 640px;
			margin: auto;
		}

		#enroll-form table {
			margin: auto;
		}

		#enroll-form input {
			margin: 5px;
		}

		/* 추가본 2 아이디, 비밀번호 */
		input[type="text"],
		input[type="password"],
		input[type="email"],
		input[type="date"] {
			width: 615px;
			height: 40px;
			/* margin: 15px 0px 0px 0px; */
			margin: auto;
			border-top-right-radius: 5px;
			border-bottom-right-radius: 5px;
			border-top-left-radius: 5px;
			border-bottom-left-radius: 5px;
			/* background-color: #f7f7f7; */
			/* border: 1px solid #f7f7f7; */
			border: 1px solid lightgray;
		}
		
		input[name=email],
		input[name=emailCheck],
		input[name=sample6_postcode] {
		    width: 480px; 
		}

		/* 회원가입 버튼 */
		#enroll_input_btn {
			text-align: center;
		}

		#enrollBtn {
            width: 610px;
            height: 55px;
            margin: 30px 0px 10px 0px;
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
            background-color: rgb(191, 216, 175);
            color: white;
            border: 1px solid rgb(191, 216, 175);
		}
		
		#enrollBtn:hover {
			cursor: pointer;
			background-color: rgb(153, 188, 133);
		}

		#checkbox {
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance: none;
			width: 20px;
			height: 20px;
			border-radius: 50%;
			/* 체크박스 외곽선 스타일 */
			outline: none;
			cursor: pointer;
		}

		#emailNumberCheckBtn,
		#emailCheckBtn,
		#post-btn {
			border: 1px solid rgb(191, 216, 175);
			width: 120px;
		}
		
		#emailNumberCheckBtn:hover,
		#emailCheckBtn:hover,
		#post-btn:hover {
			background-color: rgb(191, 216, 175);
			color: white;
		} 
		
		/* 추가본 3 */
		.scrollable-content {
            max-height: 100px;
            max-width: 600px;
            overflow-y: auto;
            padding: 10px;
        }
        
        .agreement-content {
            margin-bottom: 20px;
        }
        
        /* 주소 */
        #sample6_postcode {
        	width: 200px;
        }
        
       #email-check-container,
       #emailNumber-check-container {
		    display: flex;
		    align-items: center;
		}

		#emailCheckBtn,
		#emailNumberCheckBtn {
		    margin-left: 10px; /* 버튼과 입력 필드 사이의 간격 조절 */
		}
		
		::placeholder {
            font-size: 15px; /* placeholder 글씨 크기 */
        }
        
	</style>
	
	<!-- 추가본 4 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<!-- 온라인 방식 -->
	
	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- 다음 주소 API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
</head>
<body>

	<div class="outer">

		<br>
		<!-- 추가본 5 -->
		<div id="logo">
			<a href="${pageContext.request.contextPath}/">
				<img src="resources/img/image (4).png" width="100%" height="100%">
			</a>
		</div>

		<!-- 회원가입 요청 insert.me -->
		<form id="enroll-form" action="insert.me" method="post">
			
			<div id="enroll-text">
    			<h2>회원가입</h2><hr>
			</div>

			<table>
				<tr>
					<td>* 아이디</td>
				</tr>
				<tr>
					<td>
					<div id="id-check-container">
						<input type="text" id="userId" name="userId" class="form-control" minlength="5" maxlength="11"
							placeholder="아이디(5~11자)" required >
						<div id="idCheckResult" class="result"
							 style="font-size: 0.8em;" display : none;"></div>
					</div> <br>
					</td>
				</tr>
				
				<!-- id 중복체크 ajax -->	
				<script>
				
					$(function(){
						
						// 아이디를 입력하는 input 요소 객체를 변수에 담아두기
			       		const $idInput = $("#enroll-form input[name=userId]");
			      		
			       		// 아이디를 입력할때마다 실시간으로 아이디 중복 체크
			       		// > "keyup" 이벤트 활용
			       		$idInput.keyup(function() {
			       			
			       			// console.log($idInput.val());
			       			// > 사용자가 실시간으로 입력한 아이디값을 중복체크 시 요청값으로 넘기기
			       			
			       			// 우선, 아이디값이 최소 5글자 이상으로 입력되어 있을 때에만
			       			// ajax 를 요청해서 중복체크 하기!!
			       			
			       			if($idInput.val().length >= 5) {
			       				// 5글자 이상일 때
			       				// > ajax 로 아이디 중복확인 요청 보내기
			       				
			       				$.ajax({
			       					url : "idCheck.me",
			       					type : "get",
			       					data : {
			       						checkId : $idInput.val()
			       					},
			       					success : function(result) {
			       						
			       						// console.log(result);
			       						
			       						
			       						if(result == "NNNNN") {
			       							// 사용 불가능한 아이디일 경우
			       							
			       							// 빨간색 메세지로 출력
			       							$("#idCheckResult").show()
			       											 .css("color", "red")
			       											 .text("이미 사용중인 아이디입니다. 다시 입력해주세요.");
			       							
			       							// 회원가입버튼 비활성화
			       							$("#enroll-form button[type=submit]").attr("disabled", true);
			       							
			       						} else {
			       							// 사용 가능한 아이디일 경우
			       							
			       							// 초록색 메세지로 출력
			       							$("#idCheckResult").show();
			       							$("#idCheckResult").css("color", "green");
			       							$("#idCheckResult").text("사용 가능한 아이디입니다.");
			       							
			       							// 회원가입버튼 활성화
			       							$("#enroll-form button[type=submit]").attr("disabled", false);
			       							
			       						}
			       						
			       					},
			       					error : function() {
			       						console.log("아이디 중복 체크용 ajax 통신 실패!");
			       					}
			       				});
			       				
			       			} else {
			       				// 5글자 미만일 때	
			       				
			       				// 회원가입버튼 비활성화
			       				$("#enroll-form button[type=submit]").attr("disabled", true);
			       				
			       				// 메세지 숨기기
			       				$("#idCheckResult").hide();
			       				
			       			}
			       			
			       		});
					});
		       		</script>

				<tr>
					<td>* 비밀번호</td>
				</tr>
				<tr>
					<td>
						<input type="password" id="pw1" name="userPwd" class="form-control" maxlength="30" 
							placeholder="비밀번호 (8~30자 영문, 숫자 조합)" onKeydown="validatePassword()" required>
							
						<input type="password" id="pw2" class="form-control" maxlength="30"
							placeholder="비밀번호 확인" required onKeyup="validatePassword()">
						<div id="result" class="result"></div>
							<script>
							function validatePassword() {
							    var pw1 = document.getElementById('pw1').value;
							    var pw2 = document.getElementById('pw2').value;
							    var resultDiv = document.getElementById('result');
							    var enrollBtn = document.getElementById('enrollBtn');

							    var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,30}$/;

							    if (passwordRegex.test(pw1)) {
							        if (pw1 === pw2) {
							            resultDiv.innerHTML = '비밀번호가 일치합니다.';
							            resultDiv.style.color = 'green';
							            resultDiv.style.fontSize = '0.8em';
							            enrollBtn.disabled = false; // 비밀번호가 일치하고 유효성 검사를 통과하면 버튼 활성화
							        } else {
							            resultDiv.innerHTML = '비밀번호가 일치하지 않습니다.';
							            resultDiv.style.color = 'red';
							            resultDiv.style.fontSize = '0.8em'; // font-size를 0.8em으로 설정
							            enrollBtn.disabled = true; // 비밀번호가 일치하지 않으면 버튼 비활성화
							        }
							    } else {
							        resultDiv.innerHTML = '비밀번호 (8~30자 영문, 숫자 조합)';
							        resultDiv.style.color = 'red';
							        resultDiv.style.fontSize = '0.8em';
							        enrollBtn.disabled = true; // 비밀번호 유효성 검사를 통과하지 못하면 버튼 비활성화
							    }
							} 
							</script>
							<div style="position: relative;">
							</div><br>

					</td>
				</tr>
				<tr>
					<td>* 닉네임</td>
				</tr>
				<tr>
					<td>
					<div id="nick-check-container">
						<input type="text" id="userNick" name="userNick" class="form-control" minlength="2" maxlength="11"
							placeholder="닉네임(2~11자) " required >
						<div id="nickCheckResult"
							 style="font-size: 0.8em;" display : none;"></div>
					</div>
					
					<!-- 닉네임 중복체크 ajax -->	
					<script>
					
						$(function(){
							
							// 아이디를 입력하는 input 요소 객체를 변수에 담아두기
				       		const $nickInput = $("#enroll-form input[name=userNick]");
				      		
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
				       							$("#enroll-form button[type=submit]").attr("disabled", false);
				       							
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

						<br>
					</td>
  				</tr>
				
				<tr>
					<td>* 이름</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="userName" class="form-control" maxlength="6" placeholder="이름을 입력해주세요"
							required><br>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>* 전화번호</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="phone" class="form-control" maxlength="13" placeholder="- 포함해서 입력해주세요" required><br>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>* 이메일</td>
				</tr>
				<tr>
					<td>
						<div id="email-check-container">
						<input type="email" name="email" id="email" name="email" class="form-control" placeholder="이메일 주소를 입력해주세요" required>
						<button type="button" class="btn" id="emailCheckBtn"
									onclick="cert();">
							인증번호발송
						</button>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="emailNumber-check-container">
							<input type="text" id="emailCheck" name="emailCheck" class="form-control" placeholder="인증번호를 입력해주세요" required disabled>
							<button type="button" class="btn" id="emailNumberCheckBtn"
										onclick="validate();" disabled>
								인증번호확인
							</button>
							
						</div>
						
					</td>
				</tr>
				<tr>
					<td colspan="1">
						<div id="emailCheckResult"
							 style="font-size: 0.8em;" display : none;"></div><br>
					</td>
					
				</tr>
				
					
				<script>
				<!-- 이메일 중복체크 ajax -->
					$(function(){
						
						// 아이디를 입력하는 input 요소 객체를 변수에 담아두기
			       		const $emailInput = $("#enroll-form input[name=email]");
			      		
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
			       							
			       							// 회원가입버튼 비활성화
			       							$("#enroll-form button[type=submit]").attr("disabled", true);
			       							
			       						} else {
			       							// 사용 가능한 아이디일 경우
			       							
			       							// 회원가입버튼 활성화
			       							$("#enroll-form button[type=submit]").attr("disabled", false);
			       							
			       						}
			       						
			       					},
			       					error : function() {
			       						console.log("이메일 중복 체크용 ajax 통신 실패!");
			       					}
			       				});
			       				
			       			} else {
			       				// 5글자 미만
			       				
			       				// 회원가입버튼 비활성화
			       				$("#enroll-form button[type=submit]").attr("disabled", true);
			       				
			       				// 메세지 숨기기
			       				$("#nickCheckResult").hide();
			       				
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
							$("#emailCheck").attr("disabled", false);
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
							checkNo : $("#emailCheck").val()
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
				
				<tr>
					<td>&nbsp; 생년월일</td>
				</tr>
				<tr>
					<td>
						<input type="date" id="userBirthday" class="form-control" name="userBirthday" placeholder="YY-MM-DD 형식" required><br>
					</td>
				</tr>
				<tr>
					<td>* 주소</td>
				</tr>

				<tr>
					<td>
						<input type="text" id="sample6_postcode" name="deliveryZipcode"  placeholder="&nbsp;&nbsp;우편번호" readonly required>
						<input type="button" id="post-btn" class="btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="address1" name="address1" placeholder="&nbsp;&nbsp;주소" readonly required><br>
						<input type="text" id="address2" name="address2" class="form-control" placeholder="상세주소" required><br>
						<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
					</td>
					<td></td>
				</tr>
			
				<script>
				// 다음 주소 api
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
				</script>
				
				<table width="600px">
				<tr>
				    <td>
				        <input type="checkbox" id="checkAll" onclick="checkAllCheckboxes()" required>
				         <label for="checkAll">약관 전체 동의하기</label>
				    </td>
				</tr>
				
				<tr>
                    <td>
                        <input type="checkbox" id="check1" class="subCheckbox" onchange="checkSubCheckboxes()">
                        <span class="agreement-text" onclick="toggleDetails('ageAgreementDetails')">
                            <label for="check1">[ 필수 ] 만 14세 이상입니다.</label>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" id="check2" class="subCheckbox" onchange="checkSubCheckboxes()">
                        <span class="agreement-text" onclick="toggleDetails('privacyAgreementDetails')">
                            <label for="check2">[ 필수 ] 개인정보 수집 및 이용 동의</label>
                        </span>
                    </td>
                </tr>
                
				</table>
		
       		
	       		<script>
	       		// 체크박스 전체 선택 & 해제
		       	    function checkAllCheckboxes() {
		       	        var checkAllCheckbox = document.getElementById("checkAll");
		       	        var subCheckboxes = document.querySelectorAll(".subCheckbox");
		
		       	        // "checkAll" 체크박스가 선택되었는지 확인
		       	        if (checkAllCheckbox.checked) {
		       	            // 모든 하위 체크박스 선택
		       	            subCheckboxes.forEach(function(checkbox) {
		       	                checkbox.checked = true;
		       	            });
		       	        } else {
		       	            // 모든 하위 체크박스 해제
		       	            subCheckboxes.forEach(function(checkbox) {
		       	                checkbox.checked = false;
		       	            });
		       	        }
		       	    }
		
		       	    function checkSubCheckboxes() {
		       	        var subCheckboxes = document.querySelectorAll(".subCheckbox");
		       	        var allChecked = true;
		
		       	        // 모든 하위 체크박스가 선택되었는지 확인
		       	        subCheckboxes.forEach(function(checkbox) {
		       	            if (!checkbox.checked) {
		       	                allChecked = false;
		       	            }
		       	        });
		
		       	        // 모든 하위 체크박스가 선택되었으면 "checkAll" 체크박스도 선택
		       	        if (allChecked) {
		       	            document.getElementById("checkAll").checked = true;
		       	         	document.getElementById("enrollBtn").disabled = false; // 회원가입 버튼 활성화
		       	        } else {
		       	            document.getElementById("checkAll").checked = false;
		       	         	document.getElementById("enrollBtn").disabled = true; // 회원가입 버튼 비활성화
		       	        }
		       	    }
		       	</script>
	       			
			</table>

			<br>

			<div id="enroll_input_btn">
				<button type="submit" id="enrollBtn" onclick="validatePassword()">회원가입</button>
			</div>

		</form>

	</div>

	<br><br><br><br><br><br>
	
	<!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
	
</body>
</html>