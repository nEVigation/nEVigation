<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>


<script type="text/javascript">

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

</script>
</head>
<body>

	<h1>카카오맵</h1>

	<div style="width: 400px; height: 850px; float: left; border: black solid; margin-right: 20px">
	
	<form action="/map/main" method="post">
		<input type="text" name="stationName">
		<button>검색</button>
	</form>
	
	</div>



	<div id="map" style="width: 1450px; height: 850px; float: left;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f2326f00a3bd3eea8b0b3d6d8722b998"></script>
	<script>
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

				// GeoLocation을 이용해서 접속 위치를 얻어옵니다
				navigator.geolocation.getCurrentPosition(function(position) {

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(position.coords.latitude,
							position.coords.longitude), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨 
				};

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				var station_info = [];
				
				<c:forEach items="${allStationList}" var="list">
					station_info.push({
						station_no: ${list.getStation_no()},
						title: "${list.getStation_name()}",
						latlng: new kakao.maps.LatLng(${list.getStation_latitude()}, ${list.getStation_longitude()}),
						start_time: '${list.getStation_start_time()}',
						end_time: '${list.getStation_end_time()}',
						address: '${list.getStation_address()}',
						parking_fee: ${list.getParking_fee()}
					})
				</c:forEach>
					
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
				
				// 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			    station_info.forEach(function(pos) {
			    	  // 마커를 생성합니다
					    var marker = new kakao.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: pos.latlng, // 마커를 표시할 위치
					        title : pos.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					        image : markerImage, // 마커 이미지
					        clickable: true
					    });
			    	  
					  var br = document.createElement('br'); 

			    	  var content = document.createElement('div');
			    	  content.setAttribute('class', 'wrap');

			    	  var info = document.createElement('div');
			    	  info.setAttribute('class', 'info')
			    	  content.appendChild(info);
			    	  
			    	  var title = document.createElement('div');
			    	  title.setAttribute('class', 'title');
			    	  title.appendChild(document.createTextNode(pos.title));
			    	  info.appendChild(title);
			    	  
			    	  var closeBtn = document.createElement('div');
			    	  closeBtn.setAttribute('class', 'close');
			    	  closeBtn.appendChild(document.createTextNode(' '));
			    	  closeBtn.onclick = function() { customOverlay.setMap(null); };
			    	  title.appendChild(closeBtn);
			    	  
			    	  var body = document.createElement('div');
			    	  body.setAttribute('class', 'body');
			    	  info.appendChild(body);
			    	  
			    	  var desc = document.createElement('div');
			    	  desc.setAttribute('class', 'desc');
			    	  body.appendChild(desc);
			    	  
			    	  var ellipsis = document.createElement('div');
			    	  ellipsis.setAttribute('class', 'ellipsis');
			    	  ellipsis.appendChild(document.createTextNode('시작 시간 : ' + pos.start_time));
			    	  ellipsis.appendChild(br);
			    	  ellipsis.appendChild(document.createTextNode('종료 시간 : ' + pos.end_time));
			    	  ellipsis.appendChild(br);
			    	  ellipsis.appendChild(document.createTextNode('주소 : ' + pos.address));
			    	  ellipsis.appendChild(br);
			    	  ellipsis.appendChild(document.createTextNode('주차요금 : ' + pos.parking_fee + '원'));
			    	  desc.appendChild(ellipsis);
			    	  
			    	  var customOverlay = new kakao.maps.CustomOverlay({
			    		  content: content,
						  map: map,
						  position: marker.getPosition()  
			    	  });

			    	  customOverlay.setContent(content);
			    	  customOverlay.setMap(null);
			    	  
			    	  kakao.maps.event.addListener(marker, 'click', function() {
			    		  customOverlay.setMap(map);
						});
			    	});
				});
				
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		
			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = '사용자 위치를 사용 할 수 없습니다. 다시 설정해주세요.'

			displayMarker(locPosition, message);
		}
		
	

	</script>

</body>
</html>