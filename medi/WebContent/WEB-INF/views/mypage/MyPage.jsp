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
				<em>ex) ㅇㅇㅇ 에 등록된 모든 병원의 정보를<br/>한눈에 보여드립니다</em>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->

 내정보기 
<form name="frmForm" id="_frmForm" method="post" action="Mydetail.do">
<input type="hidden" name="id"   value="${login.id }"/>
<span>
<a href="#none" id="_btndetail" title="내정보보기">내 정보보기 </a>
<br>
<a href="#none" id="del" title="탈퇴하기">탈퇴하기</a>
<br>
<a href="#none"  id="butpwdupdate" title="비밀번호 수정">비밀번호 수정</a>


</span>
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

