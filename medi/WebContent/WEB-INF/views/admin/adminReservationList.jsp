<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style>
.tableWrap tr{
	border-bottom:1px solid #d9d9d9;
}
.tableWrap tr:first-child{
	border-top:3px solid #d9d9d9;
}
.tableWrap th{
	text-align:left;
	padding: 14px 14px;
	background-color: rgb(244, 245, 248)
}
.tableWrap td{
	border-left-width: 100px;
	padding: 14px 14px 14px 20px;
	vertical-align: center;
}

.tableWrap tr{border-bottom:1px solid #d9d9d9;}
.tableWrap tr:first-child{border-top:3px solid #d9d9d9;}
.tableWrap th{text-align:left; }
.list_table1 th {
background-color:#f4f5f8;
text-align: left;
border-bottom:1px solid #d9d9d9;
}
.list_table1 td {
border-bottom:1px solid #d9d9d9;
height: 60px;
}
.s_btn{width:100px; height:40px; display:block; line-height:40px; margin:20px auto 20px; text-align:center; background-color:#0b2d85; color:#fff; border-radius:5px;}
</style>
<!-- 로그인 처리 -->
<c:if test="${loginType ne 2 }">
	<script type="text/javascript">
	alert("관리자만 가능한 공간입니다");
	location.href='main.do';
	</script>
</c:if>


<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>관리자 페이지</h2>
				<em>예약 현황 목록</em>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				

					<div>
						<div>
							<form name="frmForm1" id="searchForm" method="post" action="">
								<table border="1px">
									<tr>
										<td align="center">
											<select id="_s_category" name="s_category">
												<option value="" <c:if test="${s_keyword eq '' }">selected</c:if>>선택해주세요</option>
												<option value="hos_name" <c:if test="${s_keyword ne '' and s_category eq 'hos_name'}">selected</c:if>>병원 이름</option>
												<option value="mem_name" <c:if test="${s_keyword ne '' and s_category eq 'mem_name'}">selected</c:if>>회원 이름</option>
												<option value="doc_name" <c:if test="${s_keyword ne '' and s_category eq 'doc_name'}">selected</c:if>>의사 이름</option>
											</select>
										</td>
										<td>
										<span class="form-text">
										<label for="_s_keyword" class="placeholder">검색어</label>
										<input type="text" id="_s_keyword" name="s_keyword" value="${s_keyword}"/></span></td>
										<td><span><button type="button" class="s_btn" id="searchBtn"> 검색 </button></span></td>
									</tr>
								</table>
								<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>						
								<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>
							</form>
						</div>
						<table class="list_table1">
							<tr>
								<th><input type="checkbox" id="allCheckBox"></th>
								<th>회원 이름</th>
								<th>병원 이름</th>
								<th>의사 이름</th>
								<th>예약 메모</th>
								<th>예약 날짜</th>
								<th>예약 시간</th>
								<th>예약 구분</th>
								<th>삭제</th>
								<th></th>
							</tr>
							<c:forEach var="memberList" items="${loginList }">
								<tr>
									<td>
										<input type="checkbox" name="selectCheckBox" value="${memberList.seq }">
									</td>
									<td><span id="mem_name${memberList.adminMember.name }">${memberList.adminMember.name }</span></td>
									<td><span id="hos_name${memberList.adminHospital.name }">${memberList.adminHospital.name }</span></td>
									<td><span id="doc_name${memberList.adminDoctor.name }">${memberList.adminDoctor.name }</span></td>
									<c:choose>
										<c:when test="${fn:length(memberList.content) > 16}">
											<td><span id="content${memberList.content }" title="${memberList.content }">${fn:substring(memberList.content, 0, 16) }...</span></td>
										</c:when>
										<c:otherwise>
											<td><span id="content${memberList.content }" title="${memberList.content }">${memberList.content }</span></td>
										</c:otherwise>
									</c:choose>
									<td><span id="day${memberList.day }">${memberList.day }</span></td>
									<td><span id="time${memberList.time }">${memberList.time }</span></td>
									<td><span id="wdate${memberList.wdate }">${memberList.wdate }</span></td>
									<td><span id="type${memberList.type }">${memberList.type }</span></td>
									<td><button id="btnDelete${memberList.seq }" name="btnDelete" value="${memberList.seq }">삭제</button></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					
					<!-- 페이징 처리 -->
					<div id="paging_wrap">
						<jsp:include page="/WEB-INF/include/paging.jsp" flush="false">
							<jsp:param value="${s_category }" name="s_category"/>
							<jsp:param value="${s_keyword }" name="s_keyword"/>
							<jsp:param value="${pageNumber }" name="pageNumber"/>
							<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
							<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
							<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
						</jsp:include>
					</div>

				
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>

<script>
//검색
$("#searchBtn").click(function() {
	$("#_pageNumber").val("0");
	$("#searchForm").attr({ "target":"_self", "action":"adminReservationList.do" }).submit();
});

//페이징
function goPage(pageNumber) {
	$("#_pageNumber").val(pageNumber) ;
	$("#searchForm").attr("target","_self").attr("action","adminReservationList.do").submit();
}

//체크박스
$(function() {
	$("#allCheckBox").click(function() {
		if($("#allCheckBox").prop("checked")){
			$("input[name=selectCheckBox]").prop("checked", true);
		} else {
			$("input[name=selectCheckBox]").prop("checked", false);
		}
	});
});

//체크박스2
$(function() {
	$("#allCheckBox2").click(function() {
		if($("#allCheckBox2").prop("checked")){
			$("input[name=list_day]").prop("checked", true);
			alert($("#allCheckBox2").prop("checked"));
		} else {
			$("input[name=list_day]").prop("checked", false);
			alert($("#allCheckBox2").prop("checked"));
		}
	});
});

// 회원 정보 수정
$("button[name = 'btnDelete']").on('click', function(){
	var seq = $(this).val();
	var id = $(this).attr('id');
	if(confirm('선택한 예약을 삭제하시겠습니까?')) {
 		$.ajax({
			url: 'deleteAdminReservation.do',
			data: {seq: seq},
			type: 'post',
			success: function(result) {
				$("#"+id).parent().parent().remove();
			}
		});
	}
});
</script>