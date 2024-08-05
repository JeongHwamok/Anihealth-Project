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
	    
	    #check_btn {
	    	border: 1px solid rgb(191, 216, 175);
	    }
	    
	    #check_btn:hover {
	    	border: 1px solid rgb(191, 216, 175);
	    	background-color: rgb(191, 216, 175);
	    	color: white;
	    }
			
		.password_tb input,
		.password_tb button {
			height: 50px;
		}
		
		.lock-img {
			width: 20px;
			height: auto;
		}
		
		#submit-btn {
            display: block;
            margin: 0 auto;
            padding: 10px 30px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            background-color: rgb(191, 216, 175);
            color: white;
            width: 600px;
        }
        
        #submit-btn:hover {
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
                <h2>비밀번호 변경</h2>
                <br><br>
                <div>
                
                	<div style="text-align: left; margin-left: 250px;">
	                	<span>
	                		<img src="resources/img/lock.png" class="lock-img"> 안전한 비밀번호로 내 정보를 보호하세요. <br>
	                		<img src="resources/img/lock.png" class="lock-img"> 다른 사이트에서 사용한 적 없고 이전에 사용한 적 없는 비밀번호가 안전합니다.
	                	</span>
	                	
	                	<br><br><br>
                	</div>
                
                	<form action="updatePwd.me" method="post">
                	
	                	<table align="center" class="password_tb" width="580px">
	                		<tr>
	                			<th width="130px">새로운 비밀번호</th>
	                			<td width="250px" colspan="2"><input type="password" 
	                				class="form-control" placeholder="비밀번호 (8~30자 영문, 숫자 조합)" 
	                				id="newPwd" name="newPwd" onKeyup="validatePassword()"></td>
	                		</tr>
	                		<tr>
	                			<th>비밀번호 확인</th>
	                			<td colspan="2"><input type="password" class="form-control" id="checkNewPwd" name="checkNewPwd" onKeyup="validatePassword()"></td>
	                		</tr>
	                		<tr>
	                			<td colspan="3"></td>
	                		</tr>
	                		<tr>
	                			<td colspan="3">
	                				<div id="result" class="result"></div><br>
	                			</td> 
	                		</tr>
	                		<tr>
	                			<th colspan="3" style="text-align: center;"><button type="submit" class="btn" id="submit-btn" disabled>변경하기</button></th>
	                		</tr>
	                	</table>
	                
                	</form>
                	<br><br>
                	
                	<script>
                		// 비번 유효성검사
                		function validatePassword() {
						    var pw = document.getElementById('newPwd').value;
						    var pw2 = document.getElementById('checkNewPwd').value;
						    var resultDiv = document.getElementById('result');
						    var enrollBtn = document.getElementById('submit-btn');
						
						    var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,30}$/;
						
						    if (passwordRegex.test(pw) && pw2 !== '') {
						        resultDiv.innerHTML = '';
						        enrollBtn.disabled = false; // 비밀번호 유효성 검사를 통과하고 pw2가 비어있지 않으면 버튼 활성화
						    } else {
						        if (!passwordRegex.test(pw)) {
						            resultDiv.innerHTML = '* 비밀번호 (8~30자 영문, 숫자 조합) 형식에 맞춰서 다시 입력해주세요.';
						        } else if (pw2 === '') {
						            resultDiv.innerHTML = '';
						        }
						        resultDiv.style.color = 'red';
						        enrollBtn.disabled = true; // 비밀번호 유효성 검사를 통과하지 못하거나 pw2가 비어있으면 버튼 비활성화
						    }
						}

                	</script>
                	
                </div>
                <br><br><br>
                <div class="gray-line"></div>
            </div>
        </div>
    </div>
    

    <br><br><br><br><br><br><br><br>
    <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
