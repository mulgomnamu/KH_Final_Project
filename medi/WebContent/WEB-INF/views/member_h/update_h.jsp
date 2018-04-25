<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

.tableWrap tr{border-bottom:1px solid #d9d9d9;}
.tableWrap tr:first-child{border-top:3px solid #d9d9d9;}
.tableWrap th{text-align:left;}

</style>

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
				
					<c:set var="addr" value="${fn:split(dto_h.address,'+') }"/>
					<c:set var="address1" value="${addr[0] }"/>
					<c:set var="address2" value="${addr[1] }"/>
					
					<form action="join_hAf" id="_form" name="_form" method="post">
						<input type="hidden" name="seq" value="${dto_h.seq }">
						<table class="tableWrap">
							<col width="200px"><col width="">
							<tr>
								<th>
									<span></span>아이디
								</th>
								<td>
									<input type="text" id="id" name="id" readonly="readonly" value="${dto_h.id }">
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
									<input type="text" id="name" name="name" onkeyup="nameCheckFunction()" value="${dto_h.name }" placeholder="병원 이름을 입력하세요">
									<h5 style="color: red;" id="nameCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<th>
									대표 전화번호
								</th>
								<td>
									<input type="tel" id="tel" name="tel" onkeyup="telCheckFunction()" value="${dto_h.tel }" required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}">
									<span class="validity"></span>
									<h5 style="color: red;" id="telCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<th>
									주소
								</th>
								<td>
									<input type="text" id="post" name="post" value="${dto_h.post }" placeholder="우편번호">
									<input type="button" onclick="btnPost()" value="우편번호 찾기"><br>
									<input type="text" id="address1" value="${address1 }" placeholder="주소">
									<input type="text" id="address2" value="${address2 }" onkeyup="addressCheckFunction()" placeholder="상세주소">
									<input type="hidden" name="address" id="address" value="${dto_h.address }">
									<h5 style="color: red;" id="addressCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<th>
									이메일
								</th>
								<td>
									<input type="text" id="email" name="email" value="${dto_h.email }" onkeyup="emailCheckFunction()" placeholder="이메일을 입력하세요">
									<h5 style="color: red;" id="emailCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<td>
									병원 소개
								</td>
								<td>
									<textarea id="info" onkeyup="infoCheckFunction()" name="info"><c:out value="${dto_h.info }"></c:out></textarea>
									<h5 style="color: red;" id="infoCheckMessage" align="left"></h5>
								</td>
							</tr>
						</table>
					</form>
					<input type="button" id="join_hBtn" value="회원가입">
				
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>

<script>
	var pwdCheck = 0;
	var addressCheck = 0;
	var infoCheck = 0;
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

/* address1 address2 합치기 */
$(function() {
	$("#address2").blur(function() {
		var address1 = $("#address1").val();
		var address2 = $("#address2").val();
		$("#address").val(address1+"+"+address2);
	});
});

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

/* submit */
$("#join_hBtn").click(function() {
	var data = {
			pwd: $("#pwd").val(),
			pwd2: $("#pwd2").val(),
			name: $("#name").val(),
			tel: $("#tel").val(),
			address2: $("#address2").val(),
			email: $("#email").val(),
			info: $("#info").val(),
	}

	if(pwdCheck == 0 || data.pwd == "" || data.pwd2 == ""){
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
	}else if(data.info == ""){
		$("#infoCheckMessage").html("병원 소개 글을 확인해주세요.");
		$("#info").focus();
	}else{
		var form = new FormData(document.getElementById('_form'));
		$.ajax({
			url: 'update_h.do',
			data: form,
			type: 'post',
			success: function(response) {
				alert('회원수정 성공');
				location.href ="main.do";
			}
		});

	}
});
</script>