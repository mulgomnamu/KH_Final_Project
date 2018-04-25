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
.titlediv{
margin: 80px 0 20px 30px;
font-size: 10px;
}
.titlediv span:nth-child(1) {
font-size: 2em;font-weight: bold; margin-right: 15px;
}
.titlediv span:nth-child(2) {
font-size: 2.5em;font-weight: bold;
}
.contentdiv{
width: 972.4px;
margin-left: 30px;
}
.buttondiv{
width: 972.4px;
margin:30px 0 0 30px;
}
.selectbtn{
text-align: right;
}
#selected{
width:140px;
	padding:10px;
	margin:20px;
	color:#fff;
	background-color: #1f4bb4;
	}
</style>

<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
					<form name="frmForm" id="_frmForm" method="get">
					<input type="hidden" name="mem_seq" id="seq" value="${bbs.seq}"/><!-- 질문의seq -->
					<c:if test="${not empty login_h }">
					<input type="hidden" name="seq" id="seq1" value="${login_h.seq}"/><!-- 로그인한병원seq -->
					</c:if>
					<input type="hidden" name="category" id="category" value="${bbs.category}"/>
					<table class="list_table" style="width:85%;">
					<tbody>	
					 <c:set var="wid" value="${bbs.wid}"/>
						<tr>
						<td style="text-align: left">
						<div class="titlediv">
						<span>[${bbs.category}]</span>
						<span>${bbs.title}</span><br><br>
						<span>작성자&nbsp;&nbsp;${fn:substring(wid,0,1) }*****&nbsp;&nbsp;|&nbsp;&nbsp;</span>
						<span>${bbs.wdate}&nbsp;&nbsp;|&nbsp;&nbsp;조회수&nbsp;${bbs.readcount}</span>
						<hr style="margin-top: 20px;"><br>
						</div>
						<div class="contentdiv">
							<textarea readonly="readonly" style="resize: none;" rows="10" cols="50" 
							name='content' id="_content">${bbs.content}</textarea>
						</div>
						<div class="buttondiv">
						<c:if test="${bbs.wid eq login.id}">
						<a id="_btnUpdate" class="btn-type02 btn-search refresh_btn1" style="cursor: pointer; width: 140px; margin-right: 50px;"><em style="padding:0px;">수정하기</em></a>     		
				    	<a id="_btnDelete" class="btn-type02 btn-search refresh_btn1" style="cursor: pointer; width: 140px; margin-right: 50px;"><em style="padding:0px;">삭제하기</em></a>     		
						</c:if>
						<!-- auth 4로바꿔야함 -->
						<c:if test="${login_h.auth eq 4}">
						<a id="_btnReply" class="btn-type02 btn-search refresh_btn1" style="cursor: pointer; width: 140px;"><em style="padding:0px;">답글달기</em></a>
						</c:if>
						</div>
						</td>
						</tr>
					</tbody>
					</table>
					
					</form>
				<!-- 이부분에 답글 시작 -->
				<c:if test="${not empty answerlist }">
					<table>
						<c:forEach items="${answerlist}" var="ansbbs" varStatus="vs">
							<tr>
							<td id="uptext">
							<div class="titlediv">
							<span></span>
							<span>${ansbbs.whos_name}에서 답변한 글</span><br><br>
							<span style="margin-left: 20px;">${ansbbs.ans_wdate }&nbsp;&nbsp;|&nbsp;&nbsp;</span>
							<span>채택수&nbsp;${ansbbs.medimember_hdto.score }</span>
							<p class="selectbtn">
							<c:if test="${bbs.selectyn eq 0} ">	<!-- 채택아직안된글 -->
								<c:if test="${bbs.wid eq login.id }"><!-- 일반사용자가로그인했을때 -->
								<a href="#none" onclick="saveselected(${ansbbs.ans_seq },${ansbbs.hos_seq })" class="btn-type02 btn-search refresh_btn1" style="cursor: pointer; width: 140px; margin-right: 50px;"><em style="padding:0px;">채택하기</em></a>
								</c:if>
							</c:if>
							<c:if test="${bbs.selectyn eq 1 }">
								<c:if test="${ansbbs.ans_del eq 3}">
									<span class="btn-type02" style="width: 140px;background-color:#1f4bb4; margin-right: 50px;"><em style="padding:0px;">채택된글입니다</em></span>
								</c:if>
							</c:if>
							</p>
							<hr style="margin-top: 20px;"><br>
							</div>
							<div class="contentdiv">
							<textarea id='${ansbbs.ans_seq}' readonly="readonly" rows="10" cols="50"  style="resize: none;"> ${ansbbs.content}</textarea>
							</div>
							
							<td id="hh${ansbbs.ans_seq}" style="padding-top: 125px;">
							<c:if test="${ansbbs.hos_seq eq login_h.seq}"> 
							<c:if test="${ansbbs.ans_del eq 0}">
							<a href="#none" onclick="answerupdate(${ansbbs.ans_seq })" class="btn-type02 btn-search refresh_btn1" style="cursor: pointer; width: 140px; margin: 20px;"><em style="padding:0px;">답글수정하기</em></a>
							<a href="#none" onclick="answerdelete(${ansbbs.ans_seq })" class="btn-type02 btn-search refresh_btn1" style="cursor: pointer; width: 140px;  margin: 20px;"><em style="padding:0px;">답글삭제하기</em></a>
							</c:if>
							
							</c:if>
							<c:if test="${bbs.selectyn eq 1 }">
							<a href="#none" style="width: 140px; margin: 20px;display: block;"></a>
							</c:if>
							</td> 
							
							
							
							</tr>
						</c:forEach>
						
					</table>
					
				</c:if>
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>



<script type="text/javascript">
/* 동적으로 생성된 체크박스 한개만선택하게하기
    $('input[type="checkbox"][name="selectcheck"]').click(function(){
        //클릭 이벤트 발생한 요소가 체크 상태인 경우
        if ($(this).prop('checked')) {
            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
            $('input[type="checkbox"][name="selectcheck"]').prop('checked', false);
            $(this).prop('checked', true);
        }
        $("#_checked").val($(this).val());
    }); */
    function saveselected(seq,hos_seq) {
    	/* 
   			//답변에 del3으로바꿔주기위함 ->이용해서 컨트롤러에서 디테일받은다음에 
   			hos_seq로 변원스코어,
   			parent로 selectyn을 1로바꿔준다
    	*/
    	var data={
   				seq:seq,
   				hos_seq:hos_seq
   			};
    	$.ajax({
    		url : "saveselected.do",
    		data:data,
    		dataType : "json",
    		cache : false,
    		success : function(data) {
    			if (data.yn=="yesyes") {	//채택성공 - 체크박스다없애고 그자리에 채택된글이라고뜨게한다, 부모글에 selectyn바꿔주고 hospital score올려주기
    				alert("채택했습니다");
    				location.reload();
    			}else if(data.yn=="yes"){
    				alert("채택에실패했습니다.");
    			}else{
    				alert("채택에실패했습니다");
    			}
    			
    		}
    	}); 
	}

function answerupdate(answerseq) {
	$("#"+answerseq).removeAttr("readonly");
	$("#hh"+answerseq).html("");
	$("<a onclick='updateAf("+answerseq+")' class='btn-type02 btn-search refresh_btn1' style='cursor: pointer; width: 140px; margin: 20px;'><em style='padding:0px;'>수정완료</em></a>").css({
		'cursor':'pointer'
	}).appendTo("#hh"+answerseq); 
}
function updateAf(answerseq) {
	var data={
			ans_seq:answerseq,
			content:$("#"+answerseq).val()
	}
	$.ajax({
	url : "answerupdate.do",
	data:data,
	dataType : "json",
	cache : false,
	success : function(data) {
		if (data.yn=="yes") {	
			alert("답글수정성공했습니다");
			location.reload();
		}else{
			alert("수정 실패했습니다");
		}
		
	}
}); 
}
function answerdelete(answerseq) {
	$.ajax({
		url : "answerdelete.do",
		data:"seq="+answerseq,
		dataType : "json",
		cache : false,
		success : function(data) {
			if (data.yn=="yes") {	//채택성공 - 체크박스다없애고 그자리에 채택된글이라고뜨게한다, 부모글에 selectyn바꿔주고 hospital score올려주기
				alert("답글삭제성공");
				location.reload();
			}else{
				alert("답글삭제 실패했습니다");
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

