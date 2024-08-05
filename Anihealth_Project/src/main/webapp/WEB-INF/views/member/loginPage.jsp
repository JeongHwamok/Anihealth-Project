<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ANIHEALTH</title>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   
   	<!-- alertify 연동 구문 -->
   	<!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/semantic.min.css"/>
   
    
    <style>
       
       @font-face {
            font-family: 'WavvePADO-Regular';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2404@1.0/WavvePADO-Regular.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        *{
            font-family: 'WavvePADO-Regular';    
        }
        
        div {
            box-sizing: border-box;
            /* border : 1px solid darkblue;  */
        }
        
        .wrap>div {
            width: 100%;
            margin: auto;
        }
        
        html,
        body {
            margin: 0;
            padding: 0;
        }
        
        
        #loginPage_wrap {
        	height: 100%;
        	width: 100%;
            margin: 0;
        
        }

        #content {
            width: 70%;
            height: 70%;
            margin: auto;
            /* margin-top: 3%; */

        }

        #loginPage_logo {
            width: 30%;
            height: auto;
            margin: auto;
            /*text-align: center;*/
        }

        #login_form {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #login_input_id_pwd {
        	width : 100%;
            margin: 0px;
            text-align: center;
        }

        #userId,
        #userPwd {
            width: 400px;
			height: 70px;
			margin: auto;
			border-top-right-radius: 5px;
			border-bottom-right-radius: 5px;
			border-top-left-radius: 5px;
			border-bottom-left-radius: 5px;
			/* background-color: #f7f7f7; */
			/* border: 1px solid #f7f7f7; */
			border: 1px solid lightgray;
			font-size: medium;

        }

        #login_input_btn {
            text-align: center;
        }

        #login_btn {
            width: 400px;
            height: 70px;
            margin: 30px 0px 20px 0px;
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
            background-color: rgb(191, 216, 175);
            color: white;
            border: 1px solid rgb(191, 216, 175);
            font-size: large;
        }
        
        #login_btn:hover{
        	cursor: pointer;
			background-color: rgb(153, 188, 133);
        }

        #login_form_etc {
            text-align: center;
            margin: auto;
            width: 100%;
        }

        #login_form_etc>a {
            text-decoration: none;
            /* 하이퍼링크 밑줄 제거 */
            color: rgb(105, 105, 105);
            font-size: 15px;
            font-weight: 200px;
        }

        #id_save {
            text-align: center;
            margin: 20px 300px 0px 0px;
        }


            
    </style>
</head>
<body>
	

    <script>
    <c:if test="${ not empty sessionScope.alertMsg }">
		alertify.alert('알림', '${ sessionScope.alertMsg }'/* , function(){ alertify.success('Ok'); } */);
	<c:remove var="alertMsg" scope="session" />
	</c:if>	
    </script>
    <div class="loginPage_wrap">
        <div id="content">
            <form action="login.me" method="post" id="login_form">
                <div id="loginPage_logo">
                    <a href="${pageContext.request.contextPath}">
                        <img src="resources/img/image (4).png" width="400px" height="auto">
                    </a>
                    <!--  <span style=""><b>로그인</b></span> -->
                </div>
                <div id="login_input_id_pwd">
                    <input type="text" id="userId" 
                    	   placeholder="아이디" name="userId" 
                    	   class="form-control" value="${ cookie.saveId.value }" required> <br>
                    <input type="password" id="userPwd" placeholder="비밀번호" name="userPwd" class="form-control" required>
                </div>
                <div id="id_save">
                <c:choose>
                <c:when test="${ not empty cookie.saveId }">
                <!-- 체크박스 체크 되어있을시 -->
                    <input type="checkbox" name="saveId" 
                    	   id="saveId" value="y" checked>
                    <label for="saveId">아이디 저장</label>
                </c:when>
                <c:otherwise>
                <!-- 체크 안 되어 있을시 -->
                	<input type="checkbox" name="saveId" 
                    	   id="saveId" value="y">
                    <label for="saveId">아이디 저장</label>
                </c:otherwise>
                </c:choose>	
                </div>
                <div id="login_input_btn">
                    <input type="submit" id="login_btn" value="로그인">
                </div>
            </form>
            <div id="login_form_etc">
                <a href=enrollForm.me>회원가입</a>
                &nbsp;&nbsp; | &nbsp;
                <a href="findId.me">ID 찾기</a>
                &nbsp;&nbsp; | &nbsp;
                <a href="findPwd.me">PWD 찾기</a>
                
            </div>
            
        </div>
    </div>
    <br><br><br><br><br><br><br><br><br>
    
    <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>