<%@page import="java.util.Calendar"%>
<%@page import="kh.com.medi.aop.myCal"%>
<%@page import="kh.com.medi.aop.CalendarUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
myCal jcal = (myCal)request.getAttribute("jcal");
//받는값dayOfweek, lastDay,rdate,lastDayOfMonth,year,month,가능요일,가능시간
//보내는값 monthyn -> plus,minus,doc_seq
int dayOfWeek = jcal.getDayOfWeek();
int lastDayOfMonth = jcal.getLastDay();

int year = jcal.getYear();
int month = jcal.getMonth();

String p=String.format("<a href='./%s?year=%d&month=%d'><img src='images/appointment/prec.gif'/></a>", 
		"appointment.do", year, month-1);
String n=String.format("<a href='./%s?year=%d&month=%d'><img src='images/appointment/next.gif'/></a>", 
		"appointment.do", year, month+1);

Calendar cal = Calendar.getInstance();
cal.set(year, month-1, 1);

int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
%>

<script type="text/javascript">
/* step이동 */
function step1_2() {//스탭1단계가는거
	$("#step1_2").fadeOut();
}
$("#revbtn").click(function () {
	$("#step1").fadeIn();
});
//선택메뉴
$(document).ready(function(){
	$('#list>li:not(:first)').hide();
	$('#tab li a').click(function(){
	  $('#tab li a').removeClass('selected');
	  $(this).addClass('selected')

	  $('#list>li').hide();
	  $($(this).attr('href')).show();
	  return false
	});
	});
</script>
<script type="text/javascript">
function hospitallist() {
	$.ajax({
		url : "serchhospital.do", // a.jsp 의 제이슨오브젝트값을 가져옴
		data:"name="+$("#hosserch").val(),
		dataType : "json", // 데이터 타입을 제이슨 꼭해야함, 다른방법도 2가지있음
		cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐
		success : function(data) {
			$("#hospitallistdiv").html(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
			$("<table class='ser'/>").css({
			}).appendTo("#hospitallistdiv"); // 테이블을 생성하고 그 테이블을 div에 추가함
			var key = Object.keys(data["hospitallist"][0]); // seq,name,info,address,tel의 키값을 가져옴
			$.each(data.hospitallist, function(index, hospitallist) { // 이치를 써서 모든 데이터들을 배열에 넣음
				var items = [];
				items.push("<td class='ser'><a href='javascript:void(0);' onclick='getdoctor("+hospitallist.seq+")'>" 
				+ hospitallist.name + "</a></td>"); // 여기에 id pw addr tel의 값을 배열에 넣은뒤
				items.push("<td class='ser'>" + hospitallist.info + "</td>");
				items.push("<td class='ser'>" + hospitallist.address + "</td>");
				items.push("<td class='ser'>" + hospitallist.tel + "</td>");
				$("<tr/>", {
					html : items // 티알에 붙임,
				}).appendTo("table"); // 그리고 그 tr을 테이블에 붙임
			});//each끝
		}
	});
}
function getdoctor(hos_seq) {
	$("#step1_1").fadeOut();
	$.ajax({
		url : "getdoctor.do", // a.jsp 의 제이슨오브젝트값을 가져옴
		data:"hos_seq="+hos_seq,
		dataType : "json", // 데이터 타입을 제이슨 꼭해야함, 다른방법도 2가지있음
		cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐
		success : function(data) {
			$("#getdoclistdiv").html(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
			$("<table class='ser'/>").css({
			}).appendTo("#getdoclistdiv"); // 테이블을 생성하고 그 테이블을 div에 추가함
			var key = Object.keys(data["getdoclist"][0]); // seq,name,info,address,tel의 키값을 가져옴
			$.each(data.getdoclist, function(index, getdoclist) { // 이치를 써서 모든 데이터들을 배열에 넣음
				var items = [];
				items.push("<td class='ser'><a href='javascript:void(0);' onclick='getscadule("+getdoclist.seq+")'>" 
				+ getdoclist.doc_profile + "</td>");	//img태그로 사진넣어야하고css해야한다
				items.push("<td class='ser'><a href='javascript:void(0);' onclick='getscadule("+getdoclist.seq+")'>"
				+ getdoclist.name + "</a></td>"); // 여기에 id pw addr tel의 값을 배열에 넣은뒤
				items.push("<td class='ser'>" + getdoclist.specialty + "</td>");
				items.push("<td class='ser'>" + getdoclist.doc_content + "</td>");
				$("<tr/>", {
					html : items // 티알에 붙임,
				}).appendTo("table"); // 그리고 그 tr을 테이블에 붙임
			});//each끝
		}
	});
}

function getscadule(doc_seq) {
	$("#step2_1").fadeOut();
	cleanser();
	
$.ajax({
	url : "getscadule.do", // a.jsp 의 제이슨오브젝트값을 가져옴
	data:"doc_seq="+doc_seq,
	dataType : "json", // 데이터 타입을 제이슨 꼭해야함, 다른방법도 2가지있음
	cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐
	success : function(data) {
		$("#getcalendardiv").html(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
		$("<table class='ser' align='center'><col width='40px'/><col width='40px'/><col width='40px'/><col width='40px'/><col width='40px'/><col width='40px'/><col width='40px'/>").css({
		//css적용영역
		}).appendTo("#getcalendardiv"); // 테이블을 생성하고 그 테이블을 div에 추가함
		$("<tr height='40px'><td class='days2' colspan='7'><a onclick='monprev()'><img src='images/appointment/prec.gif'/></a>" 
		+"<span style='color: red' id='nowyear'>"+data.year+"</span>"
		+"<span style='color: red' id='nowmonth'>"+data.month+"</span>"
		+"<td class='days2' colspan='7'><a onclick='monnext()'><img src='images/appointment/next.gif'/></a></td>").appendTo("table"); // 그리고 그 tr을 테이블에 붙임
		$("<tr height='40px'><th class='days2'>일</th><th class='days2'>월</th><th class='days2'>화</th><th class='days2'>수</th>"
		+"<th class='days2'>목</th><th class='days2'>금</th><th class='days2'>토</th></tr>" ).appendTo("table"); // 그리고 그 tr을 테이블에 붙임
		
				/* var key = Object.keys(data["getdoclist"][0]); // seq,name,info,address,tel의 키값을 가져옴
		
		$.each(data.canlist, function(index, canlist) { // 이치를 써서 모든 데이터들을 배열에 넣음
			var items = [];
			items.push("<td class='ser'><a href='javascript:void(0);' onclick='getcalendar("+getdoclist.seq+")'>" 
			+ getdoclist.doc_profile + "</td>");	//img태그로 사진넣어야하고css해야한다
			items.push("<td class='ser'><a href='javascript:void(0);' onclick='getcalendar("+getdoclist.seq+")'>" 
			+ getdoclist.name + "</a></td>"); // 여기에 id pw addr tel의 값을 배열에 넣은뒤
			items.push("<td class='ser'>" + getdoclist.specialty + "</td>");
			items.push("<td class='ser'>" + getdoclist.doc_content + "</td>");
			$("<tr height='40px'/>", {
				html : items // 티알에 붙임,
			}).appendTo("table"); // 그리고 그 tr을 테이블에 붙임
		});//each끝 */
	}

});
}


function cleanser() {
	$(".ser").html("");
}
</script>
<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				  <p class="m_txt"><strong>${login.id }</strong>님, 오늘도 건강한 하루 되세요</p>
       			  <p class="s_txt">온라인 예약으로 빠르고 편리하게 진료받으실 수 있습니다</p> 
   			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
				<!-- 어디서예약을누르냐에따라서 뿌려주는페이지가다르게해야한다 진료(0)/화상(1)구분 디폴트값 진료 메인에서화상진료선택시만처리해준다
					1 -> 병원선택안하고 바로올때 
					2 -> 병원선택하고올때 
				 -->
				<div class="sub_tap">
	             <ul id="tab">
	             	 <li>
	                     <a href="#tab1" onclick="cleanser()" class="selected">
	                         <em>병원으로 예약</em>		<!-- 1 메인페이지에서 또는 어느페이지서든 병원선택이안됐을때는 일로보내야된다 -->
	                     </a>
	                 </li>
	                 <li>
	                     <a href="#tab2" onclick="cleanser()">
	                         <em>진료과로 예약</em>		<!-- 2 병원을선택한곳에서 페이지오거나  -->
	                     </a>
	                 </li>
	                 <li>
	                     <a href="#tab3" onclick="cleanser()">
	                         <em>의료진으로 예약</em>	<!-- 의료진검색페이지주고 그사람클릭하면 모든정보 기본셋팅 -->
	                     </a>
	                 </li>
	             </ul>
         		</div>
         <div class="sub_wrap">
	         <div class="sub_content">
			    <ol id="list">
			    <li id="tab1">
				<div class="cont_box-office_select" id="step1_1">
			        <div class="title-type02">
			            <h3>병원으로 선택</h3>
			        </div>
			        <div>
			            <div class="doctor_detail">
			            	<div class="select_wrap_team">
			            		<span class="form-text">
			            			<label for="team_searhc" class="placeholder" style="display: none;">
			            				병원명을 2글자 이상으로 입력해 주세요
			            			</label>
			            			<input type="text" id="hosserch" name="name">
			            		</span>
			            		<button onclick="hospitallist()" class="btn-type02 btn-search"><em>검색</em></button>
			            		<button class="btn-type02 btn-search refresh_btn"><em>검색 초기화</em></button>
			            	</div>
			            </div>
			        </div>
			        <div id="hospitallistdiv" style="overflow:auto; width: 820px; height: 500px;">
			        	<!-- ajax로 리스트받아오는부분 -->
			        </div>
			    </div>
			    <div class="cont_box-office_select" id="step2_1">
			        <div class="title-type02">
			            <h3>의료진 선택</h3>
			        </div>
			        <div>
			            <div class="select_list">
			                <div class="select_list_wrap">
			                    <div id="getdoclistdiv" style="overflow:auto; width: 820px; height: 500px;">
						        	<!-- ajax로 의사리스트받아오는부분 -->
						        </div>
			                </div>
			            </div>
			           
			        </div>
			    </div>
			    <div class="cont_box-office_select" id="step3_1">
			        <div class="title-type02">
			            <h3>진료일자 선택</h3>
			        </div>
			        <div>
			            <div class="select_list">
			                <div class="select_list_wrap">
			                    <div id="getcalendardiv" style="overflow:auto; width: 820px; height: 500px;">
						        	<!-- ajax로불러오는곳 -->
						        </div>
			                </div>
			            </div>
			           
			        </div>
			    </div>
			</li>
			    <li id="tab2">
			     <!-- 진료과 선택 -->
			    <div class="cont_box-office_select" id="step1_2">
			        <div class="title-type02">
			            <h3>진료과 선택</h3>
			        </div>
			        <div>
			            <div class="select_list">
			                <div class="select_list_wrap">
			                    <table>
			                        <caption>진료과 선택 테이블</caption>
			                        <colgroup>
			                            <col width="100px">
			                            <col width="*">
			                        </colgroup>
			                        <tbody>
			                        <!-- SELECT * FROM medi.test
										where name >= '가' and name < '나'; 로검색하는커리로불러오기 
										-->
			                        <tr>
			                            <th scope="col">ㄱ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>가정의학과</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>결핵과</em>
			                                        </a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="col">ㄴ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>내과</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>노인전문</em>
			                                        </a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="col">ㅁ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>마취과</em>
			                                        </a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="col">ㅂ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>비뇨기과</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>방사선과</em>
			                                        </a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="col">ㅅ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>소아청소년과</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>산부인과</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>산후조리원</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>신경정신과</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>성형외과</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>신경외과</em>
			                                        </a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="col">ㅇ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>안과</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>이빈인후과</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>외과</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>임상병리과</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>알콜병원</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>일반</em>
			                                        </a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="col">ㅈ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>조산원</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>정형외과</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>재활의학과</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>종합</em>
			                                        </a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="col">ㅊ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>치매</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>치과</em>
			                                        </a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="col">ㅌ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>통증클리닉</em>
			                                        </a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="col">ㅍ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>피부과</em>
			                                        </a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="col">ㅎ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>항문외과</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>흉부외과</em>
			                                        </a>
			                                    </li>
			                                     <li>
			                                        <a onclick="step1_2()">
			                                            <em>한방</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a onclick="step1_2()">
			                                            <em>한의원</em>
			                                        </a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        </tbody>
			                    </table>
			                </div>
			            </div>
			           
			        </div>
			    </div>
			    <div class="cont_box-office_select" id="step2_2">
			        <div class="title-type02">
			            <h3>의료진 선택</h3>
			        </div>
			        <div>
			            <div class="select_list">
			                <div class="select_list_wrap">
			                    <!-- for문돌려서 의사디테일뿌려주기 -->
			                </div>
			            </div>
			           
			        </div>
			    </div>
			    <div class="cont_box-office_select" id="step3_2">
			        <div class="title-type02">
			            <h3>진료일시 선택</h3>
			            <p>${doctorid }님의 진료일입니다.</p>
			        </div>
			        <div>
			            <div class="select_list">
			                <div class="select_list_wrap">
			                    <!-- for문 달력뿌리기 -->
			                  	<div class="list_table">
<table style="width: 300px; margin-left: 0;">
<col width="40px"/>
<col width="40px"/>
<col width="40px"/>
<col width="40px"/>
<col width="40px"/>
<col width="40px"/>
<col width="40px"/>

<tr height="40px">
	<td class="days2" colspan="7">
		<%=p %>
			<font color="red" style="font-size: 20">
				<%=String.format("%d년&nbsp;&nbsp;%d월", year, month) %>
			</font>
		<%=n %>
	</td> 
</tr>

<tr height="40px">
	<th class="days2">일</th>
	<th class="days2">월</th>
	<th class="days2">화</th>
	<th class="days2">수</th>
	<th class="days2">목</th>
	<th class="days2">금</th>
	<th class="days2">토</th>
</tr>

<tr height="40px">
	<%
	for(int i = 1;i < dayOfWeek; i++){
		%>
		<td>&nbsp;</td>
		<%	
	}
	for(int i = 1;i <= lastDay; i++){
		String rdate = CalendarUtil.yyyymmdd(year, month, i);
		%>
		<td id='mytd<%=i %>' class="days3"
			onmouseout="mout('<%=i %>')"
			onmouseover="ajaxcalendar('<%=i %>','${login.id }','<%=rdate %>')">
			<%=i %>
			<div id="my<%=i %>"></div>
		</td>
		<% 
		if((i+dayOfWeek-1)%7 == 0){
			%>
			</tr><tr height="40px">
			<%
		}
	}
	for(int i = 0;i < (7-(dayOfWeek+lastDayOfMonth-1)%7)%7; i++){
		%>
		<td>&nbsp;</td>	
		<%
	}
	%>
</tr>
</table>
</div>
			                </div>
			            </div>
			           
			        </div>
			    </div>
			</li>
			
			<li id="tab3">
				<div class="cont_box-office_select">
			        <div class="title-type02">
			            <h3>의료진 선택</h3>
			        </div>
			        <div>
			            <div class="doctor_detail">
			            	<div class="select_wrap_team">
			            		<span class="form-text">
			            			<label for="team_searhc" class="placeholder" style="display: none;">
			            				의료진명을 2글자 이상으로 입력해 주세요
			            			</label>
			            			<input type="text" id="team_searhc">
			            		</span>
			            		<a href="검색쿼리문으로" class="btn-type02 btn-search"><em>검색</em></a>
			            		<a href="검색초기화제이쿼리" class="btn-type02 btn-search refresh_btn"><em>검색 초기화</em></a>
			            	</div>
			            </div>
			        </div>
			        <div style="overflow:auto; width: 820px; height: 500px;">
			        	<!-- for문돌려서의사디테일생성 -->
			        </div>
			    </div>
			</li>
			</ol>
			</div>
			<div class="revbtn_section">
				<button id="revbtn">이전단계로</button>
			</div>
		</div>

<!-- <div id="slidebox">
		<ul id="slider">
			<li>
				<img src="http://dummyimage.com/300x200/ff00ff/ffffff.png&text=img 1" />
			</li>
			<li>
				<img src="http://dummyimage.com/300x200/82e600/ff0000.png&text=img 2" />
			</li>
			<li>
				<img src="http://dummyimage.com/300x200/009eb3/000000.png&text=img 3" />
			</li>
			<li>
				<img src="http://dummyimage.com/300x200/d4bb00/0011ff.png&text=img 4" />
			</li>
			<li>
				<img src="http://dummyimage.com/300x200/7a3f00/ffffff.png&text=img 5" />
			</li>
		</ul>
	</div> -->
     </div></div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>
