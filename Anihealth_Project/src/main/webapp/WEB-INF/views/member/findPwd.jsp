<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ANIHEALTH</title>
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
        
        .findPwd_wrap>div {
            width: 100%;
            margin: auto;
        }
        
        html,
        body {
            margin: 0;
            padding: 0;
        }
        
        #logo {
            width: 30%;
            height: auto;
            margin: auto;
            /*text-align: center;*/
        }
        
        
        #findPwd_wrap {
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
        
        #account-btn {
            width: 400px;
            height: 60px;
            margin-top: 20px;
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
            background-color: rgb(191, 216, 175);
            color: white;
            border: 1px solid rgb(191, 216, 175);
            font-size: large;
        }

        #account-btn:hover{
        	cursor: pointer;
			background-color: rgb(153, 188, 133);
        }

        .form-control {
            width: 100%;
            height: 60px;
            margin-top: 5px;
            box-sizing: border-box;
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
            border: 1px solid lightgray;
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
    
    <div id="findPwd_wrap">
        <div id="content">
            <form action="findPwdEmail.me" method="post" id="findPwd_form">
            	<div id="logo">
                    <a href="${pageContext.request.contextPath}">
                        <img src="resources/img/image (4).png" width="400px" height="auto">
                    </a>
                </div>
	            <div>
	            	<table align="center" style="text-align: center;">
                        <tr>
                            <td align="left" style="font-size: x-large;">비밀번호 찾기</td>
                            <td><br></td>
                        </tr>
	            		<tr>
                            <th width="400px;">
                                <input type="text" class="form-control" placeholder=" 아이디를 입력해주세요" name="userId">
                            </th>
                        </tr>
                        <tr>
                            <th>
                                <input type="text" class="form-control" placeholder=" 이메일을 입력해주세요" name="email">
                            </th>
                        </tr>
                        <tr>
                            <th colspan="2">
                                <button type="submit" id="account-btn">비밀번호 찾기</button>
                            </th>
                        </tr>
                        
		                
	                </table>
	            </div>
            </form>
        
            
        </div>
    </div>
    
    <br><br><br><br><br><br><br>
    <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
