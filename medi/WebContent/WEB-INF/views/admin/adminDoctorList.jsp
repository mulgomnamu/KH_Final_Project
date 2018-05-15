<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
.tableWrap th{text-align:left;}

.s_btn{width:100px; height:40px; display:block; line-height:40px; margin:20px auto 20px; text-align:center; background-color:#0b2d85; color:#fff; border-radius:5px;}
</style>

<!-- 로그인 처리 -->
<c:if test="${loginType ne 2 }">
	<script type="text/javascript">
	alert("관리자만 가능한 공간입니다");
	location.href='main.do';
	</script>
</c:if>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />


<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>관리자 페이지</h2>
				<em>의사 회원 목록</em>
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
												<option value="specialty" <c:if test="${s_keyword ne '' and s_category eq 'specialty'}">selected</c:if>>진료분야</option>
												<option value="name" <c:if test="${s_keyword ne '' and s_category eq 'name'}">selected</c:if>>이름</option>			
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
								<th>이름</th>
								<th>진료분야</th>
								<th>진료요일</th>
								<th>의사소개</th>
								<th>수정</th>
							</tr>
							<c:forEach var="memberList" items="${loginList }">
								<tr>
									<td>
										<input type="checkbox" name="selectCheckBox" value="${memberList.seq }">
									</td>
									<td><span id="name${memberList.seq }">${memberList.name }</span></td>
									<td><span id="specialty${memberList.seq }">${memberList.specialty }</span></td>
									<td><span id="day_tostring${memberList.seq }">${memberList.day_tostring }</span></td>
									<td><span id="doc_content${memberList.seq }">${memberList.doc_content }</span></td>
									<td>
<!-- 의사 정보 수정 Modal -->
										<div id="updateModal${memberList.seq }" class="modal">
											<span><h3>${memberList.name }님 회원 정보</h3></span>
											<form action="#none" id="updateForm${memberList.seq }" method="post">
												<table class="tableWrap">
													<col width="100px"><col width="50px">
													<tr><th>이름</th><td><input type="text" name="name" value="${memberList.name }"><input type="hidden" name="seq" value="${memberList.seq }"></td></tr>
													<tr><th>진료분야</th><td><input type="text" name="specialty" value="${memberList.specialty }"></td></tr>
													<tr><th>진료요일</th><td><input type="text" name="day_tostring" value="${memberList.day_tostring }"></td></tr>
													<tr><th>의사소개</th><td><input type="text" name="doc_content" value="${memberList.doc_content }"></td></tr>
												</table>
											</form>
											<button id="updateBtn" onclick="updateBtn(${memberList.seq });" class="s_btn">수정</button>
										</div>
										
<!-- Link to open the modal -->
										<p><a href="#updateModal${memberList.seq }" rel="modal:open">수정</a></p>
									</td>
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
	$("#searchForm").attr({ "target":"_self", "action":"adminDoctorList.do" }).submit();
});

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

// 페이징
function goPage(pageNumber) {
	$("#_pageNumber").val(pageNumber) ;
	$("#searchForm").attr("target","_self").attr("action","adminDoctorList.do").submit();
}

// 회원 정보 수정
function updateBtn(seq) {
	var _updateForm = new FormData(document.getElementById("updateForm"+seq));
	$.ajax({
		url: 'updateDoctorByAdmin.do',
		data: _updateForm,
		processData: false,
		contentType: false,
		type: 'post',
		success: function(result) {
			$.modal.close();
			$("span[id=name"+seq+"]").text(result.name);
			$("span[id=specialty"+seq+"]").text(result.specialty);
			$("span[id=day_tostring"+seq+"]").text(result.day_tostring);
			$("span[id=doc_content"+seq+"]").text(result.doc_content);
		}
	});
}
</script>