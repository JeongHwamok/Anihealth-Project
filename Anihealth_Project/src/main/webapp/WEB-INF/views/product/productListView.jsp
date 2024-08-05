<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANIHEALTH</title>
<style>
 /* 메인컨테츠영역 시작 */
        .parent {
            width: 100%;
            padding-top: 100px;
            padding-bottom:80px;
        }

        .parent-content {
            width: 80%;
            margin: 0 auto;
            /* 부모 요소의 가운데 정렬을 위해 auto 마진 추가 */
        }

        .parent-container {
            width: 100%;
            display: flex;
            justify-content: center;
            /* 부모 요소를 중앙에 배치 */
        }


        /* 영양제 제목영역 시작 */
        .header-faq {
            padding-bottom: 20px;
            margin-bottom: 10px;
        }

        .header-faq h1 {
            color: #57585c;
            text-align: center;
        }

        /* 영양제 제목 영역 끝 */




        /* 가격순 정렬과 공통 키워드 검색 영역시작 */
        .parent-container {
            width: 100%;
            display: flex;
            justify-content: center;
        }

        .inner-container {
            width: 90%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
            margin-bottom: 30px;
        }

        .order-options ul {
            display: flex;
            gap: 15px;
        }

        .order-options li {
            display: inline;
            white-space: nowrap;
            /* 텍스트를 한 줄로 유지 */
            font-size: 105%;
            font-weight: bold;
            padding-top: 10px;
        }

        .order-options li a {
            text-decoration: none;
            color: #6c757d;
        }

        .search-container {
            margin-left: auto;
            /* 오른쪽 끝으로 이동 */
            float: right;
        }

        .search-container .navbar {
            display: flex;
            justify-content: flex-end;
            /* 오른쪽 정렬 */
        }

        .search-container .navbar .form-control,
        .search-container .navbar .btn {
            font-size: 110%;
            /* 글자 크기 10% 증가 */
        }
        .form-control{
        	 margin-left: 5px;
        }

        .search-container .navbar {
            display: flex;
            justify-content: flex-end;
            /* 오른쪽 정렬 */
        }

   
        #btn-search {
            border: 3px solid rgb(82, 166, 121);
            color: rgb(83, 88, 88);
            font-weight: 600;
            margin-left: 5px;
        }
          #btn-search:hover {
       	  background-color:rgb(82, 166, 121);
       	  color: white;
        }

        /* 가격순 정렬과 공통 키워드 검색 영역 끝 */



        /* 각 영양제 영역 시작 */
	     .outer-container {
		    text-align: center;
		    /* 중앙 정렬을 위한 텍스트 정렬 */
		    position: relative;
		    /* 검색 폼을 절대 위치로 정렬하기 위해 상대 위치 지정 */
		    display: flex;
		    justify-content: center;
		    width: 100%;
		    margin: 0 auto;
		    padding-bottom: 0; 
		}
		 .container-custom {
		    display: flex;
		    justify-content: center;
		    width: 100%;
		    margin: 0 auto;
		    padding-bottom: 0; 
		}

		.card-custom a {
		    text-decoration: none; /* 밑줄 제거 */
		    color: inherit; /* 부모 요소의 색상 상속 */
		}
		.card-custom a:hover {
		    text-decoration: none; /* 호버 시에도 밑줄 제거 */
		    color: inherit; /* 호버 시에도 부모 요소의 색상 상속 */
		}
         .row-custom-product-list {
        display: flex;
	        /* flexbox를 사용하여 자식 요소들을 정렬 */
	        flex-wrap: wrap;
	        /* 여러 줄로 감싸기 */
	        justify-content: flex-start;
	        /* 자식 요소들을 왼쪽 정렬 */
	        width: 1350px;
	        margin: 0 auto;
	        /* 부모 요소를 중앙에 배치 */
	         padding-bottom: 0; 
	    }

	    .row-custom {
	        width: 100%;
	        overflow: hidden;
	    }

	    .card-custom {
	        width: 22.6%;
	        box-sizing: border-box;
	        margin: 1.1%;
	        display: flex;
	        flex-direction: column;
	        height: 368px;
	        object-fit: cover; 
	         margin-bottom: 0;
	    }

        .card:hover {
            cursor: pointer;
        }

        .card {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            overflow: hidden;
            height: 100%;
            border: none;
        }

        .card-footer {
           text-align: left;
           background-color: white !important;
          /*  border:  1px solid #ddd; */
           border-radius: 10px;
            margin: 0; /* 여백 제거 */
            padding: 10px;
        }

        .fixed-img {
            width: 100%;
            height: 230px; /* 높이 고정 */
            object-fit: contain; 
          /*  overflow: hidden; */
        }

        .rounded {border-radius: 10px; }
        .drug-name {
        	font-weight: bold;
        	white-space: nowrap;
        }

        .drug-dose {
            white-space: nowrap;
            /* 텍스트 줄바꿈 방지 */
        }

        .drug-price {
            font-weight: bold;
            text-align: left;
        }
        .stars {
            display: inline-block;
            text-align: right;
            margin-left: 50px;
        }
        .stars i{
        	 color: rgb(255, 222, 36);
        	  font-weight: bold;
        }
        .star-rating {
            color: gold;
            font-size: 16px; /* 적절한 크기로 설정 */
            margin-left: 10px; /* 가격과 별점 사이 여백 */
            margin-right: 1px;
        }
        
        /* 영양제 영역 끝 */


        /* 페이징버튼 영역 시작 */
        .paging-btns button {
            border: none;
            background-color: #f0f0f0;
            color: #202020;
            padding: 10px 15px;
            margin: 0 5px;
            cursor: pointer;
            border-radius: 10px;
            margin-right: 15px;
            border: 1px solid  rgb(82, 166, 121);
        }

        .paging-btns button:hover {
            background-color: rgb(198, 228, 212);
        }

        .paging-area button.active {
            background-color: rgb(198, 228, 212);
            color: #202020;
            cursor: default;
        }

        .paging-area button.active:hover {
            background-color: (198, 228, 212);
            color: #202020;
        }

        .paging-btns>button {
            background-color: rgb(249, 246, 246);
        }

        .paging-area {
            text-align: center;
            display: flex;
            justify-content: center;
            /* 페이지 버튼을 가운데 정렬 */
            align-items: center;
            margin-top: 20px;
            /* 푸터 위로 나오게 적절한 여백 추가 */
        }

        .paging-btns {
            display: flex;
            justify-content: center;
            /* 페이지 버튼을 가운데 정렬 */
        }

        .paging-btns button {
            font-size: 100%;
            font-weight: bold;
        }

        /* 페이징버튼 끌 *

        /* 메인컨텐츠 영역 끌 */



</style>

</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="parent">
    <div class="parent-content">
        <div class="header-faq">
            <h1>영양제</h1>
        </div>

        <div class="parent-container">
            <div class="inner-container">
                <div class="order-options">
                    <ul>
                        <li><a href="?order=newest&category=${param.category != null ? param.category : ''}&keyword=${param.keyword != null ? param.keyword : ''}" id="order-latest" class="order-link">• 최신순 &nbsp;</a></li>
                        <li><a href="?order=priceAsc&category=${param.category != null ? param.category : ''}&keyword=${param.keyword != null ? param.keyword : ''}" id="order-lowest" class="order-link">• 낮은가격순</a></li>
                        <li><a href="?order=priceDesc&category=${param.category != null ? param.category : ''}&keyword=${param.keyword != null ? param.keyword : ''}" id="order-highest" class="order-link">• 높은가격순 &nbsp;</a></li>
                    </ul>
                </div>
                
                   <script>
					    $(document).ready(function() {
					        var urlParams = new URLSearchParams(window.location.search);
					        var order = urlParams.get('order');
					
					        if(order === 'newest') {
					            $('#order-latest').css('color', 'green');
					        } else if(order === 'priceDesc') {
					            $('#order-highest').css('color', 'green');
					        } else if(order === 'priceAsc') {
					            $('#order-lowest').css('color', 'green');
					        }
					
					        $("#order-latest, #order-highest, #order-lowest").click(function() {
					            $("#order-latest, #order-highest, #order-lowest").css("color", "");
					            $(this).css("color", "green");
					        });
					    });
					</script>
		             <div class="search-container">
					    <nav class="navbar">
					        <form class="form-inline" action="list.pd" method="get">
					            <select class="form-control" name="category" required>
					                  <option value="공통" ${selectedCategory != null && selectedCategory.equals('공통') ? 'selected' : ''}>공통</option>
									  <option value="강아지" ${selectedCategory != null && selectedCategory.equals('강아지') ? 'selected' : ''}>강아지</option>
									  <option value="고양이" ${selectedCategory != null && selectedCategory.equals('고양이') ? 'selected' : ''}>고양이</option>
					            </select>
					            <input class="form-control" 
					                   type="text"
					                   placeholder="검색어를 입력해주세요" 
					                   name="keyword"
					                   value="${searchKeyword}" required>
					            <button class="btn btn-search" id="btn-search" type="submit">검색</button>
					        </form>
					    </nav>
					</div>
					
					<script>
					$(function() {
					    var selectedCategory = '${selectedCategory}';
					    var searchKeyword = '${searchKeyword}';
					
					    if (selectedCategory) {
					        $('select[name="category"]').val(selectedCategory);
					    }
					    if (searchKeyword) {
					        $('input[name="keyword"]').val(searchKeyword);
					    }
					});
					</script>	
            </div>
        </div>

       <div class="outer-container">
		    <div class="container-custom">
		        <div class="row-custom-product-list">
		            <c:forEach var="p" items="${list}">
		                <div class="card-custom">
		                    <a href="detail.pd?pno=${p.productNo}">
		                        <div class="card">
		                            <img class="fixed-img rounded" src="${p.productThumbnailPath}" alt="Product Image">
		                            <div class="card-footer">
		                                <small class="drug-dose" style="font-weight: bold; color: gray;">
		                                    ${p.category} 영양제
		                                </small>
		                                <h6 class="drug-name" style="font-weight: bold;">
		                                    ${p.productName}
		                                </h6>
		                                <h6 class="drug-price">₩ <fmt:formatNumber value="${ p.price }" type="number" groupingUsed="true" />
		                                    <div class="stars">
		                                        <span class="star-rating-container star-rating-container${p.productNo}" style="display: none;">
		                                            <i class="fa-solid fa-star fa-sm"></i>
		                                            <span class="star-score star-score${p.productNo}"></span>
		                                        </span>
		                                        <span class="review-none review-none${p.productNo}" style="display: none;">리뷰 없음</span>
		                                    </div>
		                                </h6>
		                            </div>
		                        </div>
		                    </a>
		                </div>
		                <input type="hidden" value="${p.productNo}" class="ratingList">
		            </c:forEach>
		        </div>
		    </div>
       </div>


        <!-- 페이징바 -->
        <div align="center" class="paging-area">
            <div class="paging-btns">
                <c:choose>
                    <c:when test="${pi.currentPage eq 1}">
                        <button class="disabled">&lt;</button>
                    </c:when>
                    <c:otherwise>
                        <button onclick="location.href='list.pd?cpage=${pi.currentPage - 1}&order=${param.order != null ? param.order : ''}&category=${param.category != null ? param.category : ''}&keyword=${param.keyword != null ? param.keyword : ''}'">&lt;</button>
                    </c:otherwise>
                </c:choose>
                
                <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}" step="1">
                    <c:choose>
                        <c:when test="${pi.currentPage ne p}">
                            <button onclick="location.href='list.pd?cpage=${p}&order=${param.order != null ? param.order : ''}&category=${param.category != null ? param.category : ''}&keyword=${param.keyword != null ? param.keyword : ''}'">${p}</button>
                        </c:when>
                        <c:otherwise>
                            <button class="page-item active">${p}</button>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <c:choose>
                    <c:when test="${pi.currentPage eq pi.maxPage}">
                        <button class="disabled">&gt;</button>
                    </c:when>
                    <c:otherwise>
                        <button onclick="location.href='list.pd?cpage=${pi.currentPage + 1}&order=${param.order != null ? param.order : ''}&category=${param.category != null ? param.category : ''}&keyword=${param.keyword != null ? param.keyword : ''}'">&gt;</button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>


<!-- 검색 결과가 없는 경우 알림 표시 -->
<c:if test="${not empty noResults}">
    <script>
        alert("검색 결과가 없습니다. 다른 검색어를 입력해주세요.");
        window.location.href = 'list.pd';
    </script>
</c:if>

<jsp:include page="../common/footer.jsp" />

<!--별점조회-유상, 별숨기기-리뷰없음-진희  -->
<script>
    $(function () {
        let productNoArr = [];
        
        $(".ratingList").each(function () {
            productNoArr.push($(this).val());
        });

        $.ajax({
            url: "rating.pd",
            method: "get",
            data: { productNoArr: productNoArr },
            traditional: true, // 요청값이 배열일 때
            success: function(rList) {
                // 모든 제품에 대해 초기 설정
                productNoArr.forEach(function(productNo) {
                    $(".star-rating-container" + productNo).hide(); // 별 아이콘 영역 숨기기
                    $(".review-none" + productNo).show(); // 리뷰 없음 문구 보이기
                });

                // 서버로부터 받은 데이터로 별점 갱신
                rList.forEach(function(rMap) {
                    if (rMap.rating) {
                        $(".star-score" + rMap.productNo).html(Math.round((rMap.rating) * 10) / 10.0);
                        $(".star-rating-container" + rMap.productNo).show(); // 별 아이콘 영역 보이기
                        $(".review-none" + rMap.productNo).hide(); // 리뷰 없음 문구 숨기기
                    }
                });
            },
            error: function() {
                console.log("통신실패");
            }
        });
    });
    
    
</script>





</body>
</html>