<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/appointment.css?ver=1.19"/>

    <div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login">
		<section id="sub_section">
			<div class="appointment_title">
				<h1>예약이 정상적으로 완료되었습니다</h1>
				<p>진료 예약하신 정보는 진료차트에서 확인하실 수 있습니다</p>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
					
				<h1>${mem_seq }</h1>
				<h1>${hos_seq }</h1>
				<h1>${doc_seq }</h1>
				<!-- 이부분에 컨텐츠 끝 -->
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>