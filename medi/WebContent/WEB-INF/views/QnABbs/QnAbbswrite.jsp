<%@page import="kh.com.medi.model.MediMember_hDto"%>
<%@page import="kh.com.medi.model.MediMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/consulting.css?ver=1.02"/>
<style>
.refresh_btn1 em:before {content:'';display:inline-block;position:absolute;top:50%; height:16px;margin-top:-8px;background:url('../images/main/icon_refresh.png') no-repeat;vertical-align:top;}
</style>

<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
					<form name="frmForm" id="_frmForm" method="post" action="bbswriteAf.do">

					<table class="list_table" style="width:85%;">
					<colgroup>
					<col style="width:200px;" />
					<col style="width:auto;" />
					</colgroup>
					
					<tbody>	
						<tr class="id">
							<th>아이디</th>
							<td style="text-align: left">
								<c:if test="${login.auth eq 1}">
									<input type="text" name="id" id="id" value="${login.id}">
							 	</c:if>
							 	<c:if test="${login.auth eq 2}">
									<input type="text" name="id" id="id" value="${login.id}">
							 	</c:if>
							 	<c:if test="${login_h.auth eq 4}">
								  	<input type="text" name="id"  value='${login_h.id}' size="60"/>
							  	</c:if>
								
							</td>
						</tr>
						<tr class="id">
							<th>말머리 선택</th>
							<td style="text-align: left">
								<select id="question" name="question">
									<option value="질문선택">질문선택</option>
									<option value="버그문제">버그문제</option>
									<option value="신고">신고</option>
									<option value="의료사고">의료사고</option>
									<option value="개선사항">개선사항</option>	
									<option value="부당대우">부당대우</option>		
								 </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								 <input type="checkbox" id="check" name="check" value="check">
								 <span style="margin-right: 20px;">비밀번호 설정</span>
								 <input type="number" placeholder="숫자만 입력하세요"  id="rock" name="rock" disabled="disabled">
							</td>
						</tr>
						<tr>
							<th>제목</th>
								<td style="text-align: left">
								<span class="form-text">
									<input type="text" name="title" id="title" size="60"/>
									</span>
								</td>
						</tr>
						<tr>
							<th>내용</th>
							<td style="text-align: left">
								<textarea style="margin: 10px 0;" rows="10" cols="50" id="content" name='content' id="_content"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="height:50px; text-align:center;">
								<span>					
								<input type="hidden" name="loginType" id="loginType" value='${loginType}'>
								<span>					
								<a href="#none" id="_btnLogin" class="btn-type02 btn-search refresh_btn1" style="cursor: pointer; width: 140px; margin: 20px;"><em style="padding:0px;">작성완료</em></a>
								</span>
								</span>
							</td>
						</tr>
					</tbody>
					
					</table>
					
					</form>
				<!-- 이부분에 컨텐츠 끝 -->
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>
<br><br><br>


<script type="text/javascript">

var test1 = document.getElementById('check');
$(document).ready(function(){
	console.log("1");
    $('#check').click(function(){
       if($(test1).prop("checked")){
        	$("#rock").prop("disabled", false);
       }else{
    	   $("#rock").prop("disabled", true);
       }
    }); // end keyup
});

$("#_btnLogin").click(function() {	
	/* alert('글작성'); */	
	/* alert(document.getElementById("question").value); */
	if(document.getElementById("question").value == "질문선택" || !document.getElementById("title").value || !document.getElementById("content").value){
		alert("입력란에 기입해주세요.");
	}else{
		if((document.getElementById("rock").value.length < 4) && $(test1).prop("checked")){
			alert("비밀번호는 4자리 이상 입력해주세요");
		}else{
			$("#_frmForm").attr({ "target":"_self", "action":"QnabbsWriteAf.do" }).submit();	
		}
	}
	
});
</script>

<script type="text/javascript"> 
var message = '${msg}'; 
var returnUrl = '${url}'; 
if(message != ""){
	alert(message);	
}
</script>