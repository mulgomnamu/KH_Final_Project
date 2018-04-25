<%@page import="kh.com.medi.model.MediMemberDto"%>
<%@page import="kh.com.medi.model.MediQnaBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<style>
.refresh_btn1 em:before {content:'';display:inline-block;position:absolute;top:50%; height:16px;margin-top:-8px;background:url('../images/main/icon_refresh.png') no-repeat;vertical-align:top;}
.list_table{
border-top: 1px solid black;
}
.list_table th {
background-color:#f4f5f8;
padding:22px 38px;
text-align: left;
border-bottom:1px solid #d9d9d9;
}
.list_table td {
padding-left:20px;
border-bottom:1px solid #d9d9d9;
height: 60px;
}
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
					<form name="frmForm" id="_frmForm" method="post">

					<table class="list_table" style="width:85%;">
					<tbody>	
						<tr class="id">
							<th>병원이름</th>
							<td style="text-align: left">
								<span class="form-text">
								<label for="board_writer" class="placeholder"></label>
								<input type="text" id="board_writer" name="whos_name" readonly="readonly" value='${hdto.medimember_hdto.name}' style="width:158px; "/>
								</span>
								
							</td>
						</tr>
						
						<tr>
							<th>답변내용</th>
							<td style="text-align: left">
								<textarea style="margin: 10px 0 10px 0;" rows="10" cols="50" name='content' id="_content"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="height:50px; text-align:center;">
								<span>					
								<a href="#none" id="_btnLogin" class="btn-type02 btn-search refresh_btn1" style="cursor: pointer; width: 140px; margin: 20px;"><em style="padding:0px;">작성완료</em></a>
								</span>
							</td>
						</tr>
					</tbody>
					
					</table>
					<input type="hidden" name="ans_seq" value="${hdto.ans_seq}">
					<input type="hidden" name="hos_seq" value="${hdto.medimember_hdto.seq}">
					<input type="hidden" name="parent" value="${parent}">
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
$("#_btnLogin").click(function() {	
	/* alert('글작성'); */	
	if($("#_title").val()==""){
		alert("제목을 입력해주세요");
	}else if($("#_content").val()==""){
		alert("질문내용을 입력해주세요");
	}else{
		$("#_frmForm").attr({ "target":"_self", "action":"answerwriteAf.do" }).submit();	
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