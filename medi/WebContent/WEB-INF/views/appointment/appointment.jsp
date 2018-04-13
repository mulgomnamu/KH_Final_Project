<%@page import="java.util.Calendar"%>
<%@page import="kh.com.medi.aop.myCal"%>
<%@page import="kh.com.medi.aop.CalendarUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
//병원검색해서리스트불러오기
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
//의사리스트불러오기
function getdoctor(hos_seq) {
	$("#step1_1").fadeOut();
	$.ajax({
		url : "getdoctor.do", // a.jsp 의 제이슨오브젝트값을 가져옴
		data:"hos_seq="+hos_seq,
		dataType : "json", // 데이터 타입을 제이슨 꼭해야함, 다른방법도 2가지있음
		cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐
		success : function(data) {
			$("#getdoclistdiv").html(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
			$("#_hos_seq").val(hos_seq);
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
//의사 스케줄 반영한 달력불러오기
function getscadule(doc_seq) {
	$("#step2_1").fadeOut();
	cleanser();
	
$.ajax({
	url : "getscadule.do", // a.jsp 의 제이슨오브젝트값을 가져옴
	data:"doc_seq="+doc_seq,
	dataType : "json", // 데이터 타입을 제이슨 꼭해야함, 다른방법도 2가지있음
	cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐
	success : function(data) {
		$("#cal_area").html(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
		$("<table id='datecal' class='ser' style='width:300px' align='center'><col width='40px'/><col width='40px'/><col width='40px'/><col width='40px'/><col width='40px'/><col width='40px'/><col width='40px'/>").css({
		//css적용영역
		}).appendTo("#cal_area"); // 테이블을 생성하고 그 테이블을 div에 추가함
		$("<tr height='40px'><td class='days2' colspan='7'><a onclick='monprev()'><img src='images/appointment/prec.gif'/></a>" 
		+"<span style='color: red' id='nowyear'>"+data.year+"</span>"
		+"<span style='color: red' id='nowmonth'>"+data.month+"</span>"
		+"<td class='days2' colspan='7'><a onclick='monnext()'><img src='images/appointment/next.gif'/></a></td></tr>").appendTo("#datecal"); // 그리고 그 tr을 테이블에 붙임
		$("<tr height='40px'><th class='days2'>일</th><th class='days2'>월</th><th class='days2'>화</th><th class='days2'>수</th>"
		+"<th class='days2'>목</th><th class='days2'>금</th><th class='days2'>토</th></tr><tr id='dat1' height='40px'>").appendTo("#datecal"); // 그리고 그 tr을 테이블에 붙임
		
		for (var i = 1; i < data.dayOfWeek; i++) {	//앞쪽달력빈칸입력
			$("<td>&nbsp;</td>").appendTo("#"+i); // 그리고 그 tr을 테이블에 붙임
		}
		$("</tr><tr id='dat2' height='40px'></tr><tr id='dat3' height='40px'></tr><tr id='dat4' height='40px'></tr><tr id='dat5' height='40px'></tr><tr id='dat6' height='40px'>").appendTo("#datecal");
		
		for (var i = 1; i <= data.lastDay; i++){
			if (i<=7) {
				$("<td id='"+i+"'>").appendTo("#dat1");
			}
			else if (7<i&&i<=14) {
				$("<td id='"+i+"'>").appendTo("#dat2");
			}
			else if (14<i&&i<=21) {
				$("<td id='"+i+"'>").appendTo("#dat3");
			}
			else if (21<i&&i<=28) {
				$("<td id='"+i+"'>").appendTo("#dat4");
			}
			else if(28<i){
				$("<td id='"+i+"'>").appendTo("#dat5");
			}
			if((i+data.dayOfWeek-1)%7==1){	//일
				$("#"+i).text(i);
			}
			if((i+data.dayOfWeek-1)%7==2){	//월
				$("#"+i).text(i);
			}
			if((i+data.dayOfWeek-1)%7==3){	//화
				$("#"+i).text(i);
			}
			if((i+data.dayOfWeek-1)%7==4){	//수
				$("#"+i).text(i);
			}
			if((i+data.dayOfWeek-1)%7==5){	//목
				$("#"+i).text(i);
			}
			if((i+data.dayOfWeek-1)%7==6){	//금
				$("#"+i).text(i);
			}
			if((i+data.dayOfWeek-1)%7==0){	//토
				$("#"+i).text(i);
			} 
			
		}
		for (var i = 0; i < (7-(data.dayOfWeek+data.lastDayOfMonth-1)%7)%7; i++) {
			$("<td>&nbsp;</td>").appendTo("#dat5");
		}
		$("</tr>").appendTo("#datecal");
		var key = Object.keys(data["canlist"][0]);
		$.each(data.canlist, function(index, canlist) { 
			var items=[];
			if(canlist.day=='일'){	//일
				$("#1").css("color","red");
				$("#8").css("color","red");
				$("#15").css("color","red");
				$("#22").css("color","red");
				$("#29").css("color","red");
			}
			if(canlist.day=='월'){	//월
				$("#2").css("color","red");
				$("#9").css("color","red");
				$("#16").css("color","red");
				$("#23").css("color","red");
				$("#30").css("color","red");
			}
			if(canlist.day=='화'){	//화
				$("#3").css("color","red");
				$("#10").css("color","red");
				$("#17").css("color","red");
				$("#24").css("color","red");
				$("#31").css("color","red");
			}
			if(canlist.day=='수'){	//수
				$("#4").css("color","red");
				$("#11").css("color","red");
				$("#18").css("color","red");
				$("#25").css("color","red");
			}
			if(canlist.day=='목'){	//목
				$("#5").css("color","red");
				$("#12").css("color","red");
				$("#19").css("color","red");
				$("#26").css("color","red");
			}
			if(canlist.day=='금'){	//금
				$("#6").css("color","red");
				$("#13").css("color","red");
				$("#20").css("color","red");
				$("#27").css("color","red");
			}
			if(canlist.day=='토'){	//토
				$("#7").css("cursor","pointer");
				$('#7').click(function(){
					
					var times=(canlist.start_time).split('-');
					var whatday="";
					if (($("#7").text()).length==1) {
						whatday="0"+$("#7").text();
					}
					var appointmentday=data.year+data.month+whatday;
					var doc_seq=canlist.doc_seq;
					
					for (var i = 0; i < times.length; i++) {
						$("<button onclick='settime("+(appointmentday+times[i])+","+doc_seq+")'>"+times[i]+"</button>").appendTo('#time_area');
					}
					
					});
				$("#14").css("color","red");
				$("#21").css("color","red");
				$("#28").css("color","red");
			}
			
		});//each끝 
		
	}

});
}
function settime(time,doc_seq) {
	$("<button id='reservbtn' onclick='appointment("+time+","+doc_seq+")'>예약하기</button>").appendTo("#reservebtn_section");
}
function appointment(day,doc_seq) {
	/* 성공하면 예약디테일로 실패하는경우 어디서실패하느냐에따라서맨트설정해야한다 예약시간검색쿼리에있으면 예약시간을다시선택해주세요 */
	if ($("#_content").val()=="") {
		alert("증상을입력해주세요");
		return
	}
	var data={
			day:day,
			doc_seq:doc_seq,
			content:$("#_content").val(),
			type:0
	};
	 $.ajax({
	      type:"post",
	      url:"reserve.do",
	      async:true,
	      data:data,
	      success:function(msg){
	    	  if(msg.message == 'RESERVEYES'){
	    	     /* 디테일창으로~ */
	    	     alert(msg.message);
	    	   } else{
	    		   /* 정보다끌고...다시appointment로.. */
	    		   alert(msg.message);
	    	   }
	      }
	      
	   });
}

function cleanser() {
	$(".ser").html("");
}
</script>
<c:if test="${empty login }">
	<script type="text/javascript">
	alert("로그인후이용가능합니다");
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
				<div class="cont_box-office_select">
			        
			        <div>
			            <div class="doctor_detail">
			            	<div class="select_wrap_team">
			            		<div class="step_cont_wrap" style="float: left; width: 820px;" id="step1_1">
			            			<div class="title-type02">
							            <h3>병원으로 선택</h3>
							        </div>
				            		<span class="form-text" style="width: 560px;">
				            			<label for="team_searhc" class="placeholder" style="display: none;">
				            				병원명을 2글자 이상으로 입력해 주세요
				            			</label>
				            			<input type="text" id="hosserch" name="name">
				            		</span>
				            		<a onclick="hospitallist()" style="cursor: pointer;" class="btn-type02 btn-search"><em>검색</em></a>
				            		<a class="btn-type02 btn-search refresh_btn" style="cursor: pointer; width: 140px;"><em>검색초기화</em></a>
				            		<div id="hospitallistdiv" style="overflow:auto; width: 820px; height: 500px;">
							        	<!-- ajax로 리스트받아오는부분 -->
							        </div>
							        
							        
			            		</div>
			            		<div class="list_wrap" style="width: 280px; height: 600px;float: right;">
			            			<div id="mem_info" style="height: 150px; background: #ff7e00; color: #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">1</strong>&nbsp;&nbsp;&nbsp;환자정보
			            				<br>
			            				<ul style="list-style-type:disc; padding-left: 40px;">
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.name }</li>
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.phone }</li>
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.email }</li>
			            				</ul>
			            			</div>
			            			<div style="height: 150px; background: #555;color: #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">2</strong>&nbsp;&nbsp;&nbsp;병원정보
			            				<br>
			            				<div id="hospital_info">
			            					<p style="text-align: center; padding-top: 20px;">
			            					<img src="images/main/icon_list_office.png">
			            					</p>
			            				</div>
			            			</div>
			            			<div style="height: 150px; background: #555;color: #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">3</strong>&nbsp;&nbsp;&nbsp;의료진
			            				<br>
			            				<div id="doctor_info">
			            					<p style="text-align: center; padding-top: 20px;">
			            					<img src="images/main/icon_list_doctor.png">
			            					</p>
			            				</div>
			            			</div>
			            			<div style="height: 170px; background: #555;color: #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">4</strong>&nbsp;&nbsp;&nbsp;진료일시
			            				<br>
			            				<div id="time_info">
			            					<p style="text-align: center; padding-top: 20px;">
			            					<img src="images/main/icon_list_data.png">
			            					</p>
			            				</div>
			            			</div>
			            		</div>
			            	</div>
			            </div>
			        </div>
			        
			    </div>
			    <div class="cont_box-office_select" id="step2_1" style="clear: both;">
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
						        	<!-- ajax로스케쥴달력불러오는곳 -->
						        	<div id="cal_area" style="width: 300px">
						        	</div>
						        	<!-- ajax로스케쥴시간불러오는곳 -->
						        	<div id="time_area" style="width: 300px">
						        	</div>
						        	<!-- 증상입력 -->
						        	<div id="content_area" style="width: 300px">
						        	 <h3>증상을써주세요</h3>
						        	<input type="text" name="content" id="_content">
						        	</div>
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
			<div id="reservebtn_section">
				<button id="revbtn">이전단계로</button>
			</div>
			<div id="data_area">
				<input type="hidden" name="hos_seq" id="_hos_seq">
				<input type="hidden" name="type" id="_type">
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
