<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- highchart -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<!-- Additional files for the Highslide popup effect -->
<script src="https://www.highcharts.com/media/com_demo/js/highslide-full.min.js"></script>
<script src="https://www.highcharts.com/media/com_demo/js/highslide.config.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="https://www.highcharts.com/media/com_demo/css/highslide.css" />






<!-- 로그인 처리 -->
<c:if test="${loginType ne 2 }">
	<script type="text/javascript">
	alert("관리자만 가능한 공간입니다");
	location.href='main.do';
	</script>
</c:if>

<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>안녕하세요 관리자님</h2>
				<em>관리자 페이지입니다.</em>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
					
					
					
					<!-- 기간별 예약 횟수 그래프 표시 -->
					<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
					
					
					
				<!-- 이부분에 컨텐츠 끝 -->
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>

<script>

$.ajax({
	url: 'getUserChartData.do',
	type: 'post',
	success: function(data) {
		
		Highcharts.chart('container', {
			  chart: {
			    type: 'line'
			  },
			  title: {
			    text: '이번 주 회원 가입 현황'
			  },
			  subtitle: {
			    text: '구분 : 일반, 병원 회원'
			  },
			  xAxis: {
			    categories: ['D-6', 'D-5', 'D-4', 'D-3', 'D-2', 'D-1', 'D-0', 'This Week']
			  },
			  yAxis: {
			    title: {
			      text: '회원 수(명)'
			    }
			  },
			  plotOptions: {
			    line: {
			      dataLabels: {
			        enabled: true
			      },
			      enableMouseTracking: false
			    }
			  },
			  series: [{
			    name: '일반',
			    data: [data.mem.d0, data.mem.d1, data.mem.d2, data.mem.d3, data.mem.d4, data.mem.d5, data.mem.d6, data.mem.total]
			  }, {
			    name: '병원',
			    data: [data.hos.d0, data.hos.d1, data.hos.d2, data.hos.d3, data.hos.d4, data.hos.d5, data.hos.d6, data.hos.total]
			  }]
			});
		
	}
});




</script>