<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 로그인 처리 -->
<c:if test="${loginType ne 2 }">
	<script type="text/javascript">
	alert("관리자만 가능한 공간입니다");
	location.href='main.do';
	</script>
</c:if>

<style>
.alertImg img{width:100%; max-height:650px;}
#odiv{left:50% !important; width:420px; margin-left:-210px; top: 130px !important; }
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
										<input type="text" id="_s_keyword" name="s_keyword" value="${s_keyword}"/></span></td>
										<td><span><button type="button" class="s_btn" id="searchBtn"> 검색 </button></span></td>
									</tr>
								</table>
								<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>						
								<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>
							</form>
						</div>
						<div>
							<input type="button" class="s_btn" style="float: left;" id="upAuth" value="일괄 회원승인">
						</div>
						<table class="list_table1">
							<tr>
								<th><input type="checkbox" id="allCheckBox"></th>
								<th>아이디</th>
								<th>이름</th>
								<th>승인 이미지</th>
								<th>가입날짜</th>
								<th>회원구분</th>
								<th>승인</th>
							</tr>
							<c:forEach var="memberList" items="${loginList }">
								<tr>
									<td>
										<input type="checkbox" name="selectCheckBox" value="${memberList.seq }">
									</td>
									<td><span id="id${memberList.seq }">${memberList.id }</span></td>
									<td><span id="name${memberList.seq }">${memberList.name }</span></td>
									<td><span id="confirm_img${memberList.confirm_img }" style="width: 100px;display: block;"><img src="upload/${memberList.confirm_img }" onclick="resizeImg(this.src)" style="width:100%;position:relative;padding:5px;"></span></td>
									<td><span id="regdate${memberList.seq }">${memberList.regdate }</span></td>
									<td><span id="auth${memberList.seq }">${memberList.auth }</span></td>
									<td><button name="confirmBtn" id="confirmBtn${memberList.seq }" value="${memberList.seq }">승인</button></td>
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

// 개별 회원 승인
$("button[name = 'confirmBtn']").on('click', function(){
	var seq = $(this).val();
	var id = $(this).attr('id');
	if(confirm('선택한 회원을 승인하시겠습니까?')) {
 		$.ajax({
			url: 'updateHospitalAuth.do',
			data: {seq: seq},
			type: 'post',
			success: function(result) {
				$("#"+id).parent().parent().remove();
			}
		});
	}
});

//일괄 회원 승인(Check Box)
	$("#upAuth").click(function() {
		var count = 0;
		$("input[name=selectCheckBox]:checked").each(function() {
			var checkedVal = {
				seq: $(this).val(),
			};
			var _seq = parseInt(checkedVal.seq);
			$.ajax({
				url: 'updateHospitalAuth.do',
				data: checkedVal,
				type: 'post',
				success: function(result) {
					$("#confirmBtn"+_seq).parent().parent().remove();
				}
			});
			count++;
		});
		alert(count+'명의 회원을 승인했습니다.');
	});
</script>

<script>
function resizeImg(osrc) {
    var bdiv = document.createElement('DIV');

    document.body.appendChild(bdiv);

    bdiv.setAttribute("id", "bdiv");

    bdiv.style.position = 'absolute';

    bdiv.style.top = 0;

    bdiv.style.left = 0;

    bdiv.style.zIndex = 0;

    bdiv.style.width = document.body.scrollWidth;

    bdiv.style.height = document.body.scrollHeight;

    bdiv.style.background = 'gray';

    //bdiv.style.filter = "alpha(opacity=75)";

    bdiv.style.opacity = '0.5';

    //bdiv.style.mozOpacity = '0.5';

    var odiv = document.createElement('DIV');

    document.body.appendChild(odiv);

    odiv.style.zIndex = 1;

    odiv.setAttribute("id", "odiv");

    odiv.innerHTML = "<a href='javascript:void(closeImg())' class='alertImg'><img id='oimg' src='"+osrc+"' border='0' width='100%'/></a>";

    var img = document.all['oimg'];

    var owidth = (document.body.clientWidth)/2 - (img.width)/2;

    var oheight = (document.body.clientHeight)/2 - (img.height)/2;

    odiv.style.position = 'absolute';

    odiv.style.top = oheight + document.body.scrollTop;

    odiv.style.left = owidth;

    scrollImg();

}

function scrollImg() {
    var odiv = document.all['odiv'];

    var img = document.all['oimg'];

    var oheight = (document.body.clientHeight)/2 - (img.height)/2 + document.body.scrollTop;

    odiv.style.top = oheight;

    settime = setTimeout(scrollImg, 100);
}

function closeImg(){
    document.body.removeChild(odiv);

    document.body.removeChild(bdiv);

    clearTimeout(settime);
}
</script>