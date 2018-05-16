<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/consulting.css"/>
<style>
.refresh_btn1 em:before {content:'';display:inline-block;position:absolute;top:50%; height:16px;margin-top:-8px;background:url('../images/main/icon_refresh.png') no-repeat;vertical-align:top;}
div {
  position: relative;
}

input[type="number"] {
  width: 100px;
}

input + span {
  padding-right: 30px;
}

input:invalid+span:after {
  position: absolute; 
  content: '✖';
  padding-left: 5px;
  color: #8b0000;
}

input:valid+span:after {
  position: absolute;
  content: '✓';
  padding-left: 5px;
  color: #009000;
}

.btn-type02{
	width: 180px;
    height: 70px;
    line-height: 70px;
    color: #fff;
    background-color: #1f4bb4;
    border-radius: 5px;
    margin: 40px auto 80px auto;
    display: block;
}
</style>

<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>비밀번호 재설정</h2>
				<em>질문에 대한 답변이 맞으면 새로운 비밀번호를<br/>이메일로 보내드립니다.</em>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
				<form action="pwdResetAf.do">
				<input id="id" name="id" type="hidden" value='${dto.id}'>	
				<table class="list_table">
					<tbody>
					<tr>
						<th>QUESTION:</th>
						<td><input id="question" name="question" type="text" value='${dto.question}'></td>
					</tr>
					<tr>
						<th>ANSWER:</th>
						<td><input id="answer" name="answer" type="text"></td>
					</tr>
					</table>
					
					<input type="submit" value="확인" class="btn-type02">
				</form>
				<!-- 이부분에 컨텐츠 끝 -->
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>


