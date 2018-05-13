<%@page import="kh.com.medi.model.MediMemberDto"%>
<%@page import="kh.com.medi.model.MediQnaBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" /> 
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 

<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>내 예약현황</h2>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
					<div class="searchwrap">
						<div class="searchbox" style="display: inline-block;position: relative;left: 300px;top: -1.8px;">
							<form name="frmForm1" id="_frmFormSearch" method="post" action="">
								<input type="hidden" name="s_category" value="day">
								<input type="hidden" name="seq" value="${login.seq }">
								<tabl>
									<col width="15%"><col width="55%"><col width="15%">
									<tr>
										<td style="padding-left:5px"><input type="text" id="s_keyword1" name="s_keyword1" value="${s_keyword1 }"/></td>
										<td style="padding-left:5px;"><input type="text" id="s_keyword" name="s_keyword" value="${s_keyword}"/></td>
										<td style="padding-left:5px;"><button type="button" id="_btnSearch"> 날짜검색 </button></td>
									</tr>
								</table>
								<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>						
								<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>	
							</form>
						</div>
						
					</div>
					
					<div style="float:right; margin-right:90px; margin-bottom:30px; background-color: #0b2d85;height: 35px; width: 79px; text-align: center;">
						<a href="#none" id="_btnWrite" title="글쓰기"><em style="color: #fff;display: block;padding-top: 5px;">질문하기</em></a>
					</div>
				 <table style="width:85%; align:center; margin-top: 100px;"  align="center">
				   <colgroup>
				      <col style="width:150px;" />
				      <col style="width:auto;" />
				      <col style="width:100px;" />
				   </colgroup>
		
					<thead>
					   <tr>
					      <th>환자이름</th> <th>병원</th> <th>의사</th> <th>예약시간</th>  
					   </tr>
					</thead>
		
					<tbody >   
					   <c:if test="${empty list}">
					   <tr>
					      <td colspan="3">작성된 글이 없습니다.</td>
					   </tr>   
					   </c:if>
						  <c:if test="${not empty login }">
								<input type="hidden" name="id" id="id" value="${login.id }">
							</c:if>
					   <c:forEach items="${list}" var="bbs" varStatus="vs">
					  <%--  <tr class="_hover_tr">
						    <td style="text-align: center">
						    	${vs.count}
						    </td> 
						    <td style="text-align: center">
						     	${bbs.question}
						    </td>
						    <td style="text-align: center">
						     	<a href='Qnabbsdetail.do?seq=${bbs.seq}'>
								    	${bbs.title}
								</a>
						    </td>
						    <td style="text-align: center">
						    	${bbs.id}
						    </td> 
					   </tr> --%>
					   
					   <tr class="_hover_tr">
							    <td style="text-align: center;"><a href='myreservedetail.do?mem_seq=${bbs.mem_seq }&hos_seq=${bbs.hos_seq }&doc_seq=${bbs.doc_seq }&day=${bbs.day }&time=${bbs.time }'>[${login.name}]</a></td>
								<td style="text-align: center;">
								    ${bbs.mediMember_hDto.name}
								 
								</td>
								<td style="text-align: center;">${bbs.mediDoctorDto.name }</td>
								<td style="text-align: center;">${bbs.day }:${bbs.time }</td>
							    
					   </tr>
					   
					   </c:forEach>
					</tbody>
					</table> 
					<br>
					<div id="paging_wrap">
						<jsp:include page="/WEB-INF/include/paging.jsp" flush="false">
							<jsp:param value="${pageNumber }" name="pageNumber"/>
							<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
							<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
							<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
						</jsp:include>
						
						
					</div>
					
					<script>
var id = $("#id").val();
$("#_btnWrite").click(function() {	
	if(id == null){
		alert("로그인을 해주세요.");
	}else{
		location.href="consultingwrite.do";
	}
});


$(document).ready(function() {
	if ("${s_category}" == "question") {
		$("#_s_category option:eq(1)").attr("selected", "selected");
	} else if("${s_category}" == "title"){
		$("#_s_category option:eq(2)").attr("selected", "selected");
	}else if("${s_category}" == "content"){
		$("#_s_category option:eq(3)").attr("selected", "selected");
	}  else{
		$("#_s_category option:eq(0)").attr("selected", "selected");
	}
});
function goPage(pageNumber) {	
	$("#_pageNumber").val(pageNumber) ;
	$("#_frmFormSearch").attr("target","_self").attr("action","Myreserve.do?keyWord=${s_category}&selectWord=${s_keyword}").submit();
}
$("#_btnSearch").click(function() {
	//alert('search');						
	$("#_frmFormSearch").attr({ "target":"_self", "action":"Myreserve.do" }).submit();
});
</script>

<script type="text/javascript">
$(function() {
    $( "#s_keyword" ).datepicker({
    	changeMonth: true, 
        changeYear: true,
        nextText: '다음 달',
        prevText: '이전 달',
        showButtonPanel: true, 
        currentText: '오늘 날짜', 
        closeText: '닫기', 
        dateFormat: "yy-mm-dd",
            dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
            dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
            monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']



    });
});

$(function() {
    $( "#s_keyword1" ).datepicker({
    	changeMonth: true, 
        changeYear: true,
        nextText: '다음 달',
        prevText: '이전 달',
        showButtonPanel: true, 
        currentText: '오늘 날짜', 
        closeText: '닫기', 
        dateFormat: "yy-mm-dd",
            dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
            dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
            monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']



    });
});


</script>



				<!-- 이부분에 컨텐츠 끝 -->
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>
<%
String category = (String)request.getAttribute("s_keyword");
if(category == null) category = "";
%>
<script type="text/javascript">

var str='<%=category %>';
$(document).ready(function(){	
	document.frmForm1.s_keyword.value = str;
	
	// text에 문자를 입력하지 않았을 경우, 초기화 해준다.
	if($("#s_keyword").val().trim() == ""){
		document.frmForm1.s_keyword.value = "";
	}	
}); 
</script>