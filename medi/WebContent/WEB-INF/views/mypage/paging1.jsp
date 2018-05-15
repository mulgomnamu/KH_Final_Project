<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%	
	
int totalRecordCount1;		// 전체 글수
int pageNumber1;				// 현재 페이지 번호
int pageCountPerScreen1;		// 스크린당 페이지수 	
int recordCountPerPage1;		// 페이지당 글수
	
	
	String st11 = request.getParameter("totalRecordCount1");
	if(st11 == null)	totalRecordCount1 = 0;
	else			totalRecordCount1 = Integer.parseInt(st11);
	
	String st21 = request.getParameter("pageNumber1");
	if(st21 == null)	pageNumber1 = 0;
	else			pageNumber1 = Integer.parseInt(st21);
	
	String st31 = request.getParameter("pageCountPerScreen1");
	if(st31 == null)	pageCountPerScreen1 = 0;
	else			pageCountPerScreen1 = Integer.parseInt(st31);
	
	String st41 = request.getParameter("recordCountPerPage1");
	if(st41 == null)	recordCountPerPage1 = 0;
	else			recordCountPerPage1 = Integer.parseInt(st41);
	String st12 = request.getParameter("totalRecordCount2");
	
	
	
	int totalPageCount1 = totalRecordCount1 / recordCountPerPage1;	// 총페이지
	//		1		=		12					10
	
	if ((totalRecordCount1 % recordCountPerPage1) != 0) {
		//	12					10	
		totalPageCount1++;		// 1 -> 2
	}
	
	
		int screenStartPageIndex1 = ((pageNumber1+1) / pageCountPerScreen1) * pageCountPerScreen1;	
	//			0 =				0 + 1			10						10						
	int screenEndPageIndex1 = (((pageNumber1+1) / pageCountPerScreen1) * pageCountPerScreen1) + pageCountPerScreen1;	
	//			20 = 			0 + 1			10						10						10								
	if (screenEndPageIndex1 > totalPageCount1) screenEndPageIndex1 = totalPageCount1;		// 페이지 블록을 10까지만 표시하려고 하는 처리
	//	10					2				2					2
		
		if (((pageNumber1+1) % pageCountPerScreen1) == 0)
	{
	    screenStartPageIndex1 = (((pageNumber1+1) / pageCountPerScreen1) * pageCountPerScreen1) - pageCountPerScreen1;
	    screenEndPageIndex1 = pageNumber1+1;
	}
	
%>
<div style="float:left; width:100%; text-align:center; margin:30px 0 60px 0;"> 
	<a href="#none" title="처음페이지" onclick="goPage1('0');" class="prevAll"><<</a>&nbsp;		
		<%
		if (screenStartPageIndex1 > 1){
			%>
			<a href="#none" title="이전페이지" onclick="goPage('<%=screenStartPageIndex1-1%>');"><img src="image/arrow_prev.gif" alt="이전페이지" style="width:9px; height:9px;"/></a>&nbsp;	
			<%
		}
		    	
		for (int i=screenStartPageIndex1; i<screenEndPageIndex1 ;i++){
			if (i==pageNumber1){
		    	%>	
		    	<span id="pa1">
				<a href="#none" id="<%=i+11%>" title="<%=i+1%>페이지" onclick="goPage1(<%=i%>,this);" class="pagingNumOn"><%=i+1%></a>&nbsp;
		    	<% 
			} else { 
		    	%>	
				<a href="#none" id="<%=i+11%>" title="<%=i+1%>페이지" onclick="goPage1(<%=i%>,this);" class="pagingNum"><%=i+1%></a>&nbsp;
		    	
		    	<%		
		    }
		}
		    	
		if (screenEndPageIndex1 < totalPageCount1){
		    %>	
			<a href="#none" title="다음페이지" onclick="goPage1(<%=screenEndPageIndex1 %>);"><img src="image/arrow_next.gif" alt="다음페이지" style="width:9px; height:9px;"/></a>&nbsp;
		    <%
		} // end if
		    
		int end_page = 0;
		if (totalPageCount1 > 0){
			end_page = totalPageCount1 - 1;
		}
		%>
		</span>        	
	<a href="#none" title="마지막페이지" onclick="goPage1(<%=end_page %>);" class="nextAll">>></a>
</div>
	 	