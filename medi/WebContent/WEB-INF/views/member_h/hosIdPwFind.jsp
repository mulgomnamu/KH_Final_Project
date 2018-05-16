<%@page import="kh.com.medi.model.MediMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <script type="text/javascript" src="<c:url value='/js/jquery.1.9.1.min.js'/>"></script> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/consulting.css"/>

<style>
.refresh_btn1 em:before {content:'';display:inline-block;position:absolute;top:50%; height:16px;margin-top:-8px;background:url('../images/main/icon_refresh.png') no-repeat;vertical-align:top;}
div {
  position: relative;
}

input[type="number"] {
  width: 100px;
}

input + span {
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

.btn-type02{
	width: 180px;
    height: 70px;
    line-height: 70px;
    color: #fff;
    background-color: #1f4bb4;
    border-radius: 5px;
    margin: 40px auto 80px auto;
    display: block;
}
</style>

<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>ID 찾기</h2>
				<em>아이디를 잊어버리셨나요?<br>이름과 이메일 인증을 통해서 확인 가능합니다.</em>
			</div>
			<!-- content 시작 -->
			<div class="content" align="center"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
				<table class="list_table">
					<tbody>
					<tr>
						<th>이름 </th>
						<td><input id="name" name="name" type="text" style="border:1px solid #d9d9d9;"></td>
					</tr>
					<tr>
						<th>
							이메일
						</th>		
						<td><input id="email" name="email" type="text" style="border:1px solid #d9d9d9;"></td>
					</tr>
					<!-- <input type="submit" value="ID찾기"> -->
				</table>
				<button type="button" id="button" class="btn-type02">ID찾기</button>
				<br><br>
				<font id="check" size="4"></font>
				<br><br>
				<div class="title-type01">
					<h2>PW 찾기</h2>
					<em>비밀번호를 잊어버리셨나요?<br/>아이디를 통해서 이메일로 임시 비밀번호를 발급해 드립니다!</em>
				</div>
				<form action="hosPwdReset.do">
					<table class="list_table">
					<tbody>
					<tr>
						<th>아이디</th>
						<td><input id="id" name="id" type="text" style="border:1px solid #d9d9d9;"></td>
					</tr>
					</table>
					<input type="submit" value="PW찾기" class="btn-type02">
				</form>
				
				
				
				<!-- 이부분에 컨텐츠 끝 -->
				</div>
			</div>
			
			
			
		</section>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
    $('#button').click(function(){
        var name = $('#name').val();
        var email = $('#email').val();
        var url = "hosIdFind.do";
        $.ajax({
            type : "post",
            url : url,
            data:{name:name, email:email},
            success : function(data) {
            	if(data == "no"){
            		$("#check").text("I don't looking for your ID, check your name or email");
            	}else{	
            		$("#check").text("Your  Id  is  '" + data + "' ");
            	}
            }
        }); 
     });
});
</script>