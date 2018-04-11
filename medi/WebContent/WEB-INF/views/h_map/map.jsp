<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/reset.css"/>
<link rel="stylesheet" type="text/css" href="css/ui_common.css"/>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<link rel="stylesheet" type="text/css" href="css/map.css"/>
<!-- <script type="text/javascript" src="js/mainSlide.js"></script>
<script src="plugin/jquery-1.11.1.min.js"></script>
<script src="plugin/jquery.bxslider.js"></script>
<script src="plugin/jquery.bxslider.min.js"></script>
<script src="js/main.js"></script> -->
<!-- 복붙시작 -->
<script type="text/javascript" src="ui_common/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="ui_common/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="ui_common/js/TweenMax.js"></script>
<script type="text/javascript" src="ui_common/js/ScrollToPlugin.js"></script>
<script type="text/javascript" src="ui_common/js/masonry.pkgd.min.js"></script>
<script type="text/javascript" src="ui_common/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="ui_common/js/ui.common.js"></script>
<script type="text/javascript" src="ui_common/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="ui_common/js/jquery.animateNumber.js"></script>
<script type="text/javascript" src="ui_common/js/jquery.accessSlider.js"></script>
<!-- 복붙끝 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>병원 지도로 보기</title>
<style type="text/css">
.mapWrap{width:100%; min-height:600px; overflow:hidden;}
.mapContainer{position:absolute;left:0;right:0;bottom:0;top:60px;width:100%;}
.maparea{position:absolute;left:0;top:0;right:0;bottom:0;}
#fullmap {position:absolute; width:100%; height:100%; padding:0; }
</style>
</head>
<body class="layout-member" style="position:absolute;width:100%;height:100%;">
<div id="skipnavigation">
    <ul>
        <li><a href="#container">본문 바로가기</a></li>
        <li><a href="#gnb">주 메뉴 바로가기</a></li>
    </ul>
</div>
<div id="wrap" style="min-height:100%;">
	<!-- header 시작 -->
	<header id="header_wrap_sub" style="position:unset;">
		<div class="inner">
			<h1 class="logo">
				<a href="#;"><em class="blind">가톨릭대학교 서울성모병원</em></a>
			</h1>
			<div class="util_wrap">
	            <div class="header_util_sub">
	                <div class="logout">
	                    <ul>
	                        <li>
								<a href="javascript:cmc.util.loginPage();">
								    <em>로그인</em>
								</a>
							</li>
							<li>
								<a href="/page/member/join/select">
								    <em>회원가입</em>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- header 끝  -->
	
	<div class="mapWrap">
		<div class="mapContainer">
			<div class="maparea">
				<div id="fullmap" style="width:100%;height:100%;">
			</div>
		</div>
	</div>
	</div>
	<script>
		function initMap() {
			var uluru = {lat: -25.363, lng: 131.044};
			var map = new google.maps.Map(document.getElementById('fullmap'), {
				zoom: 4,
				center: uluru
			});
			var marker = new google.maps.Marker({
				position: uluru,
				map: map
			});
		}
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDS-kA70GhIwstJM_0pRT4kO6AM7wx8lEc&callback=initMap"></script>
</div>


</body>
</html>