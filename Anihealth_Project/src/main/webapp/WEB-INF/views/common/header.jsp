<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ANIHEALTH</title>
    <!-- 부트스트랩 연동 코드 (CDN방식) -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    
    <!-- jQuery library -->
    <!-- 온라인 방식 -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Font Awesome CSS 포함 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <!-- 애니메이션 CDN방식 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    
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

        * {
            font-family: 'WavvePADO-Regular';
        }

        /* 헤더 시작 */
        div {
            box-sizing: border-box;
            /* border : 1px solid darkblue;  */
        }

        html,
        body {
            margin: 0;
            padding: 0;
        }

        #header {
            height: 132px;
            width: 100%;
            display: flex;
            padding-top: 20px;
            margin-bottom: 20px;
            align-items: center;
            /* 수직 가운데 정렬 */
            justify-content: space-between;
        }

        #header>div {
            display: flex;
            align-items: center;
        }

        #logo {
            height: 138px;
            width: auto;
            margin-left: 150px;
            /* 로고 이미지와 다음 요소 사이 간격 설정 */
        }
		
		   #cart {
        	width: 30px;
        	height: auto;
        }
        #header_1 {
            width: 30%;
        }

        #header_2 {
            width: 50%;
            justify-content: center;
            /* 가운데 정렬 */
            margin-right: 30px;
        }

        #header_2 a {
            color: gray;
            text-decoration: none;
            font-size: 120%;
        }


        #header_2{
            height: 100%;
            display: flex;
            align-items: center;
            /* 수직 가운데 정렬 */
        }

        #header_2 ul {
            margin: 0;
            /* 리스트의 기본 마진 제거 */
            padding: 0;
            /* 리스트의 기본 패딩 제거 */
        }
        
       /* 관리자 스타일 영역 시작  */
       #headerAd_2 {
            width: 80%;
            justify-content: center;
            /* 가운데 정렬 */
            margin-right: 30px;
            height: 100%;
            display: flex;
            align-items: center;
            /* 수직 가운데 정렬 */
        }
        
        #headerAd_2 a {
            color: gray;
            text-decoration: none;
            font-size: 120%;
        }
        
        #headerAd_2 ul {
            margin: 0;
            /* 리스트의 기본 마진 제거 */
            padding: 0;
            /* 리스트의 기본 패딩 제거 */
        }
        
        #headerAd_2 .nav-item {
            margin-right: 50px;
            /* 각 네비게이션 아이템 간격 설정 */
        }

        #headerAd_2 .nav-item:last-child {
            margin-right: 0;
            /* 마지막 네비게이션 아이템의 마진 제거 */
        }

		/* 관리자 스타일 영역 종료 */

        #header_3 {
            width: 20%;
            justify-content: flex-end;
            /* 로그인 구역을 오른쪽 정렬 */
            margin-right: 100px;
        }

        .navbar-nav {
            display: flex;
            align-items: center;
            /* 수직 가운데 정렬 */
        }

        #header_2 .nav-item {
            margin-right: 50px;
            /* 각 네비게이션 아이템 간격 설정 */
        }

        #header_2 .nav-item:last-child {
            margin-right: 0;
            /* 마지막 네비게이션 아이템의 마진 제거 */
        }
        
        .wrap>div {
            width: 100%;
            margin: auto;
        }
        
        .my {
        	color: gray;
        }
        
        .my:hover {
			color: rgb(191, 216, 175);
			text-decoration: none;
		}
		
		#text1,
		#text1 span {
			color: rgb(153, 188, 133);
			font-size: medium;
		}
		
		#text2 span {
			color: rgb(153, 188, 133);
			font-size: x-large;
		}

        /* 헤더 영역 끝 */
    </style>
</head>
    
<body>

    <script>
        <c:if test="${ not empty sessionScope.alertMsg }">
                alertify.alert('알림', '${ sessionScope.alertMsg }'/* , function(){ alertify.success('Ok'); } */);
            <c:remove var="alertMsg" scope="session" />
        </c:if>
    </script>
    
	<c:choose>
		<c:when test="${ not empty sessionScope.loginUser && sessionScope.loginUser.userId eq 'admin' }">
		
		<div class="wrap">

          <div id="header">
  
              <div id="header_1" align="center">
                  <a href="${pageContext.request.contextPath}/">
                      <img src="resources/img/image (4).png" id="logo">
                  </a>
              </div>
  
              <div id="headerAd_2" align="center">
                  <ul class="nav justify-content-center">
                  	<li class="nav-item">
                          <a class="nav-link" href="member.ad">MEMBER</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" href="product.ad">PRODUCT</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" href="order.ad">ORDER</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" href="magazine.ad">MAGAZINE</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" href="review.ad">REVIEW</a>
                      </li>
  
                      <li class="nav-item dropdown">
                          <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">CUSTOMER SERVICE</a>
                          <div class="dropdown-menu">
                              <a class="dropdown-item" href="faq.ad">FAQ</a>
                              <a class="dropdown-item" href="inquiry.ad">INQUIRY</a>
  						</div>
                      </li>
  
                  </ul>
              </div>
  
              <div id="header_3">
	                 <c:choose>
	                     <c:when test="${ empty sessionScope.loginUser }">
	                     <!-- 로그인 전 -->
	                     <div id="text1">
	                         <a href="loginPage.me" id="sign"><span>로그인</span></a> &nbsp;&nbsp;|&nbsp; &nbsp;
	                         <a href="enrollForm.me"><span>회원가입</span></a>
	                     </div>
	                     </c:when>
	                     <c:otherwise>
	                         <div id="text2">
		                         <label><span>${ sessionScope.loginUser.userNick }</span> 님</label>
		                         <!--  <a href="" class="my">마이페이지</a> -->
		                         <a href="logout.me" class="my">&nbsp;&nbsp; 로그아웃</a>
	                         </div>
	                                  
	                     </c:otherwise>
	                 </c:choose>
                 </div>
          </div>
      </div>
		
		</c:when>
		
		<c:otherwise>
		
		<div class="wrap">
    
            <div id="header">
    
                <div id="header_1" align="center">
                    <a href="${pageContext.request.contextPath}/">
                        <img src="resources/img/image (4).png" id="logo">
                    </a>
                </div>
                
                <div id="header_2" align="center">
                    <ul class="nav justify-content-center">
                        <li class="nav-item">
                            <a class="nav-link" href="list.pd">영양제</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="survey.su">건강체크</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="map.ma">동물병원 찾기</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="maga.re">매거진</a>
                        </li>
    
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">고객센터</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="faq.bo">FAQ</a>
                                <a class="dropdown-item" href="list.iq">1:1 문의</a>
    						</div>
                        </li>
                    </ul>
                </div>
    
                 <div id="header_3">
                
                <c:choose>
                	<c:when test="${ empty sessionScope.loginUser }">
                	<!-- 로그인 전 -->
                    <div id="text1">
                        <a href="loginPage.me" id="sign"><span>로그인</span></a> &nbsp;&nbsp;|&nbsp; &nbsp;
                        <a href="enrollForm.me"><span>회원가입</span></a>
                    </div>
                    </c:when>
                     <c:otherwise>
						<div id="text2">
						<label><span>${ sessionScope.loginUser.userNick }</span> 님</label>&nbsp;
						<a href="cart.re">
                        	<img src="resources/img/cart.png" id="cart">
                    	</a> <br>
                        <a href="myPage.me" class="my">마이페이지</a>
                        <a href="logout.me" class="my">&nbsp;&nbsp; 로그아웃</a>
                    	</div>
					             
                    </c:otherwise>
                    
                </c:choose>
                </div>
    
            </div>
        </div>
		
		</c:otherwise>
	</c:choose>

</body>
</html>