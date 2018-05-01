<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>

<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<input type="hidden" value="${hbbs.seq }" id="hbbsSeq">
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
								<img src="upload/${hbbs.confirm_img }" alt="">
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
											<img src="upload/${doctordto.doc_profile }" alt="">
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
								<col width="10%"><col width="58%"><col width="15%"><col width="17%">
								<tr>
									<th>별점</th>
									<th>이용후기</th>
									<th>글쓴이</th>
									<th>게시일</th>
								</tr>
								<!-- for문 시작 -->
								<c:forEach items="${reviewslist}" var="reviews" varStatus="i">
									<tr>
										<c:choose>
											<c:when test="${reviews.stars == 0}">
												<td align="center" class="s_star">
													<span>★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
												</td>
											</c:when>
											<c:when test="${reviews.stars == 1}">
												<td align="center" class="s_star">
													<span class="s_on">★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
												</td>
											</c:when>
											<c:when test="${reviews.stars == 2}">
												<td align="center" class="s_star">
													<span class="s_on">★</span>
													<span class="s_on">★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
												</td>
											</c:when>
											<c:when test="${reviews.stars == 3}">
												<td align="center" class="s_star">
													<span class="s_on">★</span>
													<span class="s_on">★</span>
													<span class="s_on">★</span>
													<span>★</span>
													<span>★</span>
												</td>
											</c:when>
											<c:when test="${reviews.stars == 4}">
												<td align="center" class="s_star">
													<span class="s_on">★</span>
													<span class="s_on">★</span>
													<span class="s_on">★</span>
													<span class="s_on">★</span>
													<span>★</span>
												</td>
											</c:when>
											<c:when test="${reviews.stars == 5}">
												<td align="center" class="s_star">
													<span class="s_on">★</span>
													<span class="s_on">★</span>
													<span class="s_on">★</span>
													<span class="s_on">★</span>
													<span class="s_on">★</span>
												</td>
											</c:when>
										</c:choose>
										<td align="left" style="padding-left:15px;">${reviews.content }</td>
										<td align="center">${reviews.id }</td>
										<td align="center">${fn:substring(reviews.rdate, 0, 10) }</td>
									</tr>
								</c:forEach>
								<!-- for문 끝 -->
							</table>
							
							<!-- 병원 이용후 버튼 활성화 조건문 시작 -->
							<c:if test="${(loginType ==  1) || (loginType == 4)}">
								<a href="#;" data-hover="이용후기 작성" class="reviewsWriteBtn" id="reviewsWriteBtn">이용후기 작성</a>
							</c:if>
							<c:if test="${loginType == null }">
								<a href="#;" data-hover="이용후기 작성" onclick="alert('로그인 해주세요')" class="reviewsWriteBtn" id="">이용후기 작성</a>
							</c:if>
							<!-- 병원 이용후 버튼 활성화 조건문 끝 -->
							
							<div style="clear:both;"></div>
							
							<div id="paging_wrap">
								<jsp:include page="/WEB-INF/include/paging.jsp" flush="false">
									<jsp:param value="${pageNumber }" name="pageNumber"/>
									<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
									<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
									<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
								</jsp:include>
							</div>
							<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>						
							<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>
						</div>
					</div>
					
					<div class="reviewsBox">
						<div class="reviewsWriteBg">
						</div>
						<div class="reviewsWriteBox">
							<div class="reviewsWriteWrap">
								<div class="close-iconWrap">
									<div class="close-icon">
										<div></div>
										<div></div>
									</div>
								</div>
								
								<h4>이용후기를 남겨주세요</h4>
								<p class="star_rating">
									<a href="#;">★</a>
									<a href="#;">★</a>
									<a href="#;">★</a>
									<a href="#;">★</a>
									<a href="#;">★</a>
								</p>
								<form action="reWrite.do" method="post" id="_frmForm">
									<ul>
										<li><textarea id="reviewsContent" name="content" wrap="VIRTUAL" placeholder="40자 이내로 작성해주세요"></textarea></li>
									</ul>
									
									<c:if test="${loginType ne null}">
										<c:if test="${loginType == 1 }">
											<input type="hidden" name="id" id="id" value="${login.id }">
										</c:if>
										<c:if test="${loginType == 4 }">
											<input type="hidden" name="id" id="id" value="${login_h.id }">
										</c:if>
									</c:if>
									
									 
									<input type="hidden" name="stars" id="stars">
									<input type="hidden" name="hos_seq" value="${hbbs.seq }">
									
									<div>
										<a href="#;" class="reviewsDoneBtn" id="_btnLogin">작성완료</a>
									</div>
								</form>
							</div>
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

<script type="text/javascript">
	$( ".star_rating a" ).click(function() {
	     $(this).parent().children("a").removeClass("onstars");
	     $(this).addClass("onstars").prevAll("a").addClass("onstars");
	     var getCount = $(".onstars").length;
	     $("#stars").attr("value", getCount);
	});
	
	$(document).ready(function() {
		$(".reviewsBox").hide();
	    $('#reviewsContent').on('keyup', function() {
	        if($(this).val().length > 40) {
	        	alert("40자 이내로 작성해주세요.");
	            $(this).val($(this).val().substring(0, 40));
	        }
	    });
	});
	
	$("#reviewsWriteBtn").click(function(){
		$(".reviewsBox").fadeIn("slow");
	});
	
	$(".close-icon").click(function(){
		$(".reviewsBox").fadeOut();
	});
	
	
	$("#_btnLogin").click(function() {  
		$("#_frmForm").attr({ "target":"_self", "action":"reWrite.do" }).submit();  
	});
	
	function goPage(pageNumber) {	
		$("#_pageNumber").val(pageNumber);
		var pn = $("#_pageNumber").val();
		var seq = $("#hbbsSeq").val();
		location.href="hbbsdetail.do?pageNumber="+pn+"&seq="+seq;
	}
	
</script>








