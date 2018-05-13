<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/consulting.css"/>
<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="subpagetitle" style="margin-bottom: 50px;">
				<h2>내정보수정</h2>
 <div class="sub_tap">
  <div class="inner_flogin" style="background: transparent">

	</div>
		</div>			
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->

 <form action="" id="_frmForm">

<ul id="tab">
	 <li>
       <a href="#none" id="_btndetail"  class="selected" title="내정보보기"><em>내 정보보기</em></a>
       <input type="hidden"  name="id" value="${login.id }">
    </li>
    <li>
        <a href="#none" id="del" title="탈퇴하기"><em>탈퇴하기</em></a>
    </li>
    <li>
        <a href="#nones"  id="butpwdupdate" title="비밀번호 수정"><em>비밀번호 수정</em></a>

    </li>
</ul>


</form>








<script>
$("#del").click(function() {
	alert('탈퇴하기');
	$("#_frmForm").attr({"target":"_self", "action":"mydelete.do" }).submit();
});

$("#_btndetail").click(function() {	
	alert('내정보기');		
	$("#_frmForm").attr({ "target":"_self", "action":"Mydetail.do" }).submit();
});

$("#butpwdupdate").click(function() {	
	alert('비밀번호수정');		
	$("#_frmForm").attr({ "target":"_self", "action":"Mypwdupdate.do" }).submit();
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

