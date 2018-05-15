<%@page import="kh.com.medi.model.MediMember_hDto"%>
<%@page import="kh.com.medi.model.MediMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

   <c:if test="${sessionScope.login ne null }">
      <c:set var="login" value="${sessionScope.login }"/>
      <c:set var="loginType" value="${sessionScope.loginType }"/>
   </c:if>
   <c:if test="${sessionScope.login_h ne null }">
      <c:set var="login_h" value="${sessionScope.login_h }"/>
      <c:set var="loginType" value="${sessionScope.loginType }"/>
   </c:if>
   
<div class="header_util">
   <div class="inner">
      <ul class="util_right">
<!-- 비로그인 -->
         <c:if test="${loginType eq null }">
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
         </c:if>
<!-- 일반회원 -->
         <c:if test="${loginType eq 1 }">
            <li>
               <a href="MyPageLogin.do">
   
                  <em>정보수정</em>
               </a>
            </li>
            <li>
               <a href="MyPageList1.do?id=${login.id }&seq=${login.seq}">
                  <em>마이페이지</em>
               </a>
            </li>   
            <li>
               <a href="logout.do">
                  <em>로그아웃</em>
               </a>
            </li>
         </c:if>
<!-- 관리자 -->
         <c:if test="${loginType eq 2 }"> 
            <li>
               <a href="logout.do">
                  <em>로그아웃</em>
               </a>
            </li>
         </c:if>
<!-- 병원회원 -->
         <c:if test="${loginType eq 4 }">
            <li>
               <a href="myPage_h.do">
                  <em>마이페이지</em>
               </a>
            </li>   
            <li>
               <a href="logout.do">
                  <em>로그아웃</em>
               </a>
            </li>
         </c:if>
      </ul>
   </div>
</div>

<header id="header_wrap">
   <div class="inner">
      <h1 class="logo">
         <a href="main.do">
            I Chee U
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
                     <!-- 메뉴 추가시 여기부터 -->
                     <li>
                        <div class="d_btn_1">
                           <a href="QnAbblist.do" target="_self"><em>QnA</em></a>
                        </div>
                        <div class="d_2">
                           <ul>
                              <li>
                                 <a href="QnAbblist.do" target="_self"><em>QnA</em></a>
                              </li>
                           </ul>
                        </div>
                     </li>
                     <!-- 여기 까지 -->
                     <li>
                        <div class="d_btn_1">
                           <a href="consultinglist.do" target="_self"><em>건강상담</em></a>
                        </div>
                        <div class="d_2">
                           <ul>
                              <li>
                                 <a href="consultinglist.do" target="_self"><em>건강상담</em></a>
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
                                   <form name="searchForm" id="AKCFrm" method="post" action="">
                                 <span class="form-text">
                                    <label class="placeholder" for="kwd">병원검색</label>
                                    <input type="hidden" name="s_category" value="name">
                                    <input type="text" id="kwd" name="s_keyword" value="">
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
                                     <a href="hbbslist.do" target="_self">
                                         <strong>병원 찾기</strong>
                                     </a>
                                 </span>
                                 <ul>
                                      <li>
                                           <a href="hbbslist.do" target="_self">
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
                              <div>
                                 <span  class="tit">
                                     <a href="QnAbblist.do" target="_self">
                                         <strong>QnA</strong>
                                     </a>
                                 </span>
                                 <ul>
                                      <li>
                                           <a href="QnAbblist.do" target="_self">
                                               <em>QnA</em>
                                           </a>
                                      </li>
                                   </ul>
                              </div>
                              <div>
                                 <span  class="tit">
                                     <a href="consultinglist.do" target="_self">
                                         <strong>건강 상담</strong>
                                     </a>
                                 </span>
                                 <ul>
                                      <li>
                                           <a href="consultinglist.do" target="_self">
                                               <em>건강 상담</em>
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
<script>

$(".search_btn").click(function(){
	$("#AKCFrm").attr({ "target":"_self", "action":"hbbslist.do"}).submit();	
});

</script>







