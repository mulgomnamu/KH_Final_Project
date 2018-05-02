<%@page import="java.util.Calendar"%>
<%@page import="kh.com.medi.aop.myCal"%>
<%@page import="kh.com.medi.aop.CalendarUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/appointment.css?ver=1.25"/> 
<script type="text/javascript" src="<%=request.getContextPath() %>/js/appointment.js"></script>
<style>
#tab li{
margin-top:132px;
margin-left:3px;
width:33%;
height:63px;
float: left;
background-color: rgb(217,217,217);
}
#tab li a{
display: block;
padding-top: 14px;
height:63px;
color: #fff;
font-size: 1.3em;
font-weight: bolder;
}
#tab li em{
font-weight: bolder;
}
.h3title{
	margin-bottom: 30px;
}
.selected{
background-color: #fff;
border-top: 2px solid #1f4bb4;
color: #1f4bb4;
}
.selected>em{
color: #1f4bb4;
font-weight: bolder;
}
</style>
<script type="text/javascript">
function byspecialty(elem) {
	//진료과목검색해서리스트불러오기
		$.ajax({
			url : "byspecialty.do", // a.jsp 의 제이슨오브젝트값을 가져옴
			data:"subject="+$(elem).text(),
			dataType : "json", // 데이터 타입을 제이슨 꼭해야함, 다른방법도 2가지있음
			cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안댐
			success : function(data) {
				if (data.yn=="no") {
					alert("해당 진료과목의 병원이 없습니다.");
					return
				}
				$("#step2_tableinit").hide();
				$("#changetitle2").html("<h3>병원 선택</h3>");
				$("<table class='ser' id='table2_1'/>").css({
				}).appendTo("#specialtydiv"); // 테이블을 생성하고 그 테이블을 div에 추가함
				var key = Object.keys(data["hospitallist"][0]); // seq,name,info,address,tel의 키값을 가져옴
				$.each(data.hospitallist, function(index, hospitallist) { // 이치를 써서 모든 데이터들을 배열에 넣음
					var items = [];
					items.push("<td class='ser'><a href='javascript:void(0);' onclick='getdoctor2("+hospitallist.medimember_hdto.seq+")'>" 
					+ hospitallist.medimember_hdto.name + "</a></td>"); // 여기에 id pw addr tel의 값을 배열에 넣은뒤
					items.push("<td class='ser'>" + hospitallist.medimember_hdto.info + "</td>");
					items.push("<td class='ser'>" + hospitallist.medimember_hdto.address + "</td>");
					items.push("<td class='ser'>" + hospitallist.medimember_hdto.tel + "</td>");
					$("<tr/>", {
						html : items // 티알에 붙임,
					}).appendTo("#table2_1"); // 그리고 그 tr을 테이블에 붙임
				});//each끝 
			}
		});
}
</script>
<c:if test="${loginType eq 4 }">
	<script type="text/javascript">
	alert("일반회원만 가능한 공간입니다");
	location.href='main.do';
	</script>
</c:if>
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
				  <h2 style="padding-top: 30px;"><strong>${login.id }</strong>님, 오늘도 건강한 하루 되세요</h2>
       			  <p class="s_txt">온라인 예약으로 빠르고 편리하게 진료받으실 수 있습니다</p> 
       			  <div class="sub_tap">
       			  <div class="inner_flogin" style="background: transparent">
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
   			</div>
			<!-- content 시작 -->
			<div class="content" style="clear: both;"> 
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
			            		<div class="cont_box-office_select" style="float: left; width: 820px; margin-top: 50px;" id="step1_1">
			            			<div class="title-type02">
							            <h3 class="h3title">병원으로 선택</h3>
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
			            		<div class="list_wrap" style="width: 280px; height: 630px;float: right;margin-top: 50px;margin-bottom: 50px;">
			            			<div id="mem_info" style="height: 150px; background: #ff7e00; color: #fff; border-bottom: 2px solid #fff; ">
			            				<strong class="f_eng" style="font-size: 2.3em;">1</strong>&nbsp;&nbsp;&nbsp;환자정보
			            				<br>
			            				<ul style="padding-left: 40px;">
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.name }</li>
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.phone }</li>
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.email }</li>
			            				</ul>
			            			</div>
			            			<div style="height: 170px; background: #555;color: #fff;border-bottom: 2px solid #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">2</strong>&nbsp;&nbsp;&nbsp;병원정보
			            				<br>
			            				<div id="hospital_info" class="reserve2">
			            					<p style="text-align: center; padding-top: 20px;">
			            					<img src="images/main/icon_list_office.png">
			            					</p>
			            				</div>
			            			</div>
			            			<div style="height: 170px; background: #555;color: #fff;border-bottom: 2px solid #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">3</strong>&nbsp;&nbsp;&nbsp;의료진
			            				<br>
			            				<div id="doctor_info" class="reserve3">
			            					<p style="text-align: center; padding-top: 20px;">
			            					<img src="images/main/icon_list_doctor.png">
			            					</p> 
			            				</div>
			            			</div>
			            			<div style="height: 170px; background: #555;color: #fff;border-bottom: 2px solid #fff;">
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
					            <div class="list_wrap" style="width: 280px; height: 630px;float: right; margin-top: 50px;margin-bottom: 50px;">
			            			<div id="mem_info" style="height: 150px; background: #ff7e00; color: #fff;border-bottom: 2px solid #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">1</strong>&nbsp;&nbsp;&nbsp;환자정보
			            				<br>
			            				<ul style="padding-left: 40px;">
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.name }</li>
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.phone }</li>
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.email }</li>
			            				</ul>
			            			</div>
			            			<div style="height: 170px; background: #555;color: #fff;border-bottom: 2px solid #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">2</strong>&nbsp;&nbsp;&nbsp;병원정보
			            				<br>
			            				<div id="hospital_info2" class="reserve2">
			            					<p style="text-align: center; padding-top: 20px;">
			            					<img src="images/main/icon_list_office.png">
			            					</p>
			            				</div>
			            			</div>
			            			<div style="height: 170px; background: #555;color: #fff;border-bottom: 2px solid #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">3</strong>&nbsp;&nbsp;&nbsp;의료진
			            				<br>
			            				<div id="doctor_info2" class="reserve3">
			            					<p style="text-align: center; padding-top: 20px;">
			            					<img src="images/main/icon_list_doctor.png">
			            					</p> 
			            				</div>
			            			</div>
			            			<div style="height: 170px; background: #555;color: #fff;border-bottom: 2px solid #fff;">
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
			            	  <div class="cont_box-office_select" style="float: left; width: 820px; margin-top: 50px;" id="step3_1">
				            	<div class="title-type02">
						            <h3 class="h3title">의료진 선택</h3>
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
						      <div class="list_wrap" style="width: 280px; height: 630px;float: right; margin-top: 50px;margin-bottom: 50px;">
			            			<div id="mem_info" style="height: 150px; background: #ff7e00; color: #fff;border-bottom: 2px solid #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">1</strong>&nbsp;&nbsp;&nbsp;환자정보
			            				<br>
			            				<ul style="padding-left: 40px;">
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.name }</li>
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.phone }</li>
			            					<li><small style="font-size: 0.5em">●</small>&nbsp;&nbsp;${login.email }</li>
			            				</ul>
			            			</div>
			            			<div style="height: 170px; background: #555;color: #fff;border-bottom: 2px solid #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">2</strong>&nbsp;&nbsp;&nbsp;의료진
			            				<br>
			            				<div id="doctor_info3" class="reserve3">
			            					<p style="text-align: center; padding-top: 20px;">
			            					<img src="images/main/icon_list_doctor.png">
			            					</p> 
			            				</div>
			            			</div>
			            			<div style="height: 170px; background: #555;color: #fff;border-bottom: 2px solid #fff;">
			            				<strong class="f_eng" style="font-size: 2.3em;">3</strong>&nbsp;&nbsp;&nbsp;병원정보
			            				<br>
			            				<div id="hospital_info3" class="reserve2">
			            					<p style="text-align: center; padding-top: 20px;">
			            					<img src="images/main/icon_list_office.png">
			            					</p>
			            				</div>
			            			</div>
			            			<div style="height: 170px; background: #555;color: #fff;border-bottom: 2px solid #fff;">
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
											<a onclick="revto3_1()" id="revto2">&lt;&nbsp;&nbsp;이전단계로</a>
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
