<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<style type="text/css">.thumb-image{float:left;width:100px;position:relative;padding:5px;}/* .selectedItem{border:2px solid blue;} */</style>

<style type="text/css">
/* div {
	margin-bottom: 10px;
	position: relative;
} */

input[type="number"] {
	width: 100px;
}

input + span {
	padding-right: 30px;
}

input:invalid + span:after {
	position: absolute;
	content: "✖";
	padding-left: 5px;
	color: #8b0000;
}

input:valid + span:after {
	position: absolute;
	content: "✓";
	padding-left: 5px;
	color: #009000;
}

.tableWrap tr{
	border-top:1px solid #d9d9d9;
	border-bottom:1px solid #d9d9d9;
}
.tableWrap th{
	text-align:left;
	padding: 14px 38px;
	background-color: rgb(244, 245, 248)
}
.tableWrap td{
	border-left-width: 100px;
	padding: 14px 14px 14px 20px;
}
input select{
	border-width: 100px;
	padding: 8px 20px;
}
.bg_blue{padding:0 !important; font-size:12px;}
.updateBtn{width:180px; height:70px; line-height:70px; color:#fff; background-color:#1f4bb4; border-radius:5px; margin:40px auto 80px auto; display:block;}
</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
<!-- SUB SECTION -->
		<section id="sub_section">
<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>병원 회원가입</h2>
				<em>모든 항목을 자세히 적어주세요</em>
			</div>
<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
					<form action="join_hAf" id="_form" name="_form" method="post" enctype="multipart/form-data">
						<table class="tableWrap">
							<col width="200px"><col width="">
							<tr>
								<th>
									아이디
								</th>
								<td>
									<input type="text" id="id" name="id" onkeyup="idCheckFunction()" placeholder="아이디를 입력하세요">
									<h5 style="color: red;" id="idCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<th>
									패스워드
								</th>
								<td>
									<input type="password" id="pwd" name="pwd" onkeyup="pwdCheckFunction()" placeholder="비밀번호를 입력하세요">
									<h5 style="color: red;" id="pwdCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<th>
									패스워드 확인
								</th>
								<td>
									<input type="password" id="pwd2" name="pwd2" onkeyup="pwdCheckFunction2()" placeholder="비밀번호를 입력하세요">
									<h5 style="color: red;" id="pwdCheckMessage2" align="left"></h5>
								</td>
							</tr>
							<tr>
								<th>
									병원명
								</th>
								<td>
									<input type="text" id="name" name="name" onkeyup="nameCheckFunction()" placeholder="병원 이름을 입력하세요">
									<h5 style="color: red;" id="nameCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<th>
									대표 전화번호
								</th>
								<td>
									<input type="tel" id="tel" name="tel" onkeyup="telCheckFunction()" required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" placeholder="00-000-0000">
									<span class="validity"></span>
									<h5 style="color: red;" id="telCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<th>
									주소
								</th>
								<td>
									<input type="text" id="post" name="post" placeholder="우편번호" readonly="readonly">
									<input type="button" onclick="btnPost()" value="우편번호 찾기"><br>
									<input type="text" id="address1" placeholder="주소" readonly="readonly">
									<input type="text" id="address2" onkeyup="addressCheckFunction()" placeholder="상세주소">
									<input type="hidden" name="address" id="address" value="">
									<h5 style="color: red;" id="addressCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<th>
									이메일
								</th>
								<td>
									<input type="text" id="email" name="email" onkeyup="emailCheckFunction()" placeholder="이메일을 입력하세요">
									<h5 style="color: red;" id="emailCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<th>
									질문
								</th>
								<td>
									<select id="question" name="question">
										<option value="감명 깊게 읽은 책은?">감명 깊게 읽은 책은?</option>
										<option value="가장 가고 싶은 여행지는?">가장 가고 싶은 여행지는?</option>
										<option value="가장 기억나는 선생님은?">가장 기억나는 선생님은?</option>
										<option value="내가 가장 아끼는 보물 1호는?">내가 가장 아끼는 보물 1호는?</option>
										<option value="제일 감명깊게 본 영화는?">제일 감명깊게 본 영화는?</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>
									답변
								</th>
								<td>
									<input type="text" id="answer" onkeyup="answerCheckFunction()" name="answer" placeholder="답변을 입력하세요">
									<h5 style="color: red;" id="answerCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<th>
									의료 자격증
								</th>
								<td>
									<input type="file" id="upload" name="upload">
									<h5 style="color: red;" id="uploadCheckMessage" align="left"></h5>
								</td>
								<td>
									<div>
										<img id="preview" style="width: 130px; height: 200px;">
									</div>
								</td>
							</tr>
							<tr>
								<th>
									진료 분야
								</th>
									
								<td>
									<table>
										<tr>
											<td>
												<div align="center">				
													<b>전체 진료과목</b>
													<div style="margin-top: 10px">
														<select name="all_cl_sjt" id="all_cl_sjt" multiple="multiple" size="14" style="width:200px" onclick="click_select('all_cl_sjt');" ondblclick="append_cl();">
															<option value="내과">내과</option>
															<option value="치과">치과</option>
															<option value="소아청소년과">소아청소년과</option>
															<option value="산부인과">산부인과</option>
															<option value="산후조리원">산후조리원</option>
															<option value="조산원">조산원</option>
															<option value="이비인후과">이비인후과</option>
															<option value="안과">안과</option>
															<option value="피부과">피부과</option>
															<option value="비뇨기과">비뇨기과</option>
															<option value="신경정신과">신경정신과</option>
															<option value="외과">외과</option>
															<option value="정형외과">정형외과</option>
															<option value="성형외과">성형외과</option>
															<option value="신경외과">신경외과</option>
															<option value="항문외과">항문외과</option>
															<option value="흉부외과">흉부외과</option>
															<option value="한방">한방</option>
															<option value="한의원">한의원</option>
															<option value="가정의학과">가정의학과</option>
															<option value="재활의학과">재활의학과</option>
															<option value="노인전문">노인전문</option>
															<option value="치매">치매</option>
															<option value="통증클리닉">통증클리닉</option>
															<option value="방사선과">방사선과</option>
															<option value="마취과">마취과</option>
															<option value="결핵과">결핵과</option>
															<option value="임상병리과">임상병리과</option>
															<option value="알콜병원">알콜병원</option>
															<option value="일반">일반</option>
															<option value="종합">종합</option>
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
												<div align="center">		
													<b>선택한 진료과목</b>
													<div style="margin-top: 10px">
														<select name="cl_sjt" id="cl_sjt" multiple="multiple" size="14" style="width:200px" onclick="click_select('cl_sjt');" ondblclick="remove_cl();">
														</select>
														<input type="hidden" name="cl_sjt_list" id="cl_sjt_list">		
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
										<tr>
									</table>
								</td>
							</tr>
							<tr>
								<th>
									병원 소개
								</th>
								<td>
									<textarea id="info" onkeyup="infoCheckFunction()" name="info" rows="8"></textarea>
									<h5 style="color: red;" id="infoCheckMessage" align="left"></h5>
								</td>
							</tr>
						</table>
<!-- 					</form>
 					<form action="imgUploads.do" id="img_form" method="post" enctype="multipart/form-data"> 
 -->						<table class="tableWrap">
							<tr>
								<th>
									병원 이미지 업로드
								</th>
								<td class="input_fields_wrap">
<!-- 									<button class="add_image_field">파일 더 올리기</button><br> -->
									<input type="file" id="_upload" name="_upload" multiple>
<!-- 									<input type="button" id="btnDelete" value="delete"> -->
								</td>
								<td>
									<div id="image-holder">
									</div>
								</td>
							</tr>
						</table>
						</form>
					<input type="button" id="join_hBtn" value="회원가입" class="updateBtn">
				</div>
			</div>
<!-- 이부분에 컨텐츠 끝 -->
		</section>
	</div>
</div>

<script>
	var idCheck = 0;
	var pwdCheck = 0;
	var addressCheck = 0;
	var answerCheck = 0;
	var infoCheck = 0;

/* 아이디 중복 확인 */
	function idCheckFunction() {
		var id = $("#id").val();
		if(id != ""){
			$.ajax({
				type: 'post',
				url: 'checkId_h.do',
				data: {id: id},
				success: function(result) {
					if(result == "true"){
						idCheck = 0;
						$("#idCheckMessage").html("이미 사용중인 아이디입니다.");
					}else{
						idCheck = 9;
						$("#idCheckMessage").html("");
					}
				}
			});
		}
	}
	
/* 전화번호 중복 확인 */
	function telCheckFunction() {
		var tel = $("#tel").val();
		if(tel != ""){
			$.ajax({
				type: 'post',
				url: 'checkTel_h.do',
				data: {tel: tel},
				success: function(result) {
					if(result == "true"){
						telCheck = 0;
						$("#telCheckMessage").html("이미 사용중인 전화번호입니다.");
					}else{
						telCheck = 9;
						$("#telCheckMessage").html("");
					}
				}
			});
		}
	}
    
/* address1 address2 합치기 */
	function addressCheckFunction() {
		var address1 = $("#address1").val();
		var address2 = $("#address2").val();
		$("#address").val(address1+"+"+address2);
		addressCheckFunction1();
	}
	
/* 주소 중복 확인 */
	function addressCheckFunction1() {
		var address = $("#address").val();
		if(address != ""){
			$.ajax({
				type: 'post',
				url: 'checkAddress_h.do',
				data: {address: address},
				success: function(result) {
					if(result == "true"){
						addressCheck = 0;
						$("#addressCheckMessage").html("이미 사용중인 주소입니다.");
					}else{
						addressCheck = 9;
						$("#addressCheckMessage").html("");
					}
				}
			});
		}
	}
	
/* 이메일 중복 확인 */
	function emailCheckFunction1() {
		var email = $("#email").val();
		if(email != ""){
			$.ajax({
				type: 'post',
				url: 'checkEmail_h.do',
				data: {email: email},
				success: function(result) {
					if(result == "true"){
						emailCheck = 0;
						$("#emailCheckMessage").html("이미 사용중인 이메일입니다.");
					}else{
						emailCheck = 9;
						$("#emailCheckMessage").html("");
					}
				}
			});
		}
	}

/* 비밀번호 유효성 확인 (문자, 숫자, 특수문자의 조합으로 6~16자리) */
 	function pwdCheckFunction() {
		var id = $("#id").val();
		var pwd = $("#pwd").val();
		if(pwd != ""){
			var samePwd_0 = 0;
			var samePwd_1 = 0;
			var samePwd_2 = 0;
			for(var i = 0; i < pwd.length; i++){
				var charPwd_0 = pwd.charAt(i);
				var charPwd_1 = pwd.charAt(i + 1);
				var charPwd_2 = pwd.charAt(i + 2);
				
				if(charPwd_0 == charPwd_1){
					samePwd_0 = samePwd_0 + 1;
				}
				if(charPwd_0.charCodeAt(0) - charPwd_1.charCodeAt(0) == 1 && charPwd_1.charCodeAt(0) - charPwd_2.charCodeAt(0) == 1){
					samePwd_1 = samePwd_1 + 1;
				}
				if(charPwd_0.charCodeAt(0) - charPwd_1.charCodeAt(0) == -1 && charPwd_1.charCodeAt(0) - charPwd_2.charCodeAt(0) == -1){
					samePwd_2 = samePwd_2 + 1;
				}
			}
			if(pwd.length < 6){
				pwdCheck = 0;
				$("#pwdCheckMessage").html("비밀번호는 6자 이상이어야 합니다.");
			}else if(pwd.length > 16){
				pwdCheck = 0;
				$("#pwdCheckMessage").html("비밀번호는 16자 이하이어야 합니다.");
			}else if(samePwd_0 > 1){
				pwdCheck = 0;
				$("#pwdCheckMessage").html("비밀번호에 동일할 문자를 3번 이상 사용할 수 없습니다.");
			}else if(samePwd_1 > 1 || samePwd_2 > 1){
				pwdCheck = 0;
				$("#pwdCheckMessage").html("비밀번호에 연속된 문자열(123 또는 321, abc, cba 등)을 3자 이상 사용할 수 없습니다.");
			}else if(id == pwd){
				pwdCheck = 0;
				$("#pwdCheckMessage").html("비밀번호는 아이디와 같을 수 없습니다.");
			}else if(!pwd.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
				pwdCheck = 0;
				$("#pwdCheckMessage").html("비밀번호는 영문,숫자와 특수문자(!@#$%^&*?_~ 만 허용)를 포함해서 사용해 주세요.");
			}else{
				pwdCheck = 9;
				$("#pwdCheckMessage").html("");
			}
		}
	}
	
/* 비밀번호 확인 */
	function pwdCheckFunction2() {
		var pwd1 = $("#pwd").val();
		var pwd2 = $("#pwd2").val();
		if(pwd1 != pwd2){
			pwdCheck = 0;
			$("#pwdCheckMessage2").html("비밀번호가 서로 일치하지 않습니다.");
		}else{
			pwdCheck = 9;
			$("#pwdCheckMessage2").html("");
		}
	}
	
/* 우편번호 */
	function btnPost() {
    	new daum.Postcode({
            oncomplete: function(data) {
                var fullAddr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') {
                    fullAddr = data.roadAddress;
                } else {
                    fullAddr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                document.getElementById('post').value = data.zonecode;
                document.getElementById('address1').value = fullAddr;
                document.getElementById('address2').focus();
                addressCheck = 9;
            }
        }).open();
    }
	
/* 이메일 유효성 확인 */
	function emailCheckFunction() {
		var email = $("#email").val();
		var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		if(!re.test(email)) {
			$("#emailCheckMessage").html("이메일 형식에 맞춰주세요");
		}else{
			emailCheckFunction1();
			$("#emailCheckMessage").html("");
		}
	}
	
/* 의료 자격증 (단일)파일 업로드 제어 */
	$(function() {
		$("#upload").change(function() {
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
		if($("#upload").val() != ""){
			var ext = $("#upload").val().split(".").pop().toLowerCase();
			if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1){
				$("#uploadCheckMessage").html("gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.");
				$("#upload").val("");
				return;
			}else{
				$("#uploadCheckMessage").html("");
			}
		}
	}
	
/* 다중 파일 제어 */
	$(document).ready(function() {
        $("#_upload").on('change', function() {
          var countFiles = $(this)[0].files.length;
          var imgPath = $(this)[0].value;
          var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
          var image_holder = $("#image-holder");
          image_holder.empty();
          if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
            if (typeof(FileReader) != "undefined") {
              for (var i = 0; i < countFiles; i++) 
              {
                var reader = new FileReader();
                reader.onload = function(e) {
                  $("<img />", {
                    "src": e.target.result,
                    "class": "thumb-image"
                  }).appendTo(image_holder);
                }
                image_holder.show();
                reader.readAsDataURL($(this)[0].files[i]);
              }
            } else {
              alert("This browser does not support FileReader.");
            }
          } else {
            alert("Pls select only images");
          }
        });
      });
      
/* submit */
	$("#join_hBtn").click(function() {
		var data = {
				id: $("#id").val(),
				pwd: $("#pwd").val(),
				pwd2: $("#pwd2").val(),
				name: $("#name").val(),
				tel: $("#tel").val(),
				address2: $("#address2").val(),
				email: $("#email").val(),
				answer: $("#answer").val(),
				info: $("#info").val(),
		};

  		if(idCheck == 0 || data.id == ""){
			$("#idCheckMessage").html("아이디를 확인해주세요.");
			$("#id").focus();
		}else if(pwdCheck == 0 || data.pwd == "" || data.pwd2 == ""){
			$("#pwdCheckMessage").html("비밀번호를 확인해주세요.");
			$("#pwd").focus();
		}else if(data.name == ""){
			$("#nameCheckMessage").html("병원 이름을 확인해주세요.");
			$("#name").focus();
		}else if(data.tel == ""){
			$("#telCheckMessage").html("전화번호를 확인해주세요.");
			$("#tel").focus();
		}else if(addressCheck == 0 || data.address2 == ""){
			$("#addressCheckMessage").html("주소를 확인해주세요.");
			$("#address2").focus();
		}else if(data.email == ""){
			$("#emailCheckMessage").html("이메일을 확인해주세요.");
			$("#email").focus();
		}else if(data.answer == ""){
			$("#answerCheckMessage").html("질문-답변을 확인해주세요.");
			$("#answer").focus();
		}else if(data.info == ""){
			$("#infoCheckMessage").html("병원 소개 글을 확인해주세요.");
			$("#info").focus();
		}else{

			var cl_list_str = "";
			var box = document.getElementById("cl_sjt");
			for(var i = 0; i < box.options.length; i++){
				if(i == cl_sjt.length - 1)
					cl_list_str=cl_list_str + box.options[i].value ;
				else
					cl_list_str=cl_list_str + box.options[i].value +",";
			}
			$("#cl_sjt_list").val(cl_list_str);
			
			var form = new FormData(document.getElementById('_form'));
			$.ajax({
				url: 'join_hAf.do',
				data: form,
				dataType: 'text',
				processData: false,
				contentType: false,
				type: 'post',
				success: function(response) {
					alert('회원가입 성공');
					location.href ="join_d.do?hos_seq=" + response;
				}
			});

		}
	});
	
/* 메시지 초기화 */
	function nameCheckFunction() {
		var name = $("#name").val();
		if(name != ""){
			$("#nameCheckMessage").html("");
		}
	}
	function answerCheckFunction() {
		var answer = $("#answer").val();
		if(answer != ""){
			$("#answerCheckMessage").html("");
		}
	}
	function infoCheckFunction() {
		var info = $("#info").val();
		if(info != ""){
			$("#infoCheckMessage").html("");
		}
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


</script>