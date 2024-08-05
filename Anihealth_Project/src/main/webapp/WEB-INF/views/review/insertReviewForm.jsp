<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANIHEALTH</title>
<style>
        * {
            font-family: 'WavvePADO-Regular';
            box-sizing: border-box;
        }

        div {
            /*border: 1px solid black;*/
        }

        .review-insert-wrap {
            width: 1000px;
            margin: auto;
            margin-top: 100px;
        }

        .review-insert-wrap span {
            color: rgb(160, 160, 160);
        }

        form {
            margin: auto;
            width: 100%;
        }

        form>div {
            width: 100%;
        }

        .review-rating {
            width: 100%;

            margin-bottom: 15px;
        }

        .review-title {
            width: 100%;
            box-shadow: 0px 0px 10px rgba(143, 143, 143, 0.3);
        }

        .review-content-container {
            height: 400px;
            display: flex;
            gap: 20px;
        }

        .review-content {
            width: 60%;
            height: 100%;
            box-shadow: 0px 0px 10px rgba(143, 143, 143, 0.3);
        }

        .review-pic {
            width: 40%;
            height: 100%;
        }

        .review-pic>img {
            width: 400px;
            height: 400px;
            border-radius: 5px;
            object-fit: cover;
            box-shadow: 0px 0px 10px rgba(143, 143, 143, 0.3);
            border: 1px solid lightgray;
        }

        textarea {
            resize: none !important;
        }
        
        button {
            border-radius: 10px !important;
            font-size: 4px;
            font-weight: 100;
            padding: 5px 10px;
            background-color: #9ac5ab;
            /*background-color: transparent;*/
            cursor: pointer;
            border: none;
            color: white;
            margin-top: 30px !important;
        }
        .button-area {
        	text-align: center;
        }
        
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	 <jsp:include page="../common/header.jsp" />

	 <main class="review-insert-wrap">
	        <form action="insert.re" method="post" enctype="multipart/form-data">
	            <div class="review-rating">
	                <i class="fa fa-star" style="font-size:36px; "></i>
	                <i class="fa fa-star" style="font-size:36px; "></i>
	                <i class="fa fa-star" style="font-size:36px; "></i>
	                <i class="fa fa-star" style="font-size:36px; "></i>
	                <i class="fa fa-star" style="font-size:36px; "></i>
	                <i class="fa fa-star" style="font-size:36px; display: none;"></i>
	                <span><span>별점선택</span></span>
	                <input type="hidden" name="rating" required id="rating">
	            </div>
	            <div class="input-group mb-3 review-title">
	                <input type="text" name="reviewTitle" class="form-control" placeholder="제목을 입력해주세요" aria-label="제목을 입력해주세요" required>
	            </div>
	            <div class="review-content-container">
	                <div class="input-group review-content">
	                    <textarea class="form-control" name="reviewContent" placeholder="내용을 입력해주세요(최대 1500자)" required></textarea>
	                </div>
	                <div class="review-pic" onclick="inputFile();">
	                    <img src="resources/rimg/noImage4.png" alt="">
	                </div>
	            </div>
	            <input type="file" name="upfile" class="inputFile" style="display: none;" onchange="loadImg(this);">
	            <div class="button-area"><button type="submit">리뷰등록</button> 
	            <button type="button" onclick="history.back();">작성취소</button> </div>
	            <input type="hidden" name="orderProductNo" value="${orderProductNo}"> 
	        </form>
	    </main>
	    <br> <br> <br>
	    <jsp:include page="../common/footer.jsp" />
	    <script>
	        $(function () {
	            // 별점부여
	            $(".fa").on("click", function () {
	                    $(this).next().prevAll().css("color", "#ffd700");
	                    $(this).nextAll().css("color", "black");
	                    $("input[name=rating]").val($(this).index() + 1);
	            });
	            // 제출전 유효성 검사(별점, 이미지)
	            $("form").on("submit", function() {

					console.log(!$("#rating").val());
					if (!$("#rating").val()) {
						alertify.alert().set({
						    'onshow': function() {
						        this.elements.dialog.style.width = '400px'; 
						    },
						    'message': '별점을 입력해주세요',
						    'title' : '알람'
						    
						}).show();
	
						return false
					}

					console.log(!$(".inputFile").val());
					if (!$(".inputFile").val()) {
						alertify.alert().set({
						    'onshow': function() {
						        this.elements.dialog.style.width = '400px'; 
						    },
						    'message': '사진을 첨부해주세요',
						    'title' : '알람'
						    
						}).show();

						return false;
					}

				});
	
	        });
	
	        function inputFile() {
	            $(".inputFile").click();
	        }
			// 파일 첨부/제거시 미리보기 이미지 동기화
	        function loadImg(inputFile) {
	            if (inputFile.files.length == 1) { // 파일 변경이 0 -> 1
	                let reader = new FileReader();
	                reader.readAsDataURL(inputFile.files[0]);
	                reader.onload = function (e) {
	                    $(".review-pic>img").attr("src", e.target.result);
	                }
	
	            } else { // 파일 변경이 1 -> 0
	                $(".review-pic>img").attr("src", "resources/rimg/noImage4.png");

	            }
	
	        }
	        // onsubmit 이벤트
	
	    </script>
	
	</body>
	
	<br> <br> <br>
	
	<jsp:include page="../common/footer.jsp" />
</html>