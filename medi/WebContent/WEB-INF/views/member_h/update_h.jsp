<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

<style type="text/css">
/* div {
  margin-bottom: 10px;
  position: relative;
} */

input[type="number"] {
  width: 100px;
}

input + span {
  padding-right: 30px;
}

input:invalid + span:after {
  position: absolute;
  content: "✖";
  padding-left: 5px;
  color: #8b0000;
}

input:valid + span:after {
  position: absolute;
  content: "✓";
  padding-left: 5px;
  color: #009000;
}
.tableWrap tr{
	border-bottom:1px solid #d9d9d9;
}
.tableWrap tr:first-child{
	border-top:3px solid #d9d9d9;
}
.tableWrap th{
	text-align:left;
	padding: 14px 38px;
	background-color: rgb(244, 245, 248)
}
.tableWrap td{
	border-left-width: 100px;
	padding: 14px 14px 38px 20px;
}

.tableWrap tr{border-bottom:1px solid #d9d9d9;}
.tableWrap tr:first-child{border-top:3px solid #d9d9d9;}
.tableWrap th{text-align:left;}
.updateBtn{width:180px; height:70px; line-height:70px; color:#fff; background-color:#1f4bb4; border-radius:5px; margin:40px auto 80px auto; display:block;}

</style>

<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>병원 회원 수정</h2>
				<em>수정할 회원 정보를 입력해주세요</em>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				
					<c:set var="addr" value="${fn:split(login_h.address,'+') }"/>
					<c:set var="address1" value="${addr[0] }"/>
					<c:set var="address2" value="${addr[1] }"/>
					
					<form action="join_hAf" id="_form" name="_form" method="post">
						<input type="hidden" class="tableWrap" name="seq" value="${login_h.seq }">
						<table class="tableWrap">
							<col width="200px"><col width="">
							<tr>
								<th>
									<span></span>아이디
								</th>
								<td>
									<input type="text" id="id" name="id" readonly="readonly" value="${login_h.id }">
								</td>
							</tr>
							<tr>
								<th>
									병원명
								</th>
								<td>
									<input type="text" id="name" name="name" onkeyup="nameCheckFunction()" value="${login_h.name }" placeholder="병원 이름을 입력하세요">
									<h5 style="color: red;" id="nameCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<th>
									대표 전화번호
								</th>
								<td>
									<input type="tel" id="tel" name="tel" onkeyup="telCheckFunction()" value="${login_h.tel }" required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}">
									<input type="hidden" id="oriTel" value="${login_h.tel }">
									<span class="validity"></span>
									<h5 style="color: red;" id="telCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<th>
									주소
								</th>
								<td>
									<input type="text" id="post" name="post" value="${login_h.post }" placeholder="우편번호" readonly="readonly">
									<input type="button" onclick="btnPost()" value="우편번호 찾기"><br>
									<input type="text" id="address1" value="${address1 }" placeholder="주소" readonly="readonly">
									<input type="text" id="address2" value="${address2 }" onkeyup="addressCheckFunction()" placeholder="상세주소">
									<input type="hidden" name="address" id="address" value="${login_h.address }">
									<input type="hidden" id="oriAddress" value="{login_h.address }">
									<h5 style="color: red;" id="addressCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<th>
									이메일
								</th>
								<td>
									<input type="text" id="email" name="email" value="${login_h.email }" onkeyup="emailCheckFunction()" placeholder="이메일을 입력하세요">
									<input type="hidden" id="oriEmail" value="${login_h.email }">
									<h5 style="color: red;" id="emailCheckMessage" align="left"></h5>
								</td>
							</tr>
							<tr>
								<th>
									진료 분야
								</th>
									
								<td>
									<table>
										<tr>
											<td>
												<div>				
													전체 진료과목
													<div>
														<select name="all_cl_sjt" id="all_cl_sjt" multiple="multiple" size="14" style="width:200px" onclick="click_select('all_cl_sjt');" ondblclick="append_cl();">
															<option value="내과">내과</option>
															<option value="치과">치과</option>
															<option value="소아청소년과">소아청소년과</option>
															<option value="산부인과">산부인과</option>
															<option value="산후조리원">산후조리원</option>
															<option value="조산원">조산원</option>
															<option value="이비인후과">이비인후과</option>
															<option value="안과">안과</option>
															<option value="피부과">피부과</option>
															<option value="비뇨기과">비뇨기과</option>
															<option value="신경정신과">신경정신과</option>
															<option value="외과">외과</option>
															<option value="정형외과">정형외과</option>
															<option value="성형외과">성형외과</option>
															<option value="신경외과">신경외과</option>
															<option value="항문외과">항문외과</option>
															<option value="흉부외과">흉부외과</option>
															<option value="한방">한방</option>
															<option value="한의원">한의원</option>
															<option value="가정의학과">가정의학과</option>
															<option value="재활의학과">재활의학과</option>
															<option value="노인전문">노인전문</option>
															<option value="치매">치매</option>
															<option value="통증클리닉">통증클리닉</option>
															<option value="방사선과">방사선과</option>
															<option value="마취과">마취과</option>
															<option value="결핵과">결핵과</option>
															<option value="임상병리과">임상병리과</option>
															<option value="알콜병원">알콜병원</option>
															<option value="일반">일반</option>
															<option value="종합">종합</option>
															<option value="기타">기타</option>
														</select>						
													</div>
												</div>
											</td>
											<td>
												<div class="pad_tp80l">					
													<br><input type="button" class="bg_blue" value="▶" onclick="append_cl();" style="width:25px;height:25px"><br><br>
													<input type="button" class="bg_blue" value="◀" onclick="remove_cl();" style="width:25px;height:25px">
												</div>
											</td>
											<td>
												<div>		
													선택한 진료과목
													<div>
														<select name="cl_sjt" id="cl_sjt" multiple="multiple" size="14" style="width:200px" onclick="click_select('cl_sjt');" ondblclick="remove_cl();">
														
															<c:forEach var="sub_option" items="${list_hs }">
																<option value="${sub_option.subject }">${sub_option.subject }</option>
															</c:forEach>
														
														</select>
														<input type="hidden" name="cl_sjt_list" id="cl_sjt_list">
													</div>
												</div>
											</td>
											<td>
												<div class="pad_tp80">
													<input type="button" class="bg_blue" value="▲" onclick="move_up();" style="width:25px;height:25px"><br><br>
													<input type="button" class="bg_blue" value="▼" onclick="move_down();" style="width:25px;height:25px">
												</div>
												<p class="clear"></p>
											</td>
										<tr>
									</table>
								</td>
							</tr>
							<tr>
								<th>
									병원 소개
								</th>
								<td>
									<textarea id="info" onkeyup="infoCheckFunction()" name="info"><c:out value="${login_h.info }"></c:out></textarea>
									<h5 style="color: red;" id="infoCheckMessage" align="left"></h5>
								</td>
							</tr>
						</table>
					</form>
					<input type="button" id="update_hBtn" value="수정하기" class="updateBtn">
				
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>

<script>
	var telCheck = 9;
	var addressCheck = 9;
	var emailCheck = 9;
	var pwdCheck = 0;
	var infoCheck = 9;

/* 우편번호 */
function btnPost() {
	new daum.Postcode({
        oncomplete: function(data) {
            var fullAddr = '';
            var extraAddr = '';

            if (data.userSelectedType === 'R') {
                fullAddr = data.roadAddress;
            } else {
                fullAddr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            document.getElementById('post').value = data.zonecode;
            document.getElementById('address1').value = fullAddr;
            document.getElementById('address2').focus();
            addressCheck = 9;
        }
    }).open();
}
	
/* 전화번호 중복 확인 */
	function telCheckFunction() {
		var tel = $("#tel").val();
		var oriTel = $("#oriTel").val();
		if(tel != oriTel){
			if(tel != ""){
				$.ajax({
					type: 'post',
					url: 'checkTel_h.do',
					data: {tel: tel},
					success: function(result) {
						if(result == "2"){
							telCheck = 0;
							$("#telCheckMessage").html("이미 사용중인 전화번호입니다.");
						}else{
							telCheck = 9;
							$("#telCheckMessage").html("");
						}
					}
				});
			}
		}else{
			telCheck = 9;
		}
	}
    
/* address1 address2 합치기 */
	function addressCheckFunction() {
		var address1 = $("#address1").val();
		var address2 = $("#address2").val();
		$("#address").val(address1+"+"+address2);
		addressCheckFunction1();
	}
	
/* 주소 중복 확인 */
	function addressCheckFunction1() {
		var address = $("#address").val();
		var oriAddress = $("#oriAddress").val();
		if(address != oriAddress){
			if(address != ""){
				$.ajax({
					type: 'post',
					url: 'checkAddress_h.do',
					data: {address: address},
					success: function(result) {
						if(result == "2"){
							addressCheck = 0;
							$("#addressCheckMessage").html("이미 사용중인 주소입니다.");
						}else{
							addressCheck = 9;
							$("#addressCheckMessage").html("");
						}
					}
				});
			}
		}else{
			addressCheck = 9;
		}
	}
	
/* 이메일 중복 확인 */
	function emailCheckFunction1() {
		var email = $("#email").val();
		var oriEmail = $("#oriEmail").val();
		if(email != oriEmail){
			if(email != ""){
				$.ajax({
					type: 'post',
					url: 'checkEmail_h.do',
					data: {email: email},
					success: function(result) {
						if(result == "2"){
							emailCheck = 0;
							$("#emailCheckMessage").html("이미 사용중인 이메일입니다.");
						}else{
							emailCheck = 9;
							$("#emailCheckMessage").html("");
						}
					}
				});
			}
		}else{
			emailCheck = 9;
		}
	}

/* 이메일 유효성 확인 */
function emailCheckFunction() {
	var email = $("#email").val();
	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	if(!re.test(email)) {
		$("#emailCheckMessage").html("이메일 형식에 맞춰주세요");
	}else{
		emailCheckFunction1();
		$("#emailCheckMessage").html("");
	}
}

/* submit */
$("#update_hBtn").click(function() {
	var data = {
			seq: $("#seq").val(),
			name: $("#name").val(),
			tel: $("#tel").val(),
			address2: $("#address2").val(),
			email: $("#email").val(),
			info: $("#info").val(),
	}

	if(data.name == ""){
		$("#nameCheckMessage").html("병원 이름을 확인해주세요.");
		$("#name").focus();
	}else if(data.tel == "" || telCheck == 0){
		$("#telCheckMessage").html("전화번호를 확인해주세요.");
		$("#tel").focus();
	}else if(data.address2 == "" || addressCheck == 0){
		$("#addressCheckMessage").html("주소를 확인해주세요.");
		$("#address2").focus();
	}else if(data.email == "" || emailCheck == 0){
		$("#emailCheckMessage").html("이메일을 확인해주세요.");
		$("#email").focus();
	}else if(data.info == ""){
		$("#infoCheckMessage").html("병원 소개 글을 확인해주세요.");
		$("#info").focus();
	}else{
		var cl_list_str = "";
		var box = document.getElementById("cl_sjt");
		for(var i = 0; i < box.options.length; i++){
			if(i == cl_sjt.length - 1)
				cl_list_str=cl_list_str + box.options[i].value ;
			else
				cl_list_str=cl_list_str + box.options[i].value +",";
		}
		$("#cl_sjt_list").val(cl_list_str);
		
		var _form = new FormData(document.getElementById('_form'));
		$.ajax({
			url: 'updateAf_h.do',
			data: _form,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'post',
			success: function(response) {
				alert('회원수정 성공');
				location.href ="myPage_h.do";
			},
			error: function() {
				alert('error');
			},
		});

	}
});
	
/*진료과목 추가*/
function append_cl() {
	var box = document.getElementById("cl_sjt");
	var oribox;
	oribox = document.getElementById("all_cl_sjt");

	for (i = oribox.length - 1; i >= 0 ; i--) {
		if (oribox.options[i].selected) {
			// 중복 체크
			for (j = 0; j < box.length; j++) {
				if (box.options[j].value == oribox.options[i].value) {
					alert("\""+oribox.options[i].text+"\"은 이미 추가되었습니다.");
					break;
				}
			}
			// 옵션 추가
			if (j == box.length) {
				box.options[box.length] = new Option(oribox.options[i].text, oribox.options[i].value);
			}
		}
	}
}

/*다른 쪽에 포커스가 갔을때 선택이 되어져있으면 해지 시킨다.*/
function click_select(select_name) {
	if (select_name != "cl_sjt") {
		document.getElementById("cl_sjt").selectedIndex = -1;
	}

	if (select_name != "all_cl_sjt") {
		document.getElementById("all_cl_sjt").selectedIndex = -1;
	}
}

/*진료과목 빼기*/
function remove_cl() {
	var box = document.getElementById("cl_sjt"); 
	var oribox;
	oribox = document.getElementById("all_cl_sjt");
	
	for (i = box.length - 1; i >= 0 ; i--) {
		if (box.options[i].selected) {
				box.options[i] = null;
		}
	}
}

/*삭제진료과목 체크 (진료과목을 선택한 의사가 있을때 오류 메시지를 낸다.*/
function remove_cl_final_notok(arg) {
	document.getElementById("cl_sjt").options[arg].selected = false;
	remove_cl();
}

/*삭제진료과목 체크(진료과목을 선택한 의사가 없을때 해당 과목을 삭제한다.)*/
function remove_cl_final_ok(arg) {
	var box = document.getElementById("cl_sjt");
	box.options[arg] = null;
	remove_cl();
}

/*진료과목 순서올리기*/
function move_up() {
	var box = document.getElementById("cl_sjt");
	for (i = 0; i < box.length ; i++) {
		if(i == 0) continue;
		if (box.options[i].selected && !box.options[i-1].selected) {
			swap_option(box, i, i-1);
		}
	}
}

/*진료과목 순서내리기*/
function move_down() {
	var box = document.getElementById("cl_sjt");
	for (i = box.length - 1; i >= 0 ; i--) {
		if(i == box.length - 1) continue;
		if (box.options[i].selected && !box.options[i+1].selected) {
			swap_option(box, i, i+1);
		}
	}
}

/*진료과목 순서정렬*/
function swap_option(target, swap_a, swap_b) {
	var temp_option = new Option(target.options[swap_a].text,target.options[swap_a].value,false,true);
	target[swap_a] = new Option(target.options[swap_b].text,target.options[swap_b].value);
	target[swap_b] = temp_option;
}
</script>