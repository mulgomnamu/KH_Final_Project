<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
.subpagetitle{
	height: 284px;
	text-align: center;
	background: url(images/appointment/sub_bg.jpg) no-repeat 50% top;
}
</style>
<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
   <div class="login"><!-- 2뎁스명 클래스 -->
      <!-- SUB SECTION -->
      <section id="sub_section">
         <!-- #LOCATION -->
         <!-- sub타이틀 시작 -->
         <div class="subpagetitle">
            <h2 style="padding-top:118px; font-size:38px; color:#111; font-family:nanum;">MyPage</h2>
         </div>
         <!-- content 시작 -->
         <div class="content"> 
            <div class="inner_flogin">
            <!-- 이부분에 컨텐츠 시작 -->
<form name="frmForm" id="_frmForm" method="post" action="Mydetail.do">
<input type="hidden" name="id"   value="${login.id }"/>
<p style="text-align: center; margin: 30px 0;">
<span class="btn_login">
   <a href="#none" id="_btndetail" title="내정보보기" class="btn-type01" style="width: 130px;height: 107px;">
      <em style="margin-top: 20px;">내정보보기</em>
   </a>
</span>
<span class="btn_login">
   <a href="#none" id="del" title="탈퇴하기" class="btn-type01" style="width: 130px;height: 107px; margin: 0 50px;">
      <em style="margin-top: 20px;">탈퇴하기</em>
   </a>
</span>
<span class="btn_login">
   <a href="#none" id="butpwdupdate" title="비밀번호 수정" class="btn-type01" style="width: 130px;height: 107px;">
      <em style="margin-top: 20px;">비밀번호 수정</em>
   </a>
</span>
</p>
</form>









<script>
$("#del").click(function() {
   $("#_frmForm").attr({"target":"_self", "action":"mydelete.do" }).submit();
});

$("#_btndetail").click(function() {   
   $("#_frmForm").attr({ "target":"_self", "action":"Mydetail.do" }).submit();
});

$("#butpwdupdate").click(function() {   
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
