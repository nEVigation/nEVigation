<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/layout/header.jsp" />    

	<!-- <div class="sliderbox">
		<ul id="slider">
			<li><p><img style ="width:300px; height:300px; clear:both; float:left;" src="/resources/img/tip1.jpg" align="top"></p>
			<p><h5>지하주차장을 이용하세요</h5></li>
			<li><p><img style ="width:300px; height:300px; clear:both; float:left;" src="/resources/img/tip2.jpg" align="top"></p>
			<p><h6>회생제동을 활용하세요</h6></li>
			<li><p><img style ="width:300px; height:300px; clear:both; float:left;" src="/resources/img/tip3.jpg" align="top"></p>
			<p><h6>가끔은 '완충' 해주세요</h6></li>
			<li><p><img style ="width:300px; height:300px; clear:both; float:left;" src="/resources/img/tip4.jpg" align="top"></p>
			<p><h6>전기차 경고등을 알아두세요</h6></li>
		</ul>
	</div> -->
	 
	<br>
	
<section>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

<!-- Wrapper for slides -->

<div class="carousel-inner slideshow center-block .col-lg-" >
    <div class="item active">
      <img src="/resources/img/tip1.jpg" alt="tip1"  >
      <div class="carousel-caption">
        <h3>지하주차장을 이용하세요</h3>
      </div>
    </div>

    <div class="item">
      <img src="/resources/img/tip2.jpg" alt="tip2">
      <div class="carousel-caption">
        <h3>회생제동을 활용하세요</h3>
      </div>
    </div>

    <div class="item">
      <img src="/resources/img/tip3.jpg" alt="tip3">
      <div class="carousel-caption">
        <h3>가끔은 '완충' 해주세요</h3>
      </div>
    </div>
    
    <div class="item">
      <img src="/resources/img/tip4.jpg" alt="tip4">
      <div class="carousel-caption">
        <h3>전기차 경고등을 알아두세요</h3>
      </div>
    </div>
  </div>

<!-- Pictogram -->
<!-- 
  <div class="carousel-inner slideshow center-block " >
    <div class="item active">
      <img src="/resources/img/picto1.png" alt="tip1"  >
        <h3>회생제동을 활용하세요</h3>
        <h3>지하주차장을 이용하세요</h3>
      </div>
    </div>

    <div class="item">
      <img src="/resources/img/picto2.png" alt="tip2">
      <div class="carousel-caption">
        <h3>회생제동을 활용하세요</h3>
      </div>
    </div>

    <div class="item">
      <img src="/resources/img/picto3.png" alt="tip3">
      <div class="carousel-caption">
        <h3>가끔은 '완충' 해주세요</h3>
      </div>
    </div>
    
    <div class="item">
      <img src="/resources/img/picto4.png" alt="tip4">
      <div class="carousel-caption">
        <h3>전기차 경고등을 알아두세요</h3>
      </div>
    </div>
  </div>
 -->
 
  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

	
<div class="video-area">
	<video width="100%" src="/resources/video/ev1.mp4" autoplay muted loop></video>
</div>

</section>

<c:import url="/WEB-INF/layout/footer.jsp" />    
