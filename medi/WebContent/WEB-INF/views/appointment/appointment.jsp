<%@page import="java.util.Calendar"%>
<%@page import="kh.com.medi.aop.myCal"%>
<%@page import="kh.com.medi.aop.CalendarUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/appointment.css?ver=1.24"/>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/appointment.js"></script>

<script type="text/javascript">
function doclist() {
	var serlen=$("#docserch").val();
	if(serlen.length<2){
		alert("두글자이상으로검색해주세요");
		$("#docserch").val("");
		return
	}
	$.ajax({
		url : "doclist.do", // a.jsp 의 제이슨오브젝트값을 가져옴
		data:"name="+$("#docserch").val(),
		dataType : "json", // 데이터 타입을 제이슨 꼭해야함, 다른방법도 2가지있음
		cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐
		success : function(data) {
			if (data.yn=="no") {
				alert("찾으시는 의사가 없습니다.");
				$("#docserch").val("");
			}
			$("#doclistdiv").html(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
			$("<table class='ser' id='table3_1'/>").css({
			}).appendTo("#doclistdiv"); // 테이블을 생성하고 그 테이블을 div에 추가함
			var key = Object.keys(data["doclist"][0]); // seq,name,info,address,tel의 키값을 가져옴
			$.each(data.doclist, function(index, doclist) { // 이치를 써서 모든 데이터들을 배열에 넣음
				var items = [];
				items.push("<td class='ser'><a href='javascript:void(0);' onclick='getscadule3("+doclist.seq+","+doclist.hos_seq+")'>" 
				+ doclist.doc_profile + "</td>");	//img태그로 사진넣어야하고css해야한다
				items.push("<td class='ser'><a href='javascript:void(0);' onclick='getscadule3("+doclist.seq+","+doclist.hos_seq+")'>"
				+ doclist.name + "</a></td>"); // 여기에 id pw addr tel의 값을 배열에 넣은뒤
				items.push("<td class='ser'>" + doclist.specialty + "</td>");
				items.push("<td class='ser'>" + doclist.doc_content + "</td>");
				$("<tr/>", {
					html : items // 티알에 붙임,
				}).appendTo("#table3_1"); // 그리고 그 tr을 테이블에 붙임
			});//each끝
		}
	});
}
//의사 스케줄 반영한 달력불러오기
function getscadule3(doc_seq,hos_seq) {
	$("#step3_1").fadeOut();
	$("#step3_2").fadeIn();
	$.ajax({
		url : "hosdto.do", // a.jsp 의 제이슨오브젝트값을 가져옴
		data:"hos_seq="+hos_seq,
		dataType : "json", // 데이터 타입을 제이슨 꼭해야함, 다른방법도 2가지있음
		cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐
		success : function(data) {
			$(".reserve2").html("");
			$("<span id='h_img'></span><ul><li><small style='font-size: 0.5em'>●</small>&nbsp;&nbsp;"+data.hosdto.name+"</li>"
			+"<li><small style='font-size: 0.5em'>●</small>&nbsp;&nbsp;"+data.hosdto.tel+"</li></ul>").appendTo(".reserve2");
			
		}
	});
$.ajax({
	url : "getscadule.do", // a.jsp 의 제이슨오브젝트값을 가져옴
	data:"doc_seq="+doc_seq,
	dataType : "json", // 데이터 타입을 제이슨 꼭해야함, 다른방법도 2가지있음
	cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐
	success : function(data) {
		$("#cal_area3").html(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
		$("#caltitle3").remove();
		$("#docinfo3").remove();
		$("<table id='datecal3' class='ser' style='width:500px; display:inline;' align='center'><col width='60px'/><col width='60px'/><col width='60px'/><col width='60px'/><col width='60px'/><col width='60px'/><col width='60px'/>").css({
		//css적용영역
		}).appendTo("#cal_area3"); // 테이블을 생성하고 그 테이블을 div에 추가함
		$(".reserve3").html("");
		$("<span id='d_img'></span><ul><li><small style='font-size: 0.5em'>●</small>&nbsp;&nbsp;"+data.name+"</li>"
			+"<li><small style='font-size: 0.5em'>●</small>&nbsp;&nbsp;"+data.specialty+"</li></ul>").appendTo(".reserve3");
		
		//선생님추가하는곳
		$("<p id='docinfo3'><strong>"+data.name+"</strong>선생님의 진료일입니다</p><div id='caltitle3'><a onclick='monprev3("+doc_seq+","+data.month+","+data.year+")' id='monprev'>&lt;</a>"+data.year+"."+data.month
		+"<a onclick='monnext3("+doc_seq+","+data.month+","+data.year+")' id='monnext'>&gt;</a></div>").appendTo("#calendartitle3"); // 그리고 그 tr을 테이블에 붙임
		
		$("<tr><th class='days2'>일</th><th class='days2'>월</th><th class='days2'>화</th><th class='days2'>수</th>"
		+"<th class='days2'>목</th><th class='days2'>금</th><th class='days2'>토</th></tr><tr id='dat1'>").appendTo("#datecal3"); // 그리고 그 tr을 테이블에 붙임
		
		$("</tr><tr id='dat2'></tr><tr id='dat3'></tr><tr id='dat4'></tr><tr id='dat5'></tr>").appendTo("#datecal3");
		var days=1;
		for (var i = 1; i <= data.lastDay; i++){
			
			if (i<=7) {
				if (data.dayOfWeek>i) {
					$("<td id='"+i+"'>&nbsp;</td>").appendTo("#dat1"); 
				}else{
					$("<td id='"+i+"'>").appendTo("#dat1");
				}
				
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
			//일자찍어주기
			if((i+data.dayOfWeek-1)%7==1){	//일
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			}
			if((i+data.dayOfWeek-1)%7==2){	//월
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			}
			if((i+data.dayOfWeek-1)%7==3){	//화
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			}
			if((i+data.dayOfWeek-1)%7==4){	//수
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			}
			if((i+data.dayOfWeek-1)%7==5){	//목
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			}
			if((i+data.dayOfWeek-1)%7==6){	//금
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			}
			if((i+data.dayOfWeek-1)%7==0){	//토
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			} 
			
		}
		for (var i = 0; i < (7-(data.dayOfWeek+data.lastDayOfMonth-1)%7)%7; i++) {
			$("<td>&nbsp;</td>").appendTo("#dat5");
		}
		$("</tr>").appendTo("#datecal3");
		var key = Object.keys(data["canlist"][0]);
		$.each(data.canlist, function(index, canlist) { 
			var items=[];
			
			if(canlist.day=='일'){	//일
				$("#1>.divwrap").wrap('<div class="circle"></div>');
				$("#8>.divwrap").wrap('<div class="circle"></div>');
				$("#15>.divwrap").wrap('<div class="circle"></div>');
				$("#22>.divwrap").wrap('<div class="circle"></div>');
				$("#29>.divwrap").wrap('<div class="circle"></div>');
				$("#1,#8,#15,#22,#29").attr("class","caldaycss1");
				$(".caldaycss1").click(function(){
					$("#time_area3").html("");
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);
					
					});
			}
			if(canlist.day=='월'){	//월
				$("#2>.divwrap").wrap('<div class="circle"></div>');
				$("#9>.divwrap").wrap('<div class="circle"></div>');
				$("#16>.divwrap").wrap('<div class="circle"></div>');
				$("#23>.divwrap").wrap('<div class="circle"></div>');
				$("#30>.divwrap").wrap('<div class="circle"></div>');
				$("#2,#9,#16,#23,#30").attr("class","caldaycss2");
				$(".caldaycss2").click(function(){
					$("#time_area3").html("");
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);
					
					});
			}
			if(canlist.day=='화'){	//화
				$("#3>.divwrap").wrap('<div class="circle"></div>');
				$("#10>.divwrap").wrap('<div class="circle"></div>');
				$("#17>.divwrap").wrap('<div class="circle"></div>');
				$("#24>.divwrap").wrap('<div class="circle"></div>');
				$("#31>.divwrap").wrap('<div class="circle"></div>');
				$("#3,#10,#17,#24,#31").attr("class","caldaycss3");
				$(".caldaycss3").click(function(){
					$("#time_area3").html("");
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);
					
					});
			}
			if(canlist.day=='수'){	//수
				$("#4>.divwrap").wrap('<div class="circle"></div>');
				$("#11>.divwrap").wrap('<div class="circle"></div>');
				$("#18>.divwrap").wrap('<div class="circle"></div>');
				$("#25>.divwrap").wrap('<div class="circle"></div>');
				$("#4,#11,#18,#25").attr("class","caldaycss4");
				$(".caldaycss4").click(function(){
					$("#time_area3").html("");
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);
					
					});
			}
			if(canlist.day=='목'){	//목
				$("#5>.divwrap").wrap('<div class="circle"></div>');
				$("#12>.divwrap").wrap('<div class="circle"></div>');
				$("#19>.divwrap").wrap('<div class="circle"></div>');
				$("#26>.divwrap").wrap('<div class="circle"></div>');
				$("#5,#12,#19,#26").attr("class","caldaycss5");
				$(".caldaycss5").click(function(){
					$("#time_area3").html("");
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);
					
					});
			}
			if(canlist.day=='금'){	//금
				$("#6>.divwrap").wrap('<div class="circle"></div>');
				$("#13>.divwrap").wrap('<div class="circle"></div>');
				$("#20>.divwrap").wrap('<div class="circle"></div>');
				$("#27>.divwrap").wrap('<div class="circle"></div>');
				$("#6,#13,#20,#27").attr("class","caldaycss6");
				$(".caldaycss6").click(function(){
					$("#time_area3").html("");
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);
					});
			}
			if(canlist.day=='토'){	//토
				$("#7>.divwrap").wrap('<div class="circle"></div>');
				$("#14>.divwrap").wrap('<div class="circle"></div>');
				$("#21>.divwrap").wrap('<div class="circle"></div>');
				$("#28>.divwrap").wrap('<div class="circle"></div>');
				$("#7,#14,#21,#28").attr("class","caldaycss7");
				$(".caldaycss7").click(function(){
					$("#time_area3").html("");
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);
					});
			}
			//오늘찍어주기
			if($("#"+data.today).text()==data.today&&data.nowmon==data.month){
				$("#"+data.today).attr("class","today");
			}
			//오늘이전날짜초기화
			for (var i = 1; i < 31; i++) {
				if($("#"+i).text()==data.today&&data.nowmon==data.month){
					$("#"+i).children(".circle").attr("class","non3");
					$("#"+i).children(".divwrap").attr("class","non2");
				}
				else if($("#"+i).text()<data.today&&data.nowmon==data.month){
					$("#"+i).attr("class","non");
					$("#"+i).children(".circle").attr("class","non");
					$("#"+i).children(".divwrap").attr("class","non");
				}
			}
			
		});//each끝 
		
	}

});
}
//의사 스케줄 반영한 다음달달력불러오기
function monnext3(doc_seq,month,year) {
	cleanser();
	var dt = new Date();
	var nowmon = dt.getMonth()+1;
	var _month=month*1;
	if(_month+1==nowmon+2){
		alert("두달뒤는 예약이 불가합니다");
		getscadule3(doc_seq);
		return
	}
	var data={
			doc_seq:doc_seq,
			month:month+1,
			year:year
	};	
$.ajax({
	url : "monnext.do", 
	data:data,
	dataType : "json", 
	cache : false, 
	success : function(data) {
		$("#cal_area3").html(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
		$("#caltitle3").remove("");
		$("<table id='datecal3' class='ser' style='width:500px; display:inline;' align='center'><col width='60px'/><col width='60px'/><col width='60px'/><col width='60px'/><col width='60px'/><col width='60px'/><col width='60px'/>").css({
		//css적용영역
		}).appendTo("#cal_area3"); // 테이블을 생성하고 그 테이블을 div에 추가함
		//선생님추가하는곳
		$("<div id='caltitle3'><a onclick='monprev3("+doc_seq+","+data.month+","+data.year+")' id='monprev'>&lt;</a>"+data.year+"."+data.month
		+"<a onclick='monnext3("+doc_seq+","+data.month+","+data.year+")' id='monnext'>&gt;</a></div>").appendTo("#calendartitle3"); // 그리고 그 tr을 테이블에 붙임
		
		$("<tr><th class='days2'>일</th><th class='days2'>월</th><th class='days2'>화</th><th class='days2'>수</th>"
		+"<th class='days2'>목</th><th class='days2'>금</th><th class='days2'>토</th></tr><tr id='dat1'>").appendTo("#datecal3"); // 그리고 그 tr을 테이블에 붙임
		
		$("</tr><tr id='dat2'></tr><tr id='dat3'></tr><tr id='dat4'></tr><tr id='dat5'></tr>").appendTo("#datecal3");
		var days=1;
		for (var i = 1; i <= data.lastDay; i++){
			
			if (i<=7) {
				if (data.dayOfWeek>i) {
					$("<td id='"+i+"'>&nbsp;</td>").appendTo("#dat1"); 
				}else{
					$("<td id='"+i+"'>").appendTo("#dat1");
				}
				
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
			//일자찍어주기
			//시작번호 3 에 1을넣어줘야한다 i=1
			if((i+data.dayOfWeek-1)%7==1){	//일
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			}
			if((i+data.dayOfWeek-1)%7==2){	//월
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			}
			if((i+data.dayOfWeek-1)%7==3){	//화
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			}
			if((i+data.dayOfWeek-1)%7==4){	//수
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			}
			if((i+data.dayOfWeek-1)%7==5){	//목
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			}
			if((i+data.dayOfWeek-1)%7==6){	//금
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			}
			if((i+data.dayOfWeek-1)%7==0){	//토
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			} 
			
		}
		for (var i = 0; i < (7-(data.dayOfWeek+data.lastDayOfMonth-1)%7)%7; i++) {
			$("<td>&nbsp;</td>").appendTo("#dat5");
		}
		$("</tr>").appendTo("#datecal3");
		var key = Object.keys(data["canlist"][0]);
		$.each(data.canlist, function(index, canlist) { 
			var items=[];
			if(canlist.day=='일'){	//일
				$("#1>.divwrap").wrap('<div class="circle"></div>');
				$("#8>.divwrap").wrap('<div class="circle"></div>');
				$("#15>.divwrap").wrap('<div class="circle"></div>');
				$("#22>.divwrap").wrap('<div class="circle"></div>');
				$("#29>.divwrap").wrap('<div class="circle"></div>');
				$("#1,#8,#15,#22,#29").attr("class","caldaycss1");
				$(".caldaycss1").click(function(){
					$("#time_area3").html("");
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);					
					});
			}
			if(canlist.day=='월'){	//월
				$("#2>.divwrap").wrap('<div class="circle"></div>');
				$("#9>.divwrap").wrap('<div class="circle"></div>');
				$("#16>.divwrap").wrap('<div class="circle"></div>');
				$("#23>.divwrap").wrap('<div class="circle"></div>');
				$("#30>.divwrap").wrap('<div class="circle"></div>');
				$("#2,#9,#16,#23,#30").attr("class","caldaycss2");
				$(".caldaycss2").click(function(){
					$("#time_area3").html("");
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);
					
					});
			}
			if(canlist.day=='화'){	//화
				$("#3>.divwrap").wrap('<div class="circle"></div>');
				$("#10>.divwrap").wrap('<div class="circle"></div>');
				$("#17>.divwrap").wrap('<div class="circle"></div>');
				$("#24>.divwrap").wrap('<div class="circle"></div>');
				$("#31>.divwrap").wrap('<div class="circle"></div>');
				$("#3,#10,#17,#24,#31").attr("class","caldaycss3");
				$(".caldaycss3").click(function(){
					$("#time_area3").html("");
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);
					
					});
			}
			if(canlist.day=='수'){	//수
				$("#4>.divwrap").wrap('<div class="circle"></div>');
				$("#11>.divwrap").wrap('<div class="circle"></div>');
				$("#18>.divwrap").wrap('<div class="circle"></div>');
				$("#25>.divwrap").wrap('<div class="circle"></div>');
				$("#4,#11,#18,#25").attr("class","caldaycss4");
				$(".caldaycss4").click(function(){
					$("#time_area3").html("");
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);
					
					});
			}
			if(canlist.day=='목'){	//목
				$("#5>.divwrap").wrap('<div class="circle"></div>');
				$("#12>.divwrap").wrap('<div class="circle"></div>');
				$("#19>.divwrap").wrap('<div class="circle"></div>');
				$("#26>.divwrap").wrap('<div class="circle"></div>');
				$("#5,#12,#19,#26").attr("class","caldaycss5");
				$(".caldaycss5").click(function(){
					$("#time_area3").html("");
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);
					
					});
			}
			if(canlist.day=='금'){	//금
				$("#6>.divwrap").wrap('<div class="circle"></div>');
				$("#13>.divwrap").wrap('<div class="circle"></div>');
				$("#20>.divwrap").wrap('<div class="circle"></div>');
				$("#27>.divwrap").wrap('<div class="circle"></div>');
				$("#6,#13,#20,#27").attr("class","caldaycss6");
				$(".caldaycss6").click(function(){
					$("#time_area3").html("");
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);
					
					});
			}
			if(canlist.day=='토'){	//토
				$("#7>.divwrap").wrap('<div class="circle"></div>');
				$("#14>.divwrap").wrap('<div class="circle"></div>');
				$("#21>.divwrap").wrap('<div class="circle"></div>');
				$("#28>.divwrap").wrap('<div class="circle"></div>');
				$("#7,#14,#21,#28").attr("class","caldaycss7");
				$(".caldaycss7").click(function(){
					$("#time_area3").html("");
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);
					
					});
			}
			//오늘날짜찍어주기
			if($("#"+data.today).text()==data.today&&data.nowmon==data.month){
				$("#"+data.today).attr("class","today");
			}
			//오늘달력전날없애기
			for (var i = 1; i < 31; i++) {
				if($("#"+i).text()==data.today&&data.nowmon==data.month){
					$("#"+i).children(".divwrap").attr("class","non2");
				}
				else if($("#"+i).text()<data.today&&data.nowmon==data.month){
					$("#"+i).attr("class","non");
					$("#"+i).children(".circle").attr("class","non");
					$("#"+i).children(".divwrap").attr("class","non");
				}
			}
			//의사가능한날짜찍어주기
			
		});//each끝 
	}

});
}
//저번달달력불러오기
function monprev3(doc_seq,month,year) {
	cleanser();
	var dt = new Date();
	var nowmon = dt.getMonth()+1;
	var _month=month*1;
	if(_month-1<nowmon){
		alert("지난달은 예약이 불가합니다");
		getscadule3(doc_seq);
		return
	}
	var data={
			doc_seq:doc_seq,
			month:month-1,
			year:year
	};	
$.ajax({
	url : "monnext.do", 
	data:data,
	dataType : "json", 
	cache : false, 
	success : function(data) {
		$("#cal_area3").html(""); 
		$("#caltitle3").remove("");
		$("<table id='datecal3' class='ser' style='width:500px; display:inline;' align='center'><col width='60px'/><col width='60px'/><col width='60px'/><col width='60px'/><col width='60px'/><col width='60px'/><col width='60px'/>").css({
		//css적용영역
		}).appendTo("#cal_area3"); // 테이블을 생성하고 그 테이블을 div에 추가함
		//선생님추가하는곳
		$("<div id='caltitle3'><a onclick='monprev3("+doc_seq+","+data.month+","+data.year+")' id='monprev'>&lt;</a>"+data.year+"."+data.month
		+"<a onclick='monnext3("+doc_seq+","+data.month+","+data.year+")' id='monnext'>&gt;</a></div>").appendTo("#calendartitle3"); // 그리고 그 tr을 테이블에 붙임
		
		$("<tr><th class='days2'>일</th><th class='days2'>월</th><th class='days2'>화</th><th class='days2'>수</th>"
		+"<th class='days2'>목</th><th class='days2'>금</th><th class='days2'>토</th></tr><tr id='dat1'>").appendTo("#datecal3"); // 그리고 그 tr을 테이블에 붙임
		
		$("</tr><tr id='dat2'></tr><tr id='dat3'></tr><tr id='dat4'></tr><tr id='dat5'></tr>").appendTo("#datecal3");
		var days=1;
		for (var i = 1; i <= data.lastDay; i++){
			
			if (i<=7) {
				if (data.dayOfWeek>i) {
					$("<td id='"+i+"'>&nbsp;</td>").appendTo("#dat1"); 
				}else{
					$("<td id='"+i+"'>").appendTo("#dat1");
				}
				
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
			//일자찍어주기
			//시작번호 3 에 1을넣어줘야한다 i=1
			if((i+data.dayOfWeek-1)%7==1){	//일
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			}
			if((i+data.dayOfWeek-1)%7==2){	//월
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			}
			if((i+data.dayOfWeek-1)%7==3){	//화
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			}
			if((i+data.dayOfWeek-1)%7==4){	//수
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			}
			if((i+data.dayOfWeek-1)%7==5){	//목
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			}
			if((i+data.dayOfWeek-1)%7==6){	//금
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			}
			if((i+data.dayOfWeek-1)%7==0){	//토
				if (data.dayOfWeek>i) {
					$("#"+i).html("&nbsp;");
				}
				else{
					$("#"+i).html("<div class=divwrap>"+days+"</div>");
					days++;
				}
			} 
			
		}
		for (var i = 0; i < (7-(data.dayOfWeek+data.lastDayOfMonth-1)%7)%7; i++) {
			$("<td>&nbsp;</td>").appendTo("#dat5");
		}
		$("</tr>").appendTo("#datecal3");
		var key = Object.keys(data["canlist"][0]);
		$.each(data.canlist, function(index, canlist) { 
			var items=[];
			if(canlist.day=='일'){	//일
				$("#1>.divwrap").wrap('<div class="circle"></div>');
				$("#8>.divwrap").wrap('<div class="circle"></div>');
				$("#15>.divwrap").wrap('<div class="circle"></div>');
				$("#22>.divwrap").wrap('<div class="circle"></div>');
				$("#29>.divwrap").wrap('<div class="circle"></div>');
				$("#1,#8,#15,#22,#29").attr("class","caldaycss1");
				$(".caldaycss1").click(function(){
					$("#time_area3").html("");
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);
					});
			}
			if(canlist.day=='월'){	//월
				$("#2>.divwrap").wrap('<div class="circle"></div>');
				$("#9>.divwrap").wrap('<div class="circle"></div>');
				$("#16>.divwrap").wrap('<div class="circle"></div>');
				$("#23>.divwrap").wrap('<div class="circle"></div>');
				$("#30>.divwrap").wrap('<div class="circle"></div>');
				$("#2,#9,#16,#23,#30").attr("class","caldaycss2");
				$(".caldaycss2").click(function(){
					$("#time_area3").html("");
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);
					});
			}
			if(canlist.day=='화'){	//화
				$("#3>.divwrap").wrap('<div class="circle"></div>');
				$("#10>.divwrap").wrap('<div class="circle"></div>');
				$("#17>.divwrap").wrap('<div class="circle"></div>');
				$("#24>.divwrap").wrap('<div class="circle"></div>');
				$("#31>.divwrap").wrap('<div class="circle"></div>');
				$("#3,#10,#17,#24,#31").attr("class","caldaycss3");
				$(".caldaycss3").click(function(){
					$("#time_area3").html("");
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);
					});
			}
			if(canlist.day=='수'){	//수
				$("#4>.divwrap").wrap('<div class="circle"></div>');
				$("#11>.divwrap").wrap('<div class="circle"></div>');
				$("#18>.divwrap").wrap('<div class="circle"></div>');
				$("#25>.divwrap").wrap('<div class="circle"></div>');
				$("#4,#11,#18,#25").attr("class","caldaycss4");
				$(".caldaycss4").click(function(){
					$("#time_area3").html("");
					//가능한시간불러와서 시간세팅하는걸로던져준다
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);
					});
			}
			if(canlist.day=='목'){	//목
				$("#5>.divwrap").wrap('<div class="circle"></div>');
				$("#12>.divwrap").wrap('<div class="circle"></div>');
				$("#19>.divwrap").wrap('<div class="circle"></div>');
				$("#26>.divwrap").wrap('<div class="circle"></div>');
				$("#5,#12,#19,#26").attr("class","caldaycss5");
				$(".caldaycss5").click(function(){
					$("#time_area3").html("");
					//가능한시간불러와서 시간세팅하는걸로던져준다
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);
					
					
					});
			}
			if(canlist.day=='금'){	//금
				$("#6>.divwrap").wrap('<div class="circle"></div>');
				$("#13>.divwrap").wrap('<div class="circle"></div>');
				$("#20>.divwrap").wrap('<div class="circle"></div>');
				$("#27>.divwrap").wrap('<div class="circle"></div>');
				$("#6,#13,#20,#27").attr("class","caldaycss6");
				$(".caldaycss6").click(function(){
					$("#time_area3").html("");
					//가능한시간불러와서 시간세팅하는걸로던져준다
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);
					
					
					});
			}
			if(canlist.day=='토'){	//토
				$("#7>.divwrap").wrap('<div class="circle"></div>');
				$("#14>.divwrap").wrap('<div class="circle"></div>');
				$("#21>.divwrap").wrap('<div class="circle"></div>');
				$("#28>.divwrap").wrap('<div class="circle"></div>');
				$("#7,#14,#21,#28").attr("class","caldaycss7");
				$(".caldaycss7").click(function(){
					$("#time_area3").html("");
					//가능한시간불러와서 시간세팅하는걸로던져준다
					settime3(this,canlist.doc_seq,data.year,data.month,canlist.day);
					
					});
			}
			//오늘날짜찍어주기
			if($("#"+data.today).text()==data.today&&data.nowmon==data.month){
				$("#"+data.today).attr("class","today");
			}
			//오늘달력전날없애기
			for (var i = 1; i < 31; i++) {
				if($("#"+i).text()==data.today&&data.nowmon==data.month){
					$("#"+i).children(".divwrap").attr("class","non2");
				}
				else if($("#"+i).text()<data.today&&data.nowmon==data.month){
					$("#"+i).attr("class","non");
					$("#"+i).children(".circle").attr("class","non");
					$("#"+i).children(".divwrap").attr("class","non");
				}
			}
			 
		});//each끝 
	}

});
}
function settime3(elem,_doc_seq,year,month,dayoftheweek) {
	$(".reserve4").html("");
	$("#reservebtn_section3").html("");
	var whatday="";
	if (($(elem).text()).length==1) {
		whatday="0"+$(elem).text();
	}else{
		whatday=$(elem).text();
	}
	var appointmentday=year+month+whatday;
	var doc_seq=_doc_seq;
	var data={
			day:appointmentday,
			doc_seq:doc_seq,
			message:dayoftheweek
	};
	 $.ajax({
	      type:"post",
	      url:"cantime.do",
	      async:true,
	      data:data,
	      success:function(data){
	    	 var times=(data.canttimes).split('-');
	   		 if(data.canttimes==null||data.canttimes==""){
	    		 $("<div style='padding-top:50px;'>진료가능한 시간이 없습니다</div>").appendTo('#time_area3');
	    	 } 
    	  for (var i = 0; i < times.length-1; i++) {
    			$("<a class='times' onclick='appointment3("+(data.day+times[i])+","+doc_seq+")'><div>"+times[i]+"</div></a>").appendTo('#time_area3');
    		}
	      }
	   });
}
function appointment3(day,doc_seq) {
	$(".reserve4").html("");
	$("#reservebtn_section3").html("");
	$("<a id='reservbtn' onclick='reservation3("+day+","+doc_seq+")'>예약하기&nbsp;&nbsp;&nbsp;&nbsp;&gt;</a>").appendTo("#reservebtn_section3");
	
	day1=day+"";
	var day2=day1.substring(0,4)+"."+day1.substring(4,6)+"."+day1.substring(6,8);
	var time2=day1.substring(8,10)+":"+day1.substring(10,12);
	$("<p>"+day2+"</p><p>"+time2+"</p>").appendTo(".reserve4");
}
function reservation3(day,doc_seq) {
	/* 성공하면 예약디테일로 실패하는경우 어디서실패하느냐에따라서맨트설정해야한다 예약시간검색쿼리에있으면 예약시간을다시선택해주세요 */
	if ($("#_content3").val()=="") {
		alert("증상을입력해주세요");
		return
	}
	var data={
			day:day,
			doc_seq:doc_seq,
			content:$("#_content3").val(),
			type:0
	};
	 $.ajax({
	      type:"post",
	      url:"reserve.do",
	      async:true,
	      data:data,
	      success:function(data){
	    	  if(data.yes == 'RESERVEYES'){
	    	     /* 디테일창으로~ */
	    	     alert("예약했다니");
	    	     location.href="reservedetail.do?mem_seq="+data.mem_seq+"&hos_seq="+data.hos_seq+"&doc_seq="+data.doc_seq;
	    	      
	    	   } else{
    		   /* 정보다끌고...다시appointment로.. */
	    		   alert("방금예약이 됐습니다 다른시간을 선택해주세요");
	    	   }
	      }
	      
	   });
}
</script>

<style>

</style>

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
			<div class="subpagetitle">
				  <p class="m_txt"><strong>${login.id }</strong>님, 오늘도 건강한 하루 되세요</p>
       			  <p class="s_txt">온라인 예약으로 빠르고 편리하게 진료받으실 수 있습니다</p> 
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
   			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
				<!-- 어디서예약을누르냐에따라서 뿌려주는페이지가다르게해야한다 진료(0)/화상(1)구분 디폴트값 진료 메인에서화상진료선택시만처리해준다
					1 -> 병원선택안하고 바로올때 
					2 -> 병원선택하고올때 
				 -->
				
         <div class="sub_wrap">
	         <div class="sub_content">
			    <ol id="list">
			    <li id="tab1">
				<div>
			        <div>
			            <div class="hospital_detail">
			            	<div class="select_wrap_team">
			            		<div class="step_cont_wrap" style="float: left; width: 820px; margin-top: 50px;" id="step1_1">
			            			<div class="title-type02">
							            <h3>병원으로 선택</h3>
							        </div>
				            		<span class="form-text" style="width: 560px;">
				            			<label for="team_searhc" class="placeholder">
				            				병원명을 2글자 이상으로 입력해 주세요
				            			</label>
				            			<input type="text" id="hosserch" name="name">
				            		</span>
				            		<a onclick="hospitallist()" style="cursor: pointer;" class="btn-type02 btn-search"><em>검색</em></a>
				            		<a class="btn-type02 btn-search refresh_btn" style="cursor: pointer; width: 140px;"><em>검색초기화</em></a>
				            		<div id="hospitallistdiv" style="overflow:auto; width: 820px; height: 500px;" class="tableclass">
							        	<!-- ajax로 리스트받아오는부분 -->
							        </div>
			            		</div>
			            		<div class="list_wrap" style="width: 280px; height: 600px;float: right; margin-top: 50px;margin-bottom: 50px;">
			            			<div id="mem_info" style="height: 150px; background: #ff7e00; color: #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">1</strong>&nbsp;&nbsp;&nbsp;환자정보
			            				<br>
			            				<ul style="padding-left: 40px;">
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.name }</li>
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.phone }</li>
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.email }</li>
			            				</ul>
			            			</div>
			            			<div style="height: 150px; background: #555;color: #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">2</strong>&nbsp;&nbsp;&nbsp;병원정보
			            				<br>
			            				<div id="hospital_info" class="reserve2">
			            					<p style="text-align: center; padding-top: 20px;">
			            					<img src="images/main/icon_list_office.png">
			            					</p>
			            				</div>
			            			</div>
			            			<div style="height: 150px; background: #555;color: #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">3</strong>&nbsp;&nbsp;&nbsp;의료진
			            				<br>
			            				<div id="doctor_info" class="reserve3">
			            					<p style="text-align: center; padding-top: 20px;">
			            					<img src="images/main/icon_list_doctor.png">
			            					</p> 
			            				</div>
			            			</div>
			            			<div style="height: 170px; background: #555;color: #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">4</strong>&nbsp;&nbsp;&nbsp;진료일시
			            				<br>
			            				<div id="time_info" class="reserve4">
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
			    <div>
			        <div>
			            <div class="doc_detail">
			                <div class="select_wrap_team">
			               	 <div class="step_cont_wrap" style="float: left; width: 820px; margin-top: 30px;" id="step1_2">
			                	<div class="title-type02">
						            <h3>의료진 선택</h3>
						        </div>
			                    <div id="getdoclistdiv" style="overflow:auto; width: 820px; height: 500px;" class="tableclass">
						        	<!-- ajax로 의사리스트받아오는부분 -->
						        </div>
						        <div class="prev_btn">
									<a onclick="revto1()">&lt;&nbsp;&nbsp;이전단계로</a>
								</div>
						      </div>
			                </div>
			            </div>
			           
			        </div>
			    </div>
			    <div>
			        <div>
			        	<div class="scadule_detail">
				            <div class="select_list">
				                <div class="select_wrap_team">
				                	<div class="step_cont_wrap" style="float: left; width: 820px; height:650px; margin-top: 30px;" id="step1_3">
					                    <div class="title-type02" id="calendartitle">
								            <h3 style="text-align: center">진료일시 선택</h3>
								        </div>
					                    <div id="getcalendardiv" style="overflow:auto; width: 820px; height: 350px;">
								        	<!-- ajax로스케쥴달력불러오는곳 -->
								        	<span id="cal_area" style="width: 500px; ">
								        	</span>
								        	<!-- ajax로스케쥴시간불러오는곳 -->
								        	<div id="time_area" style="width: 280px; height: 350px;float: right;">
								        	
								        	</div>
								        </div>
								        <!-- 증상입력 -->
							        	<div id="content_area" style="width: 300px; margin-bottom: 40px;">
							        	<span class="form-text" style="width: 560px;">
				            			<label for="team_searhc" class="placeholder">
				            				증상을 입력해 주세요
				            			</label>
			            				<input type="text" id="_content" name="content">
							        	</span>
							        	</div>
								        <span style="margin-top: 40px;">
											<a onclick="revto2()" id="revto2">&lt;&nbsp;&nbsp;이전단계로</a>
										</span>
										<span id="reservebtn_section" style="margin-top: 40px;">
											
										</span>
							        </div>
				                </div>
				            </div>
			           </div>
			        </div>
			    </div>
			</li>
			    <li id="tab2">
			     <!-- 진료과 선택 -->
			     <div>
			        <div>
			         <div class="specialty_detail">
			           <div class="select_wrap_team">
					    <div class="cont_box-office_select" style="float: left; width: 820px; margin-top: 50px;" id="step2_1">
					        <div class="title-type02" id="changetitle2">
					            <h3>진료과 선택</h3>
					        </div>
					        <div id="specialtydiv" style="overflow:auto; width: 820px; height: 500px;" class="tableclass">
			                    <!-- 진료과목클릭하면 병원리스트나온다 -->
			                    <table id="step2_tableinit">
			                        <caption>진료과 선택 테이블</caption>
			                        <tbody>
			                        <tr>
			                            <th scope="col">ㄱ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                        <a onclick="byspecialty(this)">가정의학과</a>
			                                    </li>
			                                    <li>
			                                        <a onclick="byspecialty(this)">결핵과</a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="col">ㄴ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                       <a onclick="byspecialty(this)">내과</a>
			                                    </li>
			                                    <li>
			                                       <a onclick="byspecialty(this)">노인전문</a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="col">ㅁ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                        <a onclick="byspecialty(this)">마취과</a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="col">ㅂ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                        <a onclick="byspecialty(this)">비뇨기과</a>
			                                    </li>
			                                    <li>
			                                        <a onclick="byspecialty(this)">방사선과</a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="col">ㅅ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                        <a onclick="byspecialty(this)">소아청소년과</a>
			                                    </li>
			                                    <li>
			                                       <a onclick="byspecialty(this)">산부인과</a>
			                                    </li>
			                                    <li>
			                                        <a onclick="byspecialty(this)">산후조리원</a>
			                                    </li>
			                                    <li>
			                                        <a onclick="byspecialty(this)">신경정신과</a>
			                                    </li>
			                                    <li>
			                                        <a onclick="byspecialty(this)">성형외과</a>
			                                    </li>
			                                    <li>
			                                        <a onclick="byspecialty(this)">신경외과</a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="col">ㅇ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                        <a onclick="byspecialty(this)">안과</a>
			                                    </li>
			                                    <li>
			                                         <a onclick="byspecialty(this)">이빈인후과</a>
			                                    </li>
			                                    <li>
			                                        <a onclick="byspecialty(this)">외과</a>
			                                    </li>
			                                    <li>
			                                        <a onclick="byspecialty(this)">임상병리과</a>
			                                    </li>
			                                    <li>
			                                         <a onclick="byspecialty(this)">알콜병원</a>
			                                    </li>
			                                    <li>
			                                        <a onclick="byspecialty(this)">일반</a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="col">ㅈ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                        <a onclick="byspecialty(this)">조산원</a>
			                                    </li>
			                                    <li>
			                                        <a onclick="byspecialty(this)">정형외과</a>
			                                    </li>
			                                    <li>
			                                        <a onclick="byspecialty(this)">재활의학과</a>
			                                    </li>
			                                    <li>
			                                        <a onclick="byspecialty(this)">종합</a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="col">ㅊ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                        <a onclick="byspecialty(this)">치매</a>
			                                    </li>
			                                    <li>
			                                        <a onclick="byspecialty(this)">치과</a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="col">ㅌ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                        <a onclick="byspecialty(this)">통증클리닉</a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="col">ㅍ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                        <a onclick="byspecialty(this)">피부과</a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="col">ㅎ</th>
			                            <td>
			                                <ul>
			                                    <li>
			                                       <a onclick="byspecialty(this)">항문외과</a>
			                                    </li>
			                                    <li>
			                                        <a onclick="byspecialty(this)">흉부외과</a>
			                                    </li>
			                                     <li>
			                                        <a onclick="byspecialty(this)">한방</a>
			                                    </li>
			                                    <li>
			                                        <a onclick="byspecialty(this)">한의원</a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        </tbody>
			                    	</table>
					               </div>
					            </div>
					            <div class="list_wrap" style="width: 280px; height: 600px;float: right; margin-top: 50px;margin-bottom: 50px;">
			            			<div id="mem_info" style="height: 150px; background: #ff7e00; color: #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">1</strong>&nbsp;&nbsp;&nbsp;환자정보
			            				<br>
			            				<ul style="padding-left: 40px;">
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.name }</li>
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.phone }</li>
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.email }</li>
			            				</ul>
			            			</div>
			            			<div style="height: 150px; background: #555;color: #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">2</strong>&nbsp;&nbsp;&nbsp;병원정보
			            				<br>
			            				<div id="hospital_info2" class="reserve2">
			            					<p style="text-align: center; padding-top: 20px;">
			            					<img src="images/main/icon_list_office.png">
			            					</p>
			            				</div>
			            			</div>
			            			<div style="height: 150px; background: #555;color: #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">3</strong>&nbsp;&nbsp;&nbsp;의료진
			            				<br>
			            				<div id="doctor_info2" class="reserve3">
			            					<p style="text-align: center; padding-top: 20px;">
			            					<img src="images/main/icon_list_doctor.png">
			            					</p> 
			            				</div>
			            			</div>
			            			<div style="height: 170px; background: #555;color: #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">4</strong>&nbsp;&nbsp;&nbsp;진료일시
			            				<br>
			            				<div id="time_info2" class="reserve4">
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
			    <div>
			        <div>
			            <div class="doc_detail2">
			                <div class="select_wrap_team">
			               	 <div class="step_cont_wrap" style="float: left; width: 820px; margin-top: 30px;" id="step2_2">
			                	<div class="title-type02">
						            <h3>의료진 선택</h3>
						        </div>
			                    <div id="getdoclistdiv2" style="overflow:auto; width: 820px; height: 500px;" class="tableclass">
						        	<!-- ajax로 의사리스트받아오는부분 -->
						        </div>
						        <div class="prev_btn">
									<a onclick="revto1_2()">&lt;&nbsp;&nbsp;이전단계로</a>
								</div>
						      </div>
			                </div>
			            </div>
			           
			        </div>
			    </div>
			    <div>
			        <div>
			        	<div class="scadule_detail2">
				            <div class="select_list">
				                <div class="select_wrap_team">
				                	<div class="step_cont_wrap" style="float: left; width: 820px; height:650px; margin-top: 30px;" id="step2_3">
					                    <div class="title-type02" id="calendartitle2">
								            <h3 style="text-align: center">진료일시 선택</h3>
								        </div>
					                    <div id="getcalendardiv2" style="overflow:auto; width: 820px; height: 350px;">
								        	<!-- ajax로스케쥴달력불러오는곳 -->
								        	<span id="cal_area2" style="width: 500px; ">
								        	</span>
								        	<!-- ajax로스케쥴시간불러오는곳 -->
								        	<div id="time_area2" style="width: 280px; height: 350px;float: right;">
								        	
								        	</div>
								        </div>
								        <!-- 증상입력 -->
							        	<div id="content_area2" style="width: 300px; margin-bottom: 40px;">
							        	<span class="form-text" style="width: 560px;">
				            			<label for="team_searhc2" class="placeholder">
				            				증상을 입력해 주세요
				            			</label>
			            				<input type="text" id="_content2" name="content">
							        	</span>
							        	</div>
								        <span style="margin-top: 40px;">
											<a onclick="revto2_2()" id="revto2">&lt;&nbsp;&nbsp;이전단계로</a>
										</span>
										<span id="reservebtn_section2" style="margin-top: 40px;">
											
										</span>
							        </div>
				                </div>
				            </div>
			           </div>
			        </div>
			    </div>
			</li>
			
			<li id="tab3">
				<div>
			        <div>
			            <div class="doctor_detail">
			            	<div class="select_wrap_team">
			            	  <div class="step_cont_wrap" style="float: left; width: 820px; margin-top: 50px;" id="step3_1">
				            	<div class="title-type02">
						            <h3>의료진 선택</h3>
						        </div>
			            		<span class="form-text" style="width: 560px;">
			            			<label for="team_searhc" class="placeholder">
			            				의료진명을 2글자 이상으로 입력해 주세요
			            			</label>
			            			<input type="text" id="docserch" name="name">
			            		</span>
			            		<a onclick="doclist()" style="cursor: pointer;" class="btn-type02 btn-search"><em>검색</em></a>
			            		<a class="btn-type02 btn-search refresh_btn" style="cursor: pointer; width: 140px;"><em>검색초기화</em></a>
			            		<div id="doclistdiv" style="overflow:auto; width: 820px; height: 500px;" class="tableclass">
						        	<!-- ajax로 리스트받아오는부분 -->
						        </div>
						      </div>
						      <div class="list_wrap" style="width: 280px; height: 600px;float: right; margin-top: 50px;margin-bottom: 50px;">
			            			<div id="mem_info" style="height: 150px; background: #ff7e00; color: #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">1</strong>&nbsp;&nbsp;&nbsp;환자정보
			            				<br>
			            				<ul style="padding-left: 40px;">
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.name }</li>
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.phone }</li>
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.email }</li>
			            				</ul>
			            			</div>
			            			<div style="height: 150px; background: #555;color: #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">2</strong>&nbsp;&nbsp;&nbsp;의료진
			            				<br>
			            				<div id="doctor_info3" class="reserve3">
			            					<p style="text-align: center; padding-top: 20px;">
			            					<img src="images/main/icon_list_doctor.png">
			            					</p> 
			            				</div>
			            			</div>
			            			<div style="height: 150px; background: #555;color: #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">3</strong>&nbsp;&nbsp;&nbsp;병원정보
			            				<br>
			            				<div id="hospital_info3" class="reserve2">
			            					<p style="text-align: center; padding-top: 20px;">
			            					<img src="images/main/icon_list_office.png">
			            					</p>
			            				</div>
			            			</div>
			            			<div style="height: 170px; background: #555;color: #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">4</strong>&nbsp;&nbsp;&nbsp;진료일시
			            				<br>
			            				<div id="time_info3" class="reserve4">
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
			    <div>
			        <div>
			        	<div class="scadule_detail3">
				            <div class="select_list">
				                <div class="select_wrap_team">
				                	<div class="step_cont_wrap" style="float: left; width: 820px; height:650px; margin-top: 30px;" id="step3_2">
					                    <div class="title-type02" id="calendartitle3">
								            <h3 style="text-align: center">진료일시 선택</h3>
								        </div>
					                    <div id="getcalendardiv3" style="overflow:auto; width: 820px; height: 350px;">
								        	<!-- ajax로스케쥴달력불러오는곳 -->
								        	<span id="cal_area3" style="width: 500px; ">
								        	</span>
								        	<!-- ajax로스케쥴시간불러오는곳 -->
								        	<div id="time_area3" style="width: 280px; height: 350px;float: right;">
								        	
								        	</div>
								        </div>
								        <!-- 증상입력 -->
							        	<div id="content_area3" style="width: 300px; margin-bottom: 40px;">
							        	<span class="form-text" style="width: 560px;">
				            			<label for="team_searhc3" class="placeholder">
				            				증상을 입력해 주세요
				            			</label>
			            				<input type="text" id="_content3" name="content">
							        	</span>
							        	</div>
								        <span style="margin-top: 40px;">
											<a onclick="revto1_3()" id="revto2">&lt;&nbsp;&nbsp;이전단계로</a>
										</span>
										<span id="reservebtn_section3" style="margin-top: 40px;">
											
										</span>
							        </div>
				                </div>
				            </div>
			           </div>
			        </div>
			    </div>
			</li>
			</ol>
			</div>
			<div id="data_area">
				<input type="hidden" name="hos_seq" id="_hos_seq">
				<input type="hidden" name="type" id="_type">
			</div>
		</div>
     </div></div>
		</section>
	</div>
</div>
