<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 로그인 처리 -->
<c:if test="${empty login_h }">
	<script type="text/javascript">
	alert("로그인후이용가능합니다");
	location.href='main.do';
	</script>
</c:if>
<c:if test="${loginType ne 4 }">
	<script type="text/javascript">
	alert("병원회원만 가능한 공간입니다");
	location.href='main.do';
	</script>
</c:if>

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
				
					<form action="">
						<table>
							<tr>
								<td>
									현재 비밀번호
								</td>
								<td>
									<input type="password" id="pwdBf" placeholder="현재 비밀번호를 입력하세요">
								</td>
							</tr>
							<tr>
								<td>
									수정 할 비밀번호
								</td>
								<td>
									<input type="hidden" id="id" name="id" value="${login_h.id }">
									<input type="password" id="pwdAf1" onkeyup="pwdCheckFunction();" placeholder="수정할 비밀번호를 입력하세요" >
									<h5 style="color: red;" id="pwdCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<td>
									수정 할 비밀번호 확인
								</td>
								<td>
									<input type="password" id="pwdAf2" onkeyup="pwdCheckFunction2();" placeholder="수정할 비밀번호를 입력하세요">
									<h5 style="color: red;" id="pwdCheckMessage2" align="left"></h5>
								</td>
							</tr>
						</table>
					</form>
					<input type="button" id="btnChangePwd" value="수정하기">
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>


<script>
/* 비밀번호 유효성 확인 (문자, 숫자, 특수문자의 조합으로 6~16자리) */
	function pwdCheckFunction() {
		var id = $("#id").val();
		var pwd = $("#pwdAf1").val();
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
		var pwd1 = $("#pwdAf1").val();
		var pwd2 = $("#pwdAf2").val();
		if(pwd1 != pwd2){
			pwdCheck = 0;
			$("#pwdCheckMessage2").html("비밀번호가 서로 일치하지 않습니다.");
		}else{
			pwdCheck = 9;
			$("#pwdCheckMessage2").html("");
		}
	}

/* submit */
	$("#btnChangePwd").click(function() {
		var data = {
				id: $("#id").val(),
				pwd: $("#pwdBf").val(),
				pwd1: $("#pwdAf1").val(),
		};
		
		$.ajax({
			url: 'changePwd_h.do',
			data: data,
			dataType: 'text',
			type: 'post',
			success: function(response) {
				if(response == 0){
					alert("현재 비밀번호를 확인해주세요.");
					$("#pwdBf").focus();
				}else if(response == 1){
					alert("비밀번호 변경 성공");
					location.href = "myPage_h.do";
				}
			},
			error: function() {
				alert("비번 변경 실패");
			}
		});
	});
</script>