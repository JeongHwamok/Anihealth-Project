<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
                <c:forEach var="m" items="${ requestScope.list }">
	                <form action="update.me">
	                    <table id="myPage_tb">
	                        <tr>
	                            <th>아이디</th>
	                            <td>
	                                ${ m.userId }
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>닉네임</th>
	                            <td>
	                                ${ m.userNick }
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>이름</th>
	                            <td>
	                                ${ m.userName }
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>이메일</th>
	                            <td>
	                                ${ m.email }
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>전화번호</th>
	                            <td>
	                                ${ m.phone }
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>생년월일</th>
	                            <td>
	                                ${ m.userBirthday }
	                            </td>
	                        </tr>
	                        <tr>
	                            <td colspan="2" height="10px"></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2" class="form-buttons" style="text-align: center;">
	                                <a class="btn" href="myPageUpdate.me" id="btn-update">수정하기</a>
	                                <button type="button" class="btn" id="btn-pwdUpdate" data-toggle="modal" data-target="#pwdUpdateForm">비밀번호 변경</button>
	                                <button type="button" class="btn" id="btn-delete" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
	                                
	                            </td>
	                        </tr>
	                    </table>
	                </form>
                </c:forEach>
                <div class="gray-line"></div>
            </div>
        </div>
    </div>
    
    <!-- 탈퇴 -->
    <div class="modal fade" id="deleteForm">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">회원탈퇴</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <form action="delete.me" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div align="center">
                            탈퇴 후 복구가 불가능합니다. <br>
                            정말로 탈퇴 하시겠습니까? <br>
                        </div>
                        <br>
                            <label for="userPwd" class="mr-sm-2">Password : </label>
                            <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="userPwd" name="userPwd" required> <br>
                    		<!-- 회원 탈퇴 시 PK 에 해당하는 회원의 아이디도 같이 넘겨야함 -->
                    		<input type="hidden" name="userId" value="${ sessionScope.loginUser.userId }">
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn btn-danger">탈퇴하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    
    <!-- 비번 수정 -->
    <div class="modal fade" id="pwdUpdateForm">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">비밀번호 변경</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <form action="checkPwd.me" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div align="center">
                            기존 비밀번호를 입력해주세요.<br>
                        </div>
                        <br>
                            <label for="userPwd" class="mr-sm-2">Password : </label>
                            <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="userPwd" name="userPwd" required> <br>
                    		<!-- 회원 탈퇴 시 PK 에 해당하는 회원의 아이디도 같이 넘겨야함 -->
                    		<input type="hidden" name="userId" value="${ sessionScope.loginUser.userId }">
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn btn-danger">확인</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <br><br><br><br><br><br><br><br>
    <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
