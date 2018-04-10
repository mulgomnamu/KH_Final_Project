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
				  <p class="m_txt"><strong>${login.id }</strong>님, 오늘도 건강한 하루 되세요</p>
       			  <p class="s_txt">온라인 예약으로 빠르고 편리하게 진료받으실 수 있습니다</p> 
   			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
					<div class="sub_tap">
             <ul>
                 <li class="tab1">
                     <a href="javascript:void(0)" onclick="AppointmentOptionTab(1)">
                         <em>진료과로 예약</em>
                     </a>
                 </li>
                 <li class="tab2">
                     <a href="javascript:void(0)" onclick="AppointmentOptionTab(2)">
                         <em>의료진으로 예약</em>
                     </a>
                 </li>
                 <li class="tab3">
                     <a href="javascript:void(0)" onclick="AppointmentOptionTab(3)">
                         <em>진료분야로 예약</em>
                     </a>
                 </li>
             </ul>
         </div>
         <div class="sub_wrap">
	         <div class="sub_content">
			    <ol class="step_list">
			    <li class="tab1">
			     <!-- 진료과 선택 -->
			    <div class="cont_box-office_select">
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
			                                        <a href="javascript:void(0)" onclick="step2()">
			                                            <em>가정의학과</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a href="javascript:void(0)" onclick="step2()">
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
			                                        <a href="javascript:void(0)" onclick="step2()">
			                                            <em>내과</em>
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a href="javascript:void(0)" onclick="step2()">
			                                            <em>노인전문</em>
			                                        </a>
			                                    </li>
			                                </ul>
			                            </td>
			                        </tr>
			                        <tr v-if="Object.keys(appointment.option.deptList).length < 1">
			                            <td colspan="2">
			                                <div style="text-align: center;" class="office_no_data">
			                                    <span>조회된 진료과가 없습니다.</span>
			                                </div>
			                            </td>
			                        </tr>
			                        </tbody>
			                    </table>
			                </div>
			            </div>
			           
			        </div>
			    </div>
			</li>
			</ol>
			</div>
			
		</div>

<div id="slidebox">
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
	</div>
     </div>
      <div class="step_btn_area" v-if="param.isUpdateYn != 'Y'"><!-- 신규 예약 -->
	        <span class="prev_btn">
	            <a href="javascript:;" @click="fnGoAppointmentOptionStep(0, true)" v-if="appointment.tabNo == 1 && appointment.option.doctorDeptList.length == 1 && appointment.option.stepNo == 2">
	                <em>이전단계</em></a>
	            <a href="javascript:;" @click="fnPrevAppointmentOptionStep()" v-else>
	                <em>{{ appointment.option.stepNo > 1 ? '이전단계' : '취소' }}</em>
	            </a>
	        </span>
	        <span class="next_btn">
	            <a href="javascript:;" @click="fnNextAppointmentOptionStep()">
	                <em>{{ appointment.option.stepNo < 2 ? '다음단계' : '예약하기' }}</em>
	            </a>
	        </span>
				<!-- 이부분에 컨텐츠 끝 -->
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>
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