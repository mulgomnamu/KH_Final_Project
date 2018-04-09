<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<html>
<head>
<tiles:insertAttribute name="head"/>
</head>
<body class="main_layout">
<div id="skipnavigation">
    <ul>
        <li><a href="#container">본문 바로가기</a></li>
        <li><a href="#gnb">주 메뉴 바로가기</a></li>
    </ul>
</div>
<div id="wrap">
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="content"/>
	<tiles:insertAttribute name="footer"/>
</div>
		   
</body>
</html>
