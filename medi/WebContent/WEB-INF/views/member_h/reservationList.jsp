<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />


<!-- 로그인 처리 -->
<c:if test="${empty login_h }">
	<script type="text/javascript">
	alert("로그인후이용가능합니다");
	location.href='main.do';
	</script>
</c:if>
<c:if test="${loginType ne 4 }">
	<script type="text/javascript">
	alert("병원회원만 가능한 공간입니다");
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
				<h2>예약 목록</h2>
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
										<td>검색 : </td>
										<td>
											<select id="_s_category" name="s_category">
												<option value="" <c:if test="${s_keyword eq '' }">selected</c:if>>선택</option>
												<option value="mem_name" <c:if test="${s_keyword ne '' and s_category eq 'mem_name'}">selected</c:if>>회원 이름</option>
												<option value="doc_name" <c:if test="${s_keyword ne '' and s_category eq 'doc_name'}">selected</c:if>>의사 이름</option>
											</select>
										</td>
										<td><input type="text" id="_s_keyword" name="s_keyword" value="${s_keyword}"/></td>
										<td><span><button type="button" id="searchBtn"> 검색 </button></span></td>
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
							</tr>
							<c:forEach var="memberList" items="${loginList }">
								<tr>
									<td>
										<input type="checkbox" name="selectCheckBox" value="${memberList.seq }">
									</td>
									<td><span id="mem_name${memberList.adminMember.name }">${memberList.adminMember.name }</span></td>
									<td><span id="hos_name${memberList.adminHospital.name }">${memberList.adminHospital.name }</span></td>
									<td><span id="doc_name${memberList.adminDoctor.name }">${memberList.adminDoctor.name }</span></td>
									<td><span id="content${memberList.content }">${memberList.content }</span></td>
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