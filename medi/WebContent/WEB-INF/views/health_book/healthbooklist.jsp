 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" type="text/css" href="./css/slick-theme.css">
<link rel='stylesheet prefetch' href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css">
<link href="./css/healthbook.css" type="text/css" rel="stylesheet">

<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>

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

.food_slider{
background:url(./images/healthbook/ico_treat_food_off.png) center center no-repeat;	
}
.slick-current.food_slider{
 background:url(./images/healthbook/ico_treat_food_on.png) center center no-repeat;
}
.slick-current.food_slider li {
    color: #12bc8a;
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


.fooddiv{
display: inline-block; margin: 15px;
}
.fooddiv2{
display: inline-block; vertical-align: middle;
}
#standard{
width: 75%;
margin: 0 auto;
}
#standard th{
height: 60px;
text-align: left;
border-bottom: dashed 1px #ccc;
}
#standard td{
height: 50px;
border-bottom: dashed 1px #ccc;
text-align: left;
}
</style>

<c:if test="${empty login }">
	<script type="text/javascript">
	alert("로그인후이용가능합니다");
	location.href='main.do';
	</script>
</c:if>

<%--  
 <c:if test="${empty hlist}">
	<a href='healthbook.do'>건강수첩 입력하기</a> -->
<!--  	<script type="text/javascript">
	alert("기본 정보를 입력해주세요");
	location.href='healthbook.do';
	</script> -->
</c:if>

 --%>

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
 	
    <div class="food_slider" style= "width: 120px; height: 134px;">
   	 <li class="food_slider_on" style="text-align: center; 
   	 padding-top: 100px; border-left-width: 20px; font-weight: bold;">
    	칼로리계산</li>
 	</div>
 	

 	<div class="check_slider" style= "width: 120px; height: 134px;">
   	 <li class="check_slider_on" style="text-align: center; 
   	 padding-top: 100px; border-left-width: 20px; font-weight: bold;">
    	자가진단</li>
 	</div>
    
     <div class="care_slider" style= "width: 120px; height: 134px;">
   	 <li class="care_slider_on" style="text-align: center; 
   	 padding-top: 100px; border-left-width: 20px; font-weight: bold;">
    	예방접종</li>
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
                        <span><c:set var="TextValue" value="${login.regdate}"/> 
                      			${fn:substring(TextValue,0,10)}<br>
                       </span>
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
                        <span><c:set var="TextValue" value="${login.regdate}"/> 
                      			${fn:substring(TextValue,0,10)}<br> 
								
                       </span>
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

        
</div>

	
	<!-- 기본정보 페이지 -->
    <div class="all">
	${login.name } 님의 건강수첩입니다
    <c:forEach items="${hlist}" var="health">
    
	<c:if test="${login.seq eq health.mem_seq}">
	<div style="margin-top: 40px;">
	 <table id="standard">
	        <tbody>
	        	<tr>
				<th scope="row"><label for="inp1">생년월일&nbsp;:</label></th>
				<td>
					<input type="text" name="birth" id="birth" size="28" value="${health.birth}" onkeydown="return numberOnly2(event);">
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
	</div>
	</c:if>
	</c:forEach>
	
	
	</div>

 
    
    
    
    <!-- 칼로리 -->
	<div>	
	<table align="center" cellpadding="0" cellspacing="0" width="94%">
    <tr>
    <td style=padding-bottom:20px;>ㆍ
    <font color="#006633">음식명을 선택</font>하고 
    <font color="#0066CC">분량을 선택</font>한 후 
    <font color="#339999">확인을 클릭</font>합니다.</td>
    </tr>
    
    <tr>
      <td>
		<table bgcolor="#C9C9C9" border=0 cellpadding=3 cellspacing=1 width="100%" >
			<form name="food">
				<tr align='center' bgcolor='ececec'>
					<td align=center width="1156" height="2" colspan="4" bgcolor="#6666CC">
					</td>
				</tr>
			<form name="food">
			<tr align='center' bgcolor='ececec'>
			<td align=center width="15%" height="32"><b>종류</b></td>
			<td width="35%" height="32"><b>음식명</b></td>
			<td width="25%" height="32"><b>분량(1인분)</b></td>
			<td width="25%" height="32"><b>결과(kcal)</b></td>
			</tr>

	<tr align='center' bgcolor='FFFFFF'>
		<td align=center ><font color="#333333">밥</font></td>
		<td >
			<select name='food1'>
			<option>-----선택하세요-----<option value="306.6">흰밥 <option value="294">보리밥 <option value="588.9">콩밥 <option value="598.6">오곡밥 <option value="641.8">팥밥 <option value="321.3">현미밥 <option value="578">잡곡밥 <option value="675">비빔밥
			</select>
		</td>
		<td>
			<select name="amount1" size="1" >
			<option value=0 selected>0 <option value=0.5>0.5 <option value=1>1 
			<option value=1.5>1.5 <option value=2>2 <option value=2.5>2.5 <option value=3>3 
			<option value=3.5>3.5 <option value=4>4 <option value=4.5>4.5 <option value=5>5 
			<option value=6>6 <option value=7>7 <option value=8>8 <option value=9>9 <option value=10>10
			</select>
		<div class="fooddiv">인분</div> 
		<div class="fooddiv2">
		<img src="./images/healthbook/program_submit.gif" align="absmiddle" 
		onClick="set_value(document.food.food1,document.food.amount1,document.food.cal1)" 
		style="CURSOR:HAND">
		</div></td>
		<td>
		<input name="cal1" size=7 align="right" value=0 style='color:black'>kcal
		</td>
	</tr>
	
<tr align='center' bgcolor='FFFFFF'>
<td align=center bgcolor="whitesmoke" ><font color="#333333">일품요리</font></td>
<td bgcolor="whitesmoke" >
<select name="food2" size="1" >
<option>-----선택하세요-----<option value="514.83">국수장국 <option value="569.22">떡국 <option value="687.4">비빔국수 <option value="1097.32">삼계탕 <option value="645.72">오무라이스 <option value="653.05">짜장밥 <option value="721.7">카레라이스 <option value="560.13">콩국수 <option value="605.63">콩나물밥 <option value="650.25">짜장면 <option value="452.55">떡볶이 <option value="720.21">아구찜 <option value="470.21">짜장면 <option value="404.01">짬뽕 <option value="617.10">볶음밥 <option value="616.33">탕수육
</select>
</td>
<td bgcolor="whitesmoke">
<select name="amount2" size="1" >
<option value=0 selected>0 <option value=0.5>0.5 <option value=1>1 <option value=1.5>1.5 <option value=2>2 <option value=2.5>2.5 <option value=3>3 <option value=3.5>3.5 <option value=4>4 <option value=4.5>4.5 <option value=5>5 <option value=6>6 <option value=7>7 <option value=8>8 <option value=9>9 <option value=10>10
</select>
<div class="fooddiv">인분</div> <div class="fooddiv2"> <img src="./images/healthbook/program_submit.gif" align="absmiddle" width="40" height="21" onClick="set_value(document.food.food2,document.food.amount2,document.food.cal2)" style="CURSOR:HAND"></div></td>
<td bgcolor="whitesmoke">
<input name="cal2" size=7 align="right" value=0 style='color:black'>
kcal</td>
</tr>
<tr align='center' bgcolor='FFFFFF'>
<td align=center ><font color="#333333">국</font></td>
<td >
<select name="food3" size="1" >
<option>-----선택하세요-----<option value="94.31">무우국 <option value="87.62">미역국 <option value="20.91">콩나물국 <option value="78.17">근대된장국 <option value="96.42">다시마무국 <option value="179.57">달래된장국 <option value="120.44">두부된장국 <option value="112.04">당면국 <option value="57">맑은조개국 <option value="62.92">미역냉국 <option value="89.2">솎음배추조개국 <option value="76.71">쇠고기무국 <option value="25.72">콩나물김치국 <option value="121.31">토란국 <option value="85.74">호박잎장국
</select>
</td>
<td>
<select name="amount3" size="1" >
<option value=0 selected>0 <option value=0.5>0.5 <option value=1>1 <option value=1.5>1.5 <option value=2>2 <option value=2.5>2.5 <option value=3>3 <option value=3.5>3.5 <option value=4>4 <option value=4.5>4.5 <option value=5>5 <option value=6>6 <option value=7>7 <option value=8>8 <option value=9>9 <option value=10>10
</select>
<div class="fooddiv">인분</div> <div class="fooddiv2"> <img src="./images/healthbook/program_submit.gif" align="absmiddle" width="40" height="21" onClick="set_value(document.food.food3,document.food.amount3,document.food.cal3)" style="CURSOR:HAND"></div></td>
<td>
<input name="cal3" size=7 align="right" value=0 style='color:black'>
kcal
</td>
</tr>
<tr align='center' bgcolor='FFFFFF'>
<td align=center bgcolor="whitesmoke" ><font color="#333333">탕</font></td>
<td bgcolor="whitesmoke" >
<select name="food4" size="1" >
<option>-----선택하세요-----<option value="500.65">갈비탕 <option value="207.89">내장탕 <option value="257.77">닭곰탕 <option value="161.05">우럭매운탕 <option value="152.2">조기탕 <option value="300.8">아구탕
</select>
</td>
<td bgcolor="whitesmoke">
<select name="amount4" size="1" >
<option value=0 selected>0 <option value=0.5>0.5 <option value=1>1 <option value=1.5>1.5 <option value=2>2 <option value=2.5>2.5 <option value=3>3 <option value=3.5>3.5 <option value=4>4 <option value=4.5>4.5 <option value=5>5 <option value=6>6 <option value=7>7 <option value=8>8 <option value=9>9 <option value=10>10
</select>
<div class="fooddiv">인분</div> <div class="fooddiv2"> <img src="./images/healthbook/program_submit.gif" align="absmiddle" width="40" height="21" onClick="set_value(document.food.food4,document.food.amount4,document.food.cal4)" style="CURSOR:HAND"></td>
<td bgcolor="whitesmoke">
<input name="cal4" size=7 align="right" value=0 style='color:black'>
kcal</td>
</tr>
<tr align='center' bgcolor='FFFFFF'>
<td align=center ><font color="#333333">찌게</font></td>
<td >
<select name="food5" size="1" >
<option>-----선택하세요-----<option value="204.38">김치찌개 <option value="186.14">동태찌개 <option value="241.08">콩비지찌개 <option value="82.88">냉이된장찌개 <option value="110.05">순두부찌개 <option value="79.28">양송이버섯찌개 <option value="205.74">청국장찌개 <option value="99.98">표고버섯찌개 <option value="125.89">호박두부된장찌개 <option value="118.61">어묵김치찌개 <option value="115.21">순두부찌개
</select>
</td>
<td>
<select name="amount5" size="1" >
<option value=0 selected>0 <option value=0.5>0.5 <option value=1>1 <option value=1.5>1.5 <option value=2>2 <option value=2.5>2.5 <option value=3>3 <option value=3.5>3.5 <option value=4>4 <option value=4.5>4.5 <option value=5>5 <option value=6>6 <option value=7>7 <option value=8>8 <option value=9>9 <option value=10>10
</select>
<div class="fooddiv">인분</div> <div class="fooddiv2"> <img src="./images/healthbook/program_submit.gif" align="absmiddle" width="40" height="21" onClick="set_value(document.food.food5,document.food.amount5,document.food.cal5)" style="CURSOR:HAND"></div></td>
<td>
<input name="cal5" size=7 align="right" value=0 style='color:black'>
kcal</td>
</tr>
<tr align='center' bgcolor='FFFFFF'>
<td align=center bgcolor="whitesmoke" ><font color="#333333"><font face="돋움">구이</font></font></td>
<td bgcolor="whitesmoke" >
<select name="food6" size="1" >
<option>-----선택하세요-----<option value="232.73">가자미구이 <option value="14.19">김구이 <option value="81.78">더덕구이 <option value="138">삼치구이 <option value="276.99">우엉구이 <option value="341.58">이면수구이 <option value="486.78">청어구이 <option value="180.6">뱅어포구이
</select>
</td>
<td bgcolor="whitesmoke">
<select name="amount6" size="1" >
<option value=0 selected>0 <option value=0.5>0.5 <option value=1>1 <option value=1.5>1.5 <option value=2>2 <option value=2.5>2.5 <option value=3>3 <option value=3.5>3.5 <option value=4>4 <option value=4.5>4.5 <option value=5>5 <option value=6>6 <option value=7>7 <option value=8>8 <option value=9>9 <option value=10>10
</select>
<div class="fooddiv">인분</div> <div class="fooddiv2"> <img src="./images/healthbook/program_submit.gif" align="absmiddle" width="40" height="21" onClick="set_value(document.food.food6,document.food.amount6,document.food.cal6)" style="CURSOR:HAND"></td>
<td bgcolor="whitesmoke">
<input name="cal6" size=7 align="right" value=0 style='color:black'>
kcal</td>
</tr>
<tr align='center' bgcolor='FFFFFF'>
<td align=center ><font color="#333333"><font face="돋움">전</font></font></td>
<td >
<select name="food7" size="1" >
<option>-----선택하세요-----<option value="163.8">굴전 <option value="382.81">녹두빈대떡 <option value="204.92">달걀말이 <option value="250.91">동태전 <option value="200.1">부추파전 <option value="315.41">쇠간채소전 <option value="157.96">애호박부침 <option value="200.99">완자전 <option value="310.39">풋고추표고전
</select>
</td>
<td>
<select name="amount7" size="1" >
<option value=0 selected>0 <option value=0.5>0.5 <option value=1>1 <option value=1.5>1.5 <option value=2>2 <option value=2.5>2.5 <option value=3>3 <option value=3.5>3.5 <option value=4>4 <option value=4.5>4.5 <option value=5>5 <option value=6>6 <option value=7>7 <option value=8>8 <option value=9>9 <option value=10>10
</select>
<div class="fooddiv">인분</div> <div class="fooddiv2"> <img src="./images/healthbook/program_submit.gif" align="absmiddle" width="40" height="21" onClick="set_value(document.food.food7,document.food.amount7,document.food.cal7)" style="CURSOR:HAND"></div></td>
<td>
<input name="cal7" size=7 align="right" value=0 style='color:black'>
kcal</td>
</tr>
<tr align='center' bgcolor='FFFFFF'>
<td align=center bgcolor="whitesmoke" ><font color="#333333"><font face="돋움">조림</font></font></td>
<td bgcolor="whitesmoke" >
<select name="food8" size="1" >
<option>-----선택하세요-----<option value="255.54">가자미조림 <option value="145.85">감자조림 <option value="141.82">꽈리고추오징어조림 <option value="91.6">달걀장조림 <option value="562.67">돼지고기메추리알조림 <option value="229.16">두부조림 <option value="200.49">병어조림 <option value="146.19">북어조림 <option value="154.1">삼치조림 <option value="166.21">생선묵조림 <option value="66.63">연근조림 <option value="137.77">우엉조림 <option value="333.67">청어조림 <option value="99.1">콩조림 <option value="85.3">토란조림
</select>
</td>
<td bgcolor="whitesmoke">
<select name="amount8" size="1" >
<option value=0 selected>0 <option value=0.5>0.5 <option value=1>1 <option value=1.5>1.5 <option value=2>2 <option value=2.5>2.5 <option value=3>3 <option value=3.5>3.5 <option value=4>4 <option value=4.5>4.5 <option value=5>5 <option value=6>6 <option value=7>7 <option value=8>8 <option value=9>9 <option value=10>10
</select>
<div class="fooddiv">인분</div> <div class="fooddiv2"> <img src="./images/healthbook/program_submit.gif" align="absmiddle" width="40" height="21" onClick="set_value(document.food.food8,document.food.amount8,document.food.cal8)" style="CURSOR:HAND"></div></td>
<td bgcolor="whitesmoke">
<input name="cal8" size=7 align="right" value=0 style='color:black'>
kcal</td>
</tr>
<tr align='center' bgcolor='FFFFFF'>
<td align=center ><font color="#333333"><font face="돋움">튀김</font></font></td>
<td >
<select name="food9" size="1" >
<option>-----선택하세요-----<option value="750.78">가자미튀김 <option value="1257.98">고구마튀김 <option value="1039.17">닭튀김 <option value="1350.44">채소튀김 <option value="950.52">오징어튀김
</select>
</td>
<td>
<select name="amount9" size="1" >
<option value=0 selected>0 <option value=0.5>0.5 <option value=1>1 <option value=1.5>1.5 <option value=2>2 <option value=2.5>2.5 <option value=3>3 <option value=3.5>3.5 <option value=4>4 <option value=4.5>4.5 <option value=5>5 <option value=6>6 <option value=7>7 <option value=8>8 <option value=9>9 <option value=10>10
</select>
<div class="fooddiv">인분</div> <div class="fooddiv2"> <img src="./images/healthbook/program_submit.gif" align="absmiddle" width="40" height="21" onClick="set_value(document.food.food9,document.food.amount9,document.food.cal9)" style="CURSOR:HAND"></div></td>
<td>
<input name="cal9" size=7 align="right" value=0 style='color:black'>
kcal</td>
</tr>
<tr align='center' bgcolor='FFFFFF'>
<td align=center bgcolor="whitesmoke" ><font color="#333333"><font face="돋움">볶음</font></font></td>
<td bgcolor="whitesmoke" >
<select name="food10" size="1" >
<option>-----선택하세요-----<option value="134.23">가지볶음 <option value="107.82">감자풋고추볶음 <option value="99.02">고구마순볶음 <option value="134.23">깻잎볶음 <option value="133.94">꽈리고추볶음 <option value="174.48">낙지볶음 <option value="479.54">닭볶음 <option value="604.02">닭불고기 <option value="295.4">돼지고기볶음 <option value="268.13">돼지불고기 <option value="84.06">마늘쫑볶음 <option value="83.18">미역줄기볶음 <option value="280.08">버섯잡채 <option value="512.68">불고기 <option value="111.28">양송이버섯 <option value="202.45">오징어볶음 <option value="184.43">잡채 <option value="145.49">취나물볶음 <option value="167.3">햄채소볶음
</select>
</td>
<td bgcolor="whitesmoke">
<select name="amount10" size="1" >
<option value=0 selected>0 <option value=0.5>0.5 <option value=1>1 <option value=1.5>1.5 <option value=2>2 <option value=2.5>2.5 <option value=3>3 <option value=3.5>3.5 <option value=4>4 <option value=4.5>4.5 <option value=5>5 <option value=6>6 <option value=7>7 <option value=8>8 <option value=9>9 <option value=10>10
</select>
<div class="fooddiv">인분</div> <div class="fooddiv2"> <img src="./images/healthbook/program_submit.gif" align="absmiddle" width="40" height="21" onClick="set_value(document.food.food10,document.food.amount10,document.food.cal10)" style="CURSOR:HAND"></div></td>
<td bgcolor="whitesmoke">
<input name="cal10" size=7 align="right" value=0 style='color:black'>
kcal</td>
</tr>
<tr align='center' bgcolor='FFFFFF'>
<td align=center ><font color="#333333"><font face="돋움">찜</font></font></td>
<td >
<select name="food11" size="1" >
<option>-----선택하세요-----<option value="144.72">꼬막찜 <option value="340.97">돼지갈비찜 <option value="165.35">바지락찜 <option value="800.25">갈비찜 <option value="620.00">아구찜
</select>
</td>
<td>
<select name="amount11" size="1" >
<option value=0 selected>0 <option value=0.5>0.5 <option value=1>1 <option value=1.5>1.5 <option value=2>2 <option value=2.5>2.5 <option value=3>3 <option value=3.5>3.5 <option value=4>4 <option value=4.5>4.5 <option value=5>5 <option value=6>6 <option value=7>7 <option value=8>8 <option value=9>9 <option value=10>10
</select>
<div class="fooddiv">인분</div> <div class="fooddiv2"> <img src="./images/healthbook/program_submit.gif" align="absmiddle" width="40" height="21" onClick="set_value(document.food.food11,document.food.amount11,document.food.cal11)" style="CURSOR:HAND"></div></td>
<td>
<input name="cal11" size=7 align="right" value=0 style='color:black'>
kcal</td>
</tr>
<tr align='center' bgcolor='FFFFFF'>
<td align=center bgcolor="whitesmoke" ><font color="#333333"><font face="돋움">나물</font></font></td>
<td bgcolor="whitesmoke" >
<select name="food12" size="1" >
<option>-----선택하세요-----<option value="138.86">도라지나물 <option value="43.63">시금치나물 <option value="55.34">가지나물 <option value="91.1">고추잎나물 <option value="43.83">근대나물 <option value="76.33">무나물 <option value="29.89">미나리나물 <option value="45.72">솎음배추나물 <option value="27.11">숙주나물 <option value="49.95">콩나물무침
</select>
</td>
<td bgcolor="whitesmoke">
<select name="amount12" size="1" >
<option value=0 selected>0 <option value=0.5>0.5 <option value=1>1 <option value=1.5>1.5 <option value=2>2 <option value=2.5>2.5 <option value=3>3 <option value=3.5>3.5 <option value=4>4 <option value=4.5>4.5 <option value=5>5 <option value=6>6 <option value=7>7 <option value=8>8 <option value=9>9 <option value=10>10
</select>
<div class="fooddiv">인분</div> <div class="fooddiv2">
<img src="./images/healthbook/program_submit.gif" align="absmiddle" width="40" height="21" onClick="set_value(document.food.food12,document.food.amount12,document.food.cal12)" style="CURSOR:HAND"></div></td>
<td bgcolor="whitesmoke">
<input name="cal12" size=7 align="right" value=0 style='color:black'>
kcal</td>
</tr>
<tr align='center' bgcolor='FFFFFF'>
<td align=center ><font color="#333333"><font face="돋움">무침</font></font></td>
<td >
<select name="food13" size="1" >
<option>-----선택하세요-----<option value="88.75">도라지생채 <option value="74.89">도토리무침 <option value="127.09">두부냉채 <option value="59.44">무생채 <option value="37.09">미역오징어초무침 <option value="47.31">부추무침 <option value="43.36">상추무침 <option value="37.91">오이생채 <option value="39.23">오이지무침 <option value="150.75">청포묵김무침 <option value="78.93">콩나물겨자채 <option value="49.08">해파리냉채
</select>
</td>
<td>
<select name="amount13" size="1" >
<option value=0 selected>0 <option value=0.5>0.5 <option value=1>1 <option value=1.5>1.5 <option value=2>2 <option value=2.5>2.5 <option value=3>3 <option value=3.5>3.5 <option value=4>4 <option value=4.5>4.5 <option value=5>5 <option value=6>6 <option value=7>7 <option value=8>8 <option value=9>9 <option value=10>10
</select>
<div class="fooddiv">인분</div> <div class="fooddiv2"> 
<img src="./images/healthbook/program_submit.gif" align="absmiddle" width="40" height="21" onClick="set_value(document.food.food13,document.food.amount13,document.food.cal13)" style="CURSOR:HAND"></div></td>
<td>
<input name="cal13" size=7 align="right" value=0 style='color:black'>
kcal</td>
</tr>
<tr align='center' bgcolor='FFFFFF'>
<td align=center bgcolor="whitesmoke" ><font color="#333333"><font face="돋움">김치</font></font></td>
<td bgcolor="whitesmoke" >
<select name="food14" size="1" >
<option>-----선택하세요-----<option value="69.65">깍두기 <option value="28.69">나박김치 <option value="89.77">배추김치 <option value="63.31">부추김치 <option value="64.79">솎음배추겉절이 <option value="41.59">양배추김치 <option value="52.8">열무김치 <option value="52.05">오이소박이김치 <option value="81.88">총각김치
</select>
</td>
<td bgcolor="whitesmoke">
<select name="amount14" size="1" >
<option value=0 selected>0 <option value=0.5>0.5 <option value=1>1 <option value=1.5>1.5 <option value=2>2 <option value=2.5>2.5 <option value=3>3 <option value=3.5>3.5 <option value=4>4 <option value=4.5>4.5 <option value=5>5 <option value=6>6 <option value=7>7 <option value=8>8 <option value=9>9 <option value=10>10
</select>
<div class="fooddiv">인분</div> <div class="fooddiv2"> <img src="./images/healthbook/program_submit.gif" align="absmiddle" width="40" height="21" onClick="set_value(document.food.food14,document.food.amount14,document.food.cal14)" style="CURSOR:HAND"></div></td>
<td bgcolor="whitesmoke">
<input name="cal14" size=7 align="right" value=0 style='color:black'>
kcal</td>
</tr>
<tr align='center' bgcolor='FFFFFF'>
<td align=center ><font color="#333333"><font face="돋움">과일류</font></font></td>
<td >
<select name="food15" size="1" >
<option>-----선택하세요-----<option value="28">토마토 <option value="27">딸기 <option value="19">수박 <option value="49">사과 <option value="82">바나나 <option value="78">귤 <option value="39">복숭아 <option value="58">감 <option value="60">포도
</select>
</td>
<td>
<select name="amount15" size="1" >
<option value=0 selected>0 <option value=0.5>50 <option value=1>100 <option value=1.5>150 <option value=2>200 <option value=2.5>250 <option value=3>300 <option value=3.5>350 <option value=4>400 <option value=4.5>450 <option value=5>500
</select>
<div class="fooddiv">g</div>&nbsp;&nbsp;&nbsp;&nbsp;<div class="fooddiv2">  <img src="./images/healthbook/program_submit.gif" align="absmiddle" width="40" height="21" onClick="set_value(document.food.food15,document.food.amount15,document.food.cal15)" style="CURSOR:HAND"></div></td>
<td>
<input name="cal15" size=7 align="right" value=0 style='color:black'>
kcal</td>
</tr>
<tr align='center' bgcolor='FFFFFF'>
<td align=center bgcolor="whitesmoke" >음료</td>
<td bgcolor="whitesmoke" >
<select name="food16" size="1" >
<option>-----선택하세요-----<option value="62.5">저지방우유 <option value="125.21">우유 <option value="76">요구르트 <option value="207">아이스크림 <option value="45">과일탄산음료 <option value="40">사이다 <option value="38">콜라 <option value="1">다이어트콜라 <option value="33.4">녹차 <option value="32.5">치커리차 <option value="118.21">요플레 <option value="44">포카리스웨트 <option value="190">네스카페 <option value="70">실론티 <option value="96">파스테르요쿠르트 <option value="120">생과일딸기쥬스 <option value="80">생과일키위쥬스
</select>
</td>
<td bgcolor="whitesmoke">
<select name="amount16" size="1" >
<option value=0 selected>0 <option value=0.5>50 <option value=1>100 <option value=1.5>150 <option value=2>200 <option value=2.5>250 <option value=3>300 <option value=3.5>350 <option value=4>400 <option value=4.5>450 <option value=5>500
</select>
<div class="fooddiv">ml</div>&nbsp;&nbsp;&nbsp;<div class="fooddiv2">  <img src="./images/healthbook/program_submit.gif" align="absmiddle" width="40" height="21" onClick="set_value(document.food.food16,document.food.amount16,document.food.cal16)" style="CURSOR:HAND"></div></td>
<td bgcolor="whitesmoke">
<input name="cal16" size=7 align="right" value=0 style='color:black'>
kcal</td>
</tr>
</table><br>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr align='center'>
<td><img src="./images/healthbook/program_submit.gif" align="absmiddle" width="40" height="21" onClick="total_value(document.food.cal1,document.food.cal2,document.food.cal3,document.food.cal4,document.food.cal5,document.food.cal6,document.food.cal7,document.food.cal8,document.food.cal9,document.food.cal10,document.food.cal11,document.food.cal12,document.food.cal13,document.food.cal14,document.food.cal15,document.food.cal16,document.food.total)" style="CURSOR:HAND">&nbsp;
<a href=""><img src="./images/healthbook/program_reset.gif" width="40" height="21"></a></td>
</tr>

</table>
<br>
<center>
        <font color="#006633">회원님</font>이 <font color="#003399">작성한 식단은</font>
<input type='text' name='total' size='10' value=0  style='color:black'>
kcal 입니다.</font></center>
</form>
</td>
</tr>
</table>
</span>
</td>
</tr>
</table>	

</div>
	
	
    
    <!-- 건강진단 테스트 -->
    <div>
    
    <table align="center" cellpadding="0" cellspacing="0" width="94%">
    <tr>
        <td width="1229">
            <table cellpadding="8" cellspacing="0" bgcolor="#F3F3F3">
                <tr>
                    <td width="1142">
                        <table cellpadding="10" cellspacing="0" width="100%" bgcolor="white">
                            <tr>
                                <td width="1126">
                                    <p>&nbsp;<font color="#006633"><u>자신의  현재 스트레스 상태</u></font>
                           		         를 알아보는 것이 스트레스 극복의 지름길입니다. 
                                    <font color="#0066CC">다음  30개 항목</font>에 대해 
                                    <font color="#FF3300">솔직하게   답변</font>하되, 너무 깊이 생각하지 않도록  유의하면서 
                                    <font color="#663333">스스로를  점검</font>해 보세요.</p>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td width="1229">
            <p>&nbsp;</p>
        </td>
    </tr>
    <tr>
        <td width="1229"><table border="0" cellspacing="1" CELLPADDING="3" width="100%" bordercolordark="white" bordercolorlight="black" align="center" bgcolor="#DFDFDF">
	<tr BGCOLOR="ECECEC">
		<td height="28" bgcolor="#F3F3F3"><b><font color="#6633FF">1.</font></b> 15분 이상 줄을 서면 매우 화가 나거나 짜증이 난다. </td>
		<form method="get">
		<td align="center" height="28" bgcolor="#F3F3F3">
			<input type="radio" name="ans1" value="5" onclick="ans[1]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[1]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[1]=3">보통
			<input type="radio" name="ans1" value="2" onclick="ans[1]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[1]=1">전혀          
		</td></form>
	</tr>
	<tr>
		<td height="28" bgcolor="white"><b><font color="#6633FF">2</font></b>. 한번에 한가지 이상의 일을 처리하려고 시도한다. 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="white">
			<input type="radio" name="ans1" value="5" onclick="ans[2]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[2]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[2]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[2]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[2]=1">전혀 
		</td></form>
	</tr>
	<tr BGCOLOR="ECECEC">
		<td height="28" bgcolor="#F3F3F3"><b><font color="#6633FF">3</font></b>. 일하는 도중 쉴 시간이 별로 없다.		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="#F3F3F3">
			<input type="radio" name="ans1" value="5" onclick="ans[3]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[3]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[3]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[3]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[3]=1">전혀 
		</td></form>
	</tr>
	<tr>
		<td height="28" bgcolor="white"><b><font color="#6633FF">4</font></b>. 누가 말을 천천히 하는 것을 보면 역시 짜증이 난다. 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="white">
			<input type="radio" name="ans1" value="5" onclick="ans[4]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[4]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[4]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[4]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[4]=1">전혀 
		</td></form>
	</tr>
	<tr BGCOLOR="ECECEC">
		<td height="28" bgcolor="#F3F3F3"><b><font color="#6633FF">5</font></b>. 게임이나 스포츠를 하면 꼭 이겨야 한다. 		</td>
		<td align="center" height="28" bgcolor="#F3F3F3">
			<input type="radio" name="ans1" value="5" onclick="ans[5]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[5]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[5]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[5]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[5]=1">전혀
		</td></form>
	</tr>
	<tr>
		<td height="28" bgcolor="white"><b><font color="#6633FF">6</font></b>. 지면 화가 난다. 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="white">
			<input type="radio" name="ans1" value="5" onclick="ans[6]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[6]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[6]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[6]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[6]=1">전혀
		</td></form>
	</tr>
	<tr BGCOLOR="ECECEC">
		<td height="28" bgcolor="#F3F3F3"><b><font color="#6633FF">7</font></b>. 하루 중 오로지 내 자신만을 위하여 배정된 시간이 있다. 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="#F3F3F3">
			<input type="radio" name="ans1" value="5" onclick="ans[7]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[7]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[7]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[7]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[7]=1">전혀 
		</td></form>
	</tr>
	<tr>
		<td height="28" bgcolor="white"><b><font color="#6633FF">8</font></b>. 자주 시계를 본다. 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="white">
			<input type="radio" name="ans1" value="5" onclick="ans[8]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[8]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[8]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[8]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[8]=1">전혀 
		</td></form>
	</tr>
	<tr BGCOLOR="ECECEC">
		<td height="28" bgcolor="#F3F3F3"><font color="#6633FF"><b>9</b></font>. 나는 마감시간이 임박해야 더 힘이 난다. 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="#F3F3F3">
			<input type="radio" name="ans1" value="5" onclick="ans[9]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[9]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[9]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[9]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[9]=1">전혀 
		</td></form>
	</tr>
	<tr>
		<td height="28" bgcolor="white"><b><font color="#6633FF">10</font></b>. 일을 집에 가져온다. 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="white">
			<input type="radio" name="ans1" value="5" onclick="ans[10]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[10]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[10]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[10]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[10]=1">전혀 
		</td></form>
	</tr>
	<tr BGCOLOR="ECECEC">
		<td height="28" bgcolor="#F3F3F3"><b><font color="#6633FF">11</font></b>. 상황이 긴박해질수록 힘이 난다. 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="#F3F3F3">
			<input type="radio" name="ans1" value="5" onclick="ans[11]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[11]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[11]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[11]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[11]=1">전혀 
		</td></form>
	</tr>
	<tr>
		<td height="28" bgcolor="white"><b><font color="#6633FF">12</font></b>. 책임을 맡는 것이 좋다. 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="white">
			<input type="radio" name="ans1" value="5" onclick="ans[12]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[12]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[12]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[12]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[12]=1">전혀
		</td></form>
	</tr>
	<tr BGCOLOR="ECECEC">
		<td height="28" bgcolor="#F3F3F3"><b><font color="#6633FF">13</font></b>. 일을 빨리 하기 위해 급하게 식사를 하는 때가 많다. 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="#F3F3F3">
			<input type="radio" name="ans1" value="5" onclick="ans[13]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[13]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[13]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[13]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[13]=1">전혀 
		</td></form>
	</tr>
	<tr>
		<td height="28" bgcolor="white"><b><font color="#6633FF">14</font></b>. <span style="letter-spacing:-1;">시간이 많이 남아있건 아니건 간에 일을 빨리빨리 해치운다.</span> 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="white">
			<input type="radio" name="ans1" value="5" onclick="ans[14]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[14]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[14]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[14]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[14]=1">전혀 
		</td></form>
	</tr>
	<tr BGCOLOR="ECECEC">
		<td height="28" bgcolor="#F3F3F3"><b><font color="#6633FF">15</font></b>. 말하는 사람이 틀렸다고 생각되면 바로 지적한다. 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="#F3F3F3">
			<input type="radio" name="ans1" value="5" onclick="ans[15]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[15]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[15]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[15]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[15]=1">전혀
		</td></form>
	</tr>
	<tr>
		<td height="28" bgcolor="white"><b><font color="#6633FF">16</font></b>. 집이나 직장의 분위기가 변하는 것이 싫다. 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="white">
			<input type="radio" name="ans1" value="5" onclick="ans[16]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[16]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[16]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[16]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[16]=1">전혀
		</td></form>
	</tr>
	<tr BGCOLOR="ECECEC">
		<td height="28" bgcolor="#F3F3F3"><b><font color="#6633FF">17</font></b>. 쉬려고 하면 막상 뭘 할지 모른다 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="#F3F3F3">
			<input type="radio" name="ans1" value="5" onclick="ans[17]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[17]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[17]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[17]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[17]=1">전혀
		</td></form>
	</tr>
	<tr>
		<td height="28" bgcolor="white"><b><font color="#6633FF">18</font></b>. 다른 사람보다 빨리 먹는 편이다.		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="white">
			<input type="radio" name="ans1" value="5" onclick="ans[18]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[18]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[18]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[18]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[18]=1">전혀 
		</td></form>
	</tr>
	<tr BGCOLOR="ECECEC">
		<td height="28" bgcolor="#F3F3F3"><b><font color="#6633FF">19</font></b>. 일을 많이 해야 창조적으로 느껴진다.		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="#F3F3F3">
			<input type="radio" name="ans1" value="5" onclick="ans[19]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[19]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[19]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[19]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[19]=1">전혀 
		</td></form>
	</tr>
	<tr>
		<td height="28" bgcolor="white"><b><font color="#6633FF">20</font></b>. 휴가를 갈 수 있는데 안 간 적이 많다. 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="white">
			<input type="radio" name="ans1" value="5" onclick="ans[20]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[20]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[20]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[20]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[20]=1">전혀 
		</td></form>
	</tr>
	<tr BGCOLOR="ECECEC">
		<td height="28" bgcolor="#F3F3F3"><b><font color="#6633FF">21</font></b>. 사소한 것에 집착한다는 말을 들은 적이 있다. 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="#F3F3F3">
			<input type="radio" name="ans1" value="5" onclick="ans[21]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[21]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[21]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[21]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[21]=1">전혀 
		</td></form>
	</tr>
	<tr>
		<td height="28" bgcolor="white"><b><font color="#6633FF">22</font></b>. 일을 열심히 안 하는 사람을 보면 화가 난다. 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="white">
			<input type="radio" name="ans1" value="5" onclick="ans[22]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[22]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[22]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[22]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[22]=1">전혀
		</td></form>
	</tr>
	<tr BGCOLOR="ECECEC">
		<td height="28" bgcolor="#F3F3F3"><b><font color="#6633FF">23</font></b>. 뭐 더 할 일이 없나 하는 때가 있다. </td>
		<form method="get">
		<td align="center" height="28" bgcolor="#F3F3F3">
			<input type="radio" name="ans1" value="5" onclick="ans[23]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[23]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[23]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[23]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[23]=1">전혀 
		</td></form>
	</tr>
	<tr>
		<td height="28" bgcolor="white"><b><font color="#6633FF">24</font></b>. 일에 대해 생각하며 지내는 시간이 많다. 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="white">
			<input type="radio" name="ans1" value="5" onclick="ans[24]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[24]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[24]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[24]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[24]=1">전혀 
		</td></form>
	</tr>
	<tr BGCOLOR="ECECEC">
		<td height="28" bgcolor="#F3F3F3"><b><font color="#6633FF">25</font></b>. 쉽게 지루해진다. 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="#F3F3F3">
			<input type="radio" name="ans1" value="5" onclick="ans[25]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[25]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[25]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[25]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[25]=1">전혀
		</td></form>
	</tr>
	<tr>
		<td height="28" bgcolor="white"><b><font color="#6633FF">26</font></b>. 일이 끝날 시간이 되면 더 일할 맛이 난다. 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="white">
			<input type="radio" name="ans1" value="5" onclick="ans[26]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[26]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[26]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[26]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[26]=1">전혀
		</td></form>
	</tr>
	<tr BGCOLOR="ECECEC">
		<td height="28" bgcolor="#F3F3F3"><b><font color="#6633FF">27</font></b>. 나처럼 생각하지 않는 사람과는 논쟁을 할 필요가 있다. </td>
		<form method="get">
		<td align="center" height="28" bgcolor="#F3F3F3">
			<input type="radio" name="ans1" value="5" onclick="ans[27]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[27]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[27]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[27]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[27]=1">전혀 
		</td></form>
	</tr>
	<tr>
		<td height="28" bgcolor="white"><b><font color="#6633FF">28</font></b>. 문제가 있으면 바로 처리한다. 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="white">
			<input type="radio" name="ans1" value="5" onclick="ans[28]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[28]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[28]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[28]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[28]=1">전혀 
		</td></form>
	</tr>
	<tr BGCOLOR="ECECEC">
		<td height="28" bgcolor="#F3F3F3"><b><font color="#6633FF">29</font></b>. 일이 빨리 진행되도록 독려한다. 		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="#F3F3F3">
			<input type="radio" name="ans1" value="5" onclick="ans[29]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[29]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[29]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[29]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[29]=1">전혀
		</td></form>
	</tr>
	<tr>
		<td height="28" bgcolor="white"><b><font color="#6633FF">30</font></b>. 나는 세상에 사소한 일이라곤 별로 없다고 생각한다.		</td>
		<form method="get">
		<td align="center" height="28" bgcolor="white">
			<input type="radio" name="ans1" value="5" onclick="ans[30]=5">항상 
			<input type="radio" name="ans1" value="4" onclick="ans[30]=4">자주 
			<input type="radio" name="ans1" value="3" onclick="ans[30]=3">보통 
			<input type="radio" name="ans1" value="2" onclick="ans[30]=2">가끔 
			<input type="radio" name="ans1" value="1" onclick="ans[30]=1">전혀
		</td></form>
	</tr>
	<tr>
		<td height="35" colspan="2" bgcolor="white">
        <p align="center"><input type="button" name="1" value="결과보기" onclick="checkans()">		</td>

	</tr>
</table>
<div id=result style="font: nomal;"></div>

</td>
</tr>
</table>

<table width=100% align=center border=0 cellpadding=0 cellspacing=0>
<tr>
    <td width=70% height=25>
        

                
                
                
</td>
</tr>
</table>
</div>
   	
   	<!-- 예방접종 입력 -->
   	<div class="treat">	
   	<div class="bh_4u_sub_conts">
        <!-- 상단 탭 -->
        <div class="bh_4u_depth fix" style="height: 76px;">
            <h3 class="n_tit_h3_4">예방접종</h3>
            <ul class="bh_4u_depth_ul_n4 fix">
                <li class="bh_4u_ico_child" onclick="change_tab('Y')"><a href="javascript:"><strong>소아</strong></a></li>
                <li class="bh_4u_ico_adult" onclick="change_tab('N')"><a href="javascript:"><strong>성인</strong></a></li>
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
            <div class="noticeTxt_m">좌/우로 화면 이동이 가능하며 접종 이력을 클릭하시면 상세 정보를 보실 수 있습니다.
            </div>
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
            
            <!-- 성인 예방접종표 -->
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
                <!-- 성인예방접종표 끝 -->
            </div>
        </div>
    </div>
</div>

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

  	

/*     <div class="bh_4u_depth fix" style="height: 76px;">
    <h3 class="n_tit_h3_4">예방접종</h3>
    <ul class="bh_4u_depth_ul_n4 fix">
        <li class="bh_4u_ico_child" onclick="javascript: change_tab('Y')"><a href="javascript:"><strong>소아</strong></a></li>
        <li class="bh_4u_ico_adult" onclick="javascript: change_tab('N')"><a href="javascript:"><strong>성인</strong></a></li>
    </ul>     
</div>  	 */

var pt_no = "";
var child_yn = "N";

var resultJSON = null; // ajax 통신을 통해 리턴받은 JSON 데이터를 담아둘 변수 입니다.

$(document).ready(function () {
    change_tab(child_yn);
});

function change_tab(childYN) {
    if (childYN == "N") {
        $(".bh_4u_depth_ul_n4 li:eq(1)").addClass("on");
    }
    else if (childYN == "Y") {
        $(".bh_4u_depth_ul_n4 li:eq(0)").addClass("on");
    }
    loadVaccinationView(childYN);
}

/* function loadVaccinationView(childYN) {
    $.ajax({
        type: 'post',
        url: './health_book/healthbook.do',
        data: { "mrn": pt_no, "child_yn": childYN },
        success: function (result) {
            $("[name='detail_view']").html(result);
            columnBinding();
            eventBinding();
        },
        beforeSend: function () {
            $('.spinner').show();
        },
        complete: function () {
            $('.spinner').hide();
        },
        error: function (ex) {
            if (ex.statusText == "timeout") {
                alertPop("Alert", "데이터 조회 시간이 초과되었습니다.");
            }
            else {
               
            }
            $('.spinner').hide();
        },
        timeout: 30000
    });
}
  */
  
function columnBinding() {
    var _top = $('.tableFixWrap .tableFixCnt table thead th:first-child').position().top;
    var _width = $('.tableFixWrap .tableFixCnt table tbody td:eq(0)').position().left;
    var r_height = $('.tableFixWrap .tableFixCnt table tbody tr:eq(0)').height();
    var _fixval = 4;
    var _divtop = 0;

    if ($(window).width() <= 640) {
        _fixval--;
    }

    $('.tableFixWrap .tableFixCnt table tbody th:first-child>div').css('height', r_height);
    $('.tableFixWrap .tableFixCnt table thead th:first-child').css('width', _width - 16);
    $('.tableFixWrap .tableFixCnt table tbody th:first-child').css('width', _width - 32);

    $(window).scroll(function () {
        _divtop = $(window).scrollTop();
        $('.tableFixWrap .tableFixCnt table thead th:first-child').css('top', _top - _divtop);
        for (var i = 0; i < $('.tableFixWrap .tableFixCnt table tbody th:first-child').length; i++) {
            var _height = $('.tableFixWrap .tableFixCnt table tbody tr:eq(' + i + ')').position().top;
            $('.tableFixWrap .tableFixCnt table tbody th:first-child:eq(' + i + ')').css('top', (_top - _divtop) + _height);
        }
    })
}


/*   	 <ul>
     <li><a href="#link"><img src="img/menu_01_off.gif" alt="메뉴01" /></a>
         <ul class="tabcontent">
             <li><a href="#">1 제목이 나오는부분.....</a></li>
             <li><a href="#">2 제목이 나오는부분.....</a></li>
         </ul>
         <p class="morebtn"><a href="#"><img src="img/more.gif" alt="MORE" /></a></p>
     </li>
     <li><a href="#link"><img src="img/menu_02_off.gif" alt="메뉴02" /></a>
         <ul class="tabcontent">
             <li><a href="#">무우우우우우우우.....</a></li>
             <li><a href="#">5무우우우우우우우ㄴ.....</a></li>
         </ul> */

  	
    $(document).ready(function(){
        $(".bh_4u_depth fix").each(function(){
            var tab = $(this).children("ul");
            var tabBtn = tab.children("li").children("a");
            var content = tabBtn.nextAll();
             
            // 탭버튼을 클릭했을때
            tabBtn.click(function(){
                // 이미 on 상태면 pass
                if( $(this).hasClass("on") ) return;
 
                // 모든 컨텐츠 부분을 안보이게 한뒤
                content.hide();
 
                // 클릭한 tab 버튼(a태그) 옆의 모든 태그들은 보이도록
                $(this).nextAll().show();
                 
                // 모든탭 버튼에 있던 on 클래스를 빼고
                // 현재 클릭한 탭메뉴 버튼에 on 클래스 추가
                tabBtn.removeClass("on");
                $(this).addClass("on");
                 
                // 탭버튼를 쭉 돌면서 on 클래스가 있는 버튼만 on 이미지로 바꾸고
                // 나머지 버튼들은 off 이미지로 바꾼다.
                tabBtn.each(function(){
                    var src;
                    var img = $(this).children("img");
                    if( $(this).hasClass("on") ){
                        src = img.attr("src").replace("_off.", "_on.");
                    }else{
                        src = img.attr("src").replace("_on.", "_off.");
                    }
                     
                    img.attr("src", src);
                });
            });
             
            // 맨첫번째 탭버튼 클릭처리
            tabBtn.eq(0).click();
        });
    });
</script>

<!-- 자가진단js -->
<script language="JavaScript">
ans = new Array(30);
         
for(i=1; i<=30 ; i++)
{
    ans[i] = 6;
}
  
function WinOpen1(){
   var sumt = 0;
   for(i=1; i<=30 ; i++)
               {
                   sumt += ans[i];
               }

     alert("당신의 점수는 " +  sumt + "점 입니다...!");                           

     if(sumt <= 75)
       {        
    	 document.getElementById('result').innerHTML="<font color=red>TYPE B</font><br><br>당신은 관상동맥 질환이 생길 가능성은 좀 낮은 것 같군요.&nbsp;당신은 이 결과에 따르면 좀 풀어져 있는 분입니다.<br>서둘지 않고 참을성이 있으며 경쟁적인 것은 피하는 경향이 있습니다.<br>겉으로 드러나는 공격성은 잘 보이지는 않습니다.<br>그리고 시간을 급하게 다루지 않습니다.<br>솔직히 저희는 당신 같은 분을 존경하고 사람들이<br>모두 당신 같은 면을 가지도록 스트레스 코너를 만들었지만 실은 좀 <br>걱정이 되는군요. 이 험한 세상을 그렇게 적당히 살아도 됩니까? ^^"
    	
        }
     else if(sumt >= 76 & sumt <= 99)
       {                            
    	 document.getElementById('result').innerHTML=("<font color=red>TYPE AB</font><br><br>당신은 한편으로는 어느 정도 경쟁적이고 참을성이 적으며<br>성취지향적이고 가끔씩은 공격적일 때도 있습니다만,<br>한편으로는 서두르지 않고 낙천적인데가 있으며 도대체<br>이 경쟁이라는게 다 뭐냐 하면서 너털웃음을 지을 줄 아는 성격입니다.<br>적당한 스트레스는 자신의 발전을 위한 밑거름이 된다는 것을 아십시오.<br>그래도 좀 스트레스가 심하다면 간단하게 스트레스 해소하는 법을 사용하세요.");
        }
     else if(  sumt >= 100 )
       {                            
    	 document.getElementById('result').innerHTML=("<font color=red>TYPE A</font><br><br>당신이 바로 A유형 성격입니다.<br>당신은 매우 경쟁적이고 참을성이 적으며 성취-지향적이고 공격적이고 일에 몰두해있습니다.<br>시간에 대해서는 강박적일 정도로 철저하려고 노력합니다.<br><br>시간이 아까워 무엇이든 빨리 빨리, 그러면서 한편 정확히 처리하려고 노력합니다.<br><br>당신의 이러한 성격은 현대정보사회에서 매우 유용할 수도 있지만 당신은<br>이러한 성격으로 인해 과도한 스트레스속에 살고 있을 가능성이 높고<br> <br>각종 스트레스원에 대하여 아주 민감한 반응을 보이게 됩니다.<br><br>최근의 연구에 의하면 이런 성격의 내면에는 공격성이 있다고 합니다. <br><br>좀 더 구체적으로 말하자면 공격성과 냉소주의, 불신감 등입니다. <br>이런 성격을 변화시키려면 가장 중요한 것이 자신의 감정을 - 잘 기억하세요<br><br>자신의 생각이 아니고 감정입니다 - 자주 표현하고 잘 표현하는 연습을 하시는 겁니다.<br>화날 때 화난다는 것을 아십시오.<br> <br>도대체 내가 지금 화가 나는 건지 슬픈 건지 답답한 건지 잘 모를 때가 많다면<br>당신의 감정은 아직 미숙한 부분이 많은 것입니다.<br>감정을 절제하는 것은 자신의 감정이 어떤 것인지 명확하게 알면서 적절하게<br>표현 할 줄도 아는 사람에게 가능한 것입니다. <br>자! 당신은 당신의 가슴이 <br>말하는 메시지를 들을 줄 아는지 한번 자문해 보십시오.");
        }
}

function checkans(){
       var num=0;
       for(i=1; i<=30 ; i++)
           {
             if(ans[i] == 6){
                 num++;
              }
           }
      if(num == 0){
             WinOpen1();      
             }
      else
             {
              alert("모든 항목에 응답을 해야 합니다.  (남은항목 : " + num + "문제)" );
             }  
}

</script>
<script type="text/javascript">
<!--


function Reset(){
document.selftest.reset();
}

function isFieldBlank(theField) {
if(theField.value.length == 0)
return true;
else
return false;
}
function set_value(obj_food, obj_amount, obj_text) {

for( i=0; i < obj_food.options.length; i++) {

if(obj_food.options[i].selected)  {

for( j=0; j < obj_amount.options.length; j++) {

if(obj_amount.options[j].selected) {

temp1 = obj_food.options[i].value
temp2 = obj_amount.options[j].value
temp3 = obj_text.value
temp3 = (eval(temp1) * eval(temp2))
obj_text.value = eval(temp3)
}
}
}
}
}

function total_value(obj_text1, obj_text2,obj_text3,obj_text4,obj_text5,obj_text6,obj_text7,obj_text8,obj_text9,obj_text10,obj_text11,obj_text12,obj_text13,obj_text14,obj_text15,obj_text16, obj_total) {

temp1=obj_text1.value
temp2=obj_text2.value
temp3=obj_text3.value
temp4=obj_text4.value
temp5=obj_text5.value
temp6=obj_text6.value
temp7=obj_text7.value
temp8=obj_text8.value
temp9=obj_text9.value
temp10=obj_text10.value
temp11=obj_text11.value
temp12=obj_text12.value
temp13=obj_text13.value
temp14=obj_text14.value
temp15=obj_text15.value
temp16=obj_text16.value
temp17=obj_total.value
temp17=(eval(temp1)+eval(temp2)+eval(temp3)+eval(temp4)+eval(temp5)+eval(temp6)+eval(temp7)+eval(temp8)+eval(temp9)+eval(temp10)+eval(temp11)+eval(temp12)+eval(temp13)+eval(temp14)+eval(temp15)+eval(temp16))
obj_total.value=eval(temp17)
}


</script>


 </body>
</html>