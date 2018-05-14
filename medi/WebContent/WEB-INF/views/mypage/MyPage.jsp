<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/consulting.css"/>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><%-- 
<script type="text/javascript" src="<c:url value='/js/jquery.1.9.1.min.js'/>"></script> --%>
<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="subpagetitle" style="margin-bottom: 50px;">
				<h2>Mypage</h2>
			 <div class="sub_tap">
       		 <div class="inner_flogin" style="background: transparent">
       		 
				<ul id="tab">
				
				<li>
				<a href="#tab1" class="selected" onclick="alllist()">
					<em style="margin-top: 20px;"  >내정보보기</em>
				</a>
				</li>
				
				<li>
				<a href="#tab2">
					<em style="margin-top: 20px;" >탈퇴하기</em>
				</a>
				</li>
				
				<li>
				<a href="#tab3">
					<em style="margin-top: 20px;">비밀번호 수정</em>
				</a>
				</li>
				
				</ul>
				
				</div>
				</div>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
				<div class="sub_wrap">
	        	 <div class="sub_content">
			   		<ol id="list">
			    	<li id="tab1">
					<div id="alllist">
					<div class="searchwrap">
						<div class="searchbox" style="display: inline-block;position: relative;left: 300px;top: -1.8px;">
							<form  name="frmForm1" id="_frmFormSearch" method="post">
								<input type="hidden" id="id" name="id" value="${my.id }"/>
									<table class="list_table" style="width:85%">
												
									<tbody>
									<tr>
									<th>회원사진</th>
									<td><img alt="없음" src="upload/${my.myimg }"width="150" height="190"></td>
									</tr>	
									<tr>
										<th>아이디</th>
										<td style="text-align: left">${my.id}</td>
									</tr>
									<br>
									<tr>
										<th>이름</th>
										<td style="text-align: left">${my.name}</td>
									</tr>
									<br>
									<tr>
										<th>email</th>
									<td>		
										<input type="email" id="email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" placeholder="이메일을 입력하세요" value="${my.email }">
										<input type="text" id="oriEmail" value="${my.email }">
										<h5 style="color: red;" id="emailCheckMessage" align="left"></h5>
										<!-- <input name="email" type="email" class="form-control" id="email"
										placeholder="email" required=""> --> <br>
									</td>	
									</tr>
									<tr>
										<th>phone</th>
										<td>
											<input type="tel" name="phone" id="phone" title="phone number"
												placeholder="000-0000-0000"
												pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13"
												required value="${my.phone }"><span class="validity"></span>
												<!-- <input type="tel" name="phone" id="phone" title="phone number"
												placeholder="000-0000-0000"
												pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13"
												required=""> --> <br>
													<input type="hidden" id="oriPhone" value="${my.phone }">
													<h5 style="color: red;" id="telCheckMessage" align="left"></h5>
										<td>		
									</tr>
									<tr>
										<th>post</th>
										<td>
										<input type="text" id="sample4_postcode" name="post" placeholder="우편번호" required="" value="${my.post }">
													<input type="button"
														onclick="sample4_execDaumPostcode()" value="주소검색" required=""><br>
													<input type="text" id="sample4_roadAddress" name="address"
														placeholder="도로명주소" size="40" required="" value="${my.address }"><br>
													<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"><br>
													<span id="guide" style="color:#999"></span>
										<td>
									</tr>
									<br>
									<tr>
										<td colspan="2" style="height:50px; text-align:center;">
											<span>
												<a href="#none" id="_btnUpdate" class="btn-type02 btn-search refresh_btn1" title="내정보 수정하기">내정보 수정하기</a>
											</span>
										</td>
									</tr>
									
									</tbody>
									</table>
								


					
							</form>	
						</div>
					</div>
					</div>
					</li>
					<li id="tab2">
					2
					</li>
					<li id="tab3">
					3</li>
					</ol>
				</div>
			</div>

<script>
$("#del").click(function() {
	$("#_frmForm").attr({"target":"_self", "action":"mydelete.do" }).submit();
});

$("#_btndetail").click(function() {		
	$("#_frmForm").attr({ "target":"_self", "action":"Mydetail.do" }).submit();
});

$("#butpwdupdate").click(function() {		
	$("#_frmForm").attr({ "target":"_self", "action":"Mypwdupdate.do" }).submit();
});





</script>
<script type="text/javascript">
$("#_btnUpdate").click(function() {
	var phone = $("#phone").val();
	var oriPhone = $("#oriPhone").val();
	var email = $("#email").val();
	var oriEmail = $("#oriEmail").val();
	var okPhone = 0;
	var okEmail = 0;
	if(phone != oriPhone){
		if(phone != ""){
			$.ajax({
				type: 'post',
				url: 'checkPhone.do',
				data: {phone: phone},
				success: function(result) {
					if(result == "true"){
						$("#telCheckMessage").html("이미 사용중인 전화번호입니다.");
						alert("tel" + result);
						okPhone = 1;
					}else{
						$("#telCheckMessage").html("");
						okPhone = 2;
					}
				}
			});
		}
	}else{
		okPhone = 2;
	}
	if(email != oriEmail){
		if(email != ""){
			$.ajax({
				type: 'post',
				url: 'checkEmail.do',
				data: {email: email},
				success: function(result) {
					if(result == "true"){
						$("#emailCheckMessage").html("이미 사용중인 이메일입니다.");
						alert("email" + result);
						okEmail = 1;
					}else{
						$("#emailCheckMessage").html("");
						okEmail = 2;
					}
				}
			});
		}
	}else{
		okEmail = 2;
	}
	//	submitContents($("#_frmForm"));
	alert("okPhone : "+okPhone);
	alert("okEmail : "+okEmail);
	if(okPhone == 2 && okEmail == 2){
		$("#_frmForm").attr({ "target":"_self", "action":" mysupdateAf.do" }).submit();
	}
	
});
</script>

<script type="text/javascript">
//전화번호 형식검사 스크립트
var patt = new RegExp("[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}");
var res = patt.test( $("#phone").val());

if( !patt.test( $("#phone").val()) ){
    alert("전화번호를 정확히 입력하여 주십시오.");
    return false;
}
</script>	
				
<script type="text/javascript">
//우편번호 검색 스크립트
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>				
<script type="text/javascript">
//tab 초기화
$(document).ready(function(){
	$('#list>li:not(:eq(0))').hide();
	$('#tab li a').click(function(){
	  $('#tab li a').removeClass('selected');
	  $(this).addClass('selected');
	  $('#list>li').hide();
	  $($(this).attr('href')).show();
	  return false;
	});
	
	
});

function alllist() {
	alert("aaaaa");
	var data = id:$("#id").val();
	
	$.ajax({
		 type:"post",
	      url:"Mydetail.do",
	      async:true,
	      data:data,
		success : function (data) {
			if(data.yn == "AA"){
				alert("bb");
			}else{
				alert("ccc");
			}
		},
		error: function () {
			alert('error');
		}
		
	});
};
	
	


</script>




				<!-- 이부분에 컨텐츠 끝 -->
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>

