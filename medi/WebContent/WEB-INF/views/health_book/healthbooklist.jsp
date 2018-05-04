<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" type="text/css" href="./css/slick-theme.css">
<link rel='stylesheet prefetch' href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css">
<link href="./css/healthbook.css" type="text/css" rel="stylesheet">


<script type="text/javascript" src="./ui_common/js/highcharts.js"></script>
<script src="http://code.highcharts.com/highcharts-3d.js"></script>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<script src="./ui_common/js/slick.min.js"></script>
<script type="text/javascript" src="./js/healthbook.js"></script>
</head>

<style type="text/css">
.body{
      background: #e6e8f1;
}
.main {
  font-family:Arial;
  width:700px;
  display:block;
  margin:0 auto;
}

/* h3 {
    background: #fff;
    color: #3498db;
    font-size: 36px;
   line-height: 100px;
    margin: 10px;
    padding: 2%;
    position: relative;
    text-align: center;
} */
/* strong {
    color: #3498db;
    font-size: 22px;
    line-height: 100px;
    position: relative;
    text-align: center;
} */
.action{
  display:block;
  margin:100px auto;
  width:100%;
  text-align:center;
}
.action a {
  display:inline-block;
  padding:5px 10px; 
  background:#f30;
  color:#fff;
  text-decoration:none;
}
.action a:hover{
  background:#000;
}
/* slick image 관련 */
.abcd{
 background:url(./images/healthbook/ico_treat_all_off.png) center center no-repeat;
}
.slick-current.abcd{
 background:url(./images/healthbook/ico_treat_all_on.png) center center no-repeat;
}
.slick-current.abcd li {
    color: #c333ff !important;
}

.wegiht_slider{
background:url(./images/healthbook/ico_treat_body_off.png) center center no-repeat;	
}

.slick-current.wegiht_slider{
 background:url(./images/healthbook/ico_treat_body_on.png) center center no-repeat;
}
.slick-current.wegiht_slider li {
    color: #12bc8a !important;
}

.check_slider{
background:url(./images/healthbook/ico_treat_check_off.png) center center no-repeat;	
}
.slick-current.check_slider{
 background:url(./images/healthbook/ico_treat_check_on.png) center center no-repeat;
}
.slick-current.check_slider li {
    color: #2749ac;
}

.walk_slider{
background:url(./images/healthbook/ico_treat_walk_off.png) center center no-repeat;	
}
.slick-current.walk_slider{
 background:url(./images/healthbook/ico_treat_walk_on.png) center center no-repeat;
}
.slick-current.walk_slider li {
    color: #3399ff;
}

.care_slider{
background:url(./images/healthbook/ico_treat_care_off.png) center center no-repeat;	
}
.slick-current.care_slider{
 background:url(./images/healthbook/ico_treat_care_on.png) center center no-repeat;
}
.slick-current.care_slider li {
    color: #f24e4f;
}



.all{
  background: #fff;
  display:block;
  margin:0 auto;
}

.treat{
  background: #fff;
  display:block;
  margin:0 auto;
}

.bh_4u_sub_conts {
	border: 29px solid #e6e8f1;
}


.bh_4u_vital_t_ul > li .bh_4u_inner{
background:#fff;padding:20px;}

.bh_4u_vital_t_ul > li{
display:inline-block;
width:calc(32.9% - 15px);
border-left:7px solid #e6e8f1;
border-right:7px solid #e6e8f1;
background:url(../../images/sub/bg_shadow.png) 0 bottom repeat-x;
padding-bottom:5px;}


</style>
  
  

<c:if test="${empty login}">
	<script type="text/javascript">
	alert("로그인이 필요합니다");
	location.href='main.do';
	</script>
</c:if> 

<body>
<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->		
 				
				<!-- content 시작 --> 
				<div class="content"> 	
				
				
<div class="main">
 <div class="slider slider-nav" >
    <div class="abcd" style= "width: 120px; height: 134px;">
   	 <li class="abc" style="text-align: center; 
   	 padding-top: 100px; border-left-width: 20px; font-weight: bold;">
    	전체</li>
 	</div>

    <div class="wegiht_slider" style= "width: 120px; height: 134px;">
   	 <li class="wegiht_slider_on" style="text-align: center; 
   	 padding-top: 100px; border-left-width: 20px; font-weight: bold;">
    	기본정보</li>
 	</div>
 	
   <!--  <div style= "width: 120px;height: 134px;"><h3>3</h3></div> -->
    <div class="walk_slider" style= "width: 120px; height: 134px;">
   	 <li class="walk_slider_on" style="text-align: center; 
   	 padding-top: 100px; border-left-width: 20px; font-weight: bold;">
    	활동</li>
 	</div>
    <!-- <div style= "width: 120px;height: 134px;"><h3>4</h3></div> -->
     <div class="care_slider" style= "width: 120px; height: 134px;">
   	 <li class="care_slider_on" style="text-align: center; 
   	 padding-top: 100px; border-left-width: 20px; font-weight: bold;">
    	예방접종</li>
 	</div>
    
    <div class="check_slider" style= "width: 120px; height: 134px;">
   	 <li class="check_slider_on" style="text-align: center; 
   	 padding-top: 100px; border-left-width: 20px; font-weight: bold;">
    	자가진단</li>
 	</div>
 	

  </div>
</div>



<div class="main2">
  <div class="slider slider-for">
<c:forEach items="${hlist}" var="health">
<c:if test="${login.seq eq health.mem_seq}">
	
	
	<!-- 전체보기 페이지 -->
	<div class="all">
	<div class="bh_4u_vital_t" style="border:29px solid #e6e8f1">
    <ul class="bh_4u_vital_t_ul">
        <li class="bh_4u_vital_t_body">
            <div class="bh_4u_inner">
                <div class="bh_4u_t">
                    <strong>체중</strong>
                        <p>목표 처방 없음</p>
                </div>
                <div class="bh_4u_m">
                    <span class="ico_middle"><img src="./images/healthbook/ico_middle_1.gif" alt=""></span>
                            <p><span style="width: 50%;"></span></p>
                        <strong>${health.weight}</strong><em>Kg</em>
                </div>
                <div class="bh_4u_b">
                        <span>2018.04.18</span>
                </div>
            </div>
        </li>
        <li class="bh_4u_vital_t_bmi">
            <div class="bh_4u_inner">
                <div class="bh_4u_t">
                    <strong>체질량</strong>
                        <p>목표 처방 없음</p>
                </div>
                <div class="bh_4u_m">
                    <span class="ico_middle"><img src="./images/healthbook/ico_middle_2.gif" alt=""></span>
                            <p class="another_p"><span style="width: 50%;"></span></p>
                        <strong>
                        <fmt:formatNumber value=" ${(health.weight /((health.height/100) * (health.height/100)))}" pattern="0.00"/>
                       </strong><em>BMI</em>
                        
                </div>
                <div class="bh_4u_b">
                        <span>2018.04.18</span>
                </div>
            </div>
        </li>
        
        <li class="bh_4u_vital_t_walk">
            <div class="bh_4u_inner">
                <div class="bh_4u_t">
                    <strong>걸음</strong>
                        <p>목표 처방 없음</p>
                </div>
                <div class="bh_4u_m">
                        <p><span style="width: 0%;"></span></p>
                        <strong>&nbsp;</strong><em>&nbsp;</em>
                </div>
                <div class="bh_4u_b">
                        <span>걸음 데이터 없음</span>
                </div>
            </div>
        </li>
        </ul>
        </div>
        <div class="4u_vital_b">
    <ul class="vitalList">
        <li class="vitalList1">
            <div>
                <strong class="vitalTit" onclick="goToClickedPage(4)">체중/체질량 기간 추이</strong>

                <div class="yearBtn1">
                    <ul>
                        <li class="on"><a href="javascript:" onclick="weiChartPeriod(0)">2주</a></li>
                        <li><a href="javascript:" onclick="weiChartPeriod(1)">4주</a></li>
                        <li><a href="javascript:" onclick="weiChartPeriod(2)">3개월</a></li>
                    </ul>
                </div>

                <div id="weight_container" class="weightGraph" data-highcharts-chart="7"><div class="highcharts-container" id="highcharts-25" style="position: relative; overflow: hidden; width: 516px; height: 300px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><svg version="1.1" style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Arial, Helvetica, sans-serif;font-size:12px;" xmlns="http://www.w3.org/2000/svg" width="516" height="300"><desc>Created with Highcharts 4.2.3</desc><defs><clipPath id="highcharts-26"><rect x="0" y="0" width="451" height="220"></rect></clipPath></defs><rect x="0" y="0" width="516" height="300" fill="#FFFFFF" class=" highcharts-background"></rect><g class="highcharts-grid" zIndex="1"></g><g class="highcharts-grid" zIndex="1"><path fill="none" d="M 55 47.5 L 506 47.5" stroke="#D8D8D8" stroke-width="1" zIndex="1" opacity="1"></path><path fill="none" d="M 55 230.5 L 506 230.5" stroke="#D8D8D8" stroke-width="1" zIndex="1" opacity="1"></path><path fill="none" d="M 55 193.5 L 506 193.5" stroke="#D8D8D8" stroke-width="1" zIndex="1" opacity="1"></path><path fill="none" d="M 55 157.5 L 506 157.5" stroke="#D8D8D8" stroke-width="1" zIndex="1" opacity="1"></path><path fill="none" d="M 55 120.5 L 506 120.5" stroke="#D8D8D8" stroke-width="1" zIndex="1" opacity="1"></path><path fill="none" d="M 55 83.5 L 506 83.5" stroke="#D8D8D8" stroke-width="1" zIndex="1" opacity="1"></path><path fill="none" d="M 55 9.5 L 506 9.5" stroke="#D8D8D8" stroke-width="1" zIndex="1" opacity="1"></path></g><g class="highcharts-axis" zIndex="2"><path fill="none" d="M 280.5 230 L 280.5 240" stroke="#C0D0E0" stroke-width="1" opacity="1"></path><path fill="none" d="M 55 230.5 L 506 230.5" stroke="#C0D0E0" stroke-width="1" zIndex="7"></path></g><g class="highcharts-axis" zIndex="2"></g><g class="highcharts-series-group" zIndex="3"><g class="highcharts-series highcharts-series-0" zIndex="0.1" transform="translate(55,10) scale(1 1)" clip-path="url(#highcharts-26)"><path fill="none" d="M 225.5 36.666666666666686" stroke="#12bc8a" stroke-width="2" zIndex="1" stroke-linejoin="round" stroke-linecap="round"></path><path fill="none" d="M 215.5 36.666666666666686 L 225.5 36.666666666666686 L 235.5 36.666666666666686" stroke-linejoin="round" visibility="visible" stroke="rgba(192,192,192,0.0001)" stroke-width="22" zIndex="2" class=" highcharts-tracker" style=""></path></g><g class="highcharts-markers highcharts-series-0 highcharts-tracker" zIndex="0.1" transform="translate(55,10) scale(1 1)" clip-path="url(#highcharts-27)" style=""><path fill="#12bc8a" d="M 225 32.666666666666686 C 230.328 32.666666666666686 230.328 40.666666666666686 225 40.666666666666686 C 219.672 40.666666666666686 219.672 32.666666666666686 225 32.666666666666686 Z"></path></g><g class="highcharts-series highcharts-series-1" zIndex="0.1" transform="translate(55,10) scale(1 1)" clip-path="url(#highcharts-26)"><path fill="none" d="M 225.5 179.66666666666669" stroke="#96ca2f" stroke-width="2" zIndex="1" stroke-linejoin="round" stroke-linecap="round"></path><path fill="none" d="M 215.5 179.66666666666669 L 225.5 179.66666666666669 L 235.5 179.66666666666669" stroke-linejoin="round" visibility="visible" stroke="rgba(192,192,192,0.0001)" stroke-width="22" zIndex="2" class=" highcharts-tracker" style=""></path></g><g class="highcharts-markers highcharts-series-1 highcharts-tracker" zIndex="0.1" transform="translate(55,10) scale(1 1)" clip-path="url(#highcharts-27)" style=""><path fill="#96ca2f" d="M 225 175.66666666666669 L 229 179.66666666666669 225 183.66666666666669 221 179.66666666666669 Z"></path></g></g><g class="highcharts-legend" zIndex="7" transform="translate(400,255)"><g zIndex="1"><g><g class="highcharts-legend-item" zIndex="1" transform="translate(8,3)"><path fill="none" d="M 0 11 L 8 11" stroke="#12bc8a" stroke-width="2"></path><path fill="#12bc8a" d="M 4 7 C 9.328 7 9.328 15 4 15 C -1.328 15 -1.328 7 4 7 Z"></path><text x="13" style="color:#333333;font-size:12px;font-weight:bold;cursor:pointer;fill:#333333;" text-anchor="start" zIndex="2" y="15">체중</text></g><g class="highcharts-legend-item" zIndex="1" transform="translate(49.75,3)"><path fill="none" d="M 0 11 L 8 11" stroke="#96ca2f" stroke-width="2"></path><path fill="#96ca2f" d="M 4 7 L 8 11 4 15 0 11 Z"></path><text x="13" y="15" style="color:#333333;font-size:12px;font-weight:bold;cursor:pointer;fill:#333333;" text-anchor="start" zIndex="2">체질량</text></g></g></g></g><g class="highcharts-axis-labels highcharts-xaxis-labels" zIndex="7"><text x="280.5" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:Infinitypx;text-overflow:clip;" text-anchor="middle" transform="translate(0,0)" y="249" opacity="1">05/02</text></g><g class="highcharts-axis-labels highcharts-yaxis-labels" zIndex="7"><text x="40" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:160px;text-overflow:clip;" text-anchor="end" transform="translate(0,0)" y="49" opacity="1"><tspan>60 kg</tspan></text><text x="40" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:160px;text-overflow:clip;" text-anchor="end" transform="translate(0,0)" y="233" opacity="1"><tspan>10 kg</tspan></text><text x="40" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:160px;text-overflow:clip;" text-anchor="end" transform="translate(0,0)" y="196" opacity="1"><tspan>20 kg</tspan></text><text x="40" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:160px;text-overflow:clip;" text-anchor="end" transform="translate(0,0)" y="159" opacity="1"><tspan>30 kg</tspan></text><text x="40" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:160px;text-overflow:clip;" text-anchor="end" transform="translate(0,0)" y="123" opacity="1"><tspan>40 kg</tspan></text><text x="40" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:160px;text-overflow:clip;" text-anchor="end" transform="translate(0,0)" y="86" opacity="1"><tspan>50 kg</tspan></text><text x="40" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:160px;text-overflow:clip;" text-anchor="end" transform="translate(0,0)" y="13" opacity="1"><tspan>70 kg</tspan></text></g><g class="highcharts-tooltip" zIndex="8" style="cursor:default;padding:0;pointer-events:none;white-space:nowrap;" transform="translate(0,-9999)"><path fill="none" d="M 3.5 0.5 L 13.5 0.5 C 16.5 0.5 16.5 0.5 16.5 3.5 L 16.5 13.5 C 16.5 16.5 16.5 16.5 13.5 16.5 L 3.5 16.5 C 0.5 16.5 0.5 16.5 0.5 13.5 L 0.5 3.5 C 0.5 0.5 0.5 0.5 3.5 0.5" isShadow="true" stroke="black" stroke-opacity="0.049999999999999996" stroke-width="5" transform="translate(1, 1)"></path><path fill="none" d="M 3.5 0.5 L 13.5 0.5 C 16.5 0.5 16.5 0.5 16.5 3.5 L 16.5 13.5 C 16.5 16.5 16.5 16.5 13.5 16.5 L 3.5 16.5 C 0.5 16.5 0.5 16.5 0.5 13.5 L 0.5 3.5 C 0.5 0.5 0.5 0.5 3.5 0.5" isShadow="true" stroke="black" stroke-opacity="0.09999999999999999" stroke-width="3" transform="translate(1, 1)"></path><path fill="none" d="M 3.5 0.5 L 13.5 0.5 C 16.5 0.5 16.5 0.5 16.5 3.5 L 16.5 13.5 C 16.5 16.5 16.5 16.5 13.5 16.5 L 3.5 16.5 C 0.5 16.5 0.5 16.5 0.5 13.5 L 0.5 3.5 C 0.5 0.5 0.5 0.5 3.5 0.5" isShadow="true" stroke="black" stroke-opacity="0.15" stroke-width="1" transform="translate(1, 1)"></path><path fill="rgba(249, 249, 249, .85)" d="M 3.5 0.5 L 13.5 0.5 C 16.5 0.5 16.5 0.5 16.5 3.5 L 16.5 13.5 C 16.5 16.5 16.5 16.5 13.5 16.5 L 3.5 16.5 C 0.5 16.5 0.5 16.5 0.5 13.5 L 0.5 3.5 C 0.5 0.5 0.5 0.5 3.5 0.5"></path><text x="8" zIndex="1" style="font-size:12px;color:#333333;fill:#333333;" y="20"></text></g></svg></div></div>
            </div>
		
		<li class="vitalList2">
            <div>
                <strong class="vitalTit" onclick="goToClickedPage(3)">걸음 기간 추이</strong>

                <div class="tabWrap">
                    <ul>
                        <li class="on"><a href="javascript:" onclick="exerChartPeriod(0)">일</a></li>
                        <li><a href="javascript:" onclick="exerChartPeriod(1)">주</a></li>
                        <li><a href="javascript:" onclick="exerChartPeriod(2)">월</a></li>
                        <li><a href="javascript:" onclick="exerChartPeriod(3)">년</a></li>
                    </ul>
                </div>

                <div id="exercise_container" class="healthGraph" data-highcharts-chart="6"><div class="highcharts-container" id="highcharts-23" style="position: relative; overflow: hidden; width: 520px; height: 300px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><svg version="1.1" style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Arial, Helvetica, sans-serif;font-size:12px;" xmlns="http://www.w3.org/2000/svg" width="520" height="300"><desc>Created with Highcharts 4.2.3</desc><defs><clipPath id="highcharts-24"><rect x="0" y="0" width="500" height="245"></rect></clipPath></defs><rect x="0" y="0" width="520" height="300" fill="#FFFFFF" class=" highcharts-background"></rect><g class="highcharts-no-data" style="" transform="translate(257,130)"><image xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="./images/healthbook/img_data_none.png" x="-260" y="-170" height="300px" width="100%"></image><text x="3" zindex="1" style="font-size:12px;font-weight:bold;color:#60606a;fill:#60606a;" y="15"><tspan y="23%" x="-30">입력된 정보가 없습니다.</tspan></text></g><g class="highcharts-grid" zIndex="1"></g><g class="highcharts-grid" zIndex="1"></g><g class="highcharts-axis" zIndex="2"><path fill="none" d="M 10 255.5 L 510 255.5" stroke="#C0D0E0" stroke-width="1" zIndex="7"></path></g><g class="highcharts-axis" zIndex="2"></g><g class="highcharts-series-group" zIndex="3"><g class="highcharts-series highcharts-series-0 highcharts-tracker" zIndex="0.1" transform="translate(10,10) scale(1 1)" style="" clip-path="url(#highcharts-24)"></g><g class="highcharts-markers highcharts-series-0" zIndex="0.1" transform="translate(10,10) scale(1 1)" clip-path="none"></g><g class="highcharts-series highcharts-series-1 highcharts-tracker" zIndex="0.1" transform="translate(10,10) scale(1 1)" style="" clip-path="url(#highcharts-24)"></g><g class="highcharts-markers highcharts-series-1" zIndex="0.1" transform="translate(10,10) scale(1 1)" clip-path="none"></g><g class="highcharts-series highcharts-series-2 highcharts-tracker" zIndex="0.1" transform="translate(10,10) scale(1 1)" style="" clip-path="url(#highcharts-24)"></g><g class="highcharts-markers highcharts-series-2" zIndex="0.1" transform="translate(10,10) scale(1 1)" clip-path="none"></g></g><g class="highcharts-legend" zIndex="7" transform="translate(283,255)"><g zIndex="1"><g><g class="highcharts-legend-item" zIndex="1" transform="translate(8,3)"><text x="13" style="color:#333333;font-size:12px;font-weight:bold;cursor:pointer;fill:#333333;" text-anchor="start" zIndex="2" y="15">Health4U</text><rect x="0" y="8" width="8" height="8" rx="4" ry="4" zIndex="3" fill="#3331fe"></rect></g><g class="highcharts-legend-item" zIndex="1" transform="translate(79.609375,3)"><text x="13" y="15" style="color:#333333;font-size:12px;font-weight:bold;cursor:pointer;fill:#333333;" text-anchor="start" zIndex="2">S-Health</text><rect x="0" y="8" width="8" height="8" rx="4" ry="4" zIndex="3" fill="#3aa1fe"></rect></g><g class="highcharts-legend-item" zIndex="1" transform="translate(148.71875,3)"><text x="13" y="15" style="color:#333333;font-size:12px;font-weight:bold;cursor:pointer;fill:#333333;" text-anchor="start" zIndex="2">Apple건강</text><rect x="0" y="8" width="8" height="8" rx="4" ry="4" zIndex="3" fill="#3881fe"></rect></g></g></g></g><g class="highcharts-axis-labels highcharts-xaxis-labels" zIndex="7"></g><g class="highcharts-axis-labels highcharts-yaxis-labels" zIndex="7"></g><g class="highcharts-tooltip" zIndex="8" style="cursor:default;padding:0;pointer-events:none;white-space:nowrap;" transform="translate(0,-9999)"><path fill="none" d="M 3.5 0.5 L 13.5 0.5 C 16.5 0.5 16.5 0.5 16.5 3.5 L 16.5 13.5 C 16.5 16.5 16.5 16.5 13.5 16.5 L 3.5 16.5 C 0.5 16.5 0.5 16.5 0.5 13.5 L 0.5 3.5 C 0.5 0.5 0.5 0.5 3.5 0.5" isShadow="true" stroke="black" stroke-opacity="0.049999999999999996" stroke-width="5" transform="translate(1, 1)"></path><path fill="none" d="M 3.5 0.5 L 13.5 0.5 C 16.5 0.5 16.5 0.5 16.5 3.5 L 16.5 13.5 C 16.5 16.5 16.5 16.5 13.5 16.5 L 3.5 16.5 C 0.5 16.5 0.5 16.5 0.5 13.5 L 0.5 3.5 C 0.5 0.5 0.5 0.5 3.5 0.5" isShadow="true" stroke="black" stroke-opacity="0.09999999999999999" stroke-width="3" transform="translate(1, 1)"></path><path fill="none" d="M 3.5 0.5 L 13.5 0.5 C 16.5 0.5 16.5 0.5 16.5 3.5 L 16.5 13.5 C 16.5 16.5 16.5 16.5 13.5 16.5 L 3.5 16.5 C 0.5 16.5 0.5 16.5 0.5 13.5 L 0.5 3.5 C 0.5 0.5 0.5 0.5 3.5 0.5" isShadow="true" stroke="black" stroke-opacity="0.15" stroke-width="1" transform="translate(1, 1)"></path><path fill="rgba(249, 249, 249, .85)" d="M 3.5 0.5 L 13.5 0.5 C 16.5 0.5 16.5 0.5 16.5 3.5 L 16.5 13.5 C 16.5 16.5 16.5 16.5 13.5 16.5 L 3.5 16.5 C 0.5 16.5 0.5 16.5 0.5 13.5 L 0.5 3.5 C 0.5 0.5 0.5 0.5 3.5 0.5"></path><text x="8" zIndex="1" style="font-size:12px;color:#333333;fill:#333333;" y="20"></text></g></svg></div></div>
            </div>
        </li>
    </ul>
    
</div>

		<div class="bh_4u_inner"><a href='healthbook.do'>건강수첩 입력하기</a>
        <!-- <div id="container_weight" style= "width: 600px;height: 300px;">
        </div> -->

</div>
</div>

	
	<!-- 기본정보 -->
    <div class="all">
${login.name } 님의 건강수첩입니다
    <c:forEach items="${hlist}" var="health">
	<c:if test="${login.seq eq health.seq}">
	 <table>
	        <tbody>
	        	<tr>
				<th scope="row"><label for="inp1">생년월일&nbsp;:</label></th>
				<td>
					<input type="text" name="birth" id="birth" size="8" value="${health.birth}" onkeydown="return numberOnly2(event);">
				</td>
			</tr>
	        
			<tr>
				<th scope="row"><label for="inp2">출생시&nbsp; 신장&nbsp;:</label></th>
				<td>
					<input type="text" name="height" id="height" size="8" value="${health.height}" maxlength="4" onkeydown="return numberOnly2(event);">
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="inp3">출생시&nbsp; 체중&nbsp;:</label></th>
				<td>
					<input type="text" name="weight" id="weight" size="8" value="${health.weight}" onkeydown="return numberOnly2(event);"> kg
				</td>
			</tr>
			<tr>
				<th scope="row">혈  &nbsp;&nbsp;&nbsp;  액 &nbsp;&nbsp;   형 :</th>
					<td>
					<input type="radio" name="bloodtype" value="A"
					 ${health.bloodtype =='A' ?"checked='checked'":""} >A형 
					<input type="radio" name="bloodtype" value="B"
					 ${health.bloodtype =='B' ?"checked='checked'":""}>B형 
					<input type="radio" name="bloodtype" value="O"
					 ${health.bloodtype =='O' ?"checked='checked'":""}>O형
					<input type="radio" name="bloodtype" value="AB"
					 ${health.bloodtype =='AB' ?"checked='checked'":""}>AB형 
				</td>

			</tr>
			<tr>
				<th scope="row">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별 :</th>
				<td>
					<input type="radio" name="gender" value="m" 
					 ${health.gender =='m' ?"checked='checked'":""} >남자
					<input type="radio" name="gender" value="w"
					 ${health.gender =='w' ?"checked='checked'":""} >여자
				</td>
			</tr>
			
			<tr>
				<th scope="row"><label for="inp1">알러지&nbsp; 및 특이사항&nbsp;:</label></th>
						<td style="text-align: left">
						<textarea name='allergy' id='allergy' rows="5" cols="1">${health.allergy}
					</textarea>
				</td>
			</tr>
	
		</tbody>
	</table>
	</c:if>
	</c:forEach>
    
    
    </div>

 
    
    
    
    <!-- 걸음 그래프 -->
    <div><h3>걸음 그래프프프프프</h3>

    
    </div>
    
    
    <div><h3>44444비워져있음4444</h3></div>
   	
   	<!-- 예방접종 입력 -->
   	<div class="treat">	
   	<div class="bh_4u_sub_conts">
        <!-- 상단 탭 -->
        <div class="bh_4u_depth fix" style="height: 76px;">
            <h3 class="n_tit_h3_4">예방접종</h3>
            <ul class="bh_4u_depth_ul_n4 fix">
                <li class="bh_4u_ico_child" onclick="javascript: change_tab('Y')"><a href="javascript:"><strong>소아</strong></a></li>
                <li class="bh_4u_ico_adult" onclick="javascript: change_tab('N')"><a href="javascript:"><strong>성인</strong></a></li>
            </ul>     
        </div>
        <!-- /상단 탭 -->

<div class="bh_4u_treat" id="detail_view" name="detail_view">
<!-- 하단 리스트(보드) -->
<div class="bh_4u_treat_list">
    <div class="vaccinationWrap">
        <div class="categoryDiv">
            <div class="fix">
                <ul class="category1 fix">
                    <li><span class="itemBox bgOrange"></span> 필수</li>
                    <li><span class="itemBox bgGray"></span> 기타</li>
                </ul>

                <ul class="category2 fix">
                    <li><span class="itemBox bgGray"></span> 미시행</li>
                    <li><span class="itemBox bgBlue"></span> 원내</li>
                </ul>
            </div>

            <div class="noticeTxt">접종 이력을 클릭하시면 상세 정보를 보실 수 있습니다.</div>
            <div class="noticeTxt_m">좌/우로 화면 이동이 가능하며 접종 이력을 클릭하시면 상세 정보를 보실 수 있습니다.</div>
        </div>

        <div class="tableFixWrap">
        
        	<div class="tableFixCnt childFix">
                <div class="tableOver">
                    <div>
                        <table>
                            <caption>소아</caption>

                            <thead>
                                <tr>
                                    <th style="width: 176px;">대상감염병</th>
                                    <th>1차</th>
                                    <th>2차</th>
                                    <th>3차</th>
                                    <th>4차</th>
                                    <th>5차</th>
                                    <th>6차</th>
                                </tr>
                            </thead>

                            <tbody>
                                    <tr>
                                        <th style="width: 160px;">
                                                <div class="vac_row" style="height: 57px;">
                                                    <div class="vac_row_inner">
                                                        <span class="itemBox bgOrange">필수</span>
결핵(피내용)                                                    </div>
                                                </div>
                                        </th>

                                                    <td><div class="vac_none">1차<br>출생~1개월이내</div></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 160px;">
                                                <div class="vac_row" style="height: 57px;">
                                                    <div class="vac_row_inner">
                                                        <span class="itemBox bgOrange">필수</span>
B형간염                                                    </div>
                                                </div>
                                        </th>

                                                    <td><div class="vac_none">1차<br>출생~1개월이내</div></td>
                                                    <td><div class="vac_none">2차<br>1개월</div></td>
                                                    <td><div class="vac_none">3차<br>6개월</div></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 160px;">
                                                <div class="vac_row" style="height: 57px;">
                                                    <div class="vac_row_inner">
                                                        <span class="itemBox bgOrange">필수</span>
디프테리아                                                                    <br>
파상풍                                                                    <br>
백일해                                                    </div>
                                                </div>
                                        </th>

                                                    <td><div class="vac_none">1차<br>2개월</div></td>
                                                    <td><div class="vac_none">2차<br>4개월</div></td>
                                                    <td><div class="vac_none">3차<br>6개월</div></td>
                                                    <td><div class="vac_none">4차<br>15~18개월</div></td>
                                                    <td><div class="vac_none">5차<br>만4세~만6세</div></td>
                                                <td></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 160px;">
                                                <div class="vac_row" style="height: 57px;">
                                                    <div class="vac_row_inner">
                                                        <span class="itemBox bgOrange">필수</span>
폴리오                                                    </div>
                                                </div>
                                        </th>

                                                    <td><div class="vac_none">1차<br>2개월</div></td>
                                                    <td><div class="vac_none">2차<br>4개월</div></td>
                                                    <td><div class="vac_none">3차<br>6개월</div></td>
                                                    <td><div class="vac_none">4차<br>만4세~만6세</div></td>
                                                <td></td>
                                                <td></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 160px;">
                                                <div class="vac_row" style="height: 57px;">
                                                    <div class="vac_row_inner">
                                                        <span class="itemBox bgOrange">필수</span>
B형 헤모필루스                                                                    <br>
인플루엔자                                                                    <br>
뇌수막염                                                    </div>
                                                </div>
                                        </th>

                                                    <td><div class="vac_none">1차<br>2개월</div></td>
                                                    <td><div class="vac_none">2차<br>2개월</div></td>
                                                    <td><div class="vac_none">3차<br>2개월</div></td>
                                                    <td><div class="vac_none">4차<br>12개월</div></td>
                                                <td></td>
                                                <td></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 160px;">
                                                <div class="vac_row" style="height: 57px;">
                                                    <div class="vac_row_inner">
                                                        <span class="itemBox bgOrange">필수</span>
홍역                                                                    <br>
유행성이하선염                                                                    <br>
풍진                                                    </div>
                                                </div>
                                        </th>

                                                    <td><div class="vac_none">1차<br>12~15개월</div></td>
                                                    <td><div class="vac_none">2차<br>만4세~만6세</div></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 160px;">
                                                <div class="vac_row" style="height: 57px;">
                                                    <div class="vac_row_inner">
                                                        <span class="itemBox bgOrange">필수</span>
수두                                                    </div>
                                                </div>
                                        </th>

                                                    <td><div class="vac_none">1차<br>12~15개월</div></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 160px;">
                                                <div class="vac_row" style="height: 57px;">
                                                    <div class="vac_row_inner">
                                                        <span class="itemBox bgOrange">필수</span>
일본뇌염(사백신)                                                    </div>
                                                </div>
                                        </th>

                                                    <td><div class="vac_none">1차<br>12~24개월</div></td>
                                                    <td><div class="vac_none">2차<br>12~24개월</div></td>
                                                    <td><div class="vac_none">3차<br>36개월</div></td>
                                                    <td><div class="vac_none">4차<br>만6세</div></td>
                                                    <td><div class="vac_none">5차<br>만12세</div></td>
                                                <td></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 160px;">
                                                <div class="vac_row" style="height: 57px;">
                                                    <div class="vac_row_inner">
                                                        <span class="itemBox bgOrange">필수</span>
인플루엔자                                                    </div>
                                                </div>
                                        </th>

                                                <td><div class="vac_none vac_no_period">1차</div></td>
                                                <td><div class="vac_none vac_no_period">2차</div></td>
                                                <td><div class="vac_none vac_no_period">3차</div></td>
                                                <td><div class="vac_none vac_no_period">4차</div></td>
                                                <td><div class="vac_none vac_no_period">5차</div></td>
                                                <td><div class="vac_none vac_no_period">6차</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 160px;">
                                                <div class="vac_row" style="height: 57px;">
                                                    <div class="vac_row_inner">
                                                        <span class="itemBox bgOrange">필수</span>
장티푸스                                                    </div>
                                                </div>
                                        </th>

                                                    <td><div class="vac_none">1차<br>만6세~만12세</div></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 160px;">
                                                <div class="vac_row" style="height: 57px;">
                                                    <div class="vac_row_inner">
                                                        <span class="itemBox bgOrange">필수</span>
신증후군출혈열                                                    </div>
                                                </div>
                                        </th>

                                                    <td><div class="vac_none">1차<br>12개월~만12세</div></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 160px;">
                                                <div class="vac_row" style="height: 57px;">
                                                    <div class="vac_row_inner">
                                                        <span class="itemBox bgGray">기타</span>
결핵(경피용)                                                    </div>
                                                </div>
                                        </th>

                                                    <td><div class="vac_none">1차<br>출생~1개월이내</div></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 160px;">
                                                <div class="vac_row" style="height: 57px;">
                                                    <div class="vac_row_inner">
                                                        <span class="itemBox bgGray">기타</span>
일본뇌염(생백신)                                                    </div>
                                                </div>
                                        </th>

                                                    <td><div class="vac_none">1차<br>12~24개월</div></td>
                                                    <td><div class="vac_none">2차<br>36개월</div></td>
                                                    <td><div class="vac_none">3차<br>만6세</div></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 160px;">
                                                <div class="vac_row" style="height: 57px;">
                                                    <div class="vac_row_inner">
                                                        <span class="itemBox bgGray">기타</span>
A형간염                                                    </div>
                                                </div>
                                        </th>

                                                    <td><div class="vac_none">1차<br>12~36개월</div></td>
                                                    <td><div class="vac_none">2차<br>12~36개월</div></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 160px;">
                                                <div class="vac_row" style="height: 57px;">
                                                    <div class="vac_row_inner">
                                                        <span class="itemBox bgGray">기타</span>
폐렴구균                                                    </div>
                                                </div>
                                        </th>

                                                    <td><div class="vac_none">1차<br>2개월</div></td>
                                                    <td><div class="vac_none">2차<br>4개월</div></td>
                                                    <td><div class="vac_none">3차<br>6개월</div></td>
                                                    <td><div class="vac_none">4차<br>12~15개월</div></td>
                                                <td></td>
                                                <td></td>
                                    </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="tableFixCnt adultFix">
                <div class="tableOver">
                    <div>
                        <table>
                            <caption>성인</caption>

                            <thead>
                                <tr>
                                    <th style="width: 172px; top: 0px;">대상감염병</th>
                                    <th>1차</th>
                                    <th>2차</th>
                                    <th>3차</th>
                                    <th>4차</th>
                                    <th>5차</th>
                                    <th>6차</th>
                                </tr>
                            </thead>

                            <tbody>
                                    <tr>
                                        <th style="width: 156px; top: 38px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgGray">기타</span>폐렴구균</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 156px; top: 81px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgOrange">필수</span>인플루엔자</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 156px; top: 124px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgOrange">필수</span>DPT</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 156px; top: 167px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgGray">기타</span>A형간염</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 156px; top: 210px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgOrange">필수</span>B형간염</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 156px; top: 253px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgGray">기타</span>HPV</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 156px; top: 296px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgGray">기타</span>대상포진</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 156px; top: 339px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgOrange">필수</span>MMR</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 156px; top: 382px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgOrange">필수</span>수두</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 156px; top: 425px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgGray">기타</span>뇌수막염</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 156px; top: 468px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgGray">기타</span>장티푸스</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 156px; top: 511px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgGray">기타</span>수막구균</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 156px; top: 554px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgGray">기타</span>황열</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 156px; top: 597px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgOrange">필수</span>폴리오</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 156px; top: 640px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgOrange">필수</span>결핵</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 156px; top: 683px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgOrange">필수</span>일본뇌염</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 156px; top: 726px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgGray">기타</span>로타</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 156px; top: 769px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgGray">기타</span>RSV수동면역</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 156px; top: 812px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgGray">기타</span>광견병</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 156px; top: 855px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgGray">기타</span>콜레라</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                                    <tr>
                                        <th style="width: 156px; top: 898px;">
                                                <div class="vac_row" style="height: 42px;"><div class="vac_row_inner"><span class="itemBox bgGray">기타</span>풍진</div></div>
                                        </th>

                                                <td><div class="vac_none">1회</div></td>
                                                <td><div class="vac_none">2회</div></td>
                                                <td><div class="vac_none">3회</div></td>
                                                <td><div class="vac_none">4회</div></td>
                                                <td><div class="vac_none">5회</div></td>
                                                <td><div class="vac_none">6회</div></td>
                                    </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <!-- /하단 리스트(보드) -->
</div>
</div>
</div>
</c:if>
</c:forEach>

</div>		
  
  </div>

  
  
<!--     // 버튼으로 슬라이드
<div class="action">
    <a href="#" data-slide="3"></a>
    <a href="#" data-slide="4"></a>
    <a href="#" data-slide="5"></a>
  </div>	 -->	
  
  
<%-- <c:forEach items="${hlist}" var="health">
<c:if test="${login.seq eq health.seq}">
 
	 <table>
	        <tbody>
	        	<tr>
				<th scope="row"><label for="inp1">생년월일&nbsp;:</label></th>
				<td>
					<input type="text" name="birth" id="birth" size="8" value="${health.birth}" onkeydown="return numberOnly2(event);">
				</td>
			</tr>
	        
			<tr>
				<th scope="row"><label for="inp2">출생시&nbsp; 신장&nbsp;:</label></th>
				<td>
					<input type="text" name="height" id="height" size="8" value="${health.height}" maxlength="4" onkeydown="return numberOnly2(event);">
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="inp3">출생시&nbsp; 체중&nbsp;:</label></th>
				<td>
					<input type="text" name="weight" id="weight" size="8" value="${health.weight}" onkeydown="return numberOnly2(event);"> kg
				</td>
			</tr>
			<tr>
				<th scope="row">혈  &nbsp;&nbsp;&nbsp;  액 &nbsp;&nbsp;   형 :</th>
					<td>
					<input type="radio" name="bloodtype" value="A"
					 ${health.bloodtype =='A' ?"checked='checked'":""} >A형 
					<input type="radio" name="bloodtype" value="B"
					 ${health.bloodtype =='B' ?"checked='checked'":""}>B형 
					<input type="radio" name="bloodtype" value="O"
					 ${health.bloodtype =='O' ?"checked='checked'":""}>O형
					<input type="radio" name="bloodtype" value="AB"
					 ${health.bloodtype =='AB' ?"checked='checked'":""}>AB형 
				</td>

			</tr>
			<tr>
				<th scope="row">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별 :</th>
				<td>
					<input type="radio" name="gender" value="m" 
					 ${health.gender =='m' ?"checked='checked'":""} >남자
					<input type="radio" name="gender" value="w"
					 ${health.gender =='w' ?"checked='checked'":""} >여자
				</td>
			</tr>
			
			<tr>
				<th scope="row"><label for="inp1">알러지&nbsp; 및 특이사항&nbsp;:</label></th>
						<td style="text-align: left">
						<textarea  name='allergy' id='allergy' rows="5" cols="1">${health.allergy}
					</textarea>
				</td>
			</tr>
	
		</tbody>
	</table>
	</c:if> 
	<table>
	<tr><td>이름</td><td>직원번호</td><td>직책</td><td>연봉</td><td>입사일</td></tr>
	<tr>
	<td width="170px">제 이름은 ${login.name} 입니다.</td>
	<td><a onclick="chart('${login.name}','${health.weight}')">${health.seq}</a></td>
	<td>${health.allergy }</td>
	<td>${health.weight }</td>
	<td>${health.birth }</td>
	</tr>
	</table>
	
		<div id="layer_popup" class="button_style">
		<span class="layer_close"><span>X</span></span>
			<div class="content">
				 <div id="chart_div"></div> 
			</div>
	</div>
	</c:if>
</c:forEach>

	 --%>
	 
	 
<c:if test="${login.seq ne health.seq}">
	<a href='healthbook.do'>건강수첩 입력하기</a>
 	<!-- <script type="text/javascript">
	alert("기본 정보를 입력해주세요");
	location.href='healthbook.do';
	</script> --> 
</c:if>

 
</div>
</section>
</div>
</div>


 
<!-- slick js -->
<!-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<!-- <script src='https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.js'></script> -->
<script src="./ui_common/js/slick.min.js"></script>



  <script type="text/javascript">
  $(document).ready(function(){
	  $('.slider-for').slick({
		   slidesToShow: 1,
		   slidesToScroll: 1,
		   arrows: false,
		   fade: true,
		   asNavFor: '.slider-nav'
		 });
		 $('.slider-nav').slick({
		   slidesToShow: 3,
		   slidesToScroll: 1,
		   asNavFor: '.slider-for',
		   dots: false,
		   centerMode: true,
		   focusOnSelect: true
		 });

		 $('a[data-slide]').click(function(e) {
		   e.preventDefault();
		   var slideno = $(this).data('slide');
		   $('.slider-nav').slick('slickGoTo', slideno - 1);
		 });
  });
  
  
/*  
  	$(function () {
	    var chart = new Highcharts.Chart({
	        chart: {
	            renderTo: 'container_weight'
	        },
	        
	        series: [{
	            data: [66,72]
	        }]
	    });
	});
*/	


  	
/*   	Morris.Bar({
  	  element: 'bar-example',
  	  data: [
  	    { y: '2006', a: 100, b: 90 },
  	    { y: '2007', a: 75,  b: 65 },
  	    { y: '2008', a: 50,  b: 40 },
  	    { y: '2009', a: 75,  b: 65 },
  	    { y: '2010', a: 50,  b: 40 },
  	    { y: '2011', a: 75,  b: 65 },
  	    { y: '2012', a: 100, b: 90 }
  	  ],
  	  xkey: 'y',
  	  ykeys: ['a', 'b'],
  	  labels: ['Series A', 'Series B']
  	}); */

/*   	var day_data = [
  	  {period:${health.birth}, licensed:${health.height}, sorned: 43},
  	  {period: '2012-09-30', licensed: 3351, sorned: 629}
  	];


  	Morris.Line({
  	  element: 'morrisChart',
  	  data: day_data,
  	  xkey: 'period',
  	  ykeys: ['licensed', 'sorned'],
  	  labels: ['Licensed', 'SORN']
  	}); */

/*   	Morris.Area({
  	  element: 'area-example',
  	  data: [
  	    { y: '2006', a: 100, b: 90 },
  	    { y: '2007', a: 75,  b: 65 },
  	    { y: '2008', a: 50,  b: 40 },
  	    { y: '2009', a: 75,  b: 65 },
  	    { y: '2010', a: 50,  b: 40 },
  	    { y: '2011', a: 75,  b: 65 },
  	    { y: '2012', a: 100, b: 90 }
  	  ],
  	  xkey: 'y',
  	  ykeys: ['a', 'b'],
  	  labels: ['Series A', 'Series B']
  	}); */
  	
/* 하이차트 */
 	function weightChart(chartData) {
         var chart = null;
         var chartOpt = {
             chart: { renderTo: 'weight_container', type: 'line' },
             title: { text: '' },
             credits: { enabled: false },
             navigation: { buttonOptions: { enabled: false } },
             plotOptions: { series: { connectNulls: true } },
             tooltip: { shared: true,
                 formatter: function() {
                     var tooltip_str = '';
                     var date_format = '';
                     date_format = new Date(this.x).formatUTC("MM월dd일");

                     tooltip_str = '<span style="font-size: 11px">' + date_format + '</span><br/>';
                     tooltip_str += '<span style="color:' + this.points[0].color + '">●</span> ' 
                     	+ this.points[0].series.name + ': <b>' + this.points[0].y + '</b>kg<br/>';
                     tooltip_str += '<span style="color:' + this.points[1].color + '">●</span> ' 
                     	+ this.points[1].series.name + ': <b>' + this.points[1].y + '</b>kg/㎡';

                     return tooltip_str;
                 }
             },
             xAxis: [{ type: 'datetime', crosshair: { color: '#12bc8a', width: 1 }, 
            	 	dateTimeLabelFormats: { day: '%m/%d', week: '%m/%d', month: '%y년%m월', year: '%Y년' } }],
             yAxis: [{ title: { text: '지수', enabled: false }, labels: { format: "{value} kg"}}],
             legend: { align: 'right', margin: 0, verticalAlign: 'bottom', enabled: true, symbolHeight: 8, 
            	 	symbolWidth: 8, symbolRadius: 4, itemDistance: 5 },
             series: [{ name: '체중', data: [], marker: { enabled: true }, color: '#12bc8a', width: 2, yAxis: 0 },
                      { name: '체질량', data: [], marker: { enabled: true }, color: '#96ca2f', width: 2, yAxis: 0 }],
             lang: { noData: "" }
         };
         
         chart = new Highcharts.Chart(chartOpt);

         var y1Data = [];
         var y2Data = [];
         var weiObj = new Object();
         var bmiObj = new Object();

         if(chartData != null && chartData.length > 0){
             for (var i = 0; i < chartData.length; i++) {
                 weiObj = new Object();
                 bmiObj = new Object();

                 //var year = new Date(chartData[i].Reg_dt).format("yyyy");
                 //var month = new Date(chartData[i].Reg_dt).format("MM");
                 //var date = new Date(chartData[i].Reg_dt).format("dd");

                 var year = dateParse(chartData[i].Reg_dt).format("yyyy");
                 var month = dateParse(chartData[i].Reg_dt).format("MM");
                 var date = dateParse(chartData[i].Reg_dt).format("dd");

                 weiObj.x = Date.UTC(year, month, date); 
                 weiObj.y = chartData[i].Weight;

                 bmiObj.x = Date.UTC(year, month, date);
                 bmiObj.y = chartData[i].Bmi;

                 y1Data[i] = weiObj;
                 y2Data[i] = bmiObj;
             }
         }
         chart.series[0].setData(y1Data);
         chart.series[1].setData(y2Data);

         resizeNodataChart("weight_container", "기간 내 체중", 0, 0);
     } 
  	
  	function change_tab(childYN) {
        if (childYN == "N") {
            $(".bh_4u_depth_ul_n4 li:eq(1)").addClass("on");
        }
        else if (childYN == "Y") {
            $(".bh_4u_depth_ul_n4 li:eq(0)").addClass("on");
        }
        loadVaccinationView(childYN);
    }

  	
</script>

 </body>
</html>