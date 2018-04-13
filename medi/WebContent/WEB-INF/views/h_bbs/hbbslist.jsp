<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>병원 리스트</h2>
				<em>사이트에 등록된 모든 병원의 정보를<br/>한눈에 보여드립니다</em>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
					<c:forEach items="${hbbslist}" var="hbbs" varStatus="i">
						<div class="hbbsbox">
							<a href="#;" class="">
								<div class="hbbssum"><img src="images/sub/hospital.jpg" alt=""></div>
								<div class="hbbscontent">
									<h4>서울병원</h4>
									<p class="subinfo">사랑과 정성을 다하는 서울병원 입니다</p>
								</div>
								<div class="hbbsbottom">
									<img src="images/sub/location.png" alt="">
									<p>서울시 강남구 역삼동 111-111</p>
								</div>
							</a>
						</div>
					</c:forEach>
				<!-- 이부분에 컨텐츠 끝 -->
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>


