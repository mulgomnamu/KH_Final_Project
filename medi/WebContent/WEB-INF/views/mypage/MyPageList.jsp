<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>내가 쓴글</h2>
				<a href="Myconsulting.do?seq=${login.seq }"><h2>건강상담</h2></a>
				<br>
				<a href="Myreserve.do?seq=${login.seq }"><h2>내 예약현황</h2></a>
			</div>
				
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
				<div class="searchwrap">
                  <div class="searchbox" style="display: inline-block;position: relative;left: 300px;top: -1.8px;">
                     <form name="frmForm1" id="_frmFormSearch" method="post" action="">
                        <table>
                           <col width="15%"><col width="55%"><col width="15%">
                           <tr>
                              <td style="padding-left:5px;">
                                 <select id="_s_category" name="s_category">
                                    <option value="" selected="selected">선택</option>
                                    <option value="title">제목</option>
                                    <option value="id">아이디</option>                        
                                 </select>
                              </td>
                              <td style="padding-left:5px;"><input type="text" id="_s_keyword" name="s_keyword" value="${s_keyword}"/></td>
                              <td style="padding-left:5px;"><button type="button" id="_btnSearch"> 검색 </button></td>
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
             <table style="width:85%; align:center; margin-top: 100px;"  align="center">
               <colgroup>
                  <col style="width:150px;" />
                  <col style="width:auto;" />
                  <col style="width:100px;" />
               </colgroup>
      
               <thead>
                  <tr> 
                     <th>순서</th><th>아이디</th><th>제목</th><th>말머리</th> 
                  </tr>
               </thead>
      
               <tbody  style="text-align: center;">   
                  <c:if test="${empty Mylisy}">
                  <tr>
                     <td colspan="3">작성된 글이 없습니다.</td>
                  </tr>   
                  </c:if>
                
                  <c:forEach items="${Mylisy}" var="bbs" varStatus="vs">
                  
                    <tr class="_hover_tr">
                        <td>${vs.count}</td>
                        <td>${bbs.id }</td> 
                        <td>
                           <a href='Qnabbsdetail.do?seq=${bbs.seq}&mypage=mypage'>
                               ${bbs.title}</a></td>
                           <td>${bbs.content}</td>
                        </tr>
                        </c:forEach>
               </tbody>
               </table> 
               <br>
               <div id="paging_wrap">
                  <jsp:include page="/WEB-INF/include/paging.jsp" flush="false">
                     <jsp:param value="${pageNumber }" name="pageNumber"/>
                     <jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
                     <jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
                     <jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
                  </jsp:include>
                  
                  
               </div>
               
               <script type="text/javascript">
               $(document).ready(function() {
            		if ("${s_category}" == "title") {
            			$("#_s_category option:eq(1)").attr("selected", "selected");
            		} else if("${s_category}" == "id"){
            			$("#_s_category option:eq(2)").attr("selected", "selected");
            		} else{
            			$("#_s_category option:eq(0)").attr("selected", "selected");
            		}
            	});
               
               $("#_btnSearch").click(function() {
            		//alert('search');						
            		$("#_frmFormSearch").attr({ "target":"_self", "action":"MyPageList.do?id=${login.id}" }).submit();
            	});
            	function goPage(pageNumber) {	
            		$("#_pageNumber").val(pageNumber) ;
            		$("#_frmFormSearch").attr("target","_self").attr("action","MyPageList.do").submit();
            	}
               </script>
					
				<!-- 이부분에 컨텐츠 끝 -->
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>