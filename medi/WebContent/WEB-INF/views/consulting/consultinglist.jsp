<%@page import="kh.com.medi.model.MediMemberDto"%>
<%@page import="kh.com.medi.model.MediQnaBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/><%-- 
<script type="text/javascript" src="<%=request.getContextPath() %>/js/consulting.js"></script> --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/consulting.css"/>
<!-- 검색 카테고리를 유지 start -->
<%
String category = (String)request.getAttribute("s_category");
if(category == null) category = "";
%>

<script type="text/javascript">

var str='<%=category %>';
$(document).ready(function(){	
	document.frmForm1.s_category.value = str;
	
	// text에 문자를 입력하지 않았을 경우, 초기화 해준다.
	if($("#_s_keyword").val().trim() == ""){
		document.frmForm1.s_category.value = "";
	}	
}); 
</script> 
<!-- 검색 카테고리를 유지 start -->
<%
String category1 = (String)request.getAttribute("s_category1");
if(category1 == null) category1 = "";
%>

<script type="text/javascript">
var str='<%=category1 %>';
$(document).ready(function(){	
	document.frmForm2.s_category1.value = str;
	
	// text에 문자를 입력하지 않았을 경우, 초기화 해준다.
	if($("#_s_keyword1").val().trim() == ""){
		document.frmForm2.s_category1.value = "";
	}	
}); 
</script> 
<!-- 검색 카테고리를 유지 start -->
<%
String category2 = (String)request.getAttribute("s_category2");
if(category2 == null) category2 = "";
%>

<script type="text/javascript">
var str='<%=category2 %>';
$(document).ready(function(){	
	document.frmForm3.s_category2.value = str;
	
	// text에 문자를 입력하지 않았을 경우, 초기화 해준다.
	if($("#_s_keyword2").val().trim() == ""){
		document.frmForm3.s_category2.value = "";
	}	
}); 
</script> 
<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="subpagetitle" style="margin-bottom: 50px;">
				  <h2>건강상담</h2>
				<em>전문의에게 건강에 대한 질문이 있으면 문의를 해보세요.<br/>문제를 속시원히 해결해드립니다.</em>
       			  <div class="sub_tap">
       			  <div class="inner_flogin" style="background: transparent">
	             <ul id="tab">
	             	 <li>
	                     <a href="#tab1" class="selected">
	                         <em>모든 건강상담</em>		<!-- 1 메인페이지에서 또는 어느페이지서든 병원선택이안됐을때는 일로보내야된다 -->
	                     </a>
	                 </li>
	                 <li>
	                     <a href="#tab2">
	                         <em>답변을 기다리는 질문</em>		<!-- 2 병원을선택한곳에서 페이지오거나  -->
	                     </a>
	                 </li>
	                 <li>
	                     <a href="#tab3">
	                         <em>채택완료한 질문</em>	<!-- 의료진검색페이지주고 그사람클릭하면 모든정보 기본셋팅 -->
	                     </a>
	                 </li>
	             </ul>
	             </div>
         		</div>
   			</div>
			 <c:if test="${not empty login }">
				<input type="hidden" name="id" id="id" value="${login.id }">
			</c:if>
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
								<table>
									<col width="15%"><col width="55%"><col width="15%">
									<tr>
										<td style="padding-left:5px;">
											<select id="_s_category" name="s_category">
												<option value="" selected="selected">선택</option>
												<option value="category">진료분야</option>
												<option value="title">제목</option>
												<option value="content">내용</option>								
											</select>
										</td>
										<td style="padding-left:5px;"><input type="text" id="_s_keyword" name="s_keyword" value="${s_keyword}"/></td>
										<td style="padding-left:5px;"><button type="button" onclick="alllist(2,3,4,1)"> 검색 </button></td>
									</tr>
								</table>
								
								<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>						
								<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>	
								</form>
						</div>
						
					</div>
					
					<div style="float:right; margin-right:90px; margin-bottom:30px; background-color: #0b2d85;height: 35px; width: 79px; text-align: center;">
						<a href="#none" id="_btnWrite" title="글쓰기"><em style="color: #fff;display: block;padding-top: 5px;">질문하기</em></a>
					</div>
					<div id="alldiv">
				 <table style="width:85%; align:center; margin-top: 100px;"  align="center">
				  <colgroup>
				      <col style="width:150px;" />
				      <col style="width:auto;" />
				      <col style="width:100px;" />
				      <col style="width:100px;" />
				      <col style="width:100px;" />
				   </colgroup>
				 <thead>
					   <tr>
					      <th>진료분야</th><th>제목</th><th>답변</th><th>조회수</th> <th>작성자</th> 
					   </tr>
					</thead>
		
				  
					<tbody >   
					   <c:if test="${empty questionlist}">
					   <tr>
					      <td colspan="3">작성된 글이 없습니다.</td>
					   </tr>   
					   </c:if>
						  <c:if test="${not empty login }">
								<input type="hidden" name="id" id="id" value="${login.id }">
							</c:if>
					   <c:forEach items="${questionlist}" var="bbs" varStatus="vs">
					   <tr class="_hover_tr">
							    <td>[${bbs.category}]</td>
							    <c:if test="${bbs.selectyn==0}">
								<td>
									<a href='consultingdetail.do?seq=${bbs.seq}'>
								    	${bbs.title}
								    </a>
								</td>
								</c:if>
								
								<c:if test="${bbs.selectyn==1}">
								<td>
									<a href='consultingdetail.do?seq=${bbs.seq}'>
								     <span>채택완료</span>${bbs.title}
								    </a>
								</td>
								</c:if>
								<td>${bbs.commentcount}</td>
								<td>${bbs.readcount}</td>
							    <td>
							    <c:set var="wid" value="${bbs.wid}"/>
								${fn:substring(wid,0,1) }*****
							    </td>
					   </tr>
					   
					   </c:forEach>
					</tbody>
					</table> 
					</div>
					<br>
					<div id="paging_wrap">
						 <jsp:include page="/WEB-INF/views/consulting/paging.jsp" flush="false">
							<jsp:param value="${pageNumber }" name="pageNumber"/>
							<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
							<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
							<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
						</jsp:include> 
					</div>
					</div>
					</li>
					<li id="tab2">
					<div id="question">
					<div class="searchwrap">
						<div class="searchbox" style="display: inline-block;position: relative;left: 300px;top: -1.8px;">
							<form  name="frmForm2" id="_frmFormSearch2" method="post">
								<table>
									<col width="15%"><col width="55%"><col width="15%">
									<tr>
										<td style="padding-left:5px;">
											<select id="_s_category1" name="s_category1">
												<option value="" selected="selected">선택</option>
												<option value="category">진료분야</option>
												<option value="title">제목</option>
												<option value="content">내용</option>								
											</select>
										</td>
										<td style="padding-left:5px;"><input type="text" id="_s_keyword1" name="s_keyword1" value="${s_keyword1}"/></td>
										<td style="padding-left:5px;"><button type="button" onclick="queli(2,3,4,1)"> 검색 </button></td>
									</tr>
								</table>
								<input type="hidden" name="pageNumber1" id="_pageNumber1" value="${(empty pageNumber1)?0:pageNumber1}"/>						
								<input type="hidden" name="recordCountPerPage1" id="_recordCountPerPage1" value="${(empty recordCountPerPage1)?10:recordCountPerPage1}"/>	
							</form>
						</div>
						
					</div>
					
					<div style="float:right; margin-right:90px; margin-bottom:30px; background-color: #0b2d85;height: 35px; width: 79px; text-align: center;">
						<a href="#none" id="_btnWrite" title="글쓰기"><em style="color: #fff;display: block;padding-top: 5px;">질문하기</em></a>
					</div>
					<div id="questiondiv">
				 <table style="width:85%; align:center; margin-top: 100px;"  align="center">
				   <colgroup>
				      <col style="width:150px;" />
				      <col style="width:auto;" />
				      <col style="width:100px;" />
				      <col style="width:100px;" />
				      <col style="width:100px;" />
				   </colgroup>
		
					<thead>
					   <tr>
					      <th>진료분야</th><th>제목</th><th>답변</th><th>조회수</th> <th>작성자</th> 
					   </tr>
					</thead>
		
					<tbody >   
					   <c:if test="${empty onlyquestionlist}">
					   <tr>
					      <td colspan="3">작성된 글이 없습니다.</td>
					   </tr>   
					   </c:if>
						  <c:if test="${not empty login }">
								<input type="hidden" name="id" id="id" value="${login.id }">
							</c:if>
					   <c:forEach items="${onlyquestionlist}" var="bbs1" varStatus="vs">
					   <tr class="_hover_tr">
							    <td>[${bbs1.category}]</td>
							    <c:if test="${bbs1.selectyn==0}">
								<td>
									<a href='consultingdetail.do?seq=${bbs1.seq}'>
								    	${bbs1.title}
								    </a>
								</td>
								</c:if>
								<c:if test="${bbs1.selectyn==1}">
								<td>
									<a href='consultingdetail.do?seq=${bbs.seq}'>
								     <span>채택완료</span>${bbs.title}
								    </a>
								</td>
								</c:if>
								<td>${bbs1.commentcount}</td>
								<td>${bbs1.readcount}</td>
							    <td>
							    <c:set var="wid1" value="${bbs1.wid}"/>
								${fn:substring(wid1,0,1) }*****
							    </td>
					   </tr>
					   
					   </c:forEach>
					</tbody>
					</table> 
					</div>
					<br>
					<div id="paging_wrap1">
						<jsp:include page="/WEB-INF/views/consulting/paging1.jsp" flush="false">
							<jsp:param value="${pageNumber1 }" name="pageNumber1"/>
							<jsp:param value="${pageCountPerScreen1 }" name="pageCountPerScreen1"/>
							<jsp:param value="${recordCountPerPage1 }" name="recordCountPerPage1"/>
							<jsp:param value="${totalRecordCount1 }" name="totalRecordCount1"/>
						</jsp:include>
						
						
					</div>
					</div>
					</li>
					<li id="tab3">
					<div id="answer">
					<div class="searchwrap">
						<div class="searchbox" style="display: inline-block;position: relative;left: 300px;top: -1.8px;">
							<form  name="frmForm3" id="_frmFormSearch3" method="post">
								<table>
									<col width="15%"><col width="55%"><col width="15%">
									<tr>
										<td style="padding-left:5px;">
											<select id="_s_category2" name="s_category2">
												<option value="" selected="selected">선택</option>
												<option value="category">진료분야</option>
												<option value="title">제목</option>
												<option value="content">내용</option>								
											</select>
										</td>
										<td style="padding-left:5px;"><input type="text" id="_s_keyword2" name="s_keyword2" value="${s_keyword2}"/></td>
										<td style="padding-left:5px;"><button type="button" onclick="ansli(2,3,4,1)"> 검색 </button></td>
									</tr>
								</table>
								<input type="hidden" name="pageNumber2" id="_pageNumber2" value="${(empty pageNumber2)?0:pageNumber2}"/>						
								<input type="hidden" name="recordCountPerPage2" id="_recordCountPerPage2" value="${(empty recordCountPerPage2)?10:recordCountPerPage2}"/>	
							</form>
						</div>
						
					</div>
					
					<div style="float:right; margin-right:90px; margin-bottom:30px; background-color: #0b2d85;height: 35px; width: 79px; text-align: center;">
						<a href="#none" id="_btnWrite" title="글쓰기"><em style="color: #fff;display: block;padding-top: 5px;">질문하기</em></a>
					</div>
					<div id="answerdiv">
				 <table style="width:85%; align:center; margin-top: 100px;"  align="center">
				   <colgroup>
				      <col style="width:150px;" />
				      <col style="width:auto;" />
				      <col style="width:100px;" />
				   </colgroup>
		
					<thead>
					   <tr>
					      <th>진료분야</th> <th>제목</th> <th>작성자</th> 
					   </tr>
					</thead>
		
					<tbody >   
					   <c:if test="${empty answeredlist}">
					   <tr>
					      <td colspan="3">작성된 글이 없습니다.</td>
					   </tr>   
					   </c:if>
						  <c:if test="${not empty login }">
								<input type="hidden" name="id" id="id" value="${login.id }">
							</c:if>
					   <c:forEach items="${answeredlist}" var="bbs2" varStatus="vs">
					   <tr class="_hover_tr">
							    <td style="text-align: center;">[${bbs2.category}]</td>
								<td style="text-align: left">
									<a href='consultingdetail.do?seq=${bbs2.seq}'>
								    	${bbs2.title}
								    </a>
								</td>
							    <td>
							    <c:set var="wid2" value="${bbs2.wid}"/>
								${fn:substring(wid2,0,1) }*****
							    </td>
					   </tr>
					   
					   </c:forEach>
					</tbody>
					</table> 
					</div>
					<br>
					<div id="paging_wrap2">
						<jsp:include page="/WEB-INF/views/consulting/paging2.jsp" flush="false">
							<jsp:param value="${pageNumber2 }" name="pageNumber2"/>
							<jsp:param value="${pageCountPerScreen2 }" name="pageCountPerScreen2"/>
							<jsp:param value="${recordCountPerPage2 }" name="recordCountPerPage2"/>
							<jsp:param value="${totalRecordCount2 }" name="totalRecordCount2"/>
						</jsp:include>
						
						
					</div>
					</div>
					</li>
					</ol>
					</div>
					</div>
				<!-- 이부분에 컨텐츠 끝 -->
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
<script type="text/javascript">
//tab 초기화
$(document).ready(function(){
	$('#list>li:not(:eq(0))').hide();
	$('#tab li a').click(function(){
		$("#_s_category option:eq(0)").prop("selected", true);
		$("#_s_category1 option:eq(0)").prop("selected", true);
		$("#_s_category2 option:eq(0)").prop("selected", true);
		
		if ($(this).attr("href")=="#tab1") {
			alllist("1","1","1","1");
		}else if ($(this).attr("href")=="#tab2") {
			queli("1","1","1","1");
		}else if ($(this).attr("href")=="#tab3") {
			ansli("1","1","1","1");
		}
		$("#pa a:not(:eq(0))").attr('class','pagingNum');
		$("#pa a:eq(0)").addClass("pagingNumOn");
		$("#pa1 a:not(:eq(0))").attr('class','pagingNum');
		$("#pa1 a:eq(0)").addClass("pagingNumOn");
		$("#pa2 a:not(:eq(0))").attr('class','pagingNum');
		$("#pa2 a:eq(0)").addClass("pagingNumOn");
		$("#_s_keyword").val("");
		$("#_s_keyword1").val("");
		$("#_s_keyword2").val("");
	  $('#tab li a').removeClass('selected');
	  $(this).addClass('selected')
	  $('#list>li').hide();
	  $($(this).attr('href')).show();
	  return false
	});
	});


//페이징처리
function goPage(pageNumber,elem) {	
	$("#pa a").attr('class','pagingNum');
	$(elem).addClass("pagingNumOn");
	
	$("#_pageNumber").val(pageNumber);
	var data={
			s_category:$("#_s_category").val(),
			s_keyword:$("#_s_keyword").val(),
			pageNumber:$("#_pageNumber").val(),
			recordCountPerPage:$("#_recordCountPerPage").val()
	};
		$.ajax({
			url : "selectaf.do",
			data:data,
			dataType : "json",
			cache : false,
			success : function(data) {
				
				$("#alldiv").html("");
				$("<table id='table1' align='center'/>").css({
					'width':'85%','align':'center','margin-top':'100px'
				}).appendTo("#alldiv"); // 테이블을 생성하고 그 테이블을 div에 추가함
				$("<colgroup><col style='width:150px;'/><col style='width:auto;'/><col style='width:100px;'/><col style='width:100px;'/><col style='width:100px;'/></colgroup>").appendTo("#table1");
				$("<tr><th>진료분야</th><th>제목</th><th>답변</th><th>조회수</th><th>작성자</th></tr>").appendTo("#table1");
				var key = Object.keys(data["questionlist"][0]); // seq,name,info,address,tel의 키값을 가져옴
				$.each(data.questionlist, function(index, questionlist) { // 이치를 써서 모든 데이터들을 배열에 넣음
					var items = [];
					items.push("<td>["+questionlist.category+"]</td>");
					if (questionlist.selectyn==0) {
						items.push("<td><a href='consultingdetail.do?seq="+questionlist.seq+"'>"+questionlist.title+"</a></td>");
					}else if(questionlist.selectyn==1) {
						items.push("<td><a href='consultingdetail.do?seq="+questionlist.seq+"'><span>채택완료</span>"
								+questionlist.title+"</a></td>");
					}
					items.push("<td>" + questionlist.commentcount+"</td>");
					items.push("<td>" + questionlist.readcount+"</td>");
					items.push("<td>" + (questionlist.wid).substring(0,1)+"******</td>");
					$("<tr/>", {
						html : items // 티알에 붙임,
					}).appendTo("#table1"); // 그리고 그 tr을 테이블에 붙임
				});//each끝
			}
		});
	
}
function goPage1(pageNumber1,elem) {	
	$("#pa1 a").attr('class','pagingNum');
	$(elem).addClass("pagingNumOn");
	$("#_pageNumber1").val(pageNumber1) ;
	var data={
			s_category1:$("#_s_category1").val(),
			s_keyword1:$("#_s_keyword1").val(),
			pageNumber1:$("#_pageNumber1").val(),
			recordCountPerPage1:$("#_recordCountPerPage1").val()
	};
		$.ajax({
			url : "selectaf.do", // a.jsp 의 제이슨오브젝트값을 가져옴
			data:data,
			dataType : "json", // 데이터 타입을 제이슨 꼭해야함, 다른방법도 2가지있음
			cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐
			success : function(data) {
				if (data.yn1=="no") {
					alert("찾으시는 질문이 없습니다.");
					$("#_s_keyword1").val("");
				}
				$("#questiondiv").html(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
				$("<table id='table2' align='center'/>").css({
					'width':'85%','align':'center','margin-top':'100px'
				}).appendTo("#questiondiv"); // 테이블을 생성하고 그 테이블을 div에 추가함
				$("<colgroup><col style='width:150px;'/><col style='width:auto;'/><col style='width:100px;'/><col style='width:100px;'/><col style='width:100px;'/></colgroup>").appendTo("#table2");
				$("<tr><th>진료분야</th><th>제목</th><th>답변</th><th>조회수</th><th>작성자</th></tr>").appendTo("#table2");
				var key = Object.keys(data["onlyquestionlist"][0]); // seq,name,info,address,tel의 키값을 가져옴
				$.each(data.onlyquestionlist, function(index, onlyquestionlist) { // 이치를 써서 모든 데이터들을 배열에 넣음
					var items = [];
					items.push("<td>["+onlyquestionlist.category+"]</td>");
					if (onlyquestionlist.selectyn==0) {
						items.push("<td><a href='consultingdetail.do?seq="+onlyquestionlist.seq+"'>"+onlyquestionlist.title+"</a></td>");
					}else if(onlyquestionlist.selectyn==1) {
						items.push("<td><a href='consultingdetail.do?seq="+onlyquestionlist.seq+"'><span>채택완료</span>"
								+onlyquestionlist.title+"</a></td>");
					}
					items.push("<td>" + onlyquestionlist.commentcount+"</td>");
					items.push("<td>" + onlyquestionlist.readcount+"</td>");
					items.push("<td>" + (onlyquestionlist.wid).substring(0,1)+"******</td>");
					$("<tr/>", {
						html : items // 티알에 붙임,
					}).appendTo("#table2"); // 그리고 그 tr을 테이블에 붙임
				});//each끝
			}
		});
	}
function goPage2(pageNumber2,elem) {	
	$("#pa2 a").attr('class','pagingNum');
	$(elem).addClass("pagingNumOn");
	$("#_pageNumber2").val(pageNumber2) ;
	var data={
			s_category2:$("#_s_category2").val(),
			s_keyword2:$("#_s_keyword2").val(),
			pageNumber2:$("#_pageNumber2").val(),
			recordCountPerPage2:$("#_recordCountPerPage2").val()
	};
		$.ajax({
			url : "selectaf.do", // a.jsp 의 제이슨오브젝트값을 가져옴
			data:data,
			dataType : "json", // 데이터 타입을 제이슨 꼭해야함, 다른방법도 2가지있음
			cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐
			success : function(data) {
				if (data.yn2=="no") {
					alert("찾으시는 질문이 없습니다.");
					$("#_s_keyword2").val("");
				}
				$("#answerdiv").html(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
				$("<table id='table3' align='center'/>").css({
					'width':'85%','align':'center','margin-top':'100px'
				}).appendTo("#answerdiv"); // 테이블을 생성하고 그 테이블을 div에 추가함
				$("<colgroup><col style='width:150px;'/><col style='width:auto;'/><col style='width:100px;'/><col style='width:100px;'/><col style='width:100px;'/></colgroup>").appendTo("#table3");
				$("<tr><th>진료분야</th><th>제목</th><th>답변</th><th>조회수</th><th>작성자</th></tr>").appendTo("#table3");
				var key = Object.keys(data["answeredlist"][0]); // seq,name,info,address,tel의 키값을 가져옴
				$.each(data.answeredlist, function(index, answeredlist) { // 이치를 써서 모든 데이터들을 배열에 넣음
					var items = [];
					items.push("<td>["+answeredlist.category+"]</td>");
					if (answeredlist.selectyn==0) {
						items.push("<td><a href='consultingdetail.do?seq="+answeredlist.seq+"'>"+answeredlist.title+"</a></td>");
					}else if(answeredlist.selectyn==1) {
						items.push("<td><a href='consultingdetail.do?seq="+answeredlist.seq+"'><span>채택완료</span>"
								+answeredlist.title+"</a></td>");
					}
					items.push("<td>" + answeredlist.commentcount+"</td>");
					items.push("<td>" + answeredlist.readcount+"</td>");
					items.push("<td>" + (answeredlist.wid).substring(0,1)+"******</td>");
					$("<tr/>", {
						html : items // 티알에 붙임,
					}).appendTo("#table3"); // 그리고 그 tr을 테이블에 붙임
				});//each끝
			}
		});
}

//리스트별뿌려주기

function alllist(ca,key,pa,re) {
	//alert('search');$("#_frmFormSearch").attr({ "target":"_self", "action":"consultinglist.do" }).submit();
	var data={
		s_category:$("#_s_category").val(),
		s_keyword:$("#_s_keyword").val(),
		pageNumber:0,
		recordCountPerPage:$("#_recordCountPerPage").val()
};
	
	if (pa=="1") {
		data={
				s_category1:"",
				s_keyword1:"",
				pageNumber1:0,
				recordCountPerPage1:10
		};
	}
	$.ajax({
		url : "selectaf.do", // a.jsp 의 제이슨오브젝트값을 가져옴
		data:data,
		dataType : "json", // 데이터 타입을 제이슨 꼭해야함, 다른방법도 2가지있음
		cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐
		success : function(data) {
			if (data.yn=="no") {
				alert("찾으시는 질문이 없습니다.");
				$("#_s_keyword").val("");
			}
			$("#pa a").hide();
			for (var i = 1; i <= data.totalPageCount; i++) {
				
				$("#"+i).show();
			}
			
			$("#pa a:not(:eq(0))").attr('class','pagingNum');
			$("#pa a:eq(0)").addClass("pagingNumOn");
			$("#alldiv").html("");
			$("<table id='table1' align='center'/>").css({
				'width':'85%','align':'center','margin-top':'100px'
			}).appendTo("#alldiv"); // 테이블을 생성하고 그 테이블을 div에 추가함
			$("<colgroup><col style='width:150px;'/><col style='width:auto;'/><col style='width:100px;'/><col style='width:100px;'/><col style='width:100px;'/></colgroup>").appendTo("#table1");
			$("<tr><th>진료분야</th><th>제목</th><th>답변</th><th>조회수</th><th>작성자</th></tr>").appendTo("#table1");
			var key = Object.keys(data["questionlist"][0]); // seq,name,info,address,tel의 키값을 가져옴
			$.each(data.questionlist, function(index, questionlist) { // 이치를 써서 모든 데이터들을 배열에 넣음
				var items = [];
				items.push("<td>["+questionlist.category+"]</td>");
				if (questionlist.selectyn==0) {
					items.push("<td><a href='consultingdetail.do?seq="+questionlist.seq+"'>"+questionlist.title+"</a></td>");
				}else if(questionlist.selectyn==1) {
					items.push("<td><a href='consultingdetail.do?seq="+questionlist.seq+"'><span>채택완료</span>"
							+questionlist.title+"</a></td>");
				}
				items.push("<td>" + questionlist.commentcount+"</td>");
				items.push("<td>" + questionlist.readcount+"</td>");
				items.push("<td>" + (questionlist.wid).substring(0,1)+"******</td>");
				$("<tr/>", {
					html : items // 티알에 붙임,
				}).appendTo("#table1"); // 그리고 그 tr을 테이블에 붙임
			});//each끝
		}
	});
}
function queli(ca,key,pa,re) {
	var data={
			s_category1:$("#_s_category1").val(),
			s_keyword1:$("#_s_keyword1").val(),
			pageNumber1:0,
			recordCountPerPage1:$("#_recordCountPerPage1").val()
			
	};
	if (pa=="1") {
		data={
				s_category1:"",
				s_keyword1:"",
				pageNumber1:0,
				recordCountPerPage1:10
		};
	}
		$.ajax({
			url : "selectaf.do", // a.jsp 의 제이슨오브젝트값을 가져옴
			data:data,
			dataType : "json", // 데이터 타입을 제이슨 꼭해야함, 다른방법도 2가지있음
			cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐
			success : function(data) {
				if (data.yn1=="no") {
					alert("찾으시는 질문이 없습니다.");
					$("#_s_keyword1").val("");
				}
				$("#pa1 a").hide();
				for (var i = 11; i <= data.totalPageCount1+10; i++) {
					$("#"+i).show();
				}
				
				$("#pa1 a:not(:eq(0))").attr('class','pagingNum');
				$("#pa1 a:eq(0)").addClass("pagingNumOn");
				$("#questiondiv").html(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
				$("<table id='table2' align='center'/>").css({
					'width':'85%','align':'center','margin-top':'100px'
				}).appendTo("#questiondiv"); // 테이블을 생성하고 그 테이블을 div에 추가함
				$("<colgroup><col style='width:150px;'/><col style='width:auto;'/><col style='width:100px;'/><col style='width:100px;'/><col style='width:100px;'/></colgroup>").appendTo("#table2");
				$("<tr><th>진료분야</th><th>제목</th><th>답변</th><th>조회수</th><th>작성자</th></tr>").appendTo("#table2");
				var key = Object.keys(data["onlyquestionlist"][0]); // seq,name,info,address,tel의 키값을 가져옴
				$.each(data.onlyquestionlist, function(index, onlyquestionlist) { // 이치를 써서 모든 데이터들을 배열에 넣음
					var items = [];
					items.push("<td>["+onlyquestionlist.category+"]</td>");
					if (onlyquestionlist.selectyn==0) {
						items.push("<td><a href='consultingdetail.do?seq="+onlyquestionlist.seq+"'>"+onlyquestionlist.title+"</a></td>");
					}else if(onlyquestionlist.selectyn==1) {
						items.push("<td><a href='consultingdetail.do?seq="+onlyquestionlist.seq+"'><span>채택완료</span>"
								+onlyquestionlist.title+"</a></td>");
					}
					items.push("<td>" + onlyquestionlist.commentcount+"</td>");
					items.push("<td>" + onlyquestionlist.readcount+"</td>");
					items.push("<td>" + (onlyquestionlist.wid).substring(0,1)+"******</td>");
					$("<tr/>", {
						html : items // 티알에 붙임,
					}).appendTo("#table2"); // 그리고 그 tr을 테이블에 붙임
				});//each끝
			}
		});
}
function ansli(ca,key,pa,re) {
	var data={
			s_category2:$("#_s_category2").val(),
			s_keyword2:$("#_s_keyword2").val(),
			pageNumber2:0,
			recordCountPerPage2:$("#_recordCountPerPage2").val()
	};
	if (pa=="1") {
		data={
				s_category1:"",
				s_keyword1:"",
				pageNumber1:0,
				recordCountPerPage1:10
		};
	}
		$.ajax({
			url : "selectaf.do", // a.jsp 의 제이슨오브젝트값을 가져옴
			data:data,
			dataType : "json", // 데이터 타입을 제이슨 꼭해야함, 다른방법도 2가지있음
			cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐
			success : function(data) {
				if (data.yn2=="no") {
					alert("찾으시는 질문이 없습니다.");
					$("#_s_keyword2").val("");
				}
				$("#pa2 a").hide();
				for (var i = 21; i <= data.totalPageCount2+20; i++) {
					$("#"+i).show();
				}
				$("#pa2 a:not(:eq(0))").attr('class','pagingNum');
				$("#pa2 a:eq(0)").addClass("pagingNumOn");
				$("#answerdiv").html(""); // div를 일단 공백으로 초기화해줌 , 왜냐면 버튼 여러번 눌리면 중첩되니깐
				$("<table id='table3' align='center'/>").css({
					'width':'85%','align':'center','margin-top':'100px'
				}).appendTo("#answerdiv"); // 테이블을 생성하고 그 테이블을 div에 추가함
				$("<colgroup><col style='width:150px;'/><col style='width:auto;'/><col style='width:100px;'/><col style='width:100px;'/><col style='width:100px;'/></colgroup>").appendTo("#table3");
				$("<tr><th>진료분야</th><th>제목</th><th>답변</th><th>조회수</th><th>작성자</th></tr>").appendTo("#table3");
				var key = Object.keys(data["answeredlist"][0]); // seq,name,info,address,tel의 키값을 가져옴
				$.each(data.answeredlist, function(index, answeredlist) { // 이치를 써서 모든 데이터들을 배열에 넣음
					var items = [];
					items.push("<td>["+answeredlist.category+"]</td>");
					if (answeredlist.selectyn==0) {
						items.push("<td><a href='consultingdetail.do?seq="+answeredlist.seq+"'>"+answeredlist.title+"</a></td>");
					}else if(answeredlist.selectyn==1) {
						items.push("<td><a href='consultingdetail.do?seq="+answeredlist.seq+"'><span>채택완료</span>"
								+answeredlist.title+"</a></td>");
					}
					items.push("<td>" + answeredlist.commentcount+"</td>");
					items.push("<td>" + answeredlist.readcount+"</td>");
					items.push("<td>" + (answeredlist.wid).substring(0,1)+"******</td>");
					$("<tr/>", {
						html : items // 티알에 붙임,
					}).appendTo("#table3"); // 그리고 그 tr을 테이블에 붙임
				});//each끝
			}
		});
}


//id체크해서 글쓰기못누르게
var id = $("#id").val();
$("#_btnWrite").click(function() {	
	if(id == null){
		alert("로그인을 해주세요.");
	}else{
		location.href="consultingwrite.do";
	}
});

//엔터키 서브밋막기
$('input[type="text"]').keydown(function() {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
});

</script>
</div>
