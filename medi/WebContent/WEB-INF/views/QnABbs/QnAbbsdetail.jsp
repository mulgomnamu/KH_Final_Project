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
				<h2>글 확인 </h2>
				<em>불편사항이 있으면 관리자에게 문의를 해보세요.<br/>문제를 속시원히 해결해드립니다.</em>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
					<form name="frmForm" id="_frmForm" method="post" action="bbsupdate.do">

					<table class="list_table" style="width:85%;">
					
					<input type="hidden" name="seq" id="seq" value="${bbs.seq}"/>
					<input type="hidden" name="question" id="question" value="${bbs.question}"/>
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
							<td style="text-align: left"><textarea readonly="readonly" rows="10" cols="50" 
							name='content' id="_content">${bbs.content}</textarea></td>
						</tr>
						<tr>
							<td colspan="2" style="height:50px; text-align:center;">
							<span>
								<c:if test="${bbs.id eq login.id}">
									<a href="#none" id="_btnUpdate" title="글수정하기"><img src="images/Qnabbs/bupdate.png" alt="수정하기" /></a>
									<a href="#none" id="_btnDelete" title="글삭제하기"><img src="images/Qnabbs/del.png" alt="삭제하기" /></a>
								</c:if>
								<c:if test="${login.auth eq 1}">
									<a href="#none" id="_btnReply" title="답글달기"><img src="images/Qnabbs/breply.png" alt="답글달기" /></a>
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
	$("#_frmForm").attr({ "target":"_self", "action":"Qnabbsreply.do" }).submit();
});

</script>

