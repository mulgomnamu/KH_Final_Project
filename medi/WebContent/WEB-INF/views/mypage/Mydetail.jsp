<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>Big hjh</h2>
				<em>내정보를<br/>한눈에 보여드립니다</em>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
					<form action="mysupdateAf.do" method="post" name="frmForm" id="_frmForm">
					
					<table class="list_table" style="width:85%;">
					
					<input type="hidden" name="seq" value="${my.seq }"/>
<tbody>	
<tr>
	<th>아이디</th>
	<td style="text-align: left">${my.id}</td>
</tr>
<br>
<tr>
	<th>비밀번호</th>
	<td style="text-align: left">
		<input size="30" type="password" style="border: 1px solid #ff0000;" name="pwd" maxlength="16"  value='${my.pwd}' >
	</td>
</tr>
<br>
<tr>
	<th>이름</th>
	<td style="text-align: left">${my.name}</td>
</tr>
<br>
<tr>
	<th>email</th>
	<td style="text-align: left">
		<input size="60" type="text" name="email" value="${my.email}">
	</td>
</tr>
<tr>
	<th>phone</th>
	<td style="text-align: left">
		<input type="text" name="phone" value="${my.phone}">
	</td>
</tr>
<br>
<tr>
	<th>post</th>
	<td style="text-align: left">
		<input size="60" type="text" name="post" value="${my.post}">
	</td>
</tr>
<br>
<tr>
	<th>address</th>
	<td style="text-align: left">
		<input size="60" type="text" name="address" value="${my.address}">
	</td>
</tr>
<tr>
	<td colspan="2" style="height:50px; text-align:center;">
		<span>
			<a href="#none" id="_btnUpdate" title="내정보 수정하기">내정보 수정하기</a>
		</span>
	</td>
</tr>

</tbody>
</table>
</form>
				
<script type="text/javascript">
$("#_btnUpdate").click(function() {	
	alert('수정완료');	
//	submitContents($("#_frmForm"));
	$("#_frmForm").attr({ "target":"_self", "action":" mysupdateAf.do" }).submit();
});
</script>	
					
				<!-- 이부분에 컨텐츠 끝 -->
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>
