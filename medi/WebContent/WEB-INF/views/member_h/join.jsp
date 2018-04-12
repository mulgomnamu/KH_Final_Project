<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<style type="text/css">
div {
  margin-bottom: 10px;
  position: relative;
}

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

</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
<!-- SUB SECTION -->
		<section id="sub_section">
<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>병원 회원가입</h2>
				<em>병원 회원가입입니다.</em>
			</div>
<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
					<form action="#none" id="_form" name="_form" method="post" enctype="multipart/form-data">
						<table>
							<tr>
								<td>
									아이디
								</td>
								<td>
									<input type="text" id="id" name="id" onkeyup="idCheckFunction()" placeholder="아이디를 입력하세요">
									<h5 style="color: red;" id="idCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<td>
									패스워드
								</td>
								<td>
									<input type="password" id="pwd" name="pwd" onkeyup="pwdCheckFunction()" placeholder="비밀번호를 입력하세요">
									<h5 style="color: red;" id="pwdCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<td>
									패스워드 확인
								</td>
								<td>
									<input type="password" id="pwd2" name="pwd2" onkeyup="pwdCheckFunction2()" placeholder="비밀번호를 입력하세요">
									<h5 style="color: red;" id="pwdCheckMessage2" align="left"></h5>
								</td>
							</tr>
							<tr>
								<td>
									병원명
								</td>
								<td>
									<input type="text" id="name" name="name" onkeyup="nameCheckFunction()" placeholder="병원 이름을 입력하세요">
									<h5 style="color: red;" id="nameCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<td>
									대표 전화번호
								</td>
								<td>
									<input type="tel" id="tel" name="tel" onkeyup="telCheckFunction()" required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}">
									<span class="validity"></span>
									<h5 style="color: red;" id="telCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<td>
									주소
								</td>
								<td>
									<input type="text" id="post" placeholder="우편번호">
									<input type="button" onclick="btnPost()" value="우편번호 찾기"><br>
									<input type="text" id="address1" placeholder="주소">
									<input type="text" id="address2" onkeyup="addressCheckFunction()" placeholder="상세주소">
									<input type="hidden" id="address" value="">
									<h5 style="color: red;" id="addressCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<td>
									이메일
								</td>
								<td>
									<input type="text" id="email" name="email" onkeyup="emailCheckFunction()" placeholder="이메일을 입력하세요">
									<h5 style="color: red;" id="emailCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<td>
									질문
								</td>
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
								<td>
									답변
								</td>
								<td>
									<input type="text" id="answer" onkeyup="answerCheckFunction()" name="answer" placeholder="답변을 입력하세요">
									<h5 style="color: red;" id="answerCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<td>
									의료 자격증
								</td>
								<td>
									<input type="file" id="confirm_img" name="confirm_img">
								</td>
							</tr>
							<tr>
								<td>
									병원 소개
								</td>
								<td>
									<textarea id="info" onkeyup="infoCheckFunction()" name="info"></textarea>
									<h5 style="color: red;" id="infoCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<td>
									병원 이미지 업로드
								</td>
								<td>
									<input type="text" id="image" name="imgae">
								</td>
							</tr>
						</table>
					</form>
					<input type="button" id="join_hBtn" value="회원가입">
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
/*/아이디 중복 확인 */

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
/* /비밀번호 유효성 확인 */

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
/*/비밀번호 확인 */

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
/* /우편번호  */

/* 이메일 유효성 확인 */
	function emailCheckFunction() {
		var email = $("#email").val();
		var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		if(!re.test(email)) {
			$("#emailCheckMessage").html("이메일 형식에 맞춰주세요");
		}else{
			$("#emailCheckMessage").html("");
		}
	}
/* /이메일 유효성 확인 */

/* submit 전 확인 */
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
		}
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
			$("#_form").attr({"target":"_self", "action":"join_hAf.do"}).submit();
		}	
	});
/*/submit 전 확인 */

/* 메시지 초기화 */
	function nameCheckFunction() {
		var name = $("#name").val();
		if(name != ""){
			$("#nameCheckMessage").html("");
		}
	}
	function telCheckFunction() {
		var tel = $("#tel").val();
		if(tel != ""){
			$("#telCheckMessage").html("");
		}
	}
	function addressCheckFunction() {
		var address = $("#address2").val();
		if(address != ""){
			$("#addressCheckMessage").html("");
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
/* 메시지 초기화 */


</script>