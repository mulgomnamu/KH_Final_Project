<%@page import="kh.com.medi.model.MediMemberDto"%>
<%@page import="kh.com.medi.model.MediQnaBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<%!
public String dot3(String msg){
	String s="";
	if(msg.length()>=15){
		s=msg.substring(0,15);
		s+="...";
	}else{
		s=msg.trim();
	}
	return s;
}
%>
<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>건강상담</h2>
				<em>전문의에게 건강에 대한 질문이 있으면 문의를 해보세요.<br/>문제를 속시원히 해결해드립니다.</em>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
					<div class="searchwrap">
						<div class="searchbox">
							<form name="frmForm1" id="_frmFormSearch" method="post" action="">
								<table>
									<col width="15%"><col width="70%"><col width="15%">
									<tr>
										<td style="padding-left:5px;">
											<select id="_s_category" name="s_category">
												<option value="" selected="selected">선택</option>
												<option value="category">진료분야</option>
												<option value="title">제목</option>
												<option value="content">내용</option>								
											</select>
										</td>
										<td style="padding-left:5px;"><input type="text" id="_s_keyword" name="s_keyword" value="${s_keyword}"/></td>
										<td style="padding-left:5px;"><button type="button" id="_btnSearch"> 검색 </button></td>
									</tr>
								</table>
								<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>						
								<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>	
							</form>
						</div>
					</div>
				 <table style="width:85%; align:center;"  align="center">
				   <colgroup>
					  <col style="width:40px;" />
				      <col style="width:80px;" />
				      <col style="width:auto;" />
				      <col style="width:100px;" />
				   </colgroup>
		
					<thead>
					   <tr>
					      <th>순서</th> <th>말머리</th> <th>제목</th> <th>작성자</th> 
					   </tr>
					</thead>
		
					<tbody >   
					   <c:if test="${empty questionlist}">
					   <tr>
					      <td colspan="3">작성된 글이 없습니다.</td>
					   </tr>   
					   </c:if>
						  <c:if test="${not empty login }">
								<input type="hidden" name="id" id="id" value="${login.id }">
							</c:if>
					   <c:forEach items="${questionlist}" var="bbs" varStatus="vs">
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
							    <td>${vs.count}</td> 
							    <td>${bbs.category}</td>
								<td style="text-align: left">
									<a href='Qnabbsdetail.do?seq=${bbs.seq}'>
								    	${bbs.title}
								    </a>
								</td>
							    <td>
							    	${bbs.wid}
							    </td>
					   </tr>
					   
					   </c:forEach>
					</tbody>
					</table> 
					<br>
					<div align="right">
						<a href="#none" id="_btnWrite" title="글쓰기"><img src="images/Qnabbs/bwrite.png" alt="글쓰기" /></a>
					</div>
					<div id="paging_wrap">
						<jsp:include page="/WEB-INF/include/paging.jsp" flush="false">
							<jsp:param value="${pageNumber }" name="pageNumber"/>
							<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
							<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
							<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
						</jsp:include>
						
						
					</div>
					
				<!-- 이부분에 컨텐츠 끝 -->
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>

<script>
var id = $("#id").val();
$("#_btnWrite").click(function() {	
	if(id == null){
		alert("로그인을 해주세요.");
	}else{
		location.href="consultingWrite.do";
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
	$("#_frmFormSearch").attr("target","_self").attr("action","consultinglist.do?keyWord=${s_category}&selectWord=${s_keyword}").submit();
}
$("#_btnSearch").click(function() {
	//alert('search');						
	$("#_frmFormSearch").attr({ "target":"_self", "action":"consultinglist.do" }).submit();
});
</script>
