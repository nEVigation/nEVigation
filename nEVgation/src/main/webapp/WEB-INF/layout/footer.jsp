<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<footer class="container-fluid navbar-fixed-bottom ">

<script type="text/javascript">
function getLocation() {
	if (navigator.geolocation) { // GPS를 지원하면
		navigator.geolocation.getCurrentPosition(function(pos) {
			var crd = pos.coords;
			console.log('위도 : ' + crd.latitude);
			console.log('경도: ' + crd.longitude);
			lat = crd.latitude;
			lon = crd.longitude;
				$.ajax({
					url : 'https://dapi.kakao.com/v2/local/geo/coord2address.json?x=' + lon +'&y=' + lat,
				    type : 'GET',
    				headers : {
      				'Authorization' : 'KakaoAK 79583d06d0070e0b53455ab465a01368'
    				},
    				contentType : 'application/json; charset=UTF-8',
    				success : function(data) {
      					console.log(data);
      					console.log(data.documents[0].address["region_2depth_name"] +" " + data.documents[0].address["region_3depth_name"])
      					
					    var loc = data.documents[0].address["region_2depth_name"] +" " + data.documents[0].address["region_3depth_name"];
      					console.log(loc);
      
					    $("#loc").append(loc);

    				},
    				error : function(e) {
      					console.log(e);
    				}
				});
	
		}, function(error) {
			console.error(error);
		}, {
			enableHighAccuracy: false, maximumAge: 0, timeout: Infinity
		});
	} else {
		alert('GPS를 지원하지 않습니다');
		}
	}
getLocation();
</script>

	<div class="footer_logo h1">
		<!-- <img width=100px; src='/resources/img/logo.png' /> -->
		<p style="font:bold; font-family:arial; padding-right: 20px;;">nEVigation</p>
	</div> 
	
	<div class="footer_content" style="margin-top: 9px;">
		<span id="loc" style="font-weight:bold"></span> 에서 접속중
		<br> TEAM. 강건, 김준홍, 박정서, 최유리, 최현준<br>
		COPYRIGHT 2021. nEVigation. ALL RIGHTS RESERVED.
	</div>
</footer>

</html>

</body>
</html>
    