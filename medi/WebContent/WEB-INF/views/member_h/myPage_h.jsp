<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- 로그인 처리 -->
<c:if test="${empty login_h }">
	<script type="text/javascript">
	alert("로그인후이용가능합니다");
	location.href='main.do';
	</script>
</c:if>
<c:if test="${loginType ne 4 }">
	<script type="text/javascript">
	alert("병원회원만 가능한 공간입니다");
	location.href='main.do';
	</script>
</c:if>

<style>
.fourBox:first-child{margin-left:0;}
.fourBox{margin-left:15px; width:220px; height:110px; line-height:110px; color:#fff; background-color:#1f4bb4; border-radius:5px; display:inline-block; text-align:center; }
</style>

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
						<a href="change_pwd_h.do" class="fourBox">비밀번호 변경</a>
						<a href="update_h.do?seq=${login_h.seq }" class="fourBox">병원 회원 정보 변경</a>
						<a href="join_d.do" class="fourBox">의사 회원 추가</a>
						<c:if test="${getDCount == 0 }">
							<a href="#;" onClick="alert('의사정보가 없습니다.')" class="fourBox">의사 회원 정보 변경</a>
						</c:if>
						<c:if test="${getDCount != 0 }">
							<a href="update_d.do?seq=${login_h.seq }&index=0" class="fourBox">의사 회원 정보 변경</a>
						</c:if>
						<a href="HospitalReservationList.do?hos_seq=${login_h.seq }" class="fourBox">예약 목록</a>
					</div>
					
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>

