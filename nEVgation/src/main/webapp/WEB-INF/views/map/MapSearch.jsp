<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<c:import url="/WEB-INF/layout/OverlayStyle.jsp"></c:import>

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

	<div
		style="width: 400px; height: 850px; float: left; border: black solid; margin-right: 20px">
		<form action="/map/search" method="get">
			충전소 이름 검색 : <input type="text" name="searchStationName">
			<button>검색</button>
		</form>

		<hr>

		<c:forEach items="${searchStationList}" var="list">
		충전소 이름 : ${list.getStation_name()} <br>
		시작 시간 : ${list.getStation_start_time()} <br>
		종료 시간 : ${list.getStation_end_time()} <br>
		주소 : ${list.getStation_address()} <br>
		주차요금 : ${list.getParking_fee()}
		<hr>
		
		</c:forEach>
		
		<c:import url="/WEB-INF/layout/pagingSearchMapList.jsp" />
	</div>


	<div id="map" style="width: 1450px; height: 850px; float: left;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f2326f00a3bd3eea8b0b3d6d8722b998"></script>
	<script>
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new kakao.maps.LatLng(${searchStationList[0].getStation_latitude()},
					${searchStationList[0].getStation_longitude()}), // 지도의 중심좌표
			level : 7
		// 지도의 확대 레벨 
		};
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		
		// 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		
		var station_info = [];
		
		<c:forEach items="${searchStationList}" var="list">
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
				  var br2 = document.createElement('br');
				  var br3 = document.createElement('br');
				  var br4 = document.createElement('br');
				  var br5 = document.createElement('br'); 

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
		    	  
// 		    	  var favoriteBtn = document.createElement('div');
// 		    	  closeBtn.setAttribute('class', 'favorite');
// 		    	  closeBtn.appendChild(document.createTextNode(' '));
// 		    	  closeBtn.onclick = function() { customOverlay.setMap(null); };
// 		    	  title.appendChild(closeBtn);
		    	  
		    	  var body = document.createElement('div');
		    	  body.setAttribute('class', 'body');
		    	  body.appendChild(document.createTextNode('시작 시간 : ' + pos.start_time));
		    	  body.appendChild(br);
		    	  body.appendChild(document.createTextNode('종료 시간 : ' + pos.end_time));
		    	  body.appendChild(br2);
		    	  body.appendChild(document.createTextNode('주소 : ' + pos.address));
		    	  body.appendChild(br3);
		    	  body.appendChild(document.createTextNode('주차요금 : ' + pos.parking_fee + '원'));
		    	  body.appendChild(br4);
		    	  info.appendChild(body);
		    	  
		    	  var desc = document.createElement('div');
		    	  desc.setAttribute('class', 'desc');
		    	  body.appendChild(desc);
		    	  
		    	  var ellipsis = document.createElement('div');
		    	  ellipsis.setAttribute('class', 'ellipsis');
		    	  desc.appendChild(ellipsis);
		    	  
		    	  var customOverlay = new kakao.maps.CustomOverlay({
		    		  content: content,
					  map: map,
					  position: marker.getPosition()  
		    	  });

		    	  //customOverlay.setContent(content);
		    	  customOverlay.setMap(null);
		    	  
		    	  kakao.maps.event.addListener(marker, 'click', function() {
		    		  customOverlay.setMap(map);
					});
		    	});
		
	</script>
	
	<c:import url="/WEB-INF/layout/footer.jsp" />    

</body>
</html>