<%@page import="kh.com.medi.model.MediMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
		MediMemberDto user = null;

		if((MediMemberDto)request.getAttribute("dto") != null){
			user = (MediMemberDto)request.getAttribute("dto");
		}else if((MediMemberDto)session.getAttribute("login") != null){
			user = (MediMemberDto)session.getAttribute("login");
		}

%>

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
			<%
			if(user == null){
			%>
			<li>
				<a href="login.do">
					<em>로그인</em>
				</a>
			</li>
			<li>
				<a href="selectJoin.do">
					<em>회원가입</em>
				</a>
			</li>
			<%
			}else{
			%>
			<li>
				<a href="mysupdateAf.do">
					<em>정보수정</em>
				</a>
			</li>
			<li>
				<a href="logout.do">
					<em>로그아웃</em>
				</a>
			</li>
			<%
			}
			%>
			
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
									<a href="hbbslist.do" target="_self"><em>병원 찾기</em></a>
								</div>
								<div class="d_2">
									<ul>
										<li>
											<a href="hbbslist.do" target="_self"><em>병원 찾기</em></a>
										</li>
									</ul>
								</div>
							</li>
							<!-- 여기 까지 -->
							<!-- 메뉴 추가시 여기부터 -->
							<li>
								<div class="d_btn_1">
									<a href="maplist.do" target="_self"><em>내 근처 병원</em></a>
								</div>
								<div class="d_2">
									<ul>
										<li>
											<a href="maplist.do" target="_self"><em>내 근처 병원</em></a>
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
			                            <a href="maplist.do" target="_self">
			                                <strong>내 근처 병원</strong>
			                            </a>
			                        </span>
                     				<ul>
		                                <li>
	                                        <a href="maplist.do" target="_self">
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
