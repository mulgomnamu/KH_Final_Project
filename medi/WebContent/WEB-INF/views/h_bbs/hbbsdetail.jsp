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
						
						<div class="bookBtnWrap">
							<a href="#;" data-hover="예약하러가기" class="bookBtn1">방문진료에약</a>
							<a href="#;" data-hover="예약하러가기" class="bookBtn2">화상진료예약</a>
						</div>
						
						<span class="middleline"></span>
						
						<div class="detailBottom">
							<div class="doctorInfoTitle">
								<span class="square"></span>
								<h4>의료진 소개</h4>
							</div>
							<!-- 의사 인원만큼 for문 시작 -->
							<div class="doctorlistWrap">
								<c:forEach items="${doctorlist}" var="doctordto" varStatus="i">
									<div class="doctorInfo">
										<div class="doctorInfoImgBox">
											<img src="images/sub/${doctordto.doc_profile }" alt="">
										</div>
										<div style="clear:both;">
											<div class="doctorInfoCon">
												<ul>
													<li class="doctorName">${doctordto.name } <span class="doctorCharge">병원장, 전문의</span></li>
													<li class="doctorInfoSchedule">${doctordto.day_tostring }</li>
													<li class="doctorInfoSubTiny">${doctordto.doc_content }</li>
												</ul>
											</div>
										</div>
									</div>
								</c:forEach>
								<div style="clear:both;"></div>
							</div>
							<!-- 의사 인원만큼 for문 끝 -->
						</div>
						
						<div class="reviewsWrap">
							<table class="reviewsTable">
								<col width="8%"><col width="60%"><col width="15%"><col width="17%">
								<tr>
									<th>글번호</th>
									<th>이용후기</th>
									<th>글쓴이</th>
									<th>게시일</th>
								</tr>
								<!-- for문 시작 -->
								<tr>
									<td align="center">1</td>
									<td align="left" style="padding-left:15px;">정말 좋아요</td>
									<td align="center">김근영</td>
									<td align="center">2018.04.24</td>
								</tr>
								<!-- for문 끝 -->
							</table>
							<a href="#;" data-hover="이용후기 작성" class="reviewsWriteBtn" id="reviewsWriteBtn">이용후기 작성</a>
							<div style="clear:both;"></div>
						</div>
					</div>
					
					<div>
						<div>
							<span>X</span>
							<h4>이용후기를 남겨주세요</h4>
							<span></span>
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
