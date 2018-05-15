<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
.joinChoiceWrap{width:700px; margin:0 auto 80px;}
.joinChoice:first-child{margin-left:0;}
.joinChoice{width:320px; display:inline-block; margin-left:30px; background-color:#f4f5f9; padding:30px 0;}

.choiceTitle{width:100%; text-align:center; font-size:24px; color:#111; font-weight:800; margin-bottom:10px;}
.choiceSubT{width:100%; text-align:center; font-size:16px; color:#777; display:block; margin-bottom:40px;}
.choiceicon{width:110px; display:block; margin:0 auto 30px;}
.choiceicon img{width:100%;}
.choiceGoBtn{    
	width: 120px;
    display: block;
    margin: 0 auto;
    text-align: center;
    background-color: #757a85;
    color: #fff;
    padding: 8px 0;
}
</style>
<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>회원가입 선택</h2>
				<em>일반 회원은 일반 회원가입을, 병원 가입은 병원 회원가입을 눌러주세요</em>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
				<div class="joinChoiceWrap">
					<div class="joinChoice">
						<p class="choiceTitle">일반 회원가입</p>
						<span class="choiceSubT">일반인 분들은 여기로 오세요!</span>
						<span class="choiceicon"><img src="images/sub/patient.png" alt=""></span>
						<a href="joinMember.do" class="choiceGoBtn">회원가입</a>
					</div>
					<div class="joinChoice">
						<p class="choiceTitle">병원 회원가입</p>
						<span class="choiceSubT">병원 관계자분들은 여기로 오세요!</span>
						<span class="choiceicon"><img src="images/sub/doctor.png" alt=""></span>
						<a href="join_h.do" class="choiceGoBtn">회원가입</a>
					</div>
				</div>
				<!-- 이부분에 컨텐츠 끝 -->
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>