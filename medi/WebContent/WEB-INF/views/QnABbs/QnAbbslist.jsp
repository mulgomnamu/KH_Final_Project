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
				<h2>병원 리스트</h2>
				<em>사이트에 등록된 모든 병원의 정보를<br/>한눈에 보여드립니다</em>
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
												<option value="name">병원이름</option>
												<option value="address">주소</option>								
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
					
					<c:forEach items="${hbbslist}" var="hbbs" varStatus="i">
						<div class="hbbsbox">
							<a href="hbbsdetail.do?seq=${hbbs.seq}">
								<div class="hbbssum"><img src="images/sub/${hbbs.confirm_img }" alt=""></div>
								<div class="hbbscontent">
									<h4>${hbbs.name }</h4>
									<p class="subinfo">${hbbs.info }</p>
								</div>
								<div class="hbbsbottom">
									<img src="images/sub/location.png" alt="">
									<p>${hbbs.address }</p>
								</div>
							</a>
						</div>
					</c:forEach>
					
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
$(document).ready(function() {
	if ("${s_category}" == "name") {
		$("#_s_category option:eq(1)").attr("selected", "selected");
	} else if("${s_category}" == "address"){
		$("#_s_category option:eq(2)").attr("selected", "selected");
	} else{
		$("#_s_category option:eq(0)").attr("selected", "selected");
	}
});
function goPage(pageNumber) {	
	$("#_pageNumber").val(pageNumber) ;
	$("#_frmFormSearch").attr("target","_self").attr("action","hbbslist.do?keyWord=${s_category}&selectWord=${s_keyword}").submit();
}
$("#_btnSearch").click(function() {
	//alert('search');						
	$("#_frmFormSearch").attr({ "target":"_self", "action":"hbbslist.do" }).submit();
});
</script>
