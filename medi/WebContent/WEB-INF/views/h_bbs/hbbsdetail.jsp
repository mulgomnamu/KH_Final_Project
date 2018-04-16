<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<h2>${hbbs.name }</h2>
				<em>${hbbs.name }의 병원정보 소개입니다.</em>
			</div>
			<div class="content"> 
				<div class="inner_flogin">
				<!-- content 시작 -->
					<div class="detailWrap">
						<div class="detailTop">
							<div class="detailImgBox">
								<img src="images/sub/${hbbs.confirm_img }" alt="">
							</div>
							<div class="detailInfoBox">
								<table>
									<tr align="left">
										<th colspan="2">
											<h4>${hbbs.name }</h4>
										</th>
									</tr>
									<tr align="left">
										<th>주소</th>
										<td>${hbbs.address }</td>
									</tr>
									<tr align="left">
										<th>전화번호</th>
										<td>${hbbs.tel }</td>
									</tr>
									<tr align="left">
										<th>이메일</th>
										<td><a href="mailto:${hbbs.email }">${hbbs.email }</a></td>
									</tr>
									<tr align="left">
										<th>병원 소개</th>
										<td>${hbbs.info }</td>
									</tr>
								</table>
							</div>
						</div>
						
						<span class="middleline"></span>
						
						<div class="detailBottom">
							<div class="doctorInfoTitle">
								<span class="square"></span>
								<h4>의료진 소개</h4>
							</div>
							<!-- 의사 인원만큼 for문 시작 -->
							<div class="doctorInfo">
								<div class="doctorInfoImgBox">
									<img src="images/sub/info_doctor.png" alt="">
								</div>
								<div class="doctorInfoCon">
									<ul>
										<li class="doctorName">홍길동 <span class="doctorCharge">병원장, 전문의</span></li>
										<li class="doctorInfoSchedule">월, 수, 목, 금 진료</li>
										<li class="doctorInfoSubTiny">
											서울성모병원 병원장<br/>
											한양대학교 의과대학 수련의 및 점임의<br/>
											분당 서울대병원 자문교수<br/>
											북미 방사선의학회 정회원
										</li>
									</ul>
								</div>
							</div>
							<!-- 의사 인원만큼 for문 끝 -->
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