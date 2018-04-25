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
.list_table{
border-top: 1px solid black;
}
.list_table th {
background-color:#f4f5f8;
padding:22px 38px;
text-align: left;
border-bottom:1px solid #d9d9d9;
}
.list_table td {
padding-left:20px;
border-bottom:1px solid #d9d9d9;
height: 60px;
}
</style>
<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
					<form name="frmForm" id="_frmForm" method="post">

					<table class="list_table" style="width:85%;">
					<tbody>	
						<tr class="id">
							<th>이름</th>
							<td style="text-align: left">
								<span class="form-text">
								<label for="board_writer" class="placeholder"></label>
								<input type="text" id="board_writer" name="name" readonly="readonly" value='${login.name}' style="width:158px; "/>
								</span>
								
							</td>
						</tr>
						<tr class="id">
							<th>휴대전화</th>
							<td>
							<div class="form_set-mobile_number">
								<c:set var="phone" value="${login.phone}"/>
								<span class="form-text">
								<input type="text" id="board_phone1" style="letter-spacing: 3px;width: 90px; background-color: #f8f8f8;" name="phone" readonly="readonly" value='${fn:substring(phone,0,3) }'/>
								</span>
								<span class="form-text">
								<input type="text" style="letter-spacing: 3px;width: 90px; background-color: #f8f8f8;" name="phone" readonly="readonly" value='${fn:substring(phone,4,8) }'/>
								</span>
								<span class="form-text">
								<input type="text" style="letter-spacing: 3px;width: 90px; background-color: #f8f8f8;" name="phone" readonly="readonly" value='${fn:substring(phone,9,13) }'/>
								</span>
							</div>
							</td>
						</tr>
						<tr class="id">
							<th>이메일</th>
							<td>
								<span class="form-text">
								<label for="board_writer" class="placeholder"></label>
								<input type="text" id="board_writer" name="name" readonly="readonly" value='${login.email}' style="width:310px; "/>
								</span>
								
							</td>
						</tr>
						<tr class="id">
							<th>진료과목 선택</th>
							<td style="text-align: left">
							<span class="form-text" style="width: 310px;">
							<label for="category" class="placeholder">카테고리</label>
							<span class="form-select">
								<span class="virtual_select">선택
								</span>
								<select id="category" name="category">
									<option value="choicehe">선택해주세요</option>
									<option value="가정의학과">가정의학과</option>
									<option value="결핵과">결핵과</option>
									<option value="내과">내과</option>
									<option value="노인전문">노인전문</option>
									<option value="마취과">마취과</option>	
									<option value="비뇨기과">비뇨기과</option>
									<option value="방사선과">방사선과</option>
									<option value="소아청소년과">소아청소년과</option>
									<option value="산부인과">산부인과</option>
									<option value="산후조리원">산후조리원</option>
									<option value="신경정신과">신경정신과</option>	
									<option value="성형외과">성형외과</option>	
									<option value="신경외과">신경외과</option>
									<option value="안과">안과</option>
									<option value="이빈인후과">이빈인후과</option>
									<option value="외과">외과</option>
									<option value="임상병리과">임상병리과</option>	
									<option value="알콜병원">알콜병원</option>	
									<option value="일반">일반</option>
									<option value="조산원">조산원</option>
									<option value="정형외과">정형외과</option>
									<option value="재활의학과">재활의학과</option>
									<option value="종합">종합</option>	
									<option value="치매">치매</option>	
									<option value="치과">치과</option>
									<option value="통증클리닉">통증클리닉</option>
									<option value="피부과">피부과</option>
									<option value="항문외과">항문외과</option>
									<option value="흉부외과">흉부외과</option>	
									<option value="한방">한방</option>		
									<option value="한방">한의원</option>	
									<option value="기타">기타</option>	
								 </select>
							</span>
							</span>
							</td>
						</tr>
						<tr>
							<th>제목</th>
								<td style="text-align: left">
								<span class="form-text">
								<label for="board_title" class="placeholder">제목</label>
								<input type="text" id="board_title" name="title" size="60"/>
								</span>
								</td>
						</tr>
						<tr>
							<th>내용</th>
							<td style="text-align: left">
								<textarea style="margin: 10px 0 10px 0;" rows="10" cols="50" name='content' id="_content"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="height:50px; text-align:center;">
								<span>					
								<a href="#none" id="_btnLogin" class="btn-type02 btn-search refresh_btn1" style="cursor: pointer; width: 140px; margin: 20px;"><em style="padding:0px;">작성완료</em></a>
								</span>
							</td>
						</tr>
					</tbody>
					
					</table>
					<input type="hidden" name="mem_seq" value="${login.seq}">
					<input type="hidden" name="wid" value="${login.id}">
					</form>
				<!-- 이부분에 컨텐츠 끝 -->
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>
<br><br><br>
<script type="text/javascript">
$("#_btnLogin").click(function() {	
	/* alert('글작성'); */	
	if($("#category").val()=="choicehe"){
		alert("진료분야를 선택해주세요");
	}else if($("#_title").val()==""){
		alert("제목을 입력해주세요");
	}else if($("#_content").val()==""){
		alert("질문내용을 입력해주세요");
	}else{
		$("#_frmForm").attr({ "target":"_self", "action":"consultingwriteAf.do" }).submit();	
	}
	
});
</script>

<script type="text/javascript"> 
var message = '${msg}'; 
var returnUrl = '${url}'; 
if(message != ""){
	alert(message);	
}
</script>