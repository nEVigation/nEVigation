<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Kakao 지도 시작하기</title>
<style>

</style>
</head>
<body>
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=edb72254c54bc4959fa79e6644b6b5f5"></script>
	<script>
		var container = document.getElementById('map');
		var mapCenter = new kakao.maps.LatLng(${sessionScope.lat}, ${sessionScope.lng});
		var options = {
// 			center: new kakao.maps.LatLng(33.450701, 126.570667),
			center: mapCenter,
			level: 3
		};
		
		var map = new kakao.maps.Map(container, options);
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: mapCenter,
		});
		marker.setMap(map);

		var iwContent = '<div style="padding:5px; text-align:center;">${sessionScope.station_name}<br><a href="https://map.kakao.com/link/map/${sessionScope.station_name},${sessionScope.lat},${sessionScope.lng}" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/${sessionScope.station_name},${sessionScope.lat},${sessionScope.lng}" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = mapCenter; //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
	  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
		
	</script>
</body>
</html>