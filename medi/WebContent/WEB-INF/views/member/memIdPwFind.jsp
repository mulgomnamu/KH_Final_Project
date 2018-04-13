<%@page import="kh.com.medi.model.MediMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <script type="text/javascript" src="<c:url value='/js/jquery.1.9.1.min.js'/>"></script> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>



<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>ID/PW 찾기</h2>
				<em>아이디를 잊어버리셨나요? 국내에 거주중인 일반 회원은 휴대폰, 아이핀 인증을 통해서 확인 가능합니다.
						<br>(해외에 거주중인 외국인 회원의 경우 이메일 인증을 통해서 확인 가능합니다.)</em>
			</div>
			<!-- content 시작 -->
			<div class="content" align="center"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
				
				<label>NAME: </label>
				<input id="name" name="name" type="text" >
				<br>					
				<label>EMAIL: </label>
				<input id="email" name="email" type="text">
				<br>
				<!-- <input type="submit" value="ID찾기"> -->
				<button type="button" id="button">ID찾기</button>
				
				<br><br>
				<font id="check" size="4"></font>
				<br><br><br><br>
				
				<form action="pwdReset.do">
					<label>ID: </label>
					<input id="id" name="id" type="text" >
					<br>	
					<input type="submit" value="Id입력">
				</form>
				<br><br><br><br>
				
				
				
				<!-- 이부분에 컨텐츠 끝 -->
				</div>
			</div>
			
			
			
		</section>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	console.log("1");
    $('#button').click(function(){
    	console.log("2");
       
        var name = $('#name').val();
        var email = $('#email').val()
        console.log("name : " +name + "   email : " + email);
        var url = "idFind.do";
        $.ajax({
            type : "GET",
            url : url,
            data:{name:name, email:email},
            success : function(data) {
            	if(data == "no"){
            		$("#check").text("I don't looking for your ID, check your name or email");
            	}else{	
            		$("#check").text("Your  Id  is  '" + data+"' ");
            	}
            }
        }); 
     });
});
</script>