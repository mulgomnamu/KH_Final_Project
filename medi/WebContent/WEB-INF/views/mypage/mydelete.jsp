<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>탈퇴 하시겠습니까?</h2>
				
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
					<form action="MydeleteAf.do" name="frmForm" id="_frmForm" method="post">
						<table class="content_table" style="width:75%">
							<colgroup>
								<col style="width:30%">
								<col style="width:70%">
							</colgroup>
							<tbody>
								<tr>
									<th style="background: #eeeeee; color: #3e5fba;">아이디</th>
									<td>&nbsp;
										<input type="text" id="_userid" name="id" value="" data-msg="ID를" size="15" title="아이디" style="border:1px solid #dddddd;">

									</td>
								</tr>
								
								<tr>
									<th style="background: #eeeeee; color: #3e5fba;">비밀번호</th>
									<td>&nbsp;
										<input type="password" id="_pwd" name="pwd" value="" data-msg="PWD를" size="15" title="비밀번호" style="border:1px solid #dddddd;">
									</td>
								</tr>
								
								<tr>
									<td colspan="2" style="height:50px; text-align:center;">
										<span>
											<a href="#none" id="_btnLogin" title="로그인">
												<img alt="로그인" src="image/login_btn.jpg">
											</a>
										</span>
									</td>
								</tr>
							</tbody>
						
						</table>
					</form>
					
					<table  style="width:75%">
							
							<tbody>
								<tr>
									<th style="background: #eeeeee; color: #3e5fba;">아직 회원이 아니신가요?</th>
									<th style="background: #eeeeee; color: #3e5fba;">아이디가 기억나지 않으세요?</th>
									<th style="background: #eeeeee; color: #3e5fba;">비밀번호가 기억나지 않으세요?</th>
									
									
								</tr>
								
								<tr>
									<td>&nbsp;
										회원이 되시면 홈페이지에서 제공하는 <br>온라인 서비스를 이용하실 수 있습니다.
									</td>
									<td>&nbsp;
										휴대폰, 아이핀, 이메일 인증을 통해<br>아이디를 확인하실 수 있습니다.
									</td>
									<td>&nbsp;
										휴대폰, 아이핀, 이메일 인증을 통해<br>신규비밀번호로 사이트를 이용하실 수 있습니다.
									</td>
									
								</tr>
								
								<tr>

									<td>
									<a href="memberIdPwFind.do" id="_btnRegi1" title="ID찾기">
												>>ID찾기
									</a>
									</td>
									<td>
									>>PW찾기
									</td>
								</tr>
							</tbody>
						
						</table>
	
				<!-- 이부분에 컨텐츠 끝 -->
				</div>
			</div>
		</section>
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

$("#_btnLogin").click(function() {
	if($("#_pwd").val() == ""){
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

</script>
