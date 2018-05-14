<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/login.css"/> 

<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>비밀번호 확인</h2>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
				<div style="height: 300px">
					<form action="MyPageLoginAf.do" name="frmForm" id="_frmForm" method="post">
				 	<span class="form-text" style="margin-bottom: 28px;">
                        <label class="placeholder" for="id">아이디</label>
                        <input type="text" id="_userid" name="id" value="${login.id }" readonly="readonly" size="15" title="아이디" style="border:1px solid #dddddd;">
                	 </span>
                	 <span class="form-text"style="margin-bottom:20px;">
                     	<label class="placeholder" for="id">비밀번호</label>
                        <input type="text" id="_pwd" name="pwd" value="" size="15" title="비밀번호" style="border:1px solid #dddddd;">
               	 	</span>
               	 	</form>
					<div class="btn_login">
					<a href="#none" id="_btnLogin" title="로그인" class="btn-type01" style="display: block; width: 130px;height: 107px;">
						<em style="margin-top: 20px;">로그인</em>
					</a>
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
$("#_btnLogin").click(function() {
	if($("#_pwd").val() == ""){
		alert($("#_pwd").attr("data-msg") + " 입력해 주십시오" );
		$("#_pwd").focus();
	} else{
		$("#_frmForm").attr("target", "_self").submit();
	}	
});

var message = '${msg}'; 
var returnUrl = '${url}'; 
if(message != ""){
	alert(message);	
}


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