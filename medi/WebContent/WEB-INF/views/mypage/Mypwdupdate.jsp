<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript"
	src="<c:url value='/js/jquery.1.9.1.min.js'/>"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
div {
	margin-bottom: 10px;
	position: relative;
}

input[type="number"] {
	width: 100px;
}

input+span {
	padding-right: 30px;
}

input:invalid+span:after {
	position: absolute;
	content: '✖';
	padding-left: 5px;
	color: #8b0000;
}

input:valid+span:after {
	position: absolute;
	content: '✓';
	padding-left: 5px;
	color: #009000;
}
</style>

<div id="container" class="hospitalguide">
	<!-- 1뎁스명 클래스 -->
	<div class="login">
		<!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section"> <!-- #LOCATION --> <!-- sub타이틀 시작 -->
		<div class="title-type01">
			<h2>비밀번호수정</h2>
			<em>ex) ㅇㅇㅇ 에 등록된 모든 병원의 정보를<br />한눈에 보여드립니다
			</em>
		</div>
		<!-- content 시작 -->
		<div class="content">
			<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->

				<form action="MypwdupdateAf.do" method="post" name="wform"
					id="_frmForm">
					<table class="list_table" style="width: 85%;">

					
<tbody>
		<tr>
			<th>현재 비밀번호</th>
			<td style="text-align: left">
				<input size="30" type="password" style="border: 1px solid #ff0000;" name="pwd" maxlength="16">
			</td>
		</tr>	
		<tr>
			<th>수정 할 비밀번호</th>
			<td style="text-align: left">
				<input name="password1" type="password" class="form-control"
					id="password1" placeholder="password" required="" value="${my.pwd }"><font
					name="check1" size="2"></font><br>
			</td>
		</tr>
		<tr>
			<th>수정 할 비밀번호 확인</th>
			<td style="text-align: left">
			<input name="password2" type="password" class="form-control"
					id="password2" placeholder="password" required=""> <font
					name="check" size="2"></font> <br>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="height:50px; text-align:center;">
			<span>
			<a href="#none" id="_btnUpdate" title="비밀번호 수정" >비밀번호 수정</a>
			</span>
			</td>
		</tr>
		
		
		</tbody>
</table>
</form>
<script type="text/javascript">
$("#_btnUpdate").click(function() {
	alert('비밀번호 수정');
	$("#_frmForm").attr({ "target":"_self", "action":"MypwdupdateAf.do" }).submit();
});
</script>
	<script type="text/javascript">
					//동일 pwd 검사
					$(function() {
						$('#password1').keyup(function() {
							$('font[name=check]').text('');
						}); //#user_pass.keyup

						$('#password2')
								.keyup(
										function() {
											if ($('#password1').val() != $(
													'#password2').val()) {
												$('font[name=check]').html(
														"다시 입력해주세요.");
												$('font[name=check]').css(
														"color", "#ff0000");
											} else {
												$('font[name=check]').text('');
												$('font[name=check]').html(
														"동일합니다.");
												$('font[name=check]').css(
														"color", "#0000ff");
											}
										}); //#chpass.keyup
					});
				</script>

				<script type="text/javascript">
					//동일 pwd 검사
					$(function() {
						$('#_frmForm').mouseenter(
							function() {
								if ($('#password1').val() != $(
										'#password2').val()
										|| $("#result_id_msg")
												.prop("disabled")) {
									console.log("button 비활성화2");
									$("#_btnUpdate").attr(
											"disabled", true);
									$('#password1').text('');
									$('#password2').text('');
									return false;
								} else {
									console.log(" button 보임");
									$("#_btnUpdate").attr(
											"disabled", false);
									return true;
								}
							}); //#chpass.keyup
					});
				</script>

				<script type="text/javascript">
					$(function() {
						$('#password1')
								.keyup(
										function() {

											// 비밀번호(패스워드) 유효성 체크 (문자, 숫자, 특수문자의 조합으로 6~16자리)
											var ObjUserPassword = document.wform.password1;

											//if(ObjUserPassword.value != objUserPasswordRe.value)
											//{
											//  alert("입력하신 비밀번호와 비밀번호확인이 일치하지 않습니다");
											//  return false;
											//}

											if (ObjUserPassword.value.length < 6) {
												$('font[name=check1]')
														.html(
																"비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 사용하여 6~16자까지, 영문은 대소문자를 구분합니다.");
												$('font[name=check1]').css(
														"color", "#ff0000");
												/*  alert("비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 사용하여 6~16자까지, 영문은 대소문자를 구분합니다."); */
												return false;
											}

											if (!ObjUserPassword.value
													.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
												$('font[name=check1]')
														.html(
																"비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 사용하여 6~16자까지, 영문은 대소문자를 구분합니다.");
												$('font[name=check1]').css(
														"color", "#ff0000");
												/*  alert("비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 사용하여 6~16자까지, 영문은 대소문자를 구분합니다."); */
												return false;
											}

											//if(ObjUserID.value.indexOf(ObjUserPassword) > -1) {
											//  alert("비밀번호에 아이디를 사용할 수 없습니다.");
											//  return false;
											//}

											var SamePass_0 = 0; //동일문자 카운트
											var SamePass_1 = 0; //연속성(+) 카운드
											var SamePass_2 = 0; //연속성(-) 카운드
											var flag = 1;
											var flag1 = 1;
											for (var i = 0; i < ObjUserPassword.value.length; i++) {
												var chr_pass_0 = ObjUserPassword.value
														.charAt(i);
												var chr_pass_1 = ObjUserPassword.value
														.charAt(i + 1);

												//동일문자 카운트
												if (chr_pass_0 == chr_pass_1) {
													SamePass_0 = SamePass_0 + 1
												}

												var chr_pass_2 = ObjUserPassword.value
														.charAt(i + 2);

												//연속성(+) 카운드
												if (chr_pass_0.charCodeAt(0)
														- chr_pass_1
																.charCodeAt(0) == 1
														&& chr_pass_1
																.charCodeAt(0)
																- chr_pass_2
																		.charCodeAt(0) == 1) {
													SamePass_1 = SamePass_1 + 1
												}

												//연속성(-) 카운드
												if (chr_pass_0.charCodeAt(0)
														- chr_pass_1
																.charCodeAt(0) == -1
														&& chr_pass_1
																.charCodeAt(0)
																- chr_pass_2
																		.charCodeAt(0) == -1) {
													SamePass_2 = SamePass_2 + 1
												}
											}
											if (SamePass_0 > 1) {
												$('font[name=check1]')
														.html(
																"동일문자를 3번 이상 사용할 수 없습니다.");
												$('font[name=check1]').css(
														"color", "#ff0000");
												/* alert("동일문자를 3번 이상 사용할 수 없습니다."); */
												flag = 0;
												return false;
											}

											if (SamePass_1 > 1
													|| SamePass_2 > 1) {
												$('font[name=check1]')
														.html(
																"연속된 문자열(123 또는 321, abc, cba 등)을\n 3자 이상 사용 할 수 없습니다.");
												$('font[name=check1]').css(
														"color", "#ff0000");
												flag1 = 0;
												/* alert("연속된 문자열(123 또는 321, abc, cba 등)을\n 3자 이상 사용 할 수 없습니다."); */
												return false;
											}

											if ((flag == 1) && (flag1 == 1)) {
												$('font[name=check1]').html(
														"사용할 수 있습니다.");
												$('font[name=check1]').css(
														"color", "#0000ff");
												return true;
											}

											return true;
										});
					});
				</script>




				<!-- 이부분에 컨텐츠 끝 -->
			</div>
		</div>
		</section>
	</div>
	<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>