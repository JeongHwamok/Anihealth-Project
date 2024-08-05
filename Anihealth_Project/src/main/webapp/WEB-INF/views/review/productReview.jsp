<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANIHEALTH</title>

<style>

	        /*영양제 후기 메인 영역 시작*/
        .parent-container-rw {
            width: 100%;
            margin: 0 auto;
        }

        .inner-container-rw {
            width: 65%;
            margin: 0 auto;
            /*padding-top: 100px;*/
            /*padding-bottom: 100px;*/
        }

        .header-faq {
            text-align: center;
            padding-bottom: 30px;
            margin-top: 10px;
        }

        .header-faq h1 {
            color: #57585c;
            text-align: center;
        }


        /* 총점 평균 영역 시작 */
        .container-star-avg {
            margin: auto;
            padding: 20px;
            box-sizing: border-box;
            background-color: #f6f6f6;
            margin-top: 30px;
            margin-bottom: 40px;
            border-radius: 20px;
            display: flex;
            justify-content: space-between; 
            align-items: center;
        }

        .container-star-avg td {
            vertical-align: top;
            padding: 10px;
            /* 여백 추가 */
        }

        .container-star-avg>div {
            flex-grow: 1;
            margin: 0 10px;
            /* 양옆 여백 추가 */
        }

         .progress-wrapper {
            margin: 10px 0;
            position: relative;
            background-color: #f6f6f6;
        }

        .progress {
        	height: 20px;
            display: flex;
            align-items: center;
            /* 글자사이간격 */
            position: relative;
            /* 상대 위치 지정 */
            background-color: #f6f6f6;
        }

        .progress-bar {
            background-color: rgb(112, 179, 246);
            text-align: center;
            padding: 4px 0;
            /* 프로그래스바의 두께 */
            width: 80%;
            /* 부모 요소에 맞게 80%로 설정 */
            border-radius: 20px;
        }

        .progress-text {
            font-size: 1.4em;
            padding-right: 5px;
            white-space: nowrap;
        }

        .progress-label {
            position: absolute;
            left: 87%;
            transform: translateX(50%);
            /* 위치 조정 */
            font-size: 1.3em;
            white-space: nowrap;
        }

        .rating {
            display: flex;
            flex-direction: column;
            align-items: center;
			justify-content: center;
            /* margin: auto; */
            font-size: 1.5em;

        }

        .rating-stars {
            color: rgb(255, 222, 36);
            font-weight: bold;
        }

        .container-star-avg table {
            width: 100%;
        }

        .container-star-avg td {
            padding: 0 10px;
            width: 50%;
            vertical-align: top;
            /* text-align: center; */
            /* 텍스트 중앙 정렬 */
        }

        .rating p {
            margin: 5px 0;
            /* 단락 간격 조정 */
            font-size: inherit;
            /* 부모 요소의 글자 크기 상속 */
            font-weight: bold;
        }
        /* 총점 평균 영역 끝 */

        .header-table-rw {
            width: 100%;
            margin-top: 50px;
            margin-bottom: 30px;
        }

        .header-table-rw a {
            text-decoration: none;
            color: inherit;
        }
        .header-table-rw td {
            font-size: 1.2em;
            font-weight: bold;
            color: #676464;
        }

        .left-header-rw {
            text-align: left;
        }

        .right-header-rw {
            text-align: right;
        }  
        .star {
            color: rgb(255, 222, 36);
            font-size: 1.2em;
        }


        .info-table-rw {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
            margin-top: 10px;
        }

        .info-table-rw td {
            vertical-align: top;
            padding: 8px;
        }

        .info-table-rw tbody tr td {
            padding-bottom: 10px;
        }

        .table-line {
            border-top: 1.5px solid #99BC85;
        }

        .info-table-rw tbody:last-child {
            border-bottom: 1.5px solid #99BC85;
        }

        .image-column {
            width: 20%;
            text-align: center;
            vertical-align: middle;
        }

        .image-box {
            width: 100%;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            /* 부모 높이 채우기 */
        }

        .slide-image {
            width: 110px;
            height: 110px;
            object-fit: cover; 
            border-radius: 10px;
          /*     object-fit: contain;  */
            /*  overflow: hidden;  */
        }

        .info-title1 {
            font-weight: bold;
        }

        .info-title2 {
            font-weight: bold;
            color: gray;
            margin-left: 25px;
        }

        .info-title3 {
            font-weight: bold;
            margin-top: 30px;
            margin-bottom: 60px;
        }

        .info-content-rw {
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
        }
        .review-content {
           padding-top: 15px;
        }

        .stars {
            position: absolute;
            right: 0;
            display: inline-block !important;
            text-align: right !important;
            color: rgb(255, 222, 36) !important; 
        }
        .star-score {
            font-size: large;
            font-weight: bold;
            color: rgb(51, 132, 245);
            margin-left: 20px;
        }
        /*영양제 후기 메인 영역 끝*/

        
        /* 뒤로가기 버튼 영역시작 */
        .btn-back-container {
            width: 100%;
            text-align: center;
            /* 중앙 정렬 */
        }

        .btn-back>button {
            font-size: 120%;
            font-weight: bold;
            margin-bottom: 50px;
            cursor: pointer;
            border: 3px solid rgb(82, 166, 121);
            color: rgb(83, 88, 88);
            font-weight: 600;
        }
        
        /* 페이지 처리*/
        .paging-btns li {
		    display: inline-block;
		    border: none;
		    background-color: #f0f0f0; 
		    color: #202020; 
		    padding: 10px 15px; 
		    margin: 0 5px; 
		    cursor: pointer;
		    border-radius: 10px; 
		    border: 1px solid rgb(82, 166, 121);
		}
		
		.paging-btns li:hover {
		    background-color: rgb(198, 228, 212);
		}
		
		.paging-area li.active {
		    background-color: rgb(198, 228, 212);
		    color: #202020; 
		    cursor: default;
		}
		.paging-area li.active:hover {
            background-color: (198, 228, 212);
            color: #202020;
        }
        .paging-btns li {
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
		
		.paging-btns li {
		    font-size: 105%;
		    font-weight: 600;
		}
		
		.current-page {
		    background-color: #007bff;
		}
		.star-wrap {
			width: 230px;
			margin: auto;
			position: relative;
		}
		.starBack{
			position: absolute;
			width: 100%;
			overflow: hidden;
			color: gray;
			z-index: 1; /* Under the colored stars */

		}

		.starCon{
			/* width: 49.2% !important; */
			position: absolute;
			overflow: hidden;
			white-space: nowrap;
			color: rgb(255, 222, 36); /* Filled stars color */
			z-index: 2; /* On top of base stars */
	
		}


		



</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
	<div class="parent-container-rw">
		<div class="inner-container-rw">
			<div>
				<!-- <h1>영양제 후기</h1>-->
				<!-- <i class="fa-solid fa-star "></i>
				<span class="star"><i class="fa-solid fa-star "></i></span> 
				<span class="star"><i class="fa-solid fa-star "></i></span> 
				<span class="star"><i class="fa-solid fa-star "></i></span> 
				<span class="star"><i class="fa-solid fa-star decimal"></i></span> -->
			</div>
			<div class="container-star-avg">
				<table>
					<tr>
						<td class="rating-container">
							<div class="rating">
								<p>총점 평균</p>
								<p></p>
								<div class="star-wrap">
									<div class="starBack">
										<i class="fa fa-star" style="font-size:36px; "></i>
										<i class="fa fa-star" style="font-size:36px; "></i>
										<i class="fa fa-star" style="font-size:36px; "></i>
										<i class="fa fa-star" style="font-size:36px; "></i>
										<i class="fa fa-star" style="font-size:36px; "></i>
									</div>
									<div class="starCon">
										<i class="fa fa-star" style="font-size:36px; "></i>
										<i class="fa fa-star" style="font-size:36px; "></i>
										<i class="fa fa-star" style="font-size:36px; "></i>
										<i class="fa fa-star" style="font-size:36px; "></i>
										<i class="fa fa-star" style="font-size:36px; "></i>
									</div>
								</div>
							</div>
						</td>
						<td class="progress-container">
							<div class="progress-wrapper no5">
                             
                            </div>
                            <div class="progress-wrapper no4">
                      
                            </div>
                            <div class="progress-wrapper no3">
           
                            </div>
                            <div class="progress-wrapper no2">
    
                            </div>
                            <div class="progress-wrapper no1">
      
                            </div>
						</td>
					</tr>
				</table>
			</div>

			<div>
				<table class="header-table-rw">
					<tr>
						<td class="left-header-rw">전체 후기 <span> 5 </span> 건
						</td>
						<td class="right-header-rw"><a href="">최신순</a> &nbsp;|&nbsp;
							<select class="custom-select" aria-label="Default select example" onchange="selectReviewList(1);" style="width: 140px; font-size: 16px;">
							  <option selected value="0">모든 별점보기</option>
							  <option value="5">5점</option>
							  <option value="4">4점</option>
							  <option value="3">3점</option>
							  <option value="2">2점</option>
							  <option value="1">1점</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
	
			<table class="info-table-rw">
				
			</table> 
			<br>
    	<div class="page-rw paging-area">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center paging-btns">
                
                </ul>
            </nav>    
        </div>    
		</div>
	</div>
	
	<!--
	<div class="btn-back-container">
		<div class="btn-back">
			<button class="btn btn-lg" onclick="history.back()">뒤로가기</button>
		</div>
	</div>
    -->

	<style>
	@media ( max-width : 950px) {
		.header-btn {
			width: 90%;
			/* 너비를 90%로 조정 */
			height: auto;
			/* 높이를 자동으로 조정하여 비율 유지 */
			bottom: 10%;
			/* 바닥으로부터 10% 떨어진 위치 */
			right: 5%;
			/* 오른쪽으로부터 5% 떨어진 위치 */
			margin-right: 0;
			/* 우측 여백 제거 */
			padding: 10px;
			/* 내부 여백 추가 */
		}
		.header-btn h4, .header-btn h3, .header-btn p, .header-btn button {
			margin-left: 0;
			/* 왼쪽 여백 제거 */
			margin-top: 5px;
			/* 위 여백 조정 */
			margin-bottom: 5px;
			/* 아래쪽 여백 조정 */
		}
	}
	
	@media ( max-width : 950px) {
		#logo {
			height: 80px;
			/* 높이를 80px로 조정 */
			margin-left: 10px;
			/* 왼쪽 여백을 10px로 조정 */
		}
		#header_2 ul {
			margin-right: 0;
			/* 우측 여백 제거 */
		}
		#header_3 {
			margin-right: 10px;
			/* 로그인 구역의 우측 여백을 10px로 조정 */
		}
		@media ( max-width : 950px) {
			.container {
				flex-direction: column;
				align-items: center;
			}
			.left, .right {
				text-align: center;
			}
		}
		@media ( max-width : 950px) {
			.info p, .right p {
				font-size: 14px;
			}
			.left-line1 {
				font-size: 12px;
			}
		}
	}
	
	@media ( max-width : 950px) {
		.inner-container-rw {
			width: 90%; /* 컨테이너 너비를 90%로 조정 */
			padding-top: 50px; /* 상단 패딩 조정 */
			padding-bottom: 20px; /* 하단 패딩 조정 */
		}
		.container-star-avg {
			flex-direction: column; /* 세로 배치로 변경 */
			align-items: flex-start; /* 왼쪽 정렬 */
		}
		.rating-container, .progress-container {
			width: 100%; /* 전체 너비 사용 */
			margin: 0 0 20px 0; /* 아래 여백 추가 */
		}
		.progress {
			width: 100%; /* 전체 너비 사용 */
		}
		.progress-bar {
			width: 100%; /* 전체 너비 사용 */
		}
		.progress-label {
			left: auto;
			right: 10px; /* 오른쪽 끝으로 위치 조정 */
			transform: none;
		}
	}
</style>		
	<script>
       	$(function() { 		
     		selectReviewList(1);
       		//setInterval(selectReplyList, 1000); 실시간 반영코드
       	});	

       	function selectReviewList(pageNum) {
			//console.log($(".custom-select option:selected").val());
       		$.ajax({
       			url : "plist.re",
       			type : "get",
       			data : {
       				productNo: ${param.productNo}, // param 받는법
       				rating: $(".custom-select option:selected").val(),
       				currentPage: pageNum
       			},
       			success: function(result) {
       				
       				/*
       				let ratingList = result.ratingList;
       				ratingList.sort(function(a, b) {
       				    return b.RATING - a.RATING;
       				}); //정렬 콜백함수 정의
  					 */
       				let rlist = result.list;
       				let rpi = result.pi;
       				let ratingMap = result.ratingMap;
       				//console.log(ratingMap);
       							
       				let ratingStr = "";
       				let sumRating = 0;
       				let countRating = 0;
       				let avgRating = 0;
       				
					// 별점 개수 항목 출력
       				for ( var key in ratingMap) { // 객체 반복문
       					let ratingStr = "";
       					ratingStr += "<div class='progress'>"
						if(key != 1) {
							ratingStr += "<span class='progress-text'>" + key + " 점 </span>";
						} else {
							ratingStr += " <span class='progress-text' style='letter-spacing: 1px; padding-left: 2px;'>" + key + " 점 </span>";
						}
    					
    					ratingStr += "<div class='progress-bar star-pgr' style='width:" + 15 * (key) + "%;'></div>"
						if(ratingMap[key] != 1){
							ratingStr += "<span class='progress-label'>" + ratingMap[key] + "개 </span>"
						} else {
							ratingStr += "<span class='progress-label' style='letter-spacing: 2px; padding-left: 1px;'>" + ratingMap[key] + "개 </span>"
						}
    					ratingStr += "</div>";
    					sumRating += key * ratingMap[key];
    					countRating += ratingMap[key];
    					$(".no"+ key).html(ratingStr);
					}
					$(".left-header-rw>span").text(rpi.listCount);

					// 평균평점 계산 
       				avgRating = sumRating/countRating;
					let roundedRating = Math.round(avgRating*10)/ 10;

    				// 후기 리스트 입력
       				let listStr = "";
       				let pageStr = "";
       				if (rlist.length != 0) {
						for(let i = 0; i < rlist.length; i++){
	       					listStr += "<tbody> <tr class='table-line'> <td class='text-column'> <div class='info-content-rw'>" ;
	       					listStr += "<div> <span class='info-title1'>" + rlist[i].userNick + "</span>";
	       					listStr += "<span class='info-title2'>" + rlist[i].reviewDate + "</span>";
	       					listStr += "<div class='stars rw-star'>" ;
	       				    
	       				    for(let k = 0; k < rlist[i].rating; k++){
	       				    	listStr += "<i class='fa-solid fa-star'></i>";
	       				    }
	       				    listStr += "<span class='star-score'>" + rlist[i].rating+ "</span> </div> </div> </div>";
	       				    listStr += "<div style='margin-top: 10px;'> <span class='info-title3'>" + rlist[i].reviewTitle  + "</span> </div>";
	       				    listStr += "<div class='text-column review-content'> <div> <p>" + rlist[i].reviewContent + "</p> </div> </td>" ;
	       				    listStr += "<td class='image-column' rowspan='2' colspan='2'> <div class='image-box'>" ;
	       				    listStr += "<img src='" + rlist[i].reviewFilePath + "'class='slide-image'> </div> </td> </tr> </tbody>"
	       				}
						
					// 페이지 버튼 입력						
	   					if(rpi.currentPage != 1){
	   						pageStr += "<li class='page-item ' onclick='selectReviewList("+ (rpi.currentPage - 1) +");'><</li>";
	   					} else {
	   						pageStr += "<li class='page-item disabled'><</li>";
	   					} 
	   					
	       				for (let i = rpi.startPage; i <= rpi.endPage; i++) {
	       					if (rpi.currentPage != i) {
	       						pageStr += "<li class='page-item' onclick='selectReviewList("+ i +");'>" + i + "</li>";
							} else {
								pageStr += "<li class='page-item active'>" + i + "</li>";
							}			
						}
	       				
	   					if(rpi.currentPage != rpi.maxPage){
	   						pageStr += "<li class='page-item' onclick='selectReviewList("+ (rpi.currentPage + 1) +");'>></li>";
	   					} else {
	   						pageStr += "<li class='page-item disabled'>></li>";
	   					} 
	   					
					} else {
						listStr += "<span align='center'><h2>작성된 후기가 없습니다</h2></span>";
					}
       					
       				$(".rating>p").eq(1).html(roundedRating); //평균평점 출력
					$(".starCon").css("width", (roundedRating * 20) + "%"); //* 0.984, 평점 대응 별 찍기
   					//$(".progress-container").html(ratingStr);
       				$(".info-table-rw").html(listStr); // 후기 리스트 출력 
       				$(".pagination").html(pageStr); // 페이지 버튼 출력
       			},
       			error : function() {	
       				console.log("리뷰 조회 실패!");
       			}
       		});
		}
	</script>
</body>
</html>