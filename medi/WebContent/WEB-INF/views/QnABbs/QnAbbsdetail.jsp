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
				<h2>글 확인 </h2>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
					<form name="frmForm" id="_frmForm" method="post" action="bbsupdate.do">

					<table class="list_table" style="width:85%;">
					
					<input type="hidden" name="seq" id="seq" value="${bbs.seq}"/>
					<input type="hidden" name="question" id="question" value="${bbs.question}"/>
					<input type="hidden" name="rock" id="rock" value="${bbs.rock}"/>
					<input type="hidden" name="memchoice" id="memchoice" value="${bbs.memchoice}"/>
					<colgroup>
					<col style="width:200px;" />
					<col style="width:auto;" />
					</colgroup>
					
					<tbody>	
						<tr>
							<th>말머리</th>
							<td style="text-align: left">${bbs.question}</td>
						</tr>
						<tr>
							<th>제목</th>
							<td style="text-align: left">${bbs.title}</td>
						</tr>
						<tr>
							<th>작성일</th>
							<td style="text-align: left">${bbs.wdate}</td>
						</tr>
						<tr class="id">
							<th>아이디</th>
							<td style="text-align: left">${bbs.id}</td>
						</tr>
						<tr>
							<th>내용</th>
							<td style="text-align: left">
							<textarea readonly="readonly" style="resize: none; margin: 10px 0;" rows="10" cols="50" 
							name='content' id="_content">${bbs.content}</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="height:50px; text-align:center;">
							<span>
								<c:if test="${(bbs.id eq login.id) || (bbs.id eq login_h.id)}">
								<a href="#none" id="_btnUpdate" class="btn-type02 btn-search refresh_btn1" style="cursor: pointer; width: 140px; margin: 20px;"><em style="padding:0px;">수정하기</em></a>
								<a href="#none" id="_btnDelete" class="btn-type02 btn-search refresh_btn1" style="cursor: pointer; width: 140px;  margin: 20px;"><em style="padding:0px;">삭제하기</em></a>
								</c:if>
								<c:if test="${login.auth eq 2}">
								<a href="#none" id="_btnReply"  class="btn-type02 btn-search refresh_btn1" style="cursor: pointer; width: 140px; margin: 20px;"><em style="padding:0px;">답글달기</em></a>
								</c:if>
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

$("#_btnUpdate").click(function() {	
	//alert('글수정하기');		
	$("#_frmForm").attr({ "target":"_self", "action":"QnabbsUpdate.do" }).submit();
});
$("#_btnDelete").click(function() {	
	//alert('글수정하기');		
	$("#_frmForm").attr({ "target":"_self", "action":"QnabbsDelete.do" }).submit();
});
$("#_btnReply").click(function() {	
	/* alert('답글달기');	 */
	$("#_frmForm").attr({ "target":"_self", "action":"Qnabbsreply.do?rock=${bbs.rock}" }).submit();
});

</script>





