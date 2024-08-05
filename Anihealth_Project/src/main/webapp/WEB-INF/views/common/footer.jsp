<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ANIHEALTH</title>
    <style>

           /* 푸터 시작 */
       footer .info p {
            white-space: nowrap;
            /* 줄 바꿈 없이 한 줄로 유지 */
            margin: 5px 0;
        }

        footer {
            width: 100%;
            background-color: #f8f9fa;
            padding: 15px 0;
            margin-top: 0px;
            margin-bottom: 0px;
            border-top: 1px solid #737070;
        }

        footer .container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin: 0 auto;
            /* 양쪽 여백을 동일하게 설정 */
            padding: 0 5%;
            /* 추가 여백을 위해 패딩 설정 */
            margin-top: 20px;
            gap: 20%;
            /* 왼쪽과 오른쪽 사이의 여백 설정 */
        }

        footer .left {
            width: 50%;
            text-align: left;
            font-size: 105%;
            white-space: nowrap;
            /* 줄 바꿈 없이 한 줄로 유지 */
        }

        .left-line1 {
            text-decoration: none;
            font-weight: bold;
            cursor: pointer;
        }

        footer .right {
            width: 50%;
            text-align: left;
            font-size: 105%;
            white-space: nowrap;
            /* 줄 바꿈 없이 한 줄로 유지 */
        }

        footer .right p {
            margin: 5px 0;
        }

        footer .center {
            text-align: center;
            width: 100%;
            margin-top: 10px;
            color: #6c757d;
            white-space: nowrap;
            /* 줄 바꿈 없이 한 줄로 유지 */
            font-size: 110%;
            margin-bottom: 0;
        }

        .form-control {
            font-size: 16px;
            cursor: pointer;
        }

        /* 푸터 끌 */

    </style>

</head>
<body>

    <footer>
        <div class="container">
            <div class="left">
                <div class="info">
                    <p class="left-line1">ANIHEALTH | 개인정보처리방침 | 이용약관 | 공지사항</p>
                    <p>대표자 : 안해준 </p>
                    <p>약관관리자 : 정화목 ｜제품관리자 : 정유상</p>
                    <p>개인정보담당자 : 이정민 | 고객담당자 : 김진희</p>                 
                    <p>주소 : 서울특별시 영등포구 선유동2로 57 이레빌딩 19F</p>
                </div>
            </div>
            <div class="right">
                <p>고객센터 : 070-4519-6419</p>
                <p>평일 11:00 ~ 18:00 ｜ 점심시간 13:00 ~ 14:00</p>
                <p>(토, 일요일 공휴일 휴무)</p>
                <p>고객문의 : anihealth@naver.com</p>
            </div>
        </div>
        <div class="center">
            <p>ⓒ ANIHEALTH Inc. All Rights Reserved</p>
        </div>
    </footer>
    
    
    <style>
    @media (max-width: 950px) {      
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

        .header-btn h4,
        .header-btn h3,
        .header-btn p,
        .header-btn button {
            margin-left: 0;
            /* 왼쪽 여백 제거 */
            margin-top: 5px;
            /* 위 여백 조정 */
            margin-bottom: 5px;
            /* 아래쪽 여백 조정 */
        }
    }

    @media (max-width: 950px) {
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
       }


	@media (max-width: 950px) {
    .container {
        flex-direction: column;
        align-items: center;
    }

    .left, .right {
        text-align: center;
    }

    .info p, .right p {
        font-size: 14px;
    }

    .left-line1 {
        font-size: 12px;
    }

    .parent-info {
        width: 90%; /* 작은 화면에서는 너비를 90%로 설정 */
    }

    .info-table {
        width: 100%;
    }

    .td-left {
        padding: 5px;
        font-size: 14px; /* 글자 크기 조정 */
    }

    .quantity-container {
        flex-direction: column;
        align-items: flex-start;
    }

    .quantity {
        flex-direction: column; /* 수량 선택 버튼을 세로로 배치 */
        align-items: flex-start;
    }

    .quantity-content button {
        margin: 5px 0;
    }
}

       @media (max-width: 950px) {
    .image-caption {
        padding: 5px;
        top: 5%;
        left: 5px;
        width: 95%;
        overflow: hidden;
    }

    .image-caption p {
        font-size: 0.4em; /* 모든 텍스트 기본 사이즈를 더 줄임 */
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .image-caption .larger-text {
        font-size: 0.7em; /* 더 중요한 텍스트의 크기를 조금만 줄임 */
        max-width: 100%;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .image-caption .detail-link {
        font-size: 0.3em; /* '자세히 보기' 글자 크기를 더 작게 조정 */
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
}

	 
	 
	 @media (max-width: 950px) {
	.inner-container-rw {
	    width: 90%; /* 컨테이너 너비를 90%로 조정 */
	    padding-top: 50px; /* 상단 패딩 조정 */
	    padding-bottom: 20px; /* 하단 패딩 조정 */
	}
	
	.container-star-avg {
	    flex-direction: column; /* 세로 배치로 변경 */
	    align-items: flex-start; /* 왼쪽 정렬 */
	}
	
	.rating-container,
	.progress-container {
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
	
	@media (max-width: 950px) {
	            .faq-container {
	                width: 100%;
	            }
	}

	</style>
    
</body>
</html>