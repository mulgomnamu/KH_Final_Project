<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				 <%--  <p class="m_txt"><strong>${login.name }</strong>님 을 위한 맞춤 건강 관리 </p> --%>
					<h3 class="mar_tp20"><strong>${login.name }</strong>님 을 위한 맞춤 건강 관리 수첩</h3>
   			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
					<div class="sub_tap">
					
   
<form name="mainfrm" action="healthbookAf.do" method="post">
<%-- <input type="hidden" name='id' value='${login.id}'> --%>
<input type="hidden" name="seq" value="${login.seq}"/>
<input type="hidden" name="modbirth" value="">
<input type="hidden" name="changeYn" value="N">
<input type="hidden" name="anotherCnt" value="0">
  
<div class="sub26_con_bm_bg_center">
	<table class="sub26_table" cellpadding="0" cellspacing="0" width="100%" summary="해설 코스 안내">
		<caption>해설 코스 안내</caption>
		<colgroup>
		 <col width="17%">
		 <col width="*">
		</colgroup>
		<tbody>
			
				<tr>
				<th scope="row"><label for="inp1">생년월일&nbsp;:</label><br></th>
				<td>
					<input type="date" name="birth" id="birth" title="birth"
					placeholder="0000-00-00"
					pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" maxlength="8"
					required><span class="validity"></span>
					</td>
		
		<!-- 	<tr>
				<th scope="row"><label for="inp1">생년&nbsp; 월일&nbsp;:</label></th>
				<td>
					<input type="text" name="birth" id="birth" size="8" value="" maxlength="4" onkeydown="return numberOnly2(event);">cm
				</td>
			</tr> -->
			
			<tr>
				<th scope="row"><label for="inp1">신&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;장&nbsp;&nbsp;:</label></th>
				<td>
					<input type="text" name="height" id="height" size="8" value="" maxlength="3" onkeydown="return numberOnly2(event);">cm
				</td>
			</tr>
			
			<tr>
				<th scope="row"><label for="inp2">체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;중&nbsp;&nbsp;:</label></th>
				<td>
					<input type="text" name="weight" id="weight" size="8" value="" maxlength="3" onkeydown="return numberOnly2(event);"> kg
				</td>
			</tr>
			
			<tr>
				<th scope="row">혈 &nbsp;액  &nbsp; 형 :</th>
				<td>
					<input type="radio" name="bloodtype" value="A">A형 
					<input type="radio" name="bloodtype" value="B">B형 
					<input type="radio" name="bloodtype" value="O">O형
					<input type="radio" name="bloodtype" value="AB">AB형 
				</td>
			</tr>
			<tr>
				<th scope="row">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별 :</th>
				<td>
					<input type="radio" name="gender" value="m">남자
					<input type="radio" name="gender" value="w">여자
				</td>
			</tr>
			
			<tr>
				<th scope="row"><label for="inp1">알러지&nbsp; 및 특이사항&nbsp;:</label></th>
						<td style="text-align: left">
						<textarea  name='allergy' id='allergy' rows="5" cols="1">
					</textarea>
				</td>
			</tr>
			

			
		</tbody>
	</table>
	<h3 class="mar_tp20">정확히 입력해주십시오. 신체발육과 예방접종의 참고가 됩니다.</h3>
	<div class="align_rt mar_tp20">
	<!-- <input type="button" class="button" value="저장" onclick="healthInfoSave();"> -->
	<fieldset>
		<button id="form-submit" type="submit"class="btn">저 장</button><br><br>
	</fieldset>
		
	</div>
</div>


<div class="sub26_con_bm_bg_foot"></div>

</form>
</div>
</div>
</div>
</section>
</div>
</div>
<script type="text/javascript">
//전화번호 형식검사 스크립트
var patt = new RegExp("[0-9]{4}-[0-9]{2}-[0-9]{2}");
var res = patt.test( $("#birth").val());

if( !patt.test( $("#").val()) ){
    alert("생년월일을 정확히 입력하여 주십시오.");
    return false;
}
</script>

<script type="text/javascript">
$("#_btnLogin").click(function() {	
	alert('글작성');	
	$("#_frmForm").attr({ "target":"_self", "action":"healthwriteAf.do" }).submit();	
});
</script>

<!-- <script>
function healthInfoSave(){
	
	var fm = document.mainfrm;
	var monthValue = "";
	var dayValue = "";
	if(fm.year.value==""){
		alert("출생년도를 정확히 입력 해주세요.");
		fm.year.focus();
		return;
	}
	if(fm.month.value==""){
		alert("출생월를 정확히 입력해 주세요.");
		fm.month.focus();
		return;
	}
	if(fm.day.value==""){
		alert("출생날짜를 정확히 입력해 주세요.");
		fm.day.focus();
		return;
	}
	var isgender = "0";
  for(i=0;i<fm.gender.length;i++){
    if(fm.gender[i].checked){
      isgender = "1";
    }
  }
  if(isgender == "0"){
    alert("성별을 입력해 주세요.");
    return;
  }
	if(fm.year != null){
		if(parseInt(fm.month.value, 10) < 10){
			monthValue = "0"+fm.month.value;
		}else{
			monthValue = fm.month.value;
		}
		if(parseInt(fm.day.value, 10) < 10){
			dayValue = "0"+fm.day.value;
		}else{
			dayValue = fm.day.value;
		}
		fm.modbirth.value = fm.year.value+""+monthValue+""+dayValue;
	}
	if(fm.birth.value=="" || fm.anotherCnt.value=="0") {
		fm.birth.value = fm.modbirth.value;
	}
//console.log("healthInfoSave ==> " + fm.modbirth.value + " : " + fm.changeYn.value);
	if(fm.changeYn.value == "Y") {
		if(fm.birth.value!=fm.modbirth.value) {
			if(confirm("수정하시겠습니까? ")) {
				fm.birth.value = fm.modbirth.value;
			}else {
				return;
			}
		}else {
			fm.changeYn.value = "N";
		}
	}
	fm.target = "main";
	fm.action = "healthbooklist.do";
	fm.submit();
}
/* function list_view(idx) {
	var fm = document.mainfrm;
	if(idx == "ID_1"){
		ID_1.style.visibility = "hidden";
		ID_1.style.position = "absolute";
		ID_2.style.visibility = "visible";
		ID_2.style.position = "relative";
		fm.changeYn.value = "Y";
	}
	if(idx == "ID_2"){
		ID_1.style.visibility = "visible";
		ID_1.style.position = "relative";
		ID_2.style.visibility = "hidden";
		ID_2.style.position = "absolute";
		fm.changeYn.value = "N";
	}
} */
 -->

<!-- function healthActionCheck(arg){
	if(arg=="reserve"){
		healthAction('h_diary_reserve.do');
	}else{
		if(document.all["birth"].value==""){
			alert("출생정보를 입력해 주세요. ");
			return;
		}else if(arg=="body"){
			healthAction('h_diary_body.do');
		}else if(arg=="plan"){
			healthAction('h_diary_plan.do');
		}else if(arg=="reserve"){
			healthAction('h_diary_reserve.do');
		}
	}
}
</script> -->

<script type='text/javascript'>
	var x = 300;										//width 이동시킬만큼설정 (바꿀화면크기설정)
	var slider = document.getElementById("slider");		//회전시킬요소의아이디
	var slideArray = slider.getElementsByTagName("li");	//회전되는총페이지갯수
	var slideMax = slideArray.length - 1;				//for문
	var curSlideNo = 0;									//지금몇번째창인지
 
	for (i = 0; i <= slideMax; i++) {					
		if (i == curSlideNo) slideArray[i].style.left = 0;
		else slideArray[i].style.left = -x + "px";
	}
 
	slider.addEventListener('click', function () {
		changeSlide();
	}, false);
 
	var aniStart = false;
	var next = 1;
	var changeSlide = function(){
		if (aniStart === true) return;
		next = curSlideNo + 1;
		if (next > slideMax) next = 0;
		aniStart = true;
		sliding();
	}
 
	function sliding() {
		var curX = parseInt(slideArray[curSlideNo].style.left, 10);
		var nextX = parseInt(slideArray[next].style.left, 10);
		var newCurX = curX + 10;
		var newNextX = nextX + 10;
		if (newCurX >= x) {
			slideArray[curSlideNo].style.left = -x + "px";
			slideArray[next].style.left = 0;
			curSlideNo = curSlideNo + 1;
			if (curSlideNo > slideMax) curSlideNo = 0;
			aniStart = false;
			return;
		}
		slideArray[curSlideNo].style.left = newCurX + "px";
		slideArray[next].style.left = newNextX + "px";
		setTimeout(function () {
			sliding();
		}, 20);
	}
</script>