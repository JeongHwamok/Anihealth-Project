<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANIHEALTH</title>
<script type="text/javascript"
	src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=b25f42243570baa281b34156c4e66644&libraries=services"></script>
<style>
	@font-face {
		font-family: 'WavvePADO-Regular';
		src:
			url('https://fastly.jsdelivr.net/gh/projectnoonnu/2404@1.0/WavvePADO-Regular.woff2')
			format('woff2');
	}
	
	* {
		font-family: 'WavvePADO-Regular';
		box-sizing: border-box;
	}
	
	.map-wrap {
		width: 1400px;
		height: 1000px;
		
	}
	
	.map-wrap {
		margin: auto;
		display: flex;
		justify-content: center;
		gap: 40px;
	}

	#map {
		width: 600px;
		height: 600px;
		border-radius: 20px;
		box-shadow: 0px 0px 15px rgba(92, 92, 92, 0.2);
		/*border: 1px solid black;*/
		position: relative;
		z-index: 1;
		margin-bottom: 20px;
	}
	
	#address {
		display: flex;
		width: 450px;
		height: 40px;
		border: 1px solid lightgray;
		border-radius: 10px
	}
	
	#address input {
		height: 100%;
		border: none;
		border-radius: 10px;
	}
	
	#address input:focus {
		outline: none;
		box-shadow: none;
	}
	#address button span{
		line-height: 1.3em;
	}
	
	#suggestions {
		/*border: 1px solid blue;*/
		width: 600px;
		height: 200px;
	}
	#suggestions table {
		padding: 10px;
		box-shadow: 0px 0px 15px rgba(138, 138, 138, 0.2);
	}
	#suggestions tr:hover {
		cursor: pointer;
		opacity: 80%;
	}
	
	#map>button {
		position: absolute;
		bottom: 10px;
		left: 225px;
		width: 150px;
		border-radius: 20px;
		z-index: 2;
	}
	
	.map-content button {
		border-radius: 10px;
		padding-top: 5px;
		padding-bottom: 5px;
		background-color: #9ac5ab;
		background-color: rgba(47, 142, 219, 0.801);
		/*background-color: transparent;*/
		cursor: pointer;
		border: none;
		color: white;
	
	}
	
	.list-wrap {
		width: 400px;
	
	}
	.list-wrap {
		/*border: 1px solid red;*/
	}
	.list-content {
		width: 400px;
		height:80%;
		border: 1px solid lightgray;
		border-radius: 10px;
		overflow: scroll;
		overflow: auto;
	}
	
	.list-content::-webkit-scrollbar {
		width: 10px;
	}
	
	.list-content::-webkit-scrollbar-button {
		display: none !important;
	}
	
	.list-content::-webkit-scrollbar-thumb {
		background-color: lightgray;
		border-radius: 15px;
	}
	
	.list-item {
		width: 100%;
		border-bottom: 1px solid lightgray;
		padding: 10px
	}
	
	.list-item:hover {
		opacity: 80%;
	}
	
	.list-item>div {
		width: 100%;
		margin-bottom: 10px;
	}
	
	.list-item>div:nth-child(2) {
		font-weight: 100;
		color: rgb(73, 73, 73)
	}
	
	.list-item>div:nth-child(3) {
		font-weight: 100;
		color: rgb(73, 73, 73)
	}
	
	.list-item>div:nth-child(4) {
		font-weight: 100;
		color: rgb(73, 73, 73);
		margin-bottom: 0px;
	}
	#next-div-btn {
		padding-top: 20px;
		padding-bottom: 20px;
	}
	#next-div-btn:hover {
		cursor: pointer;
	}
	.list-content button {
		background-color: white;
		color: lightgray;
		border: none;
	}
	
	.name-category {
		display: flex;
		align-items: center;
		justify-content: center;
		gap: 10px;
	}
	
	.name-category>span {
		width: 50%;
	}
	
	.name-category>span:nth-child(1) {
		width: 50%;
		font-size: 19px;
	}
	
	.name-category>span:nth-child(2) {
		width: 50%;
		font-size: 12px;
		color: rgb(185, 184, 184);
	}
	
	.map-wrap a {
		text-decoration: none;
		color: rgba(47, 142, 219, 0.801) !important;
		/* #9ac5ab; */
	}
	
	.map-wrap table {
		font-weight: 100;
		font-size: 15px;
		color: rgb(128, 128, 128);
		border-collapse: separate;
		border-spacing: 3px;
	}

	#marker {
		width:210px;
		padding:5px;
		font-size:12px; 
		border: none;
	}
	.kwAuto {
		font-size: 13px;
		color: rgb(179, 179, 179);
	}
	.cancel{
		height: 24px;
		transform: translate(0px, 7px);
	}
	.cancel:hover {
		cursor: pointer;
		color: rgba(47, 142, 219, 0.801);
	}
	.defmsg {
		color: rgb(226, 226, 226);
		margin-top: 200px;
		font-size: 100;
	}
</style>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<br>
	<br>
	<div class="map-wrap">
		<div class="map-content">
			<div id="map" align="center">
				<button onclick="searchButton2();">현지도로 검색</button>
			</div>
			<div id="address" align="left">
				<button type="button" style="background-color: transparent;">
					<span class="material-symbols-outlined searchSym" onclick="searchButton();"
						style="color: black;">search</span>
				</button>
				<input  type="text" class="form-control" placeholder="장소를 입력해주세요" aria-label="장소를 입력해주세요" aria-describedby="button-addon1">
				<span class="material-symbols-outlined cancel" onclick="cancel();">close</span>
			</div>
			<div id="suggestions" align="left">
				<table>
					<!-- 자동완성 -->
				</table>
			</div>
		</div>
		<!-- <div class="list-wrap"> -->
			<!-- <div class="list-button">
				<select>
					<option>
						거리순
					</option>
					<option>
						정확도
					</option>
				</select>
			</div> -->
		<div class="list-content">
			<h2 class="defmsg" align="center">조회된 결과가 없습니다</h2>
			<!--  
				<div class="list-item">
					<div class="name-category">
						<span><a href="https://place.map.kakao.com/23120139" target='_blank'>플러스동물메디컬센터</a></span><span>가정,생활 > 반려동물 > 동물병원</span>
					</div>
					<div>02-3662-3533</div>
					<div>서울 영등포구 양평로12가길 14</div>
					<div>449m</div>
				</div>
				 -->
		</div>

		<!-- </div> -->
	</div>
	<br>
	<script>
		// 동적요소에 대한 이벤트 부여

		$(document).on("click", "#nextBtn", function () {
			if (pagination && pagination.hasNextPage) {
				$(this).remove(); // 버튼 생성전 기존 버튼 삭제
				pagination.nextPage();
			}
		})

		$(document).on("click", "#next-div-btn", function () {
			$("#nextBtn").click();
		});
		// 자동완성 클릭시
		$(document).on("click", "#suggestions tr", function() {
			let str = $(this).children().eq(0).text();
			$("#address>input").val(str);
			$(this).parent().children().remove();
		});

		// 디바운스 함수정의
		function debounce(func, delay) {
			let debounceTimer;
			return function() {
				const context = this;
				const args = arguments;
				clearTimeout(debounceTimer);
				debounceTimer = setTimeout(() => func.apply(context, args), delay);
			};
		}
		// 키업 이벤트
		$("#address input").on("keyup", debounce(function(event) {
			suggest(this.value, event);
		}, 200));
		// 클릭 이벤트
		$("#address input").on("click", function (event) {
			suggest(this.value, event);
		});
		// 포커스 아웃시
		// $("#address input").on("focusout", function () {
		// 	$("#suggestions>table").children().remove();
		// });
		
		// 삭제버튼
		function cancel() {
			$("#address input").val('');
		}


		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.534, 126.897), // 지도의 중심좌표
			level : 5, // 지도의 확대 레벨
			mapTypeId : kakao.maps.MapTypeId.ROADMAP
		// 지도종류
		};

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 뷰전환
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		//줌 컨트롤러 추가
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();
		// 상세정보창 객체 생성
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1, 
			removable : true
		});
		// 화면에 출력할 리스트
		let mapList = '';
		// 마커배열
		var markers = [];
		// autocomplete 함수명 쓰면 오류남
		// 자동완성 함수
		function suggest(keyword, event) {
			let autoList = '';
			// 엔터 입력시 자동완성 삭제

			geocoder.addressSearch(keyword, function(result, status) {
				if(event.keyCode == 13){
					$(".searchSym").click();
					return false;
				}
				if (status === kakao.maps.services.Status.OK) {

					for (let i = 0; i < 6; i++) {
						// console.log(result[i]);
						// console.log(result.length);
						// console.log(!!result[i]	)
						if(!!result[i]){ // !!: undefined, null, 0에 대해서 false 반환, 나머지는 모두 true
							autoList += "<tr>" + "<td>" + result[i].address_name + "</td>" + "</tr>";	
						}
						// result가 6개 이하면 콘솔에 오류뜸
					}
					$("#suggestions>table").html(autoList); //중복
				} else {
					$("#suggestions>table").html('');
				}
			});

			if(event.keyCode !== 13) {
				ps.keywordSearch(keyword, function (data, status, pagination) {
					if (status === kakao.maps.services.Status.OK) { 
						for (var i = 0; i < 6; i++) {
							//console.log(data[i].place_name);
							if(!!data[i]){
								autoList += "<tr>" + "<td>" + data[i].place_name + " / <span class='kwAuto'>" + data[i].address_name  + "</span> </td>" + "</tr>";
							}
						}
						$("#suggestions>table").html(autoList);
					} else {
						$("#suggestions>table").html('');
					}
				});
			}
		}
		// function categorySearchCB(result, status) {
		// 	if (status === kakao.maps.services.Status.OK) {

		// 	// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
		// 	displayMarker(result);
		// 	} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
			

		// 	} else if (status === kakao.maps.services.Status.ERROR) {
			

		// 	}
		// }

		// 주소검색 -> 키워드 검색
		function searchButton() {
			let address = $("#address>input").val();
			// 주소검색 or 키워드 검색 검사
			if(address.includes('/')){
				address = address.split('/', 2)[1];
			}
			//console.log(address);
			geocoder.addressSearch(address, function(result, status) {
						// 정상적으로 검색이 완료됐으면 
						//console.log(result);
						mapList = ''; // 검색할떄마다 리스트 비우기
						$("#suggestions>table").children().remove(); //자동완성 지우기
						hideMarkers();
						if (status === kakao.maps.services.Status.OK) {
							var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
							// 지도의 중심을 결과값으로 받은 위치로 이동
							map.panTo(coords);
							// 키워드로 장소를 검색합니다, 매개변수 location 추가
							//hideMarkers();
							ps.keywordSearch('동물병원', placesSearchCB, {location : coords, radius : 3000, size: 10, sort : kakao.maps.services.SortBy.DISTANCE}); //size : 5, page : 1	결과 최대 45개 지원
							//ps.categorySearch('PK6', categorySearchCB, {location : coords, radius : 2000});
						} else { // 주소검색 없을시 키워드 검색
							//console.log(address + '동물병원');
							ps.keywordSearch(address + ' 동물병원', (result, status) => {
								if (status === kakao.maps.services.Status.OK) { 
									var newCoords = new kakao.maps.LatLng(result[0].y, result[0].x);
									map.panTo(newCoords);
									//console.log(newCoords);
									ps.keywordSearch(address + '동물병원', placesSearchCB, {location : newCoords, radius : 4000, size: 10, sort : kakao.maps.services.SortBy.DISTANCE});
								} else { 
									$(".list-content").html(mapList);
									$(".list-content").append("<h2 class='defmsg' align='center'>조회된 결과가 없습니다</h2>");
									alert("조회된 결과가 없습니다. 주소정보를 기준으로 검색해주세요!");
								}
							});	
						}
					});
		}
		// 키워드 검색 (현위치)
		function searchButton2() {
			mapList = '';
			hideMarkers();
			$("#suggestions>table").children().remove(); 
			var center = map.getCenter();
			ps.keywordSearch('동물병원', placesSearchCB, {location : center, radius : 4000, size: 10, sort : kakao.maps.services.SortBy.DISTANCE});
		}

		// 키워드 검색 함수
		function placesSearchCB(data, status, pagination) {
			window.pagination = pagination;
			if (status === kakao.maps.services.Status.OK) {

				for (var i = 0; i < data.length; i++) {

					displayMarker(data[i]);

		            mapList += "<div class='list-item'><div class='name-category'>" +
			                    "<span><a href='" + data[i].place_url + "' target='_blank'>" + data[i].place_name + "</a></span>" +
			                    "<span>" + data[i].category_name + "</span></div>" +
			                    "<div>" + data[i].phone + "</div>" +
			                    "<div>" + data[i].address_name + "</div>" +
			                    "<div>" + data[i].distance + "m</div></div>";			
				}
				//mapList += "<button id='nextBtn' type='button'>더보기..</button>";
				
				$(".list-content").html(mapList);
				//console.log(pagination.totalCount);
				if(pagination.hasNextPage) {
					$(".list-content").append("<div align='center' id='next-div-btn'><button id='nextBtn' type='button'>더보기..</button></div>");
				}
			} else {
				//console.log("호출");
				$(".list-content").html(mapList);
				$(".list-content").append("<h2 class='defmsg' align='center'>조회된 결과가 없습니다</h2>");
				alert("조회된 결과가 없습니다. 주소정보를 기준으로 검색해주세요!");
			}

		}

		// 마커 삭제
		/*
		function hideMarkers() {
		    setMarkers(null);    
		}
		 */
		// 마커생성 && 지도 마커표기 함수
		function displayMarker(place) {
			// 마커를 생성 && 지도표기
			var marker = new kakao.maps.Marker({
				map : map,
				position : new kakao.maps.LatLng(place.y, place.x)
			});
			markers.push(marker); // 마커배열에 마커 추가
			// 마커에 클릭이벤트를 등록
			kakao.maps.event.addListener(marker, 'click',function() {
								// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
								infowindow.setContent('<div id="marker">'
												+ '<a href=' + place.place_url + '>'+ place.place_name + '</a>'
												+ '<br>'
												+ place.phone
												+ '<br>'
												+ place.address_name
												+ '<br>' 
												+ place.distance + 'm </div>');
								infowindow.open(map, marker);
							});
			
			
		}
		// 이전 마커 삭제 함수
		function hideMarkers() {
			for (let i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
		}
	</script>


	<jsp:include page="../common/footer.jsp" />

</body>
</html>