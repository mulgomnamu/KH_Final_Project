<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>Big hjh</h2>
				<em>ex) ㅇㅇㅇ 에 등록된 모든 병원의 정보를<br/>한눈에 보여드립니다</em>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				
					<form action="join_dAf" id="form_d" name="form_d" method="post" enctype="multipart/form-data">
						<table>
							<tr>
								<td>
									의사 이름
								</td>
								<td>
									<input type="text" id="name" name="name">
									<h5 style="color: red;" id="nameCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<td>
									진료 분야
								</td>
									
								<td>
									<table>
										<tr>
											<td>
												<div>				
													전체 진료과목
													<div>
														<select name="all_cl_sjt" id="all_cl_sjt" multiple="multiple" size="14" style="width:200px" onclick="click_select('all_cl_sjt');" ondblclick="append_cl();">
															<option value="갑상선클리닉">갑상선클리닉</option>
															<option value="결핵">결핵</option>
															<option value="고지혈증">고지혈증</option>
															<option value="만성비염">만성비염</option>
															<option value="무릎통증">무릎통증</option>
															<option value="물방울레이저">물방울레이저 치료</option>
															<option value="소아정신클리닉">소아정신클리닉</option>
															<option value="소화기내과">소화기내과</option>
															<option value="신장내과">신장내과</option>
															<option value="요로결석">요로결석</option>
															<option value="위장암/대장암/직장암">위장암/대장암/직장암</option>
															<option value="유방성형">유방성형</option>
															<option value="축농증">축농증</option>
															<option value="탈모/모발클리닉">탈모/모발클리닉</option>
															<option value="통증클리닉">통증클리닉</option>
															<option value="귀족수술">귀족수술</option>
															<option value="VBAC">VBAC</option>
															<option value="가족분만">가족분만</option>
															<option value="고혈압">고혈압</option>
															<option value="골다공증">골다공증</option>
															<option value="뇌졸중클리닉">뇌졸중클리닉</option>
															<option value="백내장/녹내장">백내장/녹내장</option>
															<option value="백반증/건선">백반증/건선</option>
															<option value="불임클리닉">불임클리닉</option>
															<option value="심장병">심장병</option>
															<option value="아토피클리닉">아토피클리닉</option>
															<option value="알레르기성 비염">알레르기성 비염</option>
															<option value="유방암">유방암</option>
															<option value="임플란트">임플란트</option>
															<option value="재활의학과">재활의학과</option>
															<option value="피부알레르기클리닉">피부알레르기클리닉</option>
															<option value="혈관질환">혈관질환</option>
															<option value="흰다리 교정">흰다리 교정</option>
															<option value="복강경수술">복강경수술</option>
															<option value="대장항문">대장항문</option>
															<option value="라식/라섹">라식/라섹</option>
															<option value="류마티스">류마티스</option>
															<option value="비만">비만</option>
															<option value="빈혈">빈혈</option>
															<option value="소아당뇨병">소아당뇨병</option>
															<option value="알코올클리닉">알코올클리닉</option>
															<option value="암">암</option>
															<option value="어지럼증클리닉">어지럼증클리닉</option>
															<option value="척추측만증">척추측만증</option>
															<option value="체형교정클리닉">체형교정클리닉</option>
															<option value="치아교정">치아교정</option>
															<option value="흉터 교정술">흉터 교정술</option>
															<option value="안면윤곽/사각턱">안면윤곽/사각턱</option>
															<option value="코/쌍꺼풀수술">코/쌍꺼풀수술</option>
															<option value="기타">기타</option>
														</select>
													</div>
												</div>
											</td>
											<td>
												<div class="pad_tp80l">					
													<br><input type="button" class="bg_blue" value="▶" onclick="append_cl();" style="width:25px;height:25px"><br><br>
													<input type="button" class="bg_blue" value="◀" onclick="remove_cl();" style="width:25px;height:25px">
												</div>
											</td>
											<td>
												<div>		
													선택한 진료과목
													<div>
														<select name="cl_sjt" id="cl_sjt" multiple="multiple" size="14" style="width:200px" onclick="click_select('cl_sjt');" ondblclick="remove_cl();">
														</select>
														<input type="hidden" name="specialty" id="cl_sjt_list">
													</div>
												</div>
											</td>
											<td>
												<div class="pad_tp80">
													<input type="button" class="bg_blue" value="▲" onclick="move_up();" style="width:25px;height:25px"><br><br>
													<input type="button" class="bg_blue" value="▼" onclick="move_down();" style="width:25px;height:25px">
												</div>
												<p class="clear"></p>
											</td>
										</tr>
										<tr>
											<td>
												<hr>
												진료분야 추가하기
											</td>
											<td>
												<input type="text" id="textAddsp">
											</td>
											<td>
												<input type="button" id="btnAddsp" onclick="add_cl();" value="추가하기">
											</td>
										</tr>
										<tr>
											<td>
												<h5 style="color: red;" id="spCheckMessage" align="left"></h5>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									진료 시간
								</td>
								<td>
									<table>
										<tr>
											<td>
												
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
												<input type="checkbox" value="일">일요일
											</td>
											<td>
												<select id="sun_sh" name="sun_sh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="sun_sm" name="sun_sm">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
											<td>
												<select id="sun_eh" name="sun_eh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="sun_em" name="sun_em">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
											<td>
												<select id="sun_lh" name="sun_lh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="sun_lm" name="sun_lm">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
										</tr>
<!-- 월요일 -->
										<tr>
											<td>
												<input type="checkbox" value="월">월요일
											</td>
											<td>
												<select id="mon_sh" name="mon_sh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="mon_sm" name="mon_sm">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
											<td>
												<select id="mon_eh" name="mon_eh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="mon_em" name="mon_em">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
											<td>
												<select id="mon_lh" name="mon_lh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="mon_lm" name="mon_lm">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
										</tr>
<!-- 화요일 -->
										<tr>
											<td>
												<input type="checkbox" value="화">화요일
											</td>
											<td>
												<select id="tue_sh" name="tue_sh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="tue_sm" name="tue_sm">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
											<td>
												<select id="tue_eh" name="tue_eh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="tue_em" name="tue_em">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
											<td>
												<select id="tue_lh" name="tue_lh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="tue_lm" name="tue_lm">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
										</tr>
<!-- 수요일 -->
										<tr>
											<td>
												<input type="checkbox" value="수">수요일
											</td>
											<td>
												<select id="wen_sh" name="wen_sh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="wen_sm" name="wen_sm">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
											<td>
												<select id="wen_eh" name="wen_eh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="wen_em" name="wen_em">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
											<td>
												<select id="wen_lh" name="wen_lh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="wen_lm" name="wen_lm">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
										</tr>
<!-- 목요일 -->
										<tr>
											<td>
												<input type="checkbox" value="목">목요일
											</td>
											<td>
												<select id="thur_sh" name="thur_sh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="thur_sm" name="thur_sm">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
											<td>
												<select id="thur_eh" name="thur_eh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="thur_em" name="thur_em">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
											<td>
												<select id="thur_lh" name="thur_lh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="thur_lm" name="thur_lm">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
										</tr>
<!-- 금요일 -->
										<tr>
											<td>
												<input type="checkbox" value="금">금요일
											</td>
											<td>
												<select id="fri_sh" name="fri_sh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="fri_sm" name="fri_sm">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
											<td>
												<select id="fri_eh" name="fri_eh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="fri_em" name="fri_em">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
											<td>
												<select id="fri_lh" name="fri_lh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="fri_lm" name="fri_lm">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
										</tr>
<!-- 토요일 -->
										<tr>
											<td>
												<input type="checkbox" value="토">토요일
											</td>
											<td>
												<select id="sat_sh" name="sat_sh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="sat_sm" name="sat_sm">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
											<td>
												<select id="sat_eh" name="sat_eh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="sat_em" name="sat_em">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
											<td>
												<select id="sat_lh" name="sat_lh">
													<option value="00">00</option>
													<c:forEach var="item" varStatus="i" begin="1" end="24" step="1">
														<option value="${item}">
															<c:if test="${item < 10}">
																0
															</c:if>
															<c:out value="${item}" />
														</option>
													</c:forEach>
												</select>
												:
												<select id="sat_lm" name="sat_lm">
													<option value="00">00</option>
													<option value="30">30</option>
												</select>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									의사 프로필 사진
								</td>
								<td>
									<input type="file" id="profile" name="profile">
									<h5 style="color: red;" id="profileCheckMessage" align="left"></h5>
								</td>
								<td>
									<div>
										<img id="preview" style="width: 130px; height: 200px;">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									의사 소개
								</td>
								<td>
									<textarea rows="10" cols="10" id="doc_content" name="doc_content"></textarea>
									<h5 style="color: red;" id="infoCheckMessage" align="left"></h5>
								</td>
							</tr>
						</table>
					</form>
					<input type="button" id="join_dBtn" value="회원가입">
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>

<script>
/* 없는 진료분야 추가 */
function add_cl() {
	var _text = document.getElementById("textAddsp").value;
	var box = document.getElementById("all_cl_sjt");
	
	box.options[box.length] = new Option(_text, _text);
	
	document.getElementById("textAddsp").value = "";
}

/*진료과목 추가*/
function append_cl() {
	var box = document.getElementById("cl_sjt");
	var oribox;
	oribox = document.getElementById("all_cl_sjt");

	for (i = oribox.length - 1; i >= 0 ; i--) {
		if (oribox.options[i].selected) {
			// 중복 체크
			for (j = 0; j < box.length; j++) {
				if (box.options[j].value == oribox.options[i].value) {
					alert("\""+oribox.options[i].text+"\"은 이미 추가되었습니다.");
					break;
				}
			}
			// 옵션 추가
			if (j == box.length) {
				box.options[box.length] = new Option(oribox.options[i].text, oribox.options[i].value);
			}
		}
	}
}

/*다른 쪽에 포커스가 갔을때 선택이 되어져있으면 해지 시킨다.*/
function click_select(select_name) {
	if (select_name != "cl_sjt") {
		document.getElementById("cl_sjt").selectedIndex = -1;
	}

	if (select_name != "all_cl_sjt") {
		document.getElementById("all_cl_sjt").selectedIndex = -1;
	}
}

/*진료과목 빼기*/
function remove_cl() {
	var box = document.getElementById("cl_sjt"); 
	var oribox;
	oribox = document.getElementById("all_cl_sjt");
	
	for (i = box.length - 1; i >= 0 ; i--) {
		if (box.options[i].selected) {
				box.options[i] = null;
		}
	}
}

/*삭제진료과목 체크 (진료과목을 선택한 의사가 있을때 오류 메시지를 낸다.*/
function remove_cl_final_notok(arg) {
	document.getElementById("cl_sjt").options[arg].selected = false;
	remove_cl();
}

/*삭제진료과목 체크(진료과목을 선택한 의사가 없을때 해당 과목을 삭제한다.)*/
function remove_cl_final_ok(arg) {
	var box = document.getElementById("cl_sjt");
	box.options[arg] = null;
	remove_cl();
}

/*진료과목 순서올리기*/
function move_up() {
	var box = document.getElementById("cl_sjt");
	for (i = 0; i < box.length ; i++) {
		if(i == 0) continue;
		if (box.options[i].selected && !box.options[i-1].selected) {
			swap_option(box, i, i-1);
		}
	}
}

/*진료과목 순서내리기*/
function move_down() {
	var box = document.getElementById("cl_sjt");
	for (i = box.length - 1; i >= 0 ; i--) {
		if(i == box.length - 1) continue;
		if (box.options[i].selected && !box.options[i+1].selected) {
			swap_option(box, i, i+1);
		}
	}
}

/*진료과목 순서정렬*/
function swap_option(target, swap_a, swap_b) {
	var temp_option = new Option(target.options[swap_a].text,target.options[swap_a].value,false,true);
	target[swap_a] = new Option(target.options[swap_b].text,target.options[swap_b].value);
	target[swap_b] = temp_option;
}

/* 의사 프로필 (단일)파일 업로드 제어 */
$(function() {
	$("#profile").change(function() {
		fileCheck($(this));
		addPreview($(this));
	});
});

function addPreview(input) {
	if(input[0].files){
		for(var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++){
			var file = input[0].files[fileIndex];
			var reader = new FileReader();
			
			reader.onload = function (img) {
				$("#preview").attr("src", img.target.result);
			};
		};
		reader.readAsDataURL(file);
	}else{
		alert("invalid faile input");
	}
}
function fileCheck() {
	if($("#profile").val() != ""){
		var ext = $("#profile").val().split(".").pop().toLowerCase();
		if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1){
			$("#profileCheckMessage").html("gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.");
			$("#profile").val("");
			return;
		}else{
			$("#profileCheckMessage").html("");
		}
	}
}

$("#join_dBtn").click(function() {
/* 선택한 진료과목 값 */
	var cl_list_str = "";
	var box = document.getElementById("cl_sjt");
	for(var i = 0; i < box.options.length; i++){
		if(i == cl_sjt.length - 1)
			cl_list_str=cl_list_str + box.options[i].value ;
		else
			cl_list_str=cl_list_str + box.options[i].value +",";
	}
	$("#cl_sjt_list").val(cl_list_str);
	
	
	var form = new FormData(document.getElementById('form_d'));
	$.ajax({
		url: 'join_dAf.do',
		data: form,
		dataType: 'text',
		processData: false,
		contentType: false,
		type: 'post',
		success: function(response) {
			if(response == 1){
				alert('회원가입 성공');
				location.href ="main.do";
			}else if(response == -1){
				alert('회원가입 실패');
			}else{
				alert(response);
			}
		},
		error: function(jqXHR) {
			alert('error');
		}
	});
});
</script>