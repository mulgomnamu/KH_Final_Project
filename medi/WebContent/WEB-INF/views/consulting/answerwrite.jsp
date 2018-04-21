<%@page import="kh.com.medi.model.MediMemberDto"%>
<%@page import="kh.com.medi.model.MediQnaBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>


<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>질문쓰기</h2>
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
								<input type="text" name="whos_name" readonly="readonly" value='${hdto.name}' size="60"/>
							</td>
						</tr>
						<tr class="id">
							<th>대표번호</th>
							<td style="text-align: left">
								<input type="text" style="letter-spacing: 3px;width: 40px; background-color: #f8f8f8;" name="phone" readonly="readonly" value='${hdto.tel }'/>
								
							</td>
						</tr>
						<tr>
							<th>답변내용</th>
							<td style="text-align: left">
								<textarea rows="10" cols="50" name='content' id="_content"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="height:50px; text-align:center;">
								<span>					
						 			<a href="#none" id="_btnLogin" title="글쓰기">		
										<img src="images/Qnabbs/bwrite.png" alt="로그인" />
									</a>
								</span>
							</td>
						</tr>
					</tbody>
					
					</table>
					<input type="hidden" name="seq" value="${hdto.seq}">
					<input type="hidden" name="hos_seq" value="${hdto.seq}">
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