<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>답글 달기 </h2>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
					<form name="frmForm" id="_frmForm" method="post" action="bbsreplyAf.do">
					<input type="hidden" name="seq" value="${bbs.seq}"/>
					<input type="hidden" name="question" value="${bbs.question}"/>
					<table class="list_table" style="width:85%;">
					<colgroup>
					<col style="width:200px;" />
					<col style="width:auto;" />
					</colgroup>
					
					<tbody>	
					
					<tr class="id">
						<th>아이디</th>
						<td style="text-align: left"><input type="text" name="id" readonly="readonly" 
						value='${login.id}' size="60"/></td>
					</tr>
					<tr>
						<th>제목</th>
						<td style="text-align: left"><input type="text" name="title" size="60"/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td style="text-align: left">
							<textarea rows="10" cols="50" name='content' id="_content"></textarea>
						</td>
					</tr>
					<tr>
					<td colspan="2" style="height:50px; text-align:center;">
						<span>
						<a href="#none" id="_btnReply" title="답글달기"><img src="images/Qnabbs/breply.png" alt="답글달기" /></a>
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



<script type="text/javascript">

$("#_btnReply").click(function() {	
	/* alert('답글달기');	 */
	$("#_frmForm").attr({ "target":"_self", "action":"QnabbsreplyAf.do" }).submit();
});
</script>

