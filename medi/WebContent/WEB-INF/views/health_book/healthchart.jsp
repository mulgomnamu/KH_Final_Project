<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page contentType="text/html; charset=utf-8" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<style>
div {
  margin-bottom: 10px;
  position: relative;
}

input[type="number"] {
  width: 100px;
}

input + span {
  padding-right: 30px;
}

input:invalid+span:after {
  position: absolute; content: '✖';
  padding-left: 5px;
  color: #8b0000;
}

input:valid+span:after {
  position: absolute;
  content: '✓';
  padding-left: 5px;
  color: #009000;
}
</style>


<script type="text/javascript" src="<c:url value='/js/jquery.1.9.1.min.js'/>"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<div id="container" class="hospitalguide">
	<!-- 1뎁스명 클래스 -->
	<div class="login">
		<!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section"> <!-- #LOCATION --> <!-- sub타이틀 시작 -->
		<div class="title-type01">
			<h2>회원가입</h2>
			<em>정보를 입력해주세요.</em>
		</div>
		<!-- content 시작 -->
</section>
</div>
</div>
<