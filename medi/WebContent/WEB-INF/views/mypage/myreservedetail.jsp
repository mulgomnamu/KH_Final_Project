<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/appointment.css?ver=1.28"/>

<style>
.refresh_btn1 em:before {content:'';display:inline-block;position:absolute;top:50%; height:16px;margin-top:-8px;background:url('../images/main/icon_refresh.png') no-repeat;vertical-align:top;}
</style>
<script type="text/javascript">
function resevecancel(seq) {
	 $.ajax({
	      type:"post",
	      url:"myresevecancel.do",
	      async:true,
	      data:"seq="+seq,
	      success:function(data){
	    	  if(data.yes == 'yes'){
	    		  alert("취소처리 됐습니다.");
	    	     location.href="Myreserve.do?seq=${login.seq}";
	    	   } else{
	    		   alert("취소처리 안됐습니다.");
	    	   }
	      }
	   });
}
</script>
<div id="container" class="hospitalguide">
<div class="login">
	<section id="sub_section">
		<div class="appointment_title">
			<h1>예약이 정상적으로 완료되었습니다</h1>
			<p>진료 예약하신 정보는 진료차트에서 확인하실 수 있습니다</p>
		</div>
		<!-- content 시작 -->
		<div class="content"> 
			<div class="inner_flogin">
				<div id="hosdetail">
				<h1>진료예약 정보</h1>
				<table id="hostable">
					<tr style="border-top: 2px solid #555">
					<c:if test="${reservedto.type==0 }">
						<th><p>예약정보</p></th>
						<td>일반진료예약</td>
					</c:if>
					<c:if test="${reservedto.type==1 }">
						<th><p>예약정보</p></th>
						<td>화상진료예약</td>
					</c:if>
						<th><p>예약일</p></th>
						<td>${reservedto.day }&nbsp;&nbsp;(${reservedto.wdate })&nbsp;&nbsp;${reservedto.time }</td>
					</tr>
					<tr>
						<th><p>병원명</p></th>
						<td>${hosdto.name }</td>
						<th><p>의사명</p></th>
						<td>${docdto.name }&nbsp;선생님</td>
					</tr>
					<tr>
						<th><p>진료분야</p></th>
						<td>${docdto.specialty }</td>
						<th><p>병원전화번호</p></th>
						<td>${hosdto.tel }</td>
					</tr>
					<tr>
						<th><p>병원위치</p></th>
						<td colspan="3">${hosdto.address }</td>
					</tr>
				</table>
				</div>
				<div id="memdetail">
				<h1>예약환자 정보</h1>
				<table id="memtable">
					<tr style="border-top: 2px solid #555">
						<th><p>환자명</p></th>
						<td style="width: 243px;">${login.name }</td>
						<th><p>증상</p></th>
						<td>${reservedto.content }</td>
					</tr>
					<tr>
						<th><p>휴대전화</p></th>
						<td style="width: 243px;">${login.phone }</td>
						<th><p>이메일</p></th>
						<td>${login.email }&nbsp;</td>
					</tr>
				</table>
				</div>
				<div id="btnarea">
				<p style="text-align: center; margin-bottom: 100px;">
					<a onclick="resevecancel(${reservedto.seq })" class="btn-type02 btn-search refresh_btn1" style="cursor: pointer; width: 240px; margin-right: 50px;"><em style="padding:0px;">예약취소</em></a>     		
				    <a onclick="location.href='main.do'" class="btn-type02 btn-search refresh_btn1" style="cursor: pointer; width: 240px;"><em style="padding:0px;">메인으로</em></a>     		
				</p>
				</div>
			</div>
		</div>
	</section>
</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>