<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
.submitbtn:hover{
color: #fff;
 background-color: #0b2d85;=
}
</style>
<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>비밀번호 입력창</h2>
				<em>글을 작성할 때 입력한 비밀번호를 적어주세요</em>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
				<form action="QnabbsdetailRockAf.do">
				<input type="hidden" id="seq" name="seq" value="${bbs.seq}">
				<input type="hidden" id="rock" name="rock" value="${bbs.rock}">
				<span class="form-text" style="display: inline;">
					비밀번호 입력<input type="text" id="pwd" name="pwd" style="width: 260px;margin:0 20px;">
				</span>	
					<input type="submit" value="확인" class="submitbtn" style="width: 60px;height: 40px;">
					
				</form>
				<!-- 이부분에 컨텐츠 끝 -->
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>