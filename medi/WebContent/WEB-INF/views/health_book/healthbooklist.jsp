<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>

<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				  <p class="m_txt"><strong>${login.name}</strong>님 을 위한 맞춤 건강 관리 </p>
					<tr><tr>
   			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
					<div class="sub_tap">

<c:if test="${empty login}">
	<script type="text/javascript">
	alert("로그인이 필요합니다");
	location.href='main.do';
	</script>
	
</c:if> 	



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
						<textarea  name='allergy' id='allergy' rows="5" cols="1">${health.allergy}
					</textarea>
				</td>
			</tr>
	
		</tbody>
	</table>
	</c:if>
</c:forEach>

	
<c:if test="${login.seq ne health.seq}">
	<a href='healthbook.do'>건강수첩 입력하기</a>
 	<!-- <script type="text/javascript">
	alert("기본 정보를 입력해주세요");
	location.href='healthbook.do';
	</script> --> 
</c:if>
 
</div>
</div>
</div>
</section>
</div>
</div>
