<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				<em>병원 회원 목록</em>
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
												<option value="id" <c:if test="${s_keyword ne '' and s_category eq 'id'}">selected</c:if>>아이디</option>
												<option value="name" <c:if test="${s_keyword ne '' and s_category eq 'name'}">selected</c:if>>이름</option>			
											</select>
										</td>
										<td>
										<span class="form-text">
										<label for="_s_keyword" class="placeholder">검색어</label>
										<input type="text" id="_s_keyword" name="s_keyword" value="${s_keyword}"/>
										</span></td>
										<td><span><button type="button" class="s_btn" id="searchBtn"> 검색 </button></span></td>
									</tr>
								</table>
								<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>						
								<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>
							</form>
						</div>
						<table class="list_table1">
							<col width="20px"><col width="100px"><col width="80px">
							<col width="180px"><col width="140px"><col width="350px">
							<col width="70px"><col width="140px"><col width="90px">
							<col width="140px"><col width="90px"><col width="90px">
							<col width="50px">
							<tr>
								<th><input type="checkbox" id="allCheckBox"></th>
								<th>아이디</th>
								<th>이름</th>
								<th>전화번호</th>
								<th>우편번호</th>
								<th>주소</th>
								<th>이메일</th>
								<th>병원소개</th>
								<th style="text-align: center;">채택점수</th>
								<th style="text-align: center;">탈퇴여부</th>
								<th>가입날짜</th>
								<th style="text-align: center;">회원구분</th>
								<th>수정</th>
							</tr>
							<c:forEach var="memberList" items="${loginList }">
								<tr>
									<td>
										<input type="checkbox" name="selectCheckBox" value="${memberList.seq }">
									</td>
									<td><span id="id${memberList.seq }">${memberList.id }</span></td>
									<td><span id="name${memberList.seq }">${memberList.name }</span></td>
									<td><span id="tel${memberList.seq }">${memberList.tel }</span></td>
									<td><span id="post${memberList.seq }">${memberList.post }</span></td>
									<c:choose>
										<c:when test="${fn:length(memberList.address) > 16}">
											<td><span id="address${memberList.seq }" title="${memberList.address }">${fn:substring(memberList.address, 0, 16) }...</span></td>
										</c:when>
										<c:otherwise>
											<td><span id="address${memberList.seq }" title="${memberList.address }">${memberList.address }</span></td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${fn:length(memberList.email) > 16}">
											<td><span id="email${memberList.seq }" title="${memberList.email }">${fn:substring(memberList.email, 0, 16) }...</span></td>
										</c:when>
										<c:otherwise>
											<td><span id="email${memberList.seq }" title="${memberList.email }">${memberList.email }</span></td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${fn:length(memberList.email) > 5}">
											<td><span id="info${memberList.seq }" title="${memberList.info }">${fn:substring(memberList.info, 0, 5) }...</span></td>
										</c:when>
										<c:otherwise>
											<td><span id="info${memberList.seq }" title="${memberList.info }">${memberList.info }</span></td>
										</c:otherwise>
									</c:choose>
									<td align="center"><span id="score${memberList.seq }">${memberList.score }</span></td>
									<td align="center"><span id="del${memberList.seq }">${memberList.del }</span></td>
									<td><span id="regdate${memberList.seq }">${memberList.regdate }</span></td>
									<td align="center"><span id="auth${memberList.seq }">${memberList.auth }</span></td>
									<td>
<!-- 병원 정보 수정 Modal -->
										<div id="updateModal${memberList.seq }" class="modal">
											<span><h3>${memberList.name }님 회원 정보</h3></span>
											<form action="#none" id="updateForm${memberList.seq }" method="post">
												<table class="tableWrap">
													<col width="100px"><col width="50px">
													<tr><th>이름</th><td><input type="text" name="name" value="${memberList.name }"><input type="hidden" name="seq" value="${memberList.seq }"></td></tr>
													<tr><th>전화번호</th><td><input type="text" name="tel" value="${memberList.tel }"></td></tr>
													<tr><th>우편번호</th><td><input type="text" name="post" value="${memberList.post }"></td></tr>
													<tr><th>주소</th><td><input type="text" name="address" value="${memberList.address }"></td></tr>
													<tr><th>이메일</th><td><input type="text" name="email" value="${memberList.email }"></td></tr>
													<tr><th>병원소개</th><td><input type="text" name="info" value="${memberList.info }"></td></tr>
													<tr><th>채택점수</th><td><input type="text" name="score" value="${memberList.score }"></td></tr>
													<tr><th>탈퇴여부</th><td><input type="text" name="del" value="${memberList.del }"></td></tr>
													<tr><th>가입날짜</th><td><input type="text" name="regdate" value="${memberList.regdate }"></td></tr>
													<tr><th>회원구분</th><td><input type="text" name="auth" value="${memberList.auth }"></td></tr>
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
	$("#searchForm").attr({ "target":"_self", "action":"adminHospitalList.do" }).submit();
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

// 페이징
function goPage(pageNumber) {
	$("#_pageNumber").val(pageNumber) ;
	$("#searchForm").attr("target","_self").attr("action","adminHospitalList.do").submit();
}

// 회원 정보 수정
function updateBtn(seq) {
	var _updateForm = new FormData(document.getElementById("updateForm"+seq));
	$.ajax({
		url: 'updateHospitalByAdmin.do',
		data: _updateForm,
		processData: false,
		contentType: false,
		type: 'post',
		success: function(result) {
			$.modal.close();
			$("span[id=name"+seq+"]").text(result.name);
			$("span[id=tel"+seq+"]").text(result.tel);
			$("span[id=post"+seq+"]").text(result.post);
			$("span[id=address"+seq+"]").text(result.address);
			$("span[id=email"+seq+"]").text(result.email);
			$("span[id=info"+seq+"]").text(result.info);
			$("span[id=score"+seq+"]").text(result.score);
			$("span[id=del"+seq+"]").text(result.del);
			$("span[id=regdate"+seq+"]").text(result.regdate);
			$("span[id=auth"+seq+"]").text(result.auth);
		}
	});
}
</script>