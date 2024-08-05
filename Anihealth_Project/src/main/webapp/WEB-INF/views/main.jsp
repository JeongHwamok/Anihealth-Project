<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANIHEALTH</title>
	<!-- swiper.js 라이브러리추가 (cdn) -->
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <style>
      
        .header-background {
            width: 100%;
            height: 750px;
            background-image: url(resources/img/maincat.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            padding: 1px;
            position: relative;         
        }

        .header-btn {
            width: 22%;
            height: 26%;
            bottom: 230px;
            /* 바닥으로 부터 0px 떨어진 위치 */
            right: 0;
            /* 오른쪽으로부터 0px 떨어진 위치 */
            margin-right: 50px;
            padding-bottom: 1px;
            position: absolute;
            border-radius: 10px;
            text-shadow: 2px 2px 4px #000000;
        }

        .header-btn h2,
        .header-btn h1,
        .header-btn h4,
        .header-btn button {
            margin-left: 23px;
            /* 왼쪽 여백 추가 */
            margin-top: 10px;
            margin-bottom: 10px;
            /* 아래쪽 여백 추가 */
            color: white;
        }

        .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .left, .right {
            flex: 1;
            margin: 10px;
        }

        .info p, .right p {
            margin: 5px 0;
        }


       .table-container {
            width: 73%;
            /* 매거진과 동물병원찾기 가로 길이 조정 */
            margin: 0 auto;
        }

        .content-table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
            margin-top: 20px;
            margin-bottom: 30px;
        }

        .content-table td {
            padding: 20px;
            vertical-align: top;
            text-align: center;
        }

        .content-table h3 {
            text-align: left;
            white-space: nowrap; /* 줄 바꿈 없이 한 줄로 유지 */
            font-weight: bold;
            color: rgb(88, 86, 86);
        }

        .image-text-container {
		    position: relative;
		    display: block;
		    width: 100%;
		}
		
		.content-image {
		    width: 100%;
		    height: auto;
		    border-radius: 10px;
		    object-fit: cover;
		    display: block; /* 이미지를 블록 요소로 설정 */
		}
		
		.image-caption {
		    position: absolute;
		    top: 6%; /* 이미지 상단에서 10% 아래로 위치 조정 */
		    left: 13px; /* 왼쪽에서 10픽셀 떨어진 위치 */
		    color: rgb(60, 59, 59);
		    text-align: left; /* 텍스트 왼쪽 정렬 */
		    width: 100%; 
		    padding: 10px; /* 패딩 추가 */
		    box-sizing: border-box; /* 패딩과 보더가 너비와 높이에 포함되도록 설정 */
		}
		
		.image-caption p {
		    margin: 4px 0; /* 텍스트 간격 설정 */
		    font-size: 1.7em; /* 기본 글자 크기 */
		}
		
		.image-caption .larger-text {
		    font-size: 1.9em; /* 더 큰 텍스트의 글자 크기를 더 크게 조정 */
		}
		
		.image-caption .detail-link {
		    margin-top: 15px; /* '자세히 보기' 위의 여백 추가 */
		    font-size: 1.4em; /* '자세히 보기'의 글자 크기를 조금 줄임 */
		}


        .slide-container {
            width: 70%;
            height: auto;
            margin: 0 auto;
            text-align: center;
            margin-top: 70px;
        }

        .slide-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-bottom: 40px;
        }

        .slide-container h3 {
            text-align: left;
            white-space: nowrap; /* 줄 바꿈 없이 한 줄로 유지 */
            margin: 11px;
            font-weight: bold;
            color: rgb(88, 86, 86);
        }

        .product-wrapper {
            display: flex;
            justify-content: space-around;
            align-items: center;
            padding: 20px;
            /* border: 1px solid rgb(141, 174, 157); */
            height: 460px;   
            /* 전체 칸의 높이 */
            margin-bottom: 70px;
        }

        .product-wrapper a{
            text-decoration: none;
            color: inherit;
            padding-left: 20px;
            padding-right: 20px;
        }

        .product {
            text-align: center;
            width: 35%;
            height: 85%;
            padding-top: 25px;
            padding-left: 0;
            padding-right: 0;
        }

        .product img {
        	margin-top: 20px;
            width: 200px;
            height: 200px; 
            cursor: pointer;
            object-fit: cover; 
            border-radius: 50%;
        }

        .product span {
            display: block;
            margin-top: 10px;
            color: rgb(121, 120, 120);
            padding-top: 10px;
            font-size: large;
        }
        .pd-name{
            font-weight: bold;
            padding-top: 20px;
           
        }
        .pd-price{
            margin-top: 0;
             margin-bottom: 99px;
        }



        .review-title{
            width: 100%;
            text-align: center;
            margin: 20px;
            margin-bottom: 20px;       
        }

        .review-title h3{
            font-weight: bold;
            color:  rgb(118, 158, 138);
        }

        .review-container {
            width: 100%;
            height: 400px;
            display: flex;
            justify-content: center;
            background-color: rgb(228, 236, 232);
            padding: 0; /* 패딩 제거 */
        }

        .review-row {
            display: flex;
            width: 80%;
            justify-content: space-between;
          /*   align-items: center; */
        }

         .product-rw {
            width: 22%; /* 각 디브가 일정한 너비를 가지도록 설정 */
            text-align: center;
            background-color: white;
            border-radius: 20px;
            box-sizing: border-box;
            padding: 20px;
            padding-top: 30px;
            padding-bottom: 30px; 
			display: flex;
		    flex-direction: column;
		    justify-content: center;
		    height: 300px; /* 내용에 따라 높이 자동 조절 */
		    margin-top: 40px; /* 원하는 여백 설정 */		    
        }

         .product-rw img {
            width: 140px;
            height: 140px; 
            cursor: pointer;
            object-fit: cover;
             /* object-fit: contain; */
            border-radius: 50%;
        }

        .product-rw a {
            text-decoration: none;
            color: inherit;
        }

        .product-rw span {
            display: block;
            margin-top: 10px;
            color: rgb(121, 120, 120);
            padding-top: 10px;
        }

        .product-rw .pd-title1 {
            margin-top: 0;
            font-weight: bold;
            font-size: large;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        /* 앵커 태그에 호버했을 때 모든 자식 요소에 적용되는 효과 */
		.product a#product-link:hover {
		    text-decoration: none; /* 앵커 전체의 밑줄 제거 */
		}
		
		.product a#product-link:hover .pd-name {
		    color: black;
		}
		
		.product a#product-link:hover .pd-price {
		      color: black;
		}
		
		.product a#product-link:hover img {
		    transform: scale(1.1); /* 이미지 크기를 10% 증가 */
		    transition: transform 0.3s ease; /* 부드러운 전환 효과 */
		}
        
         .hidden {
            opacity: 0;
        }
        
        div[class^=swiper-button] {
                color:  rgb(228, 236, 232);
                /* display : none; */
                /* 아니면 안보이게 숨기기도 가능 */
                --swiper-navigation-size: 55px;
            }
            
        .product-rw a:hover{
        	text-decoration: none;
            color: inherit;
            transform: scale(1.1);
        }
    </style>
    
</head>

<body>
	
	<jsp:include page="common/header.jsp" />
	
	
	<c:choose>
		<c:when test="${ not empty sessionScope.loginUser && sessionScope.loginUser.userId eq 'admin' }">
			<jsp:include page="admin/adMain.jsp" />
		</c:when>
		<c:otherwise>
			<div class="parent" >
		                <div class="header-background">
		                    <div class="header-btn">
		                        <h2>지켜주고픈 </h2>
		                        <h1>반려동물의 건강</h1>
		                        <h4>댕냥이 전용 맞춤 영양제</h4>
		                        <button class="btn btn-lg"
		                                style="background-color: rgb(153, 188, 133);" onclick="location.href='survey.su'">
		                                건강 설문 조사하기
		                        </button>
		                    </div>
		                </div>
		                <br>
		                <div class="table-container main-section hidden animate__animated animate__slower" data-animate="animate__fadeInLeft">
		    <table class="content-table">
		        <tr>
		            <td>
		                <h3>매거진</h3>
		                <div class="image-text-container">
		                    <a href="maga.re">
		                        <img src="resources/img/cat-megazine_720.png" alt="매거진 이미지" class="content-image">
		                        <div class="image-caption">
								    <p>반려동물의</p>
								    <p class="larger-text">모든 건강 정보 보기</p>
								  <p class="detail-link">자세히 보기 >>></p>
								</div>
		                    </a>
		                </div>
		            </td>
		            <td>
		                <h3>동물병원 찾기</h3>
		                <div class="image-text-container">
		                    <a href="map.ma">
		                        <img src="resources/img/dog-find_720.png" alt="동물병원 이미지" class="content-image">
		                       <div class="image-caption">
								    <p>잠깐!!!</p>
								    <p class="larger-text">전문 수의사와</p>
								    <p class="larger-text">상담 받았나요?</p>
								    <p class="detail-link">자세히 보기 >>></p>
								</div>
		                    </a>
		                </div>
		            </td>
		        </tr>
		    </table>
		</div>
		      <div class="slide-container  main-section hidden animate__animated animate__slower" data-animate="animate__fadeInRight">
		            <div class="slide-table">
		                <h3>BestPick!</h3>
				           <div class="product-wrapper">
								<div class="swiper">
			                        <!-- Additional required wrapper -->
			                        <div class="swiper-wrapper">
			                            <!--  해당 슬라이드 이미지에  href 하기 -->
			                        </div>
			                        
			                        <!-- If we need pagination -->
			                        <div class="swiper-pagination"></div>
			                        <!-- If we need navigation buttons -->
			                        <div class="swiper-button-prev"></div>
			                        <div class="swiper-button-next"></div>
			                        <!-- If we need scrollbar -->
			                        <!-- <div class="swiper-scrollbar"></div> -->
			                    </div>
				           </div>
				    </div> 
		    		
		    		
		                <div class="review-title  main-section hidden animate__animated animate__slower" data-animate="animate__fadeInLeft">
		                    <h3>ANIHEALTH 와 함께하는 고객 후기</h3>
		                </div>
		            <div class="review-container main-section hidden animate__animated animate__slower" data-animate="animate__fadeInUp">
		            	<div class="review-row">
				            
			          </div>
			    </div>
			    
			    
			</div>
			
	</div>		
		      <script>
                $(function() {
                    $.ajax({
                        url: "mList.re",
                        type: "get",
                        success: function (rList) {
                            listStr = '';
                            for (let i = 0; i < rList.length; i++) {
                                listStr += '<div class="product-rw"> <a href="detail.pd?pno=' + rList[i].productNo + '">';
                                listStr += '<img src='+ rList[i].reviewFilePath+ ' alt="Product Image"' + (i+1) + '>';
                                listStr += '<span class="pd-name1">'+ rList[i].productName +'</span>';
                                listStr += '<span class="pd-title1">' + rList[i].reviewTitle + '</span> </a> </div>';
                            }
                            $(".review-row").html(listStr);
                        },
                        error: function () {
                            console.log("리뷰 목록 AJAX 통신 실패!");
                        }
                    });
                });

                $(function() {
                    $.ajax({
                        url: "selectBest.ad",
                        type: "get",
                        success: function(list) {
                        	
                            let str = "";
                            
                            for (let i in list) {
                                // 가격을 포맷팅
                                let formattedPrice = parseFloat(list[i].price).toLocaleString('ko-KR');
                                
                                str += "<div class='product swiper-slide'>"
                                     +   "<a href='detail.pd?pno=" + list[i].productNo + "' id='product-link'>"
                                     +      "<img src='" + list[i].productThumbnailPath + "' alt='Product Image 1'>"
                                     +      "<span class='pd-name'>" + list[i].productName + "</span>"
                                     +      "<span class='pd-price'>" + formattedPrice + " 원</span>"
                                     +   "</a>"
                                     + "</div>";
                            }

                            $(".swiper-wrapper").html(str);

                            // 슬라이더 동작 정의
                            const swiper = new Swiper('.swiper', {
                                slidesPerView: 3,
                                slidesPerGroup: 3,
                                spaceBetween: 20,
                                centeredSlides: false,
                                autoplay: {
                                    delay: 4000,
                                    disableOnInteraction: false,
                                },
                                pagination: {
                                    el: ".swiper-pagination",
                                    clickable: true,
                                },
                                navigation: {
                                    nextEl: ".swiper-button-next",
                                    prevEl: ".swiper-button-prev",
                                },
                            });
                        },
                        error: function() {
                            console.log("베스트 상품 AJAX 통신 실패!");
                        }
                    });
                });

                document.addEventListener('DOMContentLoaded', function() {
                    const observerOptions = {
                        threshold: 0.1
                    };

                    const observerCallback = (entries, observer) => {
                        entries.forEach(entry => {
                            if (entry.isIntersecting) {
                                entry.target.classList.remove('hidden');
                                entry.target.classList.add(entry.target.getAttribute('data-animate'));
                                observer.unobserve(entry.target);
                            }
                        });
                    };

                    const observer = new IntersectionObserver(observerCallback, observerOptions);

                    document.querySelectorAll('.main-section').forEach(elem => {
                        observer.observe(elem);
                    });
                });
            </script>

		    <br><br><br>
		   
		    <jsp:include page="common/footer.jsp" />
		</c:otherwise>
	</c:choose>
	
</body>
</html>