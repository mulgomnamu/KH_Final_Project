<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%	
	int totalRecordCount2;		// 전체 글수
	int pageNumber2;				// 현재 페이지 번호
	int pageCountPerScreen2;		// 스크린당 페이지수 	
	int recordCountPerPage2;		// 페이지당 글수
	
	
	String st12 = request.getParameter("totalRecordCount2");
	if(st12 == null)	totalRecordCount2 = 0;
	else			totalRecordCount2 = Integer.parseInt(st12);
	
	String st22 = request.getParameter("pageNumber2");
	if(st22 == null)	pageNumber2 = 0;
	else			pageNumber2 = Integer.parseInt(st22);
	
	String st32 = request.getParameter("pageCountPerScreen2");
	if(st32 == null)	pageCountPerScreen2 = 0;
	else			pageCountPerScreen2 = Integer.parseInt(st32);
	
	String st42 = request.getParameter("recordCountPerPage2");
	if(st42 == null)	recordCountPerPage2 = 0;
	else			recordCountPerPage2 = Integer.parseInt(st42);
	
	int totalPageCount2 = totalRecordCount2 / recordCountPerPage2;	// 총페이지
	//		1		=		12					10
	
	if ((totalRecordCount2 % recordCountPerPage2) != 0) {
		//	12					10	
		totalPageCount2++;		// 1 -> 2
	}
	
	int screenStartPageIndex2 = ((pageNumber2+1) / pageCountPerScreen2) * pageCountPerScreen2;	
	//			0 =				0 + 1			10						10						
	int screenEndPageIndex2 = (((pageNumber2+1) / pageCountPerScreen2) * pageCountPerScreen2) + pageCountPerScreen2;	
	//			20 = 			0 + 1			10						10						10								
	if (screenEndPageIndex2 > totalPageCount2) screenEndPageIndex2 = totalPageCount2;		// 페이지 블록을 10까지만 표시하려고 하는 처리
			
	
	
	
	if (((pageNumber2+1) % pageCountPerScreen2) == 0)
	{
	    screenStartPageIndex2 = (((pageNumber2+1) / pageCountPerScreen2) * pageCountPerScreen2) - pageCountPerScreen2;
	    screenEndPageIndex2 = pageNumber2+1;
	}
	
%>
<div style="float:left; width:100%; text-align:center; margin:30px 0 60px 0;"> 
	<a href="#none" title="처음페이지" onclick="goPage2('0');" class="prevAll"><<</a>&nbsp;		
		<%
		if (screenStartPageIndex2 > 1){
			%>
			<a href="#none" title="이전페이지" onclick="goPage2('<%=screenStartPageIndex2-1%>');"><img src="image/arrow_prev.gif" alt="이전페이지" style="width:9px; height:9px;"/></a>&nbsp;	
			<%
		}
		    	
		for (int i=screenStartPageIndex2; i<screenEndPageIndex2 ;i++){
			if (i==pageNumber2){
		    	%>	
				<span id="pa2">
				<a href="#none" id="<%=i+21%>" title="<%=i+1%>페이지" onclick="goPage2(<%=i%>,this);" class="pagingNumOn"><%=i+1%></a>&nbsp;
		    	<% 
			} else { 
		    	%>	
				<a href="#none" id="<%=i+21%>" title="<%=i+1%>페이지" onclick="goPage2(<%=i%>,this);" class="pagingNum"><%=i+1%></a>&nbsp;
		    	
		    	<%		
		    }
		}
		    	
		if (screenEndPageIndex2 < totalPageCount2){
		    %>	
			<a href="#none" title="다음페이지" onclick="goPage2(<%=screenEndPageIndex2 %>);"><img src="image/arrow_next.gif" alt="다음페이지" style="width:9px; height:9px;"/></a>&nbsp;
		    <%
		} // end if
		    
		int end_page = 0;
		if (totalPageCount2 > 0){
			end_page = totalPageCount2 - 1;
		}
		%>
		     </span>   	
	<a href="#none" title="마지막페이지" onclick="goPage2(<%=end_page %>);" class="nextAll">>></a>
</div>
	 	