<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />


<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>관리자 페이지</h2>
				<em>의사 회원 목록</em>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				

					<div>
						<div>
							<form name="frmForm1" id="searchForm" method="post" action="">
								<table border="1px">
									<tr>
										<td>검색 : </td>
										<td>
											<select id="_s_category" name="s_category">
												<option value="" <c:if test="${s_keyword eq '' }">selected</c:if>>선택</option>
												<option value="specialty" <c:if test="${s_keyword ne '' and s_category eq 'specialty'}">selected</c:if>>진료분야</option>
												<option value="name" <c:if test="${s_keyword ne '' and s_category eq 'name'}">selected</c:if>>이름</option>			
											</select>
										</td>
										<td><input type="text" id="_s_keyword" name="s_keyword" value="${s_keyword}"/></td>
										<td><span><button type="button" id="searchBtn"> 검색 </button></span></td>
									</tr>
								</table>
								<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>						
								<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>
							</form>
						</div>
						<table class="list_table1">
							<tr>
								<th><input type="checkbox" id="allCheckBox"></th>
								<th>이름</th>
								<th>진료분야</th>
								<th>진료요일</th>
								<th>의사소개</th>
								<th>시간 수정</th>
								<th>수정</th>
							</tr>
							<c:forEach var="memberList" items="${loginList }">
								<tr>
									<td>
										<input type="checkbox" name="selectCheckBox" value="${memberList.seq }">
									</td>
									<td><span id="name${memberList.seq }">${memberList.name }</span></td>
									<td><span id="specialty${memberList.seq }">${memberList.specialty }</span></td>
									<td><span id="day_tostring${memberList.seq }">${memberList.day_tostring }</span></td>
									<td><span id="doc_content${memberList.seq }">${memberList.doc_content }</span></td>
									<td>
<!-- 의사 진료시간 수정 Modal -->
										<div id="updateScheduleModal${memberList.seq }" class="modal">
											<span><h3>${memberList.name }님 회원 정보</h3></span>
											<form action="#none" id="updateForm${memberList.seq }" method="post">
												<table>
													<tr>
														<td>
															<input type="checkbox" id="allCheckBox2" checked>
														</td>
														<td>
															진료 시작 시간
														</td>
														<td>
															진료 마감 시간
														</td>
														<td>
															식사 시간(1시간)
														</td>
													</tr>
			<!-- 일요일 -->
													<tr>
														<td>
															<input type="checkbox" id="sunCheckbox" name="list_day" value="일" <c:if test="${sun_sch.day eq '일' }">checked</c:if>>일요일
															<input type="hidden" id="sun_s_time" name="">
															<input type="hidden" id="sun_e_time" name="">
															<input type="hidden" id="sun_l_time" name="">
														</td>
														<td>
							 								<select id="sun_sh" name="sun_sh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${sun_sch.start_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="sun_sm" name="sun_sm">
																<option value="00" <c:if test="${sun_sch.start_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${sun_sch.start_min eq '30' }">selected</c:if>>30</option>
															</select> 
														</td>
														<td>
							 								<select id="sun_eh" name="sun_eh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${sun_sch.end_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="sun_em" name="sun_em">
																<option value="00" <c:if test="${sun_sch.end_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${sun_sch.end_min eq '30' }">selected</c:if>>30</option>
															</select>
														</td>
														<td>
							 								<select id="sun_lh" name="sun_lh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${sun_sch.lunch_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="sun_lm" name="sun_lm">
																<option value="00" <c:if test="${sun_sch.lunch_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${sun_sch.lunch_min eq '30' }">selected</c:if>>30</option>
															</select>
														</td>
													</tr>
			<!-- 월요일 -->
													<tr>
														<td>
															<input type="checkbox" id="monCheckbox" name="list_day" value="월" <c:if test="${mon_sch.day eq '월' }">checked</c:if>>월요일
															<input type="hidden" id="mon_s_time" name="">
															<input type="hidden" id="mon_e_time" name="">
															<input type="hidden" id="mon_l_time" name="">
														</td>
														<td>
							 								<select id="mon_sh" name="mon_sh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${mon_sch.start_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="mon_sm" name="mon_sm">
																<option value="00" <c:if test="${mon_sch.start_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${mon_sch.start_min eq '30' }">selected</c:if>>30</option>
															</select>
														</td>
														<td>
							 								<select id="mon_eh" name="mon_eh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${mon_sch.end_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="mon_em" name="mon_em">
																<option value="00" <c:if test="${mon_sch.end_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${mon_sch.end_min eq '30' }">selected</c:if>>30</option>
															</select>
														</td>
														<td>
							 								<select id="mon_lh" name="mon_lh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${mon_sch.lunch_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="mon_lm" name="mon_lm">
																<option value="00" <c:if test="${mon_sch.lunch_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${mon_sch.lunch_min eq '30' }">selected</c:if>>30</option>
															</select>
														</td>
													</tr>
			<!-- 화요일 -->
													<tr>
														<td>
															<input type="checkbox" id="tueCheckbox" name="list_day" value="화" <c:if test="${tue_sch.day eq '화' }">checked</c:if>>화요일
															<input type="hidden" id="tue_s_time" name="">
															<input type="hidden" id="tue_e_time" name="">
															<input type="hidden" id="tue_l_time" name="">
														</td>
														<td>
							 								<select id="tue_sh" name="tue_sh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${tue_sch.start_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="tue_sm" name="tue_sm">
																<option value="00" <c:if test="${tue_sch.start_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${tue_sch.start_min eq '00' }">selected</c:if>>30</option>
															</select>
														</td>
														<td>
							 								<select id="tue_eh" name="tue_eh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${tue_sch.end_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="tue_em" name="tue_em">
																<option value="00" <c:if test="${tue_sch.end_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${tue_sch.end_min eq '30' }">selected</c:if>>30</option>
															</select>
														</td>
														<td>
							 								<select id="tue_lh" name="tue_lh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${tue_sch.lunch_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="tue_lm" name="tue_lm">
																<option value="00" <c:if test="${tue_sch.lunch_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${tue_sch.lunch_min eq '30' }">selected</c:if>>30</option>
															</select>
														</td>
													</tr>
			<!-- 수요일 -->
													<tr>
														<td>
															<input type="checkbox" id="wenCheckbox" name="list_day" value="수" <c:if test="${wen_sch.day eq '수' }">checked</c:if>>수요일
															<input type="hidden" id="wen_s_time" name="">
															<input type="hidden" id="wen_e_time" name="">
															<input type="hidden" id="wen_l_time" name="">
														</td>
														<td>
							 								<select id="wen_sh" name="wen_sh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${wen_sch.start_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="wen_sm" name="wen_sm">
																<option value="00" <c:if test="${wen_sch.start_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${wen_sch.start_min eq '30' }">selected</c:if>>30</option>
															</select>
														</td>
														<td>
							 								<select id="wen_eh" name="wen_eh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${sun_sch.end_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="wen_em" name="wen_em">
																<option value="00" <c:if test="${wen_sch.end_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${wen_sch.end_min eq '30' }">selected</c:if>>30</option>
															</select>
														</td>
														<td>
							 								<select id="wen_lh" name="wen_lh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${wen_sch.lunch_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="wen_lm" name="wen_lm">
																<option value="00" <c:if test="${wen_sch.lunch_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${wen_sch.lunch_min eq '30' }">selected</c:if>>30</option>
															</select>
														</td>
													</tr>
			<!-- 목요일 -->
													<tr>
														<td>
															<input type="checkbox" id="thurCheckbox" name="list_day" value="목" <c:if test="${thur_sch.day eq '목' }">checked</c:if>>목요일
															<input type="hidden" id="thur_s_time" name="">
															<input type="hidden" id="thur_e_time" name="">
															<input type="hidden" id="thur_l_time" name="">
														</td>
														<td>
							 								<select id="thur_sh" name="thur_sh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${thur_sch.start_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="thur_sm" name="thur_sm">
																<option value="00" <c:if test="${thur_sch.start_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${thur_sch.start_min eq '30' }">selected</c:if>>30</option>
															</select>
														</td>
														<td>
							 								<select id="thur_eh" name="thur_eh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${thur_sch.end_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="thur_em" name="thur_em">
																<option value="00" <c:if test="${thur_sch.end_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${thur_sch.end_min eq '30' }">selected</c:if>>30</option>
															</select>
														</td>
														<td>
							 								<select id="thur_lh" name="thur_lh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${thur_sch.lunch_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="thur_lm" name="thur_lm">
																<option value="00" <c:if test="${thur_sch.lunch_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${thur_sch.lunch_min eq '30' }">selected</c:if>>30</option>
															</select>
														</td>
													</tr>
			<!-- 금요일 -->
													<tr>
														<td>
															<input type="checkbox" id="friCheckbox" name="list_day" value="금" <c:if test="${fri_sch.day eq '금' }">checked</c:if>>금요일
															<input type="hidden" id="fri_s_time" name="">
															<input type="hidden" id="fri_e_time" name="">
															<input type="hidden" id="fri_l_time" name="">
														</td>
														<td>
							 								<select id="fri_sh" name="fri_sh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${fri_sch.start_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="fri_sm" name="fri_sm">
																<option value="00" <c:if test="${fri_sch.start_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${fri_sch.start_min eq '30' }">selected</c:if>>30</option>
															</select>
														</td>
														<td>
							 								<select id="fri_eh" name="fri_eh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${fri_sch.end_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="fri_em" name="fri_em">
																<option value="00" <c:if test="${fri_sch.end_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${fri_sch.end_min eq '30' }">selected</c:if>>30</option>
															</select>
														</td>
														<td>
							 								<select id="fri_lh" name="fri_lh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${fri_sch.lunch_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="fri_lm" name="fri_lm">
																<option value="00" <c:if test="${fri_sch.lunch_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${fri_sch.lunch_min eq '00' }">selected</c:if>>30</option>
															</select>
														</td>
													</tr>
			<!-- 토요일 -->
													<tr>
														<td>
															<input type="checkbox" id="satCheckbox" name="list_day" value="토" <c:if test="${sat_sch.day eq '토' }">checked</c:if>>토요일
															<input type="hidden" id="sat_s_time" name="">
															<input type="hidden" id="sat_e_time" name="">
															<input type="hidden" id="sat_l_time" name="">
														</td>
														<td>
							 								<select id="sat_sh" name="sat_sh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${sat_sch.start_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="sat_sm" name="sat_sm">
																<option value="00" <c:if test="${sat_sch.start_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${sat_sch.start_min eq '30' }">selected</c:if>>30</option>
															</select>
														</td>
														<td>
							 								<select id="sat_eh" name="sat_eh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${sat_sch.end_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="sat_em" name="sat_em">
																<option value="00" <c:if test="${sat_sch.end_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${sat_sch.end_min eq '30' }">selected</c:if>>30</option>
															</select>
														</td>
														<td>
							 								<select id="sat_lh" name="sat_lh">
																<c:forEach begin="0" end="23" var="item">
																	<option value="${item}" <c:if test="${sun_sch.lunch_hour eq item }">selected</c:if>>
																		<fmt:formatNumber value="${item}" type="number" minIntegerDigits="2"/>
																	</option>
																</c:forEach>
															</select>
															:
															<select id="sat_lm" name="sat_lm">
																<option value="00" <c:if test="${sat_sch.lunch_min eq '00' }">selected</c:if>>00</option>
																<option value="30" <c:if test="${sat_sch.lunch_min eq '30' }">selected</c:if>>30</option>
															</select>
														</td>
													</tr>
												</table>
											</form>
											<button id="updateBtn" onclick="updateBtn(${memberList.seq });">수정</button>
										</div>
										
<!-- Link to open the modal -->
										<p><a href="#updateScheduleModal${memberList.seq }" rel="modal:open">수정</a></p>
									</td>
									<td>
<!-- 의사 정보 수정 Modal -->
										<div id="updateModal${memberList.seq }" class="modal">
											<span><h3>${memberList.name }님 회원 정보</h3></span>
											<form action="#none" id="updateForm${memberList.seq }" method="post">
												<table class="list_table1">
													<col width="100px"><col width="50px">
													<tr><th>이름</th><td><input type="text" name="name" value="${memberList.name }"><input type="hidden" name="seq" value="${memberList.seq }"></td></tr>
													<tr><th>진료분야</th><td><input type="text" name="specialty" value="${memberList.specialty }"></td></tr>
													<tr><th>진료요일</th><td><input type="text" name="day_tostring" value="${memberList.day_tostring }"></td></tr>
													<tr><th>의사소개</th><td><input type="text" name="doc_content" value="${memberList.doc_content }"></td></tr>
												</table>
											</form>
											<button id="updateBtn" onclick="updateBtn(${memberList.seq });">수정</button>
										</div>
										
<!-- Link to open the modal -->
										<p><a href="#updateModal${memberList.seq }" rel="modal:open">수정</a></p>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					
					<!-- 페이징 처리 -->
					<div id="paging_wrap">
						<jsp:include page="/WEB-INF/include/paging.jsp" flush="false">
							<jsp:param value="${s_category }" name="s_category"/>
							<jsp:param value="${s_keyword }" name="s_keyword"/>
							<jsp:param value="${pageNumber }" name="pageNumber"/>
							<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
							<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
							<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
						</jsp:include>
					</div>

				
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>

<script>
//검색
$("#searchBtn").click(function() {
	$("#_pageNumber").val("0");
	$("#searchForm").attr({ "target":"_self", "action":"adminDoctorList.do" }).submit();
});

//체크박스
$(function() {
	$("#allCheckBox").click(function() {
		if($("#allCheckBox").prop("checked")){
			$("input[name=selectCheckBox]").prop("checked", true);
		} else {
			$("input[name=selectCheckBox]").prop("checked", false);
		}
	});
});

//체크박스2
$(function() {
	$("#allCheckBox2").click(function() {
		if($("#allCheckBox2").prop("checked")){
			$("input[name=list_day]").prop("checked", true);
			alert($("#allCheckBox2").prop("checked"));
		} else {
			$("input[name=list_day]").prop("checked", false);
			alert($("#allCheckBox2").prop("checked"));
		}
	});
});

// 페이징
function goPage(pageNumber) {
	$("#_pageNumber").val(pageNumber) ;
	$("#searchForm").attr("target","_self").attr("action","adminDoctorList.do").submit();
}

// 회원 정보 수정
function updateBtn(seq) {
	var _updateForm = new FormData(document.getElementById("updateForm"+seq));
	$.ajax({
		url: 'updateDoctorByAdmin.do',
		data: _updateForm,
		processData: false,
		contentType: false,
		type: 'post',
		success: function(result) {
			$.modal.close();
			$("span[id=name"+seq+"]").text(result.name);
			$("span[id=specialty"+seq+"]").text(result.specialty);
			$("span[id=day_tostring"+seq+"]").text(result.day_tostring);
			$("span[id=doc_content"+seq+"]").text(result.doc_content);
		}
	});
}
</script>