<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/login.css"/> 

<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login" style="background-color: #f4f5f9;"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>로그인</h2>
				<em>홈페이지의 다양한 정보와 맞춤 서비스를 이용하시려면 로그인이 필요합니다.</em>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
				<div style="height: 300px">
				<form action="loginAf.do" name="frmForm" id="_frmForm" method="post"> 
					 <span class="form-text" style="margin-bottom: 28px;">
                        <label class="placeholder" for="id">아이디</label>
                        <input type="text" id="_userid" name="id" value="" size="15" title="아이디" style="border:1px solid #dddddd;">
                	 </span>
					<span class="form-text"style="margin-bottom:20px;">
                     	<label class="placeholder" for="id">비밀번호</label>
                        <input type="text" id="_pwd" name="pwd" value="" size="15" title="비밀번호" style="border:1px solid #dddddd;">
               	 	</span>
               	 	<span>
						<input type="radio" name="rBtnLoginType" checked="checked" value="2">
						<span style="margin-right: 5%;">일반 회원</span>
						<input type="radio" name="rBtnLoginType" value="4">병원 회원
					</span>
				</form>
				<div class="btn_login">
					<a href="#none" id="_btnLogin" title="로그인" class="btn-type01" style="display: block; width: 130px;height: 107px;">
						<em style="margin-top: 20px;">로그인</em>
					</a>
				</div>
				<div class="accountro">
				<strong>아직 회원이 아니신가요?</strong><br><br>
				회원이 되시면 홈페이지에서 제공하는 <br>온라인 서비스를 이용하실 수 있습니다.<br><br>
				<a href="#none" id="_btnRegi1" title="회원가입">>>회원가입</a>
				</div>
				</div>
				
				<!-- 이부분에 컨텐츠 끝 -->
				</div>
			</div>
		</section>
		<div class="inner_flogin" style="background-color: #f4f5f9;">
		<div class="findarea">
			<table class="findselect">	
			<tbody>
				<tr>
					<th><strong>사용자의 아이디와 비밀번호가 기억나지 않으세요?</strong></th>
					<th><strong>관계자의 아이디와 비밀번호가 기억나지 않으세요?</strong></th>
				</tr>
				<tr>
					<td>간단한 인증 및 질문답변으로<br>아이디를 확인하실 수 있습니다.
					</td>
					<td>휴대폰, 아이핀, 이메일 인증을 통해<br>신규비밀번호로 사이트를 이용하실 수 있습니다.
					</td>
				</tr>
				<tr>
					<td>
					<a href="memberIdPwFind.do" id="_btnRegi1" title="ID찾기">
								>>ID/PW찾기
					</a>
					</td>
					<td>
					<a href="#" id="_btnRegi1" title="ID찾기">
								>>ID/PW찾기
					</a>
					</td>
				</tr>
			</tbody>
		
		</table>
		</div>
	</div>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>

<script type="text/javascript"> 
var message = '${msg}'; 
var returnUrl = '${url}'; 
if(message != ""){
	alert(message);	
}
</script>

<script type="text/javascript">
$("#_btnLogin").click(function() {
	if($("#_userid").val() == ""){
		alert($("#_userid").attr("data-msg") + " 입력해 주십시오" );
		$("#_userid").focus();
	} else if($("#_pwd").val() == ""){
		alert($("#_pwd").attr("data-msg") + " 입력해 주십시오" );
		$("#_pwd").focus();
	} else{
		$("#_frmForm").attr("target", "_self").submit();
	}	
});


$("#_btnRegi").click(function() {
	location.href = "joinMember.do";
});

$("#_btnRegi1").click(function() {
	location.href = "joinMember.do";
});

$("#_userid").keypress(function(event) {
	if(event.which == "13"){
		event.preventDefault();
		$("#_pwd").focus();
	}
});

$("#_pwd").keypress(function() {
	if(event.which == "13"){
		event.preventDefault();
		$("#_btnLogin").click();
	}
});

// id저장
var user_id = $.cookie("user_id");
if(user_id != null){
	$("#_userid").val(user_id);
	$("#_chk_save_id").attr("checked", "checked");
}

$("#_chk_save_id").click(function() {		
	if($('input:checkbox[id="_chk_save_id"]').is(":checked")){
		if($("#_userid").val() == ""){
			$(this).prop("checked", false);
			alert("아이디를 입력해 주십시오");
		}else{
			$.cookie("user_id", $("#_userid").val(), { expires: 7, path: '/' });
		}		
	}else{
		$.removeCookie("user_id", { path:'/' });
	}
});
</script>




