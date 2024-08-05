<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANIHEALTH</title>
<style>
	.outer {
		width: 100%;
        padding-top: 100px;
        padding-bottom: 80px;
	}
	
	#list-area {
		width: 50%;
        margin: 0 auto; 
        /* 부모 요소의 가운데 정렬을 위해 auto 마진 추가 */
	}
	
	#detail-area-content th {
        margin: 0 auto; 
        text-align : center;
        /* 부모 요소의 가운데 정렬을 위해 auto 마진 추가 */
        margin-left:auto;
        margin-right:auto;
	}
	
	#activeLabel {
		padding-right : 50px;
	}
	
	/* 제목 영역 시작 */
 	.header-product {
        margin-left: auto;
        margin-right: auto;
        margin-bottom: 50px;   
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
   
   /* 배송지 스타일 시작 */
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
    /* 배송지 스타일 끝 */
    
    /* 버튼 영역 시작 */
    .btns button {
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

   .btns button:hover {
       background-color:  rgb(198, 228, 212);
   }
   /* 버튼 영역 끝 */
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	
	<div class="outer">
	
		<div class="header-product">
            <h1>MEMBER DETAIL</h1>
        </div>
        
		<div id="list-area">
			<form id="enroll-form" action="updateMember.ad" method="post">
			
				<input type="hidden" name="userNo" value="${ requestScope.m.userNo }">
				
				<table id="detail-area-content" class="table">
					<!-- 기본 정보 -->
					<thead>
						<tr>
							<th width="250px">회원 번호</th>
							<td>${ requestScope.m.userNo }</td>
						</tr>
						<tr>
							<th>회원 아이디</th>
							<td>${ requestScope.m.userId }</td>
						</tr>
						<tr>
							<th>회원 이름</th>
							<td>
								<input type="text" name="userName" class="form-control" maxlength="6" placeholder="이름을 입력해주세요" value="${ requestScope.m.userName }" required>
							</td>
						</tr>
						<tr>
							<th class="nickTh">* 회원 닉네임</th>
							<td>
								<input type="text" name="userNick" class="form-control" minlength="2" maxlength="11" value="${ requestScope.m.userNick }" placeholder="닉네임(2~11자 한글/영문)" required>
								<div id="nickCheckResult" style="font-size: 0.8em;"></div>
							</td>
						</tr>
						<tr>
							<th>회원 이메일</th>
							<td>${ requestScope.m.email }</td>
						</tr>
						<tr>
							<th>* 회원 전화번호</th>
							<td>
								<input type="text" name="phone" class="form-control"  maxlength="13" placeholder="- 포함해서 입력해주세요" value="${ requestScope.m.phone }" required>
							</td>
						</tr>
						<tr>
							<th>* 회원 생년월일</th>
							<td>
								<input type="date" class="form-control" value="${ requestScope.m.userBirthday }" name="userBirthday" placeholder="YY-MM-DD 형식" required>
							</td>
						</tr>
						<tr>
							<th>회원 가입일</th>
							<td>${ requestScope.m.createDate }</td>
						</tr>
						<tr>
							<th>* 회원 활동여부</th>
							<td class="status">
								<input type="radio" class="form-check-inline" id="active" name="status" value="Y"><label id="activeLabel" for="active">활동</label>
								<input type="radio" class="form-check-inline" id="inactive" name="status"  value="N"><label for="inactive">정지</label>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th></th><td></td>
						</tr>
					</tbody>
				</table>
				
				<div class="btns" id="enroll-form" align="center">
		        	<button class="btn btn-lg" type="submit">수정</button>
		        	<button class="btn btn-lg" type="button" onclick="location.href='detailMember.ad?mno=${ requestScope.m.userNo }'">뒤로가기</button>
		        	<button class="btn btn-lg" type="reset">초기화</button>
		        </div>
				
			</form>			
		</div>
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
       			$("#enroll-form button[type=submit]").attr("disabled", true);
       			
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
       							$(".nickTh").css("padding-bottom", "30px");
       							
       							// 빨간색 메세지로 출력
       							$("#nickCheckResult").show()
	       											 .css("color", "red")
	       											 .text("이미 사용중인 닉네임입니다. 다시 입력해주세요.");
       							
       							// 수정버튼 비활성화
       							$("#enroll-form button[type=submit]").attr("disabled", true);
       							
       						} else {
       							// 사용 가능한 아이디일 경우
       							$(".nickTh").css("padding-bottom", "30px");
       							
       							// 초록색 메세지로 출력
       							$("#nickCheckResult").show();
       							$("#nickCheckResult").css("color", "green");
       							$("#nickCheckResult").text("사용 가능한 닉네임입니다.");
       							
       							// 수정버튼 활성화
       							$("#enroll-form button[type=submit]").attr("disabled", false);
       							
       						}
       						
       					},
       					error : function() {
       						console.log("닉네임 중복 체크용 ajax 통신 실패!");
       					}
       				});
       				
       			} else {
       				// 2글자 미만
       				
       				$(".nickTh").css("padding-bottom", "");
       				
       				// 수정버튼 비활성화
       				$("#enroll-form button[type=submit]").attr("disabled", true);
       				
       				// 메세지 숨기기
       				$("#nickCheckResult").hide();
       				
       			}
       			
       		});
		});
		
		/* 조회된 상태여부 표시 */
		$(function() {
			
			let status = "${ requestScope.m.status }";
			
			if(status == 'Y') {
				
				$(".status input[value=Y]").attr("checked", true);
				
			} else {
				
				$(".status input[value=N]").attr("checked", true);
				
			}
			
		});
      </script>
	
</body>
</html>