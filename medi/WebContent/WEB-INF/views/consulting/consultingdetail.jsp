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
				<h2>질문보기 </h2>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
					<form name="frmForm" id="_frmForm" method="post" action="bbsupdate.do">
					<input type="hidden" name="seq" id="seq" value="${bbs.seq}"/>
					<input type="hidden" name="category" id="category" value="${bbs.category}"/>
					<table class="list_table" style="width:85%;">
					
					
					<colgroup>
					<col style="width:200px;" />
					<col style="width:auto;" />
					</colgroup>
					
					<tbody>	
						<tr>
							<th>진료과목</th>
							<td style="text-align: left">${bbs.category}</td>
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
							 <c:set var="wid" value="${bbs.wid}"/>
							<td style="text-align: left">${fn:substring(wid,0,1) }*****</td>
						</tr>
						<tr>
							<th>내용</th>
							<td style="text-align: left"><textarea readonly="readonly" rows="10" cols="50" 
							name='content' id="_content">${bbs.content}</textarea></td>
						</tr>
						<tr>
							<td colspan="2" style="height:50px; text-align:center;">
							<span>
								<c:if test="${bbs.wid eq login.id}">
									<a href="#none" id="_btnUpdate" title="글수정하기"><img src="images/Qnabbs/bupdate.png" alt="수정하기" /></a>
									<a href="#none" id="_btnDelete" title="글삭제하기"><img src="images/Qnabbs/del.png" alt="삭제하기" /></a>
								</c:if>
								<%-- <c:if test="${login.auth eq 4}">
									<a href="#none" id="_btnReply" title="답글달기"><img src="images/Qnabbs/breply.png" alt="답글달기" /></a>
								</c:if> --%>
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
				<c:if test="${not empty answerlist }">
					<table>
						<tr>
							<th>답변내용</th><th>작성자</th><th>채택</th>
						</tr>
							<c:forEach items="${answerlist}" var="ansbbs" varStatus="vs">
								<tr>
								<td>${ansbbs.content }</td>
								<td>${ansbbs.whos_name }</td>
								<c:if test="${bbs.selectyn eq 1 }">
									<c:if test="${ansbbs.del eq 3}">
										<td>채택된글입니다</td>
									</c:if>
								</c:if>
								<c:if test="${bbs.selectyn eq 0}">
								<td><input type="checkbox" value="${ansbbs.seq }" name="selectcheck"></td>
								</c:if>
								</tr>
							</c:forEach>
						
					</table>
					<c:if test="${bbs.selectyn eq 0}">
					<div><input type="hidden" name="checked" id="_checked">
					<a href="#none" onclick="saveselected()">채택하기</a></div>
					</c:if>
					
				</c:if>
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>



<script type="text/javascript">
    $('input[type="checkbox"][name="selectcheck"]').click(function(){
        //클릭 이벤트 발생한 요소가 체크 상태인 경우
        if ($(this).prop('checked')) {
            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
            $('input[type="checkbox"][name="selectcheck"]').prop('checked', false);
            $(this).prop('checked', true);
        }
        $("#_checked").val($(this).val());
    });
    function saveselected() {
    	/* 
   			//답변에 del3으로바꿔주기위함 ->이용해서 컨트롤러에서 디테일받은다음에 
   			hos_seq로 변원스코어,
   			parent로 selectyn을 1로바꿔준다
    	*/
    	$.ajax({
    		url : "saveselected.do",
    		data:"seq="+$("input[name=selectcheck]:checked").val(),
    		dataType : "json",
    		cache : false,
    		success : function(data) {
    			if (data.yn=="yesyes") {	//채택성공 - 체크박스다없애고 그자리에 채택된글이라고뜨게한다, 부모글에 selectyn바꿔주고 hospital score올려주기
    				alert("성공");
    				location.reload();
    			}else if(data.yn=="yes"){
    				alert("채택에실패했습니다.");
    			}else{
    				alert("채택에실패했습니다");
    			}
    			
    		}
    	}); 
	}
$("#_btnUpdate").click(function() {	
	//alert('글수정하기');		
	$("#_frmForm").attr({ "target":"_self", "action":"consultingupdate.do" }).submit();
});
$("#_btnDelete").click(function() {	
	//alert('글수정하기');		
	$("#_frmForm").attr({ "target":"_self", "action":"consultingdelete.do" }).submit();
});
$("#_btnReply").click(function() {	
	/* alert('답글달기');	 */
	$("#_frmForm").attr({ "target":"_self", "action":"answerwrite.do" }).submit();
});

</script>

