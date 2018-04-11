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
				  <p class="m_txt"><strong>${login.id }</strong>을 위한 맞춤 건강 관리 </p>
   			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
					<div class="sub_tap">
					
					
   
<form name="mainfrm" method="post">
<input type="hidden" name="birth" value="">
<input type="hidden" name="modbirth" value="">
<input type="hidden" name="changeYn" value="N">
<input type="hidden" name="anotherCnt" value="0">
  

<!-- <div class="mar_tp53">
	<ul class="sub_menu1">
		<li><a href="#" class="on" onclick="healthAction('h_diary_info.do')">출생정보</a></li>
		<li><a href="#" onclick="healthActionCheck('body')">신체발육</a></li>
		<li><a href="#" onclick="healthActionCheck('plan');">예방접종</a></li>
		<li><a href="#" onclick="healthActionCheck('reserve');">예약기록</a></li>
	</ul>
	<p class="clear"></p>
</div>
		 -->


<div class="sub26_con_bm_bg_center">
	<table class="sub26_table" cellpadding="0" cellspacing="0" width="100%" summary="해설 코스 안내">
		<caption>해설 코스 안내</caption>
		<colgroup>
		 <col width="17%">
		 <col width="*">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">생 &nbsp;년&nbsp; 월 일 :</th>
				<td>
					<select name="year">										
					  
						<option value="1910">1910</option>
					  
						<option value="1911">1911</option>
					  
						<option value="1912">1912</option>
					  
						<option value="1913">1913</option>
					  
						<option value="1914">1914</option>
					  
						<option value="1915">1915</option>
					  
						<option value="1916">1916</option>
					  
						<option value="1917">1917</option>
					  
						<option value="1918">1918</option>
					  
						<option value="1919">1919</option>
					  
						<option value="1920">1920</option>
					  
						<option value="1921">1921</option>
					  
						<option value="1922">1922</option>
					  
						<option value="1923">1923</option>
					  
						<option value="1924">1924</option>
					  
						<option value="1925">1925</option>
					  
						<option value="1926">1926</option>
					  
						<option value="1927">1927</option>
					  
						<option value="1928">1928</option>
					  
						<option value="1929">1929</option>
					  
						<option value="1930">1930</option>
					  
						<option value="1931">1931</option>
					  
						<option value="1932">1932</option>
					  
						<option value="1933">1933</option>
					  
						<option value="1934">1934</option>
					  
						<option value="1935">1935</option>
					  
						<option value="1936">1936</option>
					  
						<option value="1937">1937</option>
					  
						<option value="1938">1938</option>
					  
						<option value="1939">1939</option>
					  
						<option value="1940">1940</option>
					  
						<option value="1941">1941</option>
					  
						<option value="1942">1942</option>
					  
						<option value="1943">1943</option>
					  
						<option value="1944">1944</option>
					  
						<option value="1945">1945</option>
					  
						<option value="1946">1946</option>
					  
						<option value="1947">1947</option>
					  
						<option value="1948">1948</option>
					  
						<option value="1949">1949</option>
					  
						<option value="1950">1950</option>
					  
						<option value="1951">1951</option>
					  
						<option value="1952">1952</option>
					  
						<option value="1953">1953</option>
					  
						<option value="1954">1954</option>
					  
						<option value="1955">1955</option>
					  
						<option value="1956">1956</option>
					  
						<option value="1957">1957</option>
					  
						<option value="1958">1958</option>
					  
						<option value="1959">1959</option>
					  
						<option value="1960">1960</option>
					  
						<option value="1961">1961</option>
					  
						<option value="1962">1962</option>
					  
						<option value="1963">1963</option>
					  
						<option value="1964">1964</option>
					  
						<option value="1965">1965</option>
					  
						<option value="1966">1966</option>
					  
						<option value="1967">1967</option>
					  
						<option value="1968">1968</option>
					  
						<option value="1969">1969</option>
					  
						<option value="1970">1970</option>
					  
						<option value="1971">1971</option>
					  
						<option value="1972">1972</option>
					  
						<option value="1973">1973</option>
					  
						<option value="1974">1974</option>
					  
						<option value="1975">1975</option>
					  
						<option value="1976">1976</option>
					  
						<option value="1977">1977</option>
					  
						<option value="1978">1978</option>
					  
						<option value="1979">1979</option>
					  
						<option value="1980">1980</option>
					  
						<option value="1981">1981</option>
					  
						<option value="1982">1982</option>
					  
						<option value="1983">1983</option>
					  
						<option value="1984">1984</option>
					  
						<option value="1985">1985</option>
					  
						<option value="1986">1986</option>
					  
						<option value="1987">1987</option>
					  
						<option value="1988">1988</option>
					  
						<option value="1989">1989</option>
					  
						<option value="1990">1990</option>
					  
						<option value="1991">1991</option>
					  
						<option value="1992">1992</option>
					  
						<option value="1993">1993</option>
					  
						<option value="1994">1994</option>
					  
						<option value="1995">1995</option>
					  
						<option value="1996">1996</option>
					  
						<option value="1997">1997</option>
					  
						<option value="1998">1998</option>
					  
						<option value="1999">1999</option>
					  
						<option value="2000">2000</option>
					  
						<option value="2001">2001</option>
					  
						<option value="2002">2002</option>
					  
						<option value="2003">2003</option>
					  
						<option value="2004">2004</option>
					  
						<option value="2005">2005</option>
					  
						<option value="2006">2006</option>
					  
						<option value="2007">2007</option>
					  
						<option value="2008">2008</option>
					  
						<option value="2009">2009</option>
					  
						<option value="2010">2010</option>
					  
						<option value="2011">2011</option>
					  
						<option value="2012">2012</option>
					  
						<option value="2013">2013</option>
					  
						<option value="2014">2014</option>
					  
						<option value="2015">2015</option>
					  
						<option value="2016">2016</option>
					  
						<option value="2017">2017</option>
					  
						<option value="2018">2018</option>
					  
					</select> 년
					<script>document.mainfrm.year.value='';</script>

					<select name="month">                                               
					  
						<option value="1">1</option>
					  
						<option value="2">2</option>
					  
						<option value="3">3</option>
					  
						<option value="4">4</option>
					  
						<option value="5">5</option>
					  
						<option value="6">6</option>
					  
						<option value="7">7</option>
					  
						<option value="8">8</option>
					  
						<option value="9">9</option>
					  
						<option value="10">10</option>
					  
						<option value="11">11</option>
					  
						<option value="12">12</option>
					  
					</select> 월
					<script>document.mainfrm.month.value='';</script>

					<select name="day">                                              
					  
					  <option value="1">1</option>
					  
					  <option value="2">2</option>
					  
					  <option value="3">3</option>
					  
					  <option value="4">4</option>
					  
					  <option value="5">5</option>
					  
					  <option value="6">6</option>
					  
					  <option value="7">7</option>
					  
					  <option value="8">8</option>
					  
					  <option value="9">9</option>
					  
					  <option value="10">10</option>
					  
					  <option value="11">11</option>
					  
					  <option value="12">12</option>
					  
					  <option value="13">13</option>
					  
					  <option value="14">14</option>
					  
					  <option value="15">15</option>
					  
					  <option value="16">16</option>
					  
					  <option value="17">17</option>
					  
					  <option value="18">18</option>
					  
					  <option value="19">19</option>
					  
					  <option value="20">20</option>
					  
					  <option value="21">21</option>
					  
					  <option value="22">22</option>
					  
					  <option value="23">23</option>
					  
					  <option value="24">24</option>
					  
					  <option value="25">25</option>
					  
					  <option value="26">26</option>
					  
					  <option value="27">27</option>
					  
					  <option value="28">28</option>
					  
					  <option value="29">29</option>
					  
					  <option value="30">30</option>
					  
					  <option value="31">31</option>
					  
					</select> 일
					<script>document.mainfrm.day.value='';</script>

				</td>
			</tr>
			<tr>
				<th scope="row"><label for="inp1">출생시&nbsp; 신장&nbsp;:</label></th>
				<td>
					<input type="text" name="height" id="height" size="8" value="" maxlength="4" onkeydown="return numberOnly2(event);">
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="inp2">출생시&nbsp; 체중&nbsp;:</label></th>
				<td>
					<input type="text" name="weight" id="weight" size="8" value="" maxlength="4" onkeydown="return numberOnly2(event);"> kg
				</td>
			</tr>
			<tr>
				<th scope="row">혈  &nbsp;&nbsp;&nbsp;  액 &nbsp;&nbsp;   형 :</th>
				<td>
					<input type="radio" name="bloodtype" value="A">A형 
					<input type="radio" name="bloodtype" value="B">B형 
					<input type="radio" name="bloodtype" value="O">O형
					<input type="radio" name="bloodtype" value="AB">AB형 
				</td>
			</tr>
			<tr>
				<th scope="row">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별 :</th>
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
	<h1 class="mar_tp20">정확히 입력해주십시오. 신체발육과 예방접종의 참고가 됩니다.</h1>
	<div class="align_rt mar_tp20"><input type="button" class="button" value="저장" onclick="healthInfoSave();"></div>
</div>

<div class="sub26_con_bm_bg_foot"></div>

</form>


<script>
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

	fm.target = "mainfrm";
	fm.action = "healthbook.do";
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

function healthActionCheck(arg){
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
</script>

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