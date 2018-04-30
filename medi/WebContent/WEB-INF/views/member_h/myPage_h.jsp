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
				<h2>마이페이지_병원</h2>
				<em>병원 및 의사 정보 변경</em>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
					
					<div>
						<a href="change_pwd_h.do">비밀번호 변경</a>
						<br>
						<a href="update_h.do?seq=${login_h.seq }">병원 회원 정보 변경</a>
						<br>
						<a href="join_d.do">의사 회원 추가</a>
						<br>
						<a href="update_d.do?seq=${login_h.seq }&index=0">의사 회원 정보 변경</a>
						<br>
						<a href="update_h_img.do">병원 이미지 변경</a>
						<br>
						<a href="update_d_img">의사 이미지 변경</a>
						<br>
					</div>
					
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>