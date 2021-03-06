<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<link rel="stylesheet" type="text/css" href="css/reset.css"/> 
<link rel="stylesheet" type="text/css" href="css/ui_common.css"/>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<!-- <script type="text/javascript" src="js/mainSlide.js"></script>
<script src="plugin/jquery-1.11.1.min.js"></script>
<script src="plugin/jquery.bxslider.js"></script>
<script src="plugin/jquery.bxslider.min.js"></script>
<script src="js/main.js"></script> -->
<!-- 복붙시작 -->
<script type="text/javascript" src="ui_common/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="ui_common/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="ui_common/js/TweenMax.js"></script>
<script type="text/javascript" src="ui_common/js/ScrollToPlugin.js"></script>
<script type="text/javascript" src="ui_common/js/masonry.pkgd.min.js"></script>
<script type="text/javascript" src="ui_common/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="ui_common/js/ui.common.js"></script>
<script type="text/javascript" src="ui_common/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="ui_common/js/jquery.animateNumber.js"></script>
<script type="text/javascript" src="ui_common/js/jquery.accessSlider.js"></script>
<!-- 복붙끝 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="main_layout">
<!--S: skip navi -->
<div id="skipnavigation">
    <ul>
        <li><a href="#container">본문 바로가기</a></li>
        <li><a href="#gnb">주 메뉴 바로가기</a></li>
    </ul>
</div>
<!-- WRAP -->
<div id="wrap">
    <!-- #HEADER -->
    <!-- HEADER -->
<div class="header_util">
	<div class="inner">
		<ul class="util_left">
			<li>
				<a href="#;" target="_self">
					<em>사랑의 실천</em>
				</a>
			</li>
			<li>
				<a href="#;" target="_self">
					<em>병원소식</em>
				</a>
			</li>
			<li>
				<a href="#;" target="_self">
					<em>고객사연</em>
				</a>
			</li>
			<li>
				<a href="#;" target="_self">
					<em>병원소개</em>
				</a>
			</li>
		</ul>
		<ul class="util_right">
			<li>
				<a href="test.do">
					<em>로그인</em>
				</a>
			</li>
			<li>
				<a href="#;">
					<em>회원가입</em>
				</a>
			</li>
		</ul>
	</div>
</div>

<header id="header_wrap">
	<div class="inner">
		<h1 class="logo">
			<a href="#;">
				<img src="images/common/top_logo.png" alt="가톨릭대학교 서울성모병원">
			</a>
		</h1>
	</div>

	<div class="header_gnb_wrap ">
		<div class="inner">
			<!-- GLOBAL MENU -->
			<nav id="gnb">
				<div class="gnb_wrap">
					<div class="d_1_wrap" id="menuList">
						<ul class="d_1">
							<!-- 메뉴 추가시 여기부터 -->
							<li>
								<div class="d_btn_1">
									<a href="#'" target="_self"><em>병원 찾기</em></a>
								</div>
								<div class="d_2">
									<ul>
										<li>
											<a href="#;" target="_self"><em>병원 찾기</em></a>
										</li>
									</ul>
								</div>
							</li>
							<!-- 여기 까지 -->
							<!-- 메뉴 추가시 여기부터 -->
							<li>
								<div class="d_btn_1">
									<a href="#'" target="_self"><em>내 근처 병원</em></a>
								</div>
								<div class="d_2">
									<ul>
										<li>
											<a href="#;" target="_self"><em>내 근처 병원</em></a>
										</li>
									</ul>
								</div>
							</li>
							<!-- 여기 까지 -->
						</ul>
					</div>
				</div>
			</nav>
			<!--// GLOBAL MENU -->
			<div class="wrap_gnb_util">
				<span class="btn_search">
					<a href="javascript:;">
						<em class="blind">검색</em>
					</a>
					<!-- 검색 시작 -->	
					<div id="total_search">
					    <div class="total_search_wrap status_init"> <!-- status_init : 처음상태 && status_input : 글입력  (no_word_status:검색어 없음)   -->
					        <div class="inner">
					            <div class="total_searh_area">
					                <div class="input_wrap">
					                    <form name="searchForm" id="AKCFrm" method="get" action="#;">
											<span class="form-text">
												<label class="placeholder" for="kwd">검색어를 입력하세요.</label>
												<input type="text" id="kwd" name="kwd" autocomplete="off" value="">
						                        <input type="hidden" id="instNo" name="instNo" value="2">
						                    </span>
						                    <button class="search_btn" onclick="submit()">
						                        <em class="blind">검색</em>
						                    </button>
						                </form>
						            </div>
					                <div class="fir_wrap">
					                    <div class="pop_word"></div>
					                    <div class="call_info">
					                        <em>대표전화</em>
					                        <strong class="f_eng">1588-1511</strong>
					                    </div>
					                </div>
						    	</div>
						    </div>
					        <div id="keyword2" class="util_area">
					            <div class="inner">
					                <span class="close_search_btn">
										<a href="#none">
											<em>닫기</em>
										</a>
									</span>
								</div>
							</div>
						</div>
					</div>
					<!-- 검색 끝 -->			
				</span>
				<span class="btn_total">
					<a href="javascript:;">
						<em class="blind">전체메뉴</em>
					</a>
					<!-- #SITEMAP 시작 -->
					<div class="total_menu">
					    <div class="inner">
					        <div class="p_t">
					            <div>
			                        <span  class="tit">
			                            <a href="#;" target="_self">
			                                <strong>병원 찾기</strong>
			                            </a>
			                        </span>
                     				<ul>
		                                <li>
	                                        <a href="#;" target="_self">
	                                            <em>병원 찾기</em>
	                                        </a>
		                                </li>
                                	</ul>
                        		</div>
                        		<div>
			                        <span  class="tit">
			                            <a href="#;" target="_self">
			                                <strong>내 근처 병원</strong>
			                            </a>
			                        </span>
                     				<ul>
		                                <li>
	                                        <a href="#;" target="_self">
	                                            <em>내 근처 병원</em>
	                                        </a>
		                                </li>
                                	</ul>
                        		</div>
                        	</div>
					        <div class="close_btn">
					            <a href="javascript:;">
					                <em class="blind">전체메뉴 닫기</em>
					            </a>
					        </div>
                		</div>
                	</div>
					<!--// #SITEMAP 끝 -->
				</span>
			</div>

			<!-- 메뉴 안의 슬라이드 배너 -->
			<div class="gnb_banner slide_banner_ui">
				<strong class="gnb_banner_tit">CMC홍보소식</strong>
				<div class="banner_wrap">
					<div class="banner_inner_wrap">
						<ul>
							<li class="banner bnr01">
								<a href="#;" target="_self" class="b_1">
									<img src='images/common/27461.jpg' alt="">
								</a>
							</li>
							<li class="banner bnr02">
								<a href="#;" target="_blank" class="b_2">
									<img src='images/common/27469.jpg' alt="">
								</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="btn_banner"></div>
			</div>
		</div>
	</div>
</header>
<!--// HEADER -->
	<!-- CONTAINER -->
	<div id="container" class="main"><!-- 1뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<div class="content">
				<div class="main_vi_banner">
					<div class="login_box status_logout"><!-- status_login : 로그인 상태 && status_logout:로그아웃상태 -->
						<div class="logout_area">
							<div class="logout_area_wrap">
								<div class="txt_grad">
									<strong>온라인 가족이 되어주세요!</strong>
									<p>스마트한 서비스 이용 하실 수 있습니다.</p>
								</div>
								<div class="btn_area">
									<span class="login_btn">
										<a href="javascript:cmc.util.loginPage();" class="btn-type02">
											<em>로그인</em>
										</a>
									</span>
									<span class="join_btn">
										<a href="/page/member/join/select" class="btn-type02">
											<em>회원가입</em>
										</a>
									</span>
								</div>
								<div class="quick_list_btn">
									<ul>
										<li class="appoint">
											<a href="/page/appointment">
												<p>스마트한 <span class="text_color-main">진료예약</span>을 이용해보세요</p>
											</a>
										</li>
										<li class="chart">
											<a href="/page/chart">
												<p>스마트한 <span class="text_color-main">진료차트</span>로 건강을 관리하세요</p>
											</a>
										</li>
										<li class="health">
											<a href="/page/health/magazine">
												<p>스마트한 <span class="text_color-main">건강정보</span>를 확인하세요</p>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="visual-banner slide_banner_ui">
						<div class="banner_wrap">
							<div class="banner_inner_wrap">
								<ul>
									<li class="banner bnr01">
										<a href="#;" target="_self">
											<img src='images/main/27693.jpg' alt="">
										</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="btn_banner"></div>
					</div>
				</div>
				<div class="cont_box-main_util">
					<div class="call_info">
						<span>
							<em>대표전화</em>
							<strong class="f_eng">1588-1511</strong>
						</span>
					</div>
					<div class="main_util_list">
						<div class="main_util-resev_call">
							<div class="info_txt">
								<strong>내 근처 병원</strong>
								<p>입력하신 지역의 근처병원을<br/>찾기쉽게 지도로 보여드립니다.</p>
							</div>
							<div class="util_wrap">
								<form action="" method="get">
									<span class="form-text name">
										<!-- <label class="placeholder" for="quick_name">이름</label> -->
										<input type="text" id="quick_name" name="quick_name" autocomplete="off" placeholder="지역명 ex)강남구">
									</span>
									<!-- <span class="form-text mobile">
										<label class="placeholder" for="quick_hp_no">전화번호</label>
										<input type="text" id="quick_hp_no" name="quick_hp_no" autocomplete="off" minlength="12" maxlength="13">
									</span> -->
									<span class="requ_call_btn">
										<a href="#;" id="quick_appointment_btn" class="btn-type02" onClick="fnOpenQuickAppointmentPopup(event.target);">
											<em>검색</em>
										</a>
									</span>
								</form>
							</div>
						</div>
						<div class="main_util-resev_internet">
							<div class="info_txt">
								<strong>인터넷 진료예약</strong>
								<p>홈페이지에서 개인의 일정에 맞춰<br>자유롭게 진료 예약을 할 수 있습니다.</p>
							</div>
							<div class="util_wrap">
								<span class="member_btn">
									<a href="#;" class="btn-type02">
										<em>화상진료예약</em>
									</a>
								</span>
								<span class="nomember_btn">
									<a href="#;" class="btn-type02">
										<em>방문진료예약</em>
									</a>
								</span>
							</div>
						</div>
						<form name="searchForm" id="searchForm" method="get" action="#;">
						<div class="main_util-search">
							<div class="info_txt">
								<strong>빠른 병원 검색</strong>
								<p>직접 검색하여 원하는 정보를 찾거나<br>빠르게 예약할 수 있습니다.</p>
							</div>
							<div class="util_wrap">
								<span class="form-text">
									<!-- <label class="placeholder" for="select_text_1">진료과명/의료진명 입력</label> -->
									<input type="text" id="select_text_1" name="kwd" autocomplete="off" placeholder="병원명  입력">
									<button type="button" class="main_btn-search">
										<em class="blind">검색</em>
									</button>
									<input type="hidden" id="instNo" name="instNo" value="2">
									<input type="hidden" id="medicalSearch" name="medicalSearch" value="Y">
								</span>
							</div>
						</div>
						</form>
					</div>
				</div>
				<div class="cont_box-health">
					<div class="inner">
						<h3>
							<a href="#;" style="color:#111;">
								병원매거진
							</a>
						</h3>
						<div class="list-type03 small">
							<ul>
								<!-- 작업시 li한개를 for문 돌리면됩니다 -->
								<li>
									<a href="#;">
										<div class="btn_img clip"><!-- 클래스 추가 : 영상 - clip / 이미지 - img  -->
											<span class="cont_img">
												<img src="https://img.youtube.com/vi/QL3CWmQr0-Q/0.jpg" alt="유투브썸네일">
											</span>
										</div>
										<div class="reduce_multi">
											<p class="txt">[운동영상]안전한 장거리 운전을 위한 스트레칭!</p>
										</div>
									</a>
									<div class="data_con">
										<em class="data">2017.12.14</em>
										<em class="tit">동영상</em>
									</div>
								</li>
								<li>
									<a href="#;">
										<div class="btn_img img"><!-- 클래스 추가 : 영상 - clip / 이미지 - img  -->
											<span class="cont_img">
												<img src="images/main/26773.jpg" alt="">
											</span>
										</div>
										<div class="reduce_multi">
											<p class="txt">[건강기능식품] 건강기능식품, 똑똑하게 먹는 TIP!</p>
										</div>
									</a>
									<div class="data_con">
										<em class="data">2017.09.27</em>
										<em class="tit">인포그래픽</em>
									</div>
								</li>
								<li>
									<a href="#;">
										<div class="btn_img img"><!-- 클래스 추가 : 영상 - clip / 이미지 - img  -->
											<span class="cont_img">
												<img src="images/main/26785.jpg" alt="">
											</span>
										</div>
										<div class="reduce_multi">
											<p class="txt">[황반변성] 실명원인 1위! 황반변성 Q&amp;A</p>
										</div>
									</a>
									<div class="data_con">
										<em class="data">2017.12.01</em>
										<em class="tit">슬라이드</em>
									</div>
								</li>
								<li>
									<a href="#;">
										<div class="btn_img img"><!-- 클래스 추가 : 영상 - clip / 이미지 - img  -->
											<span class="cont_img">
												<img src="images/main/26774.jpg" alt="">
											</span>
										</div>
										<div class="reduce_multi">
											<p class="txt">[탈모] 병원 갈 정도는 아니잖아? 모르는 소리 탈모증도 질환!</p>
										</div>
									</a>
									<div class="data_con">
										<em class="data">2017.09.27</em>
										<em class="tit">인포그래픽</em>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="cont_box-hos_story">
					<div class="inner">
						<h3>
							<a href="/page/board/news" style="color:#111;">병원순위</a>
						</h3>
						<div class="list-type03 middle">
							<ul>
								<!--  작업시 이 밑부분 li를 for문 돌리면 됩니다 -->
								<li>
									<a href="/page/board/news/452824" target="_self">
										<div class="btn_img img">
											<span class="cont_img">
											</span>
											<div class="hos_cont">
												<div class="reduce_multi title">
													<strong class="txt">서울성모병원 연구팀, 대한갑상선학회 우수연제상 수상</strong>
												</div>
												<div class="reduce_multi cont">
													<p class="txt">
														서울성모병원 연구팀, 대한갑상선학회 우수연제상 수상 - 갑상선 석회화 양상에 따른 심혈관질환 위험도 확인 -
														서울성모병원 강무일•임동준•하정훈(내분비내
													</p>
												</div>

												<div class="data_con">
													<em class="data">2018.04.06</em>
													<em class="tit">병원순위</em>
												</div>
											</div>
											<div class="label_wrap">
												<span class="label-new">
													<!-- 화면상에는 N으로 표기 -->
													<em class="blind">새로운글</em>
												</span>
											</div>
										</div>
									</a>
								</li>
								<!-- 여기 위에 까지 -->
								<li>
									<a href="/page/board/news/452806" target="_self">
										<div class="btn_img img">
											<span class="cont_img">
											</span>
											<div class="hos_cont">
												<div class="reduce_multi title">
													<strong class="txt">치과교정과 국윤아 교수, 대한치과교정학회･바른이봉사회 회장 취임</strong>
												</div>
												<div class="reduce_multi cont">
													<p class="txt">
														치과교정과 국윤아 교수, 대한치과교정학회･바른이봉사회 회장 취임
														서울성모병원 치과교정과 국윤아 교수가 4월 1일 30대 대한치과교정학회 회장과 사단법인 바
													</p>
												</div>

												<div class="data_con">
													<em class="data">2018.04.05</em>
													<em class="tit">병원순위</em>
												</div>
											</div>
											<div class="label_wrap">
												<span class="label-new">
													<em class="blind">새로운글</em>
												</span>
											</div>
										</div>
									</a>
								</li>
								<li>
									<a href="javascript:fnGoRecruitDetail('20180410', '/page/board/recruit/452782');">
										<div class="btn_img img">
											<span class="cont_img">
											</span>
											<div class="hos_cont">
												<div class="reduce_multi title">
													<strong class="txt">사무직(경영지원팀/계약직) 공개채용</strong>
												</div>
												<div class="reduce_multi cont">
													<p class="txt">사무직(경영지원팀/계약직) 공개채용
														1. 모집기관 : 서울성모병원 경영지원팀
														2. 모집직종 : 사무직(계약직)
														3. 모집인원 : O명
														4. 응시자격
													</p>
												</div>

												<div class="data_con">
													<em class="data">2018.04.04</em>
													<em class="tit">병원순위</em>
												</div>
											</div>
											<div class="label_wrap">
												<span class="label-new">
													<em class="blind">새로운글</em>
												</span>
											</div>
										</div>
									</a>
								</li>
								<li>
									<a href="javascript:fnGoRecruitDetail('20180409', '/page/board/recruit/452773');">
										<div class="btn_img img">
											<span class="cont_img">
											</span>
											<div class="hos_cont">
												<div class="reduce_multi title">
													<strong class="txt">기관기사직(시설팀) 공개채용 모집</strong>
												</div>
												<div class="reduce_multi cont">
													<p class="txt">기관기사직(시설팀) 공개채용 모집
														1. 모집기관 : 서울성모병원 시설팀
														2. 모집직종 : 기관기사직 / 일정기간 시용평가 후 정규직 전환 가능
														3. 모집
													</p>
												</div>

												<div class="data_con">
													<em class="data">2018.04.03</em>
													<em class="tit">병원순위</em>
												</div>
											</div>
											<div class="label_wrap">
												<span class="label-new">
													<em class="blind">새로운글</em>
												</span>
											</div>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- 개인정보 동의 popup -->
			<div class="popup-type01 w-820 per_info_popup" id="per_info_layer_pop">
			    <div class="popup_wrap">
			        <div class="popup_title">
			            <strong>개인정보 동의</strong>
			        </div>
			        <div class="cont_wrap">
			            <span class="form-checkbox agree">
			                <input type='checkbox' id="per_info_check">
			                <label for="per_info_check">개인정보 수집 · 이용에동의합니다.</label>
			            </span>
			            <div class="clouse_box">
			                <!-- #CLAUSE -->
			                <div class="clouse_use policy_cont">
							    <div class="box li-1" id="li-1">
							        <ol class="li-type01">
							            <li>수집 및 이용목적 :  진료예약</li>
							            <li>수집 항목:  성명, 휴대폰 번호</li>
							            <li>보유 및 이용기간
							                <ol class="li-type02">
							                    <li>진료정보는 의료법을 기준으로 하며, 진료서비스를 위한 정보는 일반법에 의합니다.</li>
							                    <li>수집 및 이용목적이 달성된 경우 해당 개인정보는 삭제됩니다.</li>
							                </ol>
							            </li>
							        </ol>
							        <p class="txt_emphasis">상기내용은 진료예약관련 부가서비스를 시행하는데 필요한 최소한의 정보에 해당하며,이용자는 상기 내용에 동의하지 않을 권리가 있습니다. 동의하지 않으실 경우 해당 서비스 제공이 불가능함을 알려드립니다.</p>
							    </div>
							</div>
			<!--// #CLAUSE -->
			            </div>
			            <div class="btn_group">
			                <button type="button" class="btn-type01 popup_style" onclick="cmc.popup.success(window.per_info_layer_pop)">
			                    <em>확인</em>
			                </button>
			                <button type="button" class="btn-type01 popup_style nega" onclick="cmc.popup.dismiss(window.per_info_layer_pop)">
			                    <em>취소</em>
			                </button>
			            </div>
			        </div>
			        <div class="popup_close_btn">
			            <a href="javascript:;">
			                <em class="blind">팝업닫기</em>
			            </a>
			        </div>
			    </div>
			</div>
		</section>
	</div>
	<!--// CONTAINER -->
	<div class="f_banner">
		<div class="inner">
			<ul class="bannerBox">
				<li>
					<a href="#;" target="_blank">
						<img src="images/main/img_f_banner_01.png" alt="JCI 인증획득">
					</a>
				</li>
		        <li>
		        	<a href="#;">
		        		<img src="images/main/img_f_banner_02.png" alt="AAHRPP 국제인증 획득">
		        	</a>
		        </li>
		        <li>
		        	<a href="#;" target="_blank">
		        		<img src="images/main/img_f_banner_03.png" alt="보건복지부 의료기관 평가 인증마크 획득">
		        	</a>
		        </li>
		        <li>
		        	<a href="#;" target="_blank">
		        		<img src="images/main/img_f_banner_05.png" alt="2016고객감동 경영대상 5년연속 수상">
		        	</a>
		        </li>
		        <li>
		        	<a href="#;" target="_blank">
		        		<img src="images/main/img_f_banner_04.png" alt="2015서비스디자인 경진대회 대상">
		        	</a>
		        </li>
		    </ul>
		</div>
	</div>
	<div class="main_quick">
		<ul>
			<li class="load">
				<a href="#;">
					<em>찾아오시는길</em>
				</a>
			</li>
			<li class="parking">
				<a href="#;">
					<em>주차장이용안내</em>
				</a>
			</li>
			<li class="notice">
				<a href="#;">
					<em>건의 및 불편접수</em>
				</a>
			</li>
			<li class="doc">
				<a href="#;">
					<em>증명서발급안내</em>
				</a>
			</li>
			<li class="health">
				<a href="#;">
					<em>건강상담</em>
				</a>
			</li>
			<li class="funeral">
				<a href="#;" target="_blank">
					<em>장례식장</em>
				</a>
			</li>
		</ul>
	</div>
	<!--20180110 내부시스템작업 팝업-->
    <!--
	<div class="new_main_cover_popwrap off" style="position: absolute; left: 0px; top: 105px; z-index: 1000; padding: 8px; border: 1px solid rgb(211, 211, 211); background: rgb(238, 238, 238);">
		<img src="/images/main/20180110_pop.jpg" style="border:1px solid #BBB;" alt="SKT 본인확인 서비스 내부시스템 작업">
		<div style="margin-top:10px;text-align:center;">
			<input type="checkbox" id="chkbox" name="chkbox" value="" style="vertical-align:middle;">  오늘 하루 이 창을 열지 않음 <button class="new_main_cover_closebtn"><b>[닫기]</b></button>
		</div>
	</div>
    -->
    
	<style type="text/css">
		.new_main_cover_popwrap.off {display:none;}
	</style>
	<!--end-->
	
	<script type="text/javascript">
		// 채용정보 상세 이동
		function fnGoRecruitDetail(endDate, detailUrl) {
			if(endDate && endDate.length > 0) {
			    if(moment(endDate, 'YYYYMMDD').isBefore(moment())) {
			        alert("마감된 게시글입니다.");
			        return;
				}
				else {
			        location.href = detailUrl;
				}
			}
			else {
			    location.href = detailUrl;
			}
		}

		$(function(){
			// 띠배너 slider
			$('.main_top_banner').css({
				'background-color':$('.top-banner .banner_inner_wrap').find('li').eq(0).attr('bg_color-data')
			});
			var top_banner_slider = $('.top-banner').accSlider({
				'auto':true,
				'arrowBtn':false,
				'mode':'normal',
				onSliderStart:function(num){
					$('.main_top_banner').css({
						'background-color':$('.top-banner .banner_inner_wrap').find('li').eq(num).attr('bg_color-data')
					});
				}
			});
			$('.top-banner .close_wrap').on('click','.top_banner_close',function(){
				TweenMax.to($('.main_top_banner'),.8,{
					'height':0,
					'ease':'easeOutExpo',
					onComplete:function(){
						top_banner_slider.stopSlide();
						$('.main_top_banner').css('display','none');
					}
				});
			});
			//메인 비주얼 slider
			var main_slider = $('.visual-banner').accSlider({
				'auto':true
			});

			viewBandBanner();

			$('#top_banner_chk').on('click', function(){
				if($('#top_banner_chk').is(":checked")) {
					setCookie( "band", "done" , 1);
					$(".top_banner_close").click();
				}
			});
		});
		// 띠배너보기
		function viewBandBanner() {
			var blnCookie = getCookie( "band" );
			if(blnCookie != "done") {
				$(".main_top_banner").show();
			}
		}
		// 쿠키 가져오기
		function getCookie(cName) {
			cName = cName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cName);
			var cValue = '';
			if(start != -1) {
				start += cName.length;
				var end = cookieData.indexOf(';', start);
				if(end == -1)end = cookieData.length;
				cValue = cookieData.substring(start, end);
			}
			return unescape(cValue);
		}
		// 쿠키 설정하기
		function setCookie(name, value, expiredays) {
			var todayDate = new Date();
			todayDate = new Date(parseInt(todayDate.getTime() / 86400000) * 86400000 + 54000000);
			if(todayDate > new Date()) {
				expiredays = expiredays - 1;
			}
			todayDate.setDate( todayDate.getDate() + expiredays );
			document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
		}
		// 첫 방문 전화예약 팝업열기
		function fnOpenQuickAppointmentPopup(target) {
            $("#per_info_check").prop("checked", "");
            var quickInfo = fnGetQuickAppointmentInfo();
            if(quickInfo.name.length < 2) {
                window.cmc.util.alert('이름을 입력해 주세요.');
                $('input[name=quick_name]').focus();
                return false;
            } else if(cmc.validate.tel(quickInfo.hpNo) != true && cmc.validate.phone(quickInfo.hpNo) != true) {
                window.cmc.util.alert('전화번호를 정확히 입력해 주세요.');
                $('input[name=quick_hp_no]').focus();
                return false;
            }
            window.per_info_layer_pop = window.cmc.popup.open({
                popup: $('#per_info_layer_pop')[0],
                openBtn: target,
				success: function(){
                    fnQuickAppointment();
				}
            });
		}
		// 첫 방문 전화예약
		function fnQuickAppointment() {
		    if($("#per_info_check").is(":checked") == false) {
                window.cmc.util.alert('개인정보 수집 · 이용에 동의에 체크해주시기 바랍니다.');
                $('#per_info_check').focus();
                return false;
			}
			cmc.popup.dismiss(window.per_info_layer_pop);
            var quickInfo = fnGetQuickAppointmentInfo();
            // 예약 하기
            /*$('input[name=quick_name]').val('');
            $('input[name=quick_hp_no]').val('');*/
            window.cmc.util.api({
                type: 'POST',
                url: '/api/appointment/quick',
                data: {
                    name: quickInfo.name,
                    hpNo: quickInfo.hpNo
                },
                success: function(data) {
                    var result = data.result;
                    if(result == '1') {
                        window.cmc.util.alert('전화예약 요청이 완료 되었습니다. 빠른 시일내에 연락드리도록 하겠습니다.');
                    } else if(result == '2') {
                        window.cmc.util.alert('이미 전화예약 요청이 완료되었습니다.');
                    } else if(result == '3') {
                        window.cmc.util.alert('올바른 전화번호를 입력해주세요.');
                    } else {
                        window.cmc.util.alert('전화예약 요청이 완료되지 않았습니다. 콜센터에 문의 부탁드립니다.');
                    }
                    fnInitQuickAppointmentInfo();
                },
                fail: function() {
                    window.cmc.util.alert('전화예약 요청이 완료되지 않았습니다. 콜센터에 문의 부탁드립니다.');
                }
            });
        }
        // 첫 방문 전화예약 입력 파라미터 가져오기
        function fnGetQuickAppointmentInfo() {
            var quickInfo = {
                name: $('input[name=quick_name]').val(),
                hpNo: $('input[name=quick_hp_no]').val()
            };
            if(quickInfo.hpNo.indexOf('-') < 0) {
                if(quickInfo.hpNo.length == 9) {	// ex: 021231234
                    quickInfo.hpNo = quickInfo.hpNo.substring(0,2) + '-' + quickInfo.hpNo.substring(2,5) + '-' + quickInfo.hpNo.substring(5);
				} else if(quickInfo.hpNo.length == 10) {	// ex: 0321231234
                    quickInfo.hpNo = quickInfo.hpNo.substring(0,3) + '-' + quickInfo.hpNo.substring(3,6) + '-' + quickInfo.hpNo.substring(6);
				} else if(quickInfo.hpNo.length == 11) { // ex: 01012341234
                    quickInfo.hpNo = quickInfo.hpNo.substring(0,3) + '-' + quickInfo.hpNo.substring(3,7) + '-' + quickInfo.hpNo.substring(7);
                }
			}
            return quickInfo;
		}
		// 첫 방문 전화예약 입력 파라미터 초기화
		function fnInitQuickAppointmentInfo() {
            $('input[name=quick_name]').val('').focus();
            $('input[name=quick_hp_no]').val('').focus();
            $('#quick_appointment_btn').focus();
		}
		// 건강매거진 열기
		function fnDetailView(magType, magNo, videoUrl) {
			if(magType === 'V') {
				// 동영상 새창 open
				window.open(videoUrl);
			}
			else {
				location.href = '/page/health/magazine/detail/' + magNo + window.location.search;
			}
		}
	</script>


    <!-- #FOOTER -->
    <footer id="footer_wrap">
	    <a href="#container" class="top_btn"><img src="images/common/top_btn.jpg" alt="상단으로 이동"/></a>
	    <div class="cmc_network">
	        <div class="network_wrap">
	            <a href="javascript:;" class="btn_open">
	                <em>CMC네트워크</em>
	            </a>
	            <div class="network_cont_wrap">
	                <div class="inner">
	                    <ul class="d_1">
	                        <li class="d_1_1">
								<span class="title">
									<em class="blind">의료기관</em>
								</span>
	                            <ul class="d_2">
	                                <li>
	                                    <a href="http://www.cmc.or.kr/" target="_blank">
	                                        <em>가톨릭중앙의료원</em>
	                                    </a>
	                                </li>
	                            </ul>
	                        </li>
	                        <li class="d_1_2">
								<span class="title">
									<em class="blind">교욱기관</em>
								</span>
	                            <ul class="d_2">
	                                <li>
	                                    <a href="http://www.catholicfound.org/cmm/main/mainPage.do" target="_blank">
	                                        <em>학교법인 가톨릭학원</em>
	                                    </a>
	                                </li>
	                            </ul>
	                        </li>
	                        <li class="d_1_3">
								<span class="title">
									<em class="blind">연구기관</em>
								</span>
	                            <ul class="d_2">
	                                <li>
	                                    <a href="http://ibi.cmc.or.kr/" target="_blank">
	                                        <em>의생명산업연구원</em>
	                                    </a>
	                                </li>
	                            </ul>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="footer_cont">
	        <div class="inner">
	            <div class="btn_list">
	                <ul class="top">
	                    <li>
	                        <a href="https://www.cmcseoul.or.kr/healthcare/index.do" target="_blank">평생건강증진센터</a>
	                    </li>
	                    <li>
	                        <a href="https://www.cmcseoul.or.kr/cancer/index.do" target="_blank">암병원</a>
	                    </li>
	                    <li>
	                        <a href="https://www.cmcseoul.or.kr/page/department/C/328/1" target="_blank">치과병원</a>
	                    </li>
	                    <li>
	                        <a href="http://cmcrefer.cmcnu.or.kr/index.do" target="_blank">진료협력센터</a>
	                    </li>
	                    <li>
	                        <a href="http://eirb.cmcnu.or.kr/Default.aspx" target="_blank">IRB</a>
	                    </li>
	                    <li>
	                        <a href="http://kfh.catholicfuneral.co.kr/cmm/main/mainPage.do" target="_blank">장례식장</a>
	                    </li>
	                    <li>
	                        <a href="/page/board/recruit">채용정보</a>
	                    </li>
	                    <li>
	                        <a href="/page/rent/reserve">대관신청</a>
	                    </li>
	                    <li>
	                        <a href="https://ir.cmc.or.kr/main" target="_blank">전공의모집</a>
	                    </li>
	                    <li>
	                        <a href="/spvision.spr.sp">CMC 영성과 비전</a>
	                    </li>
	                    <li class="drop_down">
	                        <a href="javascript:;" class="drop_btn">교직원전용</a>
	                    </li>
	                </ul>
	                <ul class="bottom">
	                    <li>
	                        <a href="/common.hospitalguide.non_payment.sp">비급여진료비용검색</a>
	                    </li>
	                    <li>
	                        <a href="/etc.patient_right.sp">환자권리장전</a>
	                    </li>
	                    <li>
	                        <a href="/etc.privacy.sp" style="font-weight: bold;color: #e8e8e8;">개인정보처리방침</a>
	                    </li>
	                    <li>
	                        <a href="/etc.clause.sp">이용약관</a>
	                    </li>
	                    <li>
	                        <a href="/etc.refusal_mail.sp">이메일무단수집거부</a>
	                    </li>
	                    <li>
	                        <a href="/etc.ethics.sp">병원윤리강령</a>
	                    </li>
	                    <li>
	                        <a href="/page/board/voc/write">건의 및 불편접수</a>
	                    </li>
	                    <li>
	                        <a href="http://www.catholicfound.org/PURCHASE/cmm/main/mainPage.do" title="새창열기" target="_blank">입찰공고</a>
	                    </li>
	                </ul>
	            </div>
	            <div class="community">
	                <ul class="sns">
	                    <li class="blog">
	                        <a href="http://blog.naver.com/icmcseoul" target="_blank" title="네이버블로그">
	                            <em class="blind">네이버블로그</em>
	                        </a>
	                    </li>
	                    <li class="facebook">
	                        <a href="https://www.facebook.com/cmcseoul" target="_blank" title="페이스북">
	                            <em class="blind">페이스북</em>
	                        </a>
	                    </li>
	                    <li class="insta">
	                        <a href="https://www.instagram.com/icmcseoul/" target="_blank" title="인스타그램">
	                            <em class="blind">인스타그램</em>
	                        </a>
	                    </li>
	                    <li class="youtube">
	                        <a href="https://www.youtube.com/user/cmcseoul" target="_blank" title="유튜브">
	                            <em class="blind">유튜브</em>
	                        </a>
	                    </li>
	                </ul>
	                <dl>
	                    <dt>대표전화</dt>
	                    <dd>1588-1511</dd>
	                </dl>
	                <dl>
	                    <dt>평생건강증진센터</dt>
	                    <dd>1588-8668</dd>
	                </dl>
	            </div>
	            <div class="address">
	                <address>서울시 서초구 반포대로 222 가톨릭대학교 서울성모병원(06591)</address>
	                <span>copyright(c) 2017 The Catholic University of Korea, Seoul ST. Mary’s Hospital. ALL RIGHTS RESERVED.</span>
	            </div>
	        </div>
	    </div>
	</footer>
<!--// #FOOTER -->
</div>
<!--// WRAP -->
</body>

</html> --%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title> <!-- 180410 16:12 -->
</head>
<body>  
<%
response.sendRedirect("main.do");

%>    
<!--// WRAP -->
</body>

</html>