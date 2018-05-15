<%@page import="kh.com.medi.model.MediMember_hDto"%>
<%@page import="kh.com.medi.model.MediMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
#header_wrap_sub {background-color:#0b2d85;} 
#header_wrap_sub .header_util_sub em {color:#fff !important;}
#header_wrap_sub .wrap_gnb_util > span.btn_search a:after {background-image:url('/ui_common/images/common/icon_header_search_w.png');}
#header_wrap_sub .wrap_gnb_util > span.btn_total a:after {background-image:url('/ui_common/images/common/icon_header_total_w.png');}

.sub_admin_menu{display:inline-block; margin-left:120px;}
.sub_admin_menu li{float:left; margin-left:30px; color:#fff;}
.sub_admin_menu li a{color:#fff;}

</style>

   <c:if test="${sessionScope.login ne null }">
      <c:set var="login" value="${sessionScope.login }"/>
      <c:set var="loginType" value="${sessionScope.loginType }"/>
   </c:if>
   <c:if test="${sessionScope.login_h ne null }">
      <c:set var="login_h" value="${sessionScope.login_h }"/>
      <c:set var="loginType" value="${sessionScope.loginType }"/>
   </c:if>
   
<!-- header 시작 -->
<header id="header_wrap_sub" style="position:unset;">
	<div class="inner">
		<h1 class="logo">
			<a href="main.do" style="color:#fff;">I Chee U</a>
		</h1>
		<div class="sub_admin_menu">
			<ul>
				<li>
					<a href="adminMain.do">메인</a>
				</li>
				<li>
					<a href="adminMemberList.do">일반회원</a>
				</li>
				<li>
					<a href="adminHospitalList.do">병원회원</a>
				</li>
				<li>
					<a href="adminDoctorList.do">의사 리스트</a>
				</li>
				<li>
					<a href="adminReservationList.do">예약현황</a>
				</li>
				<li>
					<a href="adminHospitalConfirm.do">병원 회원승인</a>
				</li>
			</ul>
		</div>
		<div class="util_wrap">
            <div class="header_util_sub">
                <div class="logout">
                    <ul>  
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
				               <a href="MyPageList.do?id=${login.id }">
				                  <em>마이페이지</em>
				               </a>
				            </li>   
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
				   
				                  <em>정보수정</em>
				               </a>
				            </li>
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
					<!-- 관리자 -->
				         <c:if test="${loginType eq 2 }">
				            <li>
				               <a href="logout.do">
				                  <em>로그아웃</em>
				               </a>
				            </li>
				         </c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>
<!-- header 끝  -->







