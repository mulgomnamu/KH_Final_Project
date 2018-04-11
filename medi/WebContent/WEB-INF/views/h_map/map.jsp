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
	.mapContainer{position:absolute;left:0;right:0;bottom:0;top:60px;width:72%;}
	.maparea{position:absolute;left:0;top:0;right:0;bottom:0;}
	#fullmap {position:absolute; width:100%; height:100%; padding:0; }
	
	/* 지도 게시판 시작 */
	.mapbbslist{position:absolute; width:440px; overflow-y:auto; top:60px; right:0; bottom:0; z-index:5; background-color:#fff; box-shadow:0 0 10px rgba(0,0,0,0.2);}
	.mapbbslist .searchWrap{height:60px; padding-top:20px; text-align:center; background-color:#ededed; color:#fff;}
	.mapbbslist .mapsearchbox{position:relative; background-color:#fff; width:330px; height:34px; border:1px solid #e9e9e9; margin:0 auto; }
	.mapbbslist .mapsearchtext{position:absolute; left:0; width:80%;height:100%; color:#000; font-size:14px; text-indent:20px;}
	.mapbbslist .mapbbsbtn{position:absolute; top:0; right:0; height:100%; background-color:#0b2d85; width:60px; line-height:32px; color:#fff; text-align:center;}
	.mapbbslist .mapbbsboxwrap{padding:10px 15px;}
	.mapbbslist .mapbbsbox{display:block; position:relative; height:105px; padding:10px; border-top:1px solid #d9d9d9; border-right:1px solid #d9d9d9; border-left:1px solid #d9d9d9; margin-top:-1px; clear:both; }
	.mapbbslist .mapbbsbox:last-child{border-bottom:1px solid #d9d9d9;}
	
	.mapimgbox{width:120px; height:105px; overflow:hidden; float:left;}
	.mapimgbox img{width:100%; height:100%;}
	.mapbbsinfo{float:left; margin-left:12px; width:235px;}
	
	.mbiTitle{font-size:20px; font-weight:bold; color:#000; display:block; border-bottom:1px solid #d9d9d9; padding-left:5px;}
	.mbiAddress{margin-top:8px; padding-left:5px;}
	.mbiCategory{font-size:13px; color:#2074c8; padding-left:5px;}

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
	
	<!-- map -->
	<div class="mapWrap">
		<div class="mapContainer">
			<div class="maparea">
				<div id="fullmap" style="width:100%;height:100%;"></div>
			</div>
		</div>
	</div>
	<script>
		function initMap() {
			var uluru = {lat: 37.357386, lng: 126.970704};
			var map = new google.maps.Map(document.getElementById('fullmap'), {
				zoom: 15,
				center: uluru
			});
			var marker = new google.maps.Marker({
				position: uluru,
				map: map
			});
		}
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDS-kA70GhIwstJM_0pRT4kO6AM7wx8lEc&callback=initMap"></script>
    
	<!-- 게시판 list -->
    <div class="mapbbslist">
    	<div class="searchWrap">
    		<form>
    			<div class="mapsearchbox">
	    			<input type="text" name="keyword" class="mapsearchtext">
	    			<input type="submit" value="검색" class="mapbbsbtn">
    			</div>
    		</form>
    	</div>
    	<ul class="mapbbsboxwrap">
    		<li class="mapbbsbox">
    			<a href="#;">
    				<div class="mapimgbox"><img src="images/sub/hospital.jpg" alt=""></div>
    				<div class="mapbbsinfo">
    					<ul>
    						<li class="mbiTitle">병원명</li>
    						<li class="mbiAddress">서울시 강남구 역삼동 111-111</li>
    						<li class="mbiCategory">이비인후과</li>
    					</ul>
    				</div>
    			</a>
    		</li>
    		<li class="mapbbsbox">
    			<a href="#;">
    				<div class="mapimgbox"><img src="images/sub/hospital.jpg" alt=""></div>
    				<div class="mapbbsinfo">
    					<ul>
    						<li class="mbiTitle">병원명</li>
    						<li class="mbiAddress">서울시 강남구 역삼동 111-111</li>
    						<li class="mbiCategory">이비인후과</li>
    					</ul>
    				</div>
    			</a>
    		</li>
    		<li class="mapbbsbox">
    			<a href="#;">
    				<div class="mapimgbox"><img src="images/sub/hospital.jpg" alt=""></div>
    				<div class="mapbbsinfo">
    					<ul>
    						<li class="mbiTitle">병원명</li>
    						<li class="mbiAddress">서울시 강남구 역삼동 111-111</li>
    						<li class="mbiCategory">이비인후과</li>
    					</ul>
    				</div>
    			</a>
    		</li>
    		<li class="mapbbsbox">
    			<a href="#;">
    				<div class="mapimgbox"><img src="images/sub/hospital.jpg" alt=""></div>
    				<div class="mapbbsinfo">
    					<ul>
    						<li class="mbiTitle">병원명</li>
    						<li class="mbiAddress">서울시 강남구 역삼동 111-111</li>
    						<li class="mbiCategory">이비인후과</li>
    					</ul>
    				</div>
    			</a>
    		</li>
    		<li class="mapbbsbox">
    			<a href="#;">
    				<div class="mapimgbox"><img src="images/sub/hospital.jpg" alt=""></div>
    				<div class="mapbbsinfo">
    					<ul>
    						<li class="mbiTitle">병원명</li>
    						<li class="mbiAddress">서울시 강남구 역삼동 111-111</li>
    						<li class="mbiCategory">이비인후과</li>
    					</ul>
    				</div>
    			</a>
    		</li>
    	</ul>
    </div>
    
    
</div>


</body>
</html>