<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>ANIHEALTH</title>
        <style>
            @font-face {
                font-family: 'WavvePADO-Regular';
                src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2404@1.0/WavvePADO-Regular.woff2') format('woff2');
                font-style: normal;
            }

            .survey-wrap * {
                font-family: 'WavvePADO-Regular';
                box-sizing: border-box;
                font-size: 20px;
                font-weight: 100;
            }

            /* 포괄 */
            .survey-wrap {
                width: 1200px;
                margin: auto;
            }

            .survey-wrap ul {
                list-style: none;
            }

            .survey-wrap input[type=radio] {
                display: none;
            }

            .survey-wrap p {
                height: 55px;
                margin-bottom: 0px;
                opacity: 0.9;
                line-height: 2.8em;
            }
            
            .survey-container {
                width: 50%;
                margin: auto;
            }

            .survey-item {
                width: 100%;
                text-align: center;
            }

            .survey-item>*:not(label) {
                margin-bottom: 10px;
            }

            .survey-item>div>img {
                width: 70px;
            }

            .survey-wrap label {
                box-shadow: 0px 0px 7px rgba(26, 26, 26, 0.2);
                border-radius: 10px;
                width: 100%;
                line-height: 1.5em;
                padding: 10px;
                transition: all 0.3s ease;
                box-sizing: border-box;
            }

            .survey-wrap label:hover {
                background-color: #f0f0f0;
            }

            .survey-wrap label.active {
                background-color: #9ac5ab;
                color: white;
                /* border-color: #789c78;  */
            }

            .survey-wrap input {
                border-radius: 10px;
                margin: 10px;
                width: 100px;
                border: 1px solid #969696;
                text-align: center;
            }

            input:focus {
                outline: none;
            }

            input::placeholder {
                font-size: 15px;
                text-align: center;
            }

            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            /* 동물 */
            .animal {
                display: flex;
                justify-content: space-evenly;
                margin-top: 30px;
            }
            .animal img {
                width: 250px;
            }
            .animal>div {
            	padding-bottom: 17px
            }
            .animal>div:hover {
                border-radius: 15px;
                overflow: hidden; 
                cursor: pointer;  
            }
            .animal>div:not(.animal-active) {
                opacity: 80%;
            }
            .animal-active {
                opacity: 100%;
                transform: scale(1.1);
                border-radius: 15px;
                overflow: hidden;
                transition: all 0.3s;
            }

            .survey-container>div h3{
                font-size: 24px;
                margin-bottom: 20px;
            }

            .survey-container>div:nth-child(2) h3{
                font-size: 28px;
            }
            .survey-container>div:nth-child(3) h3{
                font-size: 28px;
            }
            .survey-container>div:nth-child(4) h3{
                font-size: 28px;
            }
            /* 종 */
            .breed {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-evenly;
                padding-left: 0;
                margin-top: 10px;
            }
            .breed img {
                width: 140px;
            }
            .breed div {
                font-weight: 100;
                font-size: 15px;
                line-height: 3em;
                transform: translateX(-5px);
                color: #585858;
            }

            .breed li:hover {
                opacity: 100%;
                cursor: pointer;
            }
            .breed li:not(.breed-active) {
                opacity: 70%;
            }
            .breed-active {
                opacity: 100%;
                border-radius: 25px;
                overflow: hidden;
                transform: scale(1.1);
            }
            /* 체중 */
            .bcs>label>div {
                display: flex;
            }
            .bcs>label>img {
                width: 150px;
                float: left;
                margin-right: 10px;
            }
            .bcs p {
                margin-left: 23px;
                font-size: 18px;
                line-height: 1.75em;
                text-align: left;
            }

            /* 문진 */
            
            /* 진행바 */
            .survey-wrap .progress {
                height: 10px;
                margin-bottom: 20px;
            }

            .survey-wrap .progress-bar {
                transition: width 0.8s ease;
                background-color: #9ac5ab !important;
                /* background-color: #508dc3 */
            }


            .survey-wrap button {
                border-radius: 10px !important;
                font-weight: 100;
                padding: 5px 10px;
                background-color: #9ac5ab;
                /*background-color: transparent;*/
                cursor: pointer;
                border: none;
                color: white;
                margin-top: 30px !important;
            }

            .icon-container {
                margin-bottom: 0px !important;
            }
      
            /*background-color: rgb(115, 201, 115);  */
        </style>    
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <br> <br>
        <main class="survey-wrap">
            <form action="surveyResult.su" class="survey-container" method="post">
                <div class="progress">
                    <div class="progress-bar progress-bar-striped" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0"
                        aria-valuemax="100"></div>
                </div>
                <div class="survey-item" align="center">
                    <h3>반려동물</h3>
                    <p>우리 아이는 강아지인가요? 고양이인가요?</p>
                    <div class="animal">
                        <div>
                            <img src="resources/simg/dog_780258_2.png" alt="강아지">
                            <br><span>강아지</span>
                        </div>
                        <div>
                            <img src="resources/simg/black-cat_5868714_2.png" alt="고양이">
                            <br><span>고양이</span>
                        </div>
                    </div>
                    <input type="hidden" name="animal">
                    <button class="next" type="button">다음</button>
                </div>
                <div class="survey-item dog" align="center" style="display: none;">
                    <h3 style="margin-bottom: 15px;">품종과 나이를 선택해주세요</h3>
                    나이 <input type="number" name="age" placeholder="나이 입력" min="1" max="50" step="1" required >
                    <ul class="breed">
                        <li><img src="resources/simg/닥스훈트.png" alt="닥스훈트"><div>닥스훈트</div></li>
                        <li><img src="resources/simg/포메라니안.png" alt="포메라니안"><div>포메라니안</div></li>
                        <li><img src="resources/simg/치와와.png" alt="치와와"><div>치와와</div></li>
                        <li><img src="resources/simg/요크셔테리어.png" alt="요크셔테리어"><div>요크셔테리어</div></li>
                        <li><img src="resources/simg/푸들.png" alt="푸들"><div>푸들</div></li>
                        <li><img src="resources/simg/리트리버.png" alt="리트리버"><div>리트리버</div></li>
                        <li><img src="resources/simg/허스키.png" alt="허스키"><div>허스키</div></li>
                        <li><img src="resources/simg/웰시코기.png" alt="웰시코기"><div>웰시코기</div></li>
                        <li><img src="resources/simg/시츄.png" alt="시츄"><div>시츄</div></li>
                        <li><img src="resources/simg/시바견.png" alt="시바견"><div>시바견</div></li>
                        <li><img src="resources/simg/말티즈.png" alt="말티즈"><div>말티즈</div></li>
                        <li><img src="resources/simg/도베르만.png" alt="도베르만"><div>도베르만</div></li>
                        <li><img src="resources/simg/퍼그.png" alt="포메라니안"><div>포메라니안</div></li>
                        <li><img src="resources/simg/그레이하운드.png" alt="그레이하운드"><div>그레이하운드</div></li>
                        <li><img src="resources/simg/비글.png" alt="비글"><div>비글</div></li>
                        <li><img src="resources/simg/믹스견.png" alt="믹스견"><div>믹스견</div></li>
                    </ul>
                    <input type="hidden" name="breed">
                    <button class="prev" type="button">이전</button>
                    <button class="next" type="button">다음</button>
                </div>
                <div class="survey-item cat" align="center" style="display: none;"> 
                    <h3 style="margin-bottom: 15px;">품종과 나이를 선택해주세요</h3>
                    나이 <input type="number" name="age" placeholder="나이 입력" min="1" max="50" step="1" required>
                    <ul class="breed">
                        <li><img src="resources/simg/브리티쉬숏헤어.png" alt="브리티쉬숏헤어"><div>브리티쉬숏헤어</div></li>
                        <li><img src="resources/simg/노르웨이숏헤어.png" alt="노르웨이숏헤어"><div>노르웨이숏헤어</div></li>
                        <li><img src="resources/simg/메인쿤.png" alt="메인쿤"><div>메인쿤</div></li>
                        <li><img src="resources/simg/러시안블루.png" alt="러시안블루"><div>러시안블루</div></li>
                        <li><img src="resources/simg/스핑크스.png" alt="스핑크스"><div>스핑크스</div></li>
                        <li><img src="resources/simg/아메리칸숏헤어.png" alt="아메리칸숏헤어"><div>아메리칸숏헤어</div></li>
                        <li><img src="resources/simg/아비시니안.png" alt="아비시니안"><div>아비시니안</div></li>
                        <li><img src="resources/simg/벵갈.png" alt="벵갈"><div>벵갈</div></li>
                        <li><img src="resources/simg/코리안숏헤어.png" alt="코리안숏헤어"><div>코리안숏헤어</div></li>
                        <li><img src="resources/simg/페르시안.png" alt="페르시안"><div>페르시안</div></li>
                        <li><img src="resources/simg/터키쉬앙고라.png" alt="터키쉬앙고라"><div>터키쉬앙고라</div></li>
                        <li><img src="resources/simg/랙돌.png" alt="랙돌"><div>랙돌</div></li>
                        <li><img src="resources/simg/스코티시폴드.png" alt="스코티시폴드"><div>스코티시폴드</div></li>
                        <li><img src="resources/simg/샴.png" alt="샴"><div>샴</div></li>
                        <li><img src="resources/simg/엑조틱쇼트헤어.png" alt="엑조틱쇼트헤어"><div>엑조틱쇼트헤어</div></li>
                        <li><img src="resources/simg/도메스틱숏헤어.png" alt="도메스틱숏헤어"><div>도메스틱숏헤어</div></li>
                    </ul>
                    <input type="hidden" name="breed">
                    <button class="prev" type="button">이전</button>
                    <button class="next" type="button">다음</button>
                </div>
                <div class="survey-item bcs" style="display: none;">
                    <div class="icon-container"><img src="resources/simg/obesity.png"></div>
                    <h3 style="margin-bottom: 15px;">체중/체형</h3>
                    체중 <input type="number" placeholder="몸무게 입력" name="weight" required style="margin-bottom: 20px;" step="0.1" min="0.1" max="150" required> Kg
                    <label for="bcs1">
                        <input type="radio" name="bcs" value="9" id="bcs1" required>
                        <img src="resources/simg/bcs-icon-dog-9_2.png">
                        <h5>비만이에요</h5>
                        <p>매우 많은 지방이 몸 전체에 축적되어 있어요. 목, 가슴, 허리의 구분이 어렵고 몸 어디에서도 뼈를 만지기가 힘들어요..</p>
                    </label><br>
                    <label for="bcs2">
                        <input type="radio" name="bcs" value="7" id="bcs2">
                        <img src="resources/simg/bcs-icon-dog-7_2.png">
                        <h5>무거워요</h5>
                        <p>갈비뼈의 굴곡이 거의 느껴지지 않아요. 허리와 복부에 지방이 많아 위에서 보았을 때 허리를 구분하기 힘들어요.</p>
                    </label><br>
                    <label for="bcs3">
                        <input type="radio" name="bcs" value="5" id="bcs3">
                        <img src="resources/simg/bcs-icon-dog-5_2.png">
                        <h5>이상적이에요</h5>
                        <p>갈비뼈 사이사이가 적당한 양의 지방으로 덮여 있어요. 허리가 구분되고 복부는 약간 들어가 있어요.</p>
                    </label><br>
                    <label for="bcs4">
                        <input type="radio" name="bcs" value="3" id="bcs4">
                        <img src="resources/simg/bcs-icon-dog-3_2.png">
                        <h5>말랐어요</h5>
                        <p>갈비뼈를 만졌을 때 뼈 사이사이가 매우 잘 느껴져요. 허리가 잘 구분되고 복부가 잘록해요.</p>
                    </label><br>
                    <label for="bcs5">
                        <input type="radio" name="bcs" value="1" id="bcs5">
                        <img src="resources/simg/bcs-icon-dog-1_2.png">
                        <h5>수척해요</h5>
                        <p>모든 뼈의 돌출부가 뚜렷하게 보여요. 몸 어디에서도 체지방과 근육을 확인할 수 없어요.</p>
                    </label><br>
                    <button class="prev" type="button">이전</button>
                    <button class="next" type="button">다음</button>
                </div>
                <div class="survey-item" style="display: none;">
                    <div class="icon-container"><img src="resources/simg/skin.png"></div>
                    <h3>피부</h3>
                    <label for="skin1">
                        <input type="radio" name="skin" value="5" id="skin1" required>
                        <p>피부에 딱지나 뾰루지, 각질이 생겨요.</p>
                    </label>
                    <label for="skin2">
                        <input type="radio" name="skin" value="4" id="skin2">
                        <p>피부가 빨갛고 열이 나는 경우가 있어요.</p>
                    </label><br>
                    <label for="skin3">
                        <input type="radio" name="skin" value="3" id="skin3">
                        <p>귀를 만지면 뒷발로 긁으려는 행동을 해요.</p>
                    </label><br>
                    <label for="skin4">
                        <input type="radio" name="skin" value="2" id="skin4">
                        <p>발바닥 사이 피부가 붉어요.</p>
                    </label><br>
                    <label for="skin5">
                        <input type="radio" name="skin" value="1" id="skin5">
                        <p>없어요.</p>
                    </label><br>
                    <button class="prev" type="button">이전</button>
                    <button class="next" type="button">다음</button>
                </div>
                <div class="survey-item" style="display: none;">
                    <div class="icon-container"><img src="resources/simg/teeth.png"></div>
                    <h3>치아</h3>
                    <label for="teeth1">
                        <input type="radio" name="teeth" value="5" id="teeth1" required>
                        <p>갈수록 구취가 심해져요.</p>
                    </label><br>
                    <label for="teeth2">
                        <input type="radio" name="teeth" value="4" id="teeth2">
                        <p>어금니쪽에 치석이 눈에 띄게 보여요.</p>
                    </label><br>
                    <label for="teeth3">
                        <input type="radio" name="teeth" value="3" id="teeth3">
                        <p>치아와 잇몸 경계면이 빨갛게 부어있어요.</p>
                    </label><br>
                    <label for="teeth4">
                        <input type="radio" name="teeth" value="2" id="teeth4">
                        <p>입 주변을 만지면 불편해해요.</p>
                    </label><br>
                    <label for="teeth5">
                        <input type="radio" name="teeth" value="1" id="teeth5">
                        <p>없어요.</p>
                    </label><br>
                    <button class="prev" type="button">이전</button>
                    <button class="next" type="button">다음</button>
                </div>
                <div class="survey-item" style="display: none;">
                    <div class="icon-container"><img src="resources/simg/eye.png"></div>
                    <h3>눈</h3>
                    <label for="eye1">
                        <input type="radio" name="eye" value="5" id="eye1" required>
                        <p>양쪽 눈이 모두 전체적으로 뿌옇게 보여요.</p>
                    </label><br>
                    <label for="eye2">
                        <input type="radio" name="eye" value="4" id="eye2">
                        <p>흰자위에 실핏줄이 두드러져보여요.</p>
                    </label><br>
                    <label for="eye3">
                        <input type="radio" name="eye" value="3" id="eye3">
                        <p>눈 주변이 빨갛게 충혈됐어요.</p>
                    </label><br>
                    <label for="eye4">
                        <input type="radio" name="eye" value="2" id="eye4">
                        <p>눈 주변 털이 갈색으로 착색됐어요.</p>
                    </label><br>
                    <label for="eye5">
                        <input type="radio" name="eye" value="1" id="eye5">
                        <p>없어요.</p>
                    </label><br>
                    <button class="prev" type="button">이전</button>
                    <button class="next" type="button">다음</button>
                </div>
                <div class="survey-item" style="display: none;">
                    <div class="icon-container"><img src="resources/simg/bone.png"></div>
                    <h3>뼈/관절</h3>
                    <label for="bone1">
                        <input type="radio" name="bone" value="5" id="bone1" required>
                        <p>한쪽 다리를 잘 딛지 못해요.</p>
                    </label><br>
                    <label for="bone2">
                        <input type="radio" name="bone" value="4" id="bone2">
                        <p>관절을 만졌을 때 뻣뻣함이 느껴져요.</p>
                    </label><br>
                    <label for="bone3">
                        <input type="radio" name="bone" value="3" id="bone3">
                        <p>걷는 속도가 느려졌어요.</p>
                    </label><br>
                    <label for="bone4">
                        <input type="radio" name="bone" value="2" id="bone4">
                        <p>활동량이 적고 걷다가 주저앉아요.</p>
                    </label><br>
                    <label for="bone5">
                        <input type="radio" name="bone" value="1" id="bone5">
                        <p>없어요.</p>
                    </label><br>
                    <button class="prev" type="button">이전</button>
                    <button class="next" type="button">다음</button>
                </div>
                <div class="survey-item" style="display: none;">
                    <div class="icon-container"><img src="resources/simg/heart.png"></div>
                    <h3>심장</h3>
                    <label for="heart1">
                        <input type="radio" name="heart" value="5" id="heart1" required>
                        <p>저녁 시간대에 기침을 자주 해요.</p>
                    </label><br>
                    <label for="heart2">
                        <input type="radio" name="heart" value="4" id="heart2">
                        <p>갑작스럽게 실신하듯 쓰러지는 경우가 있어요.</p>
                    </label><br>
                    <label for="heart3">
                        <input type="radio" name="heart" value="3" id="heart3">
                        <p>운동을 하면 금방 지쳐요.</p>
                    </label><br>
                    <label for="heart4">
                        <input type="radio" name="heart" value="2" id="heart4">
                        <p>자거나 쉬고 있을 때 숨을 빠르게 쉬어요.</p>
                    </label><br>
                    <label for="heart5">
                        <input type="radio" name="heart" value="1" id="heart5">
                        <p>없어요.</p>
                    </label><br>
                    <button class="prev" type="button">이전</button>
                    <button class="next" type="button">다음</button>
                </div>
                <div class="survey-item" style="display: none;">
                    <div class="icon-container"><img src="resources/simg/immunity.png"></div>
                    <h3>면역/호흡기</h3>
                    <label for="immunity1">
                        <input type="radio" name="immunity" value="5" id="immunity1" required>
                        <p>흥분했을때 켁켁거리는 기침을 자주 해요.</p>
                    </label><br>
                    <label for="immunity2">
                        <input type="radio" name="immunity" value="4" id="immunity2">
                        <p>가을, 겨울에 기침이 잦아요.</p>
                    </label><br>
                    <label for="immunity3">
                        <input type="radio" name="immunity" value="3" id="immunity3">
                        <p>콧물을 흘리는 경우가 있어요.</p>
                    </label><br>
                    <label for="immunity4">
                        <input type="radio" name="immunity" value="2" id="immunity4">
                        <p>눈곱이 많이 끼는 편이에요.</p>
                    </label><br>
                    <label for="immunity5">
                        <input type="radio" name="immunity" value="1" id="immunity5">
                        <p>없어요.</p>
                    </label><br>
                    <button class="prev" type="button">이전</button>
                    <button class="next" type="button">다음</button>
                </div>
                <div class="survey-item" style="display: none;">
                    <div class="icon-container"><img src="resources/simg/stomach.png"></div>
                    <h3>위/장</h3>
                    <label for="stomach1">
                        <input type="radio" name="stomach" value="5" id="stomach1" required>
                        <p>음식물이나 위액을 토하는 경우가 있어요.</p>
                    </label><br>
                    <label for="stomach2">
                        <input type="radio" name="stomach" value="4" id="stomach2">
                        <p>동그랗고 딱딱한 변을 보는 경우가 있어요.</p>
                    </label><br>
                    <label for="stomach3">
                        <input type="radio" name="stomach" value="3" id="stomach3">
                        <p>공복토를 종종 하는 편인에요.</p>
                    </label><br>
                    <label for="stomach4">
                        <input type="radio" name="stomach" value="2" id="stomach4">
                        <p>점액질이 섞인 변을 보는 경우가 있어요.</p>
                    </label><br>
                    <label for="stomach5">
                        <input type="radio" name="stomach" value="1" id="stomach5">
                        <p>없어요.</p>
                    </label><br>
                    <button class="prev" type="button">이전</button>
                    <button class="next" type="button">다음</button>
                </div>
                <div class="survey-item" style="display: none;">
                    <div class="icon-container"><img src="resources/simg/kidney.png"></div>
                    <h3>신장/방광</h3>
                    <label for="kidney1">
                        <input type="radio" name="kidney" value="5" id="kidney1" required>
                        <p>혈액이 섞인 소변을 보는 경우가 있어요.</p>
                    </label><br>
                    <label for="kidney2">
                        <input type="radio" name="kidney" value="4" id="kidney2">
                        <p>물을 평소보다 많이 마시는 것 같아요.</p>
                    </label><br>
                    <label for="kidney3">
                        <input type="radio" name="kidney" value="3" id="kidney3">
                        <p>소변을 보는 횟수가 늘었어요.</p>
                    </label><br>
                    <label for="kidney4">
                        <input type="radio" name="kidney" value="2" id="kidney4">
                        <p>소변을 볼 때 아파하는 모습을 보여요.</p>
                    </label><br>
                    <label for="kidney5">
                        <input type="radio" name="kidney" value="1" id="kidney5">
                        <p>없어요.</p>
                    </label><br>
                    <button class="prev" type="button">이전</button>
                    <button type="submit">제출</button>
                </div>
            </form>
        </main>
        <script>
            $(function () {
                // 선택항목(5단계)
                $("label").on("click", function () {
                    $(this).css("opacity", "0.8");
                    $(this).parent().find("label").not(this).css("opacity", "1");
                    $(this).addClass('active');
                    $(this).parent().find("label").not(this).removeClass('active');
                });
                // 동물선택
                $(".animal>div").on("click", function () {
                    $(this).addClass("animal-active");
                    $(this).parent().find("div").not(this).removeClass("animal-active");
                    let aniVal = $(this).find("img").attr("alt");
                    $("input[name=animal]").val(aniVal);
                });
                // 품종선택
                $(".breed li").on("click", function () {
                    $(this).addClass("breed-active");
                    $(this).parent().find("li").not(this).removeClass("breed-active");
                    let breedVal = $(this).find("img").attr("alt");
                    //console.log(breedVal);
                    $("input[name=breed]").val(breedVal);
                });
                //전역변수
                cat = $(".cat").clone(true);
                dog = $(".dog").clone(true);
            });
            // 뒤로가기 버튼
            $(document).on("click", ".prev", function () {
                let currentItem = $(this).parent();
                currentItem.css('display', 'none');
                if (proBar != 0) {
                    proBar -= 10;
                    setTimeout(function () {
                        $(".progress-bar").width(proBar + "%");
                    }, 10);
                }
                currentItem.prev().show();
		    });

            let proBar = 0;
            let b = true;
            // 알람 함수 이후 따로 빼기 
            // 유효성 검사 && 진행 버튼
            $(document).on("click", ".next", function () {
                if(!!$(this).parent().find("input[type=radio]").length) {

                    //console.log($(this).parent().find("input[name=weight]").val());
                    if(!!$(this).parent().find("input[name=weight]").length) {
                        let weight = $(this).parent().find("input[name=weight]").val();
                        //console.log(weight);
                        if( isNaN(weight) || weight < 0.1 || weight > 150) {
                            alertify.alert().set({
                                'onshow': function() {
                                    this.elements.dialog.style.width = '400px'; 
                                },
                                'message': '올바른 무게 형식을 입력해주세요',
                                'title' : '알람'   
                            }).show();
                        return false;
                        }
                        let weightRounded = Math.round(weight * 10) / 10;
                        $(this).parent().find("input[name=weight]").val(weightRounded);
                        //console.log($(this).parent().find("input[name=weight]").val());
                    }

                    if (!$(this).parent().find("input:checked").length){  // 라디오는 하나만 체크되도 검사됨
            			alertify.alert().set({
						    'onshow': function() {
						        this.elements.dialog.style.width = '400px'; 
						    },
						    'message': '아직 입력하지 않은 항목이 있습니다',
						    'title' : '알람'   
						}).show();
            			return false;
                    }
                } else {
                    //console.log($(this).parent().find("input[name=age]").val());
                    if(!!$(this).parent().find("input[name=age]").length) {
                        //console.log($(this).parent().find("input[name=age]").val() <= 0); // 아무것도 입력안하면 '' 반환 => 0 취급
                        let age = $(this).parent().find("input[name=age]").val();
                        if(isNaN(age) || age < 1 || age > 50 || age % 1 !== 0) {
                            alertify.alert().set({
                                'onshow': function() {
                                    this.elements.dialog.style.width = '400px'; 
                                },
                                'message': '올바른 나이 형식을 입력해주세요',
                                'title' : '알람'   
                            }).show();
                        return false;
                        }
                    }
                    $(this).parent().find("input").each(function (index, item) {
                        if(!$(item).val()){
                            //console.log("호출");
                            alertify.alert().set({
						    'onshow': function() {
						        this.elements.dialog.style.width = '400px'; 
						    },
						    'message': '아직 입력하지 않은 항목이 있습니다',
						    'title' : '알람'

						    }).show();
                            b = false;
                            return false;
                        } else {
                            b =true;
                        }
                    });
                }
                if(!b){
                    return false;
                }
                // 동물 선택에 따른 화면 구성 결정
                if($(this).is($(".next").eq(0))) { //제이쿼리 dom 비교법
                    if($("input[name=animal]").val() == '강아지') {
                        $(".cat").detach();
                        if(!$(".dog").length) { //dog 요소 없을때
                            $(".bcs").before(dog[0]);
                        }
                    } else {
                        $(".dog").detach();
                        if(!$(".cat").length) { //cat 요소 없을떄
                            $(".bcs").before(cat[0]);
                        }
                     }
                } 
                // 화면 넘김 효과
                let currentItem = $(this).parent();
                currentItem.css('display', 'none'); // 또는 hide(애니메이션);
                proBar += 10;
                setTimeout(function () {
                    $(".progress-bar").width(proBar + "%");
                }, 10);
                currentItem.next().show();
            });

        </script>
    </body>
</html>