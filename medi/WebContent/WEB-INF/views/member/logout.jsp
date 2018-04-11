<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<% 
	session.invalidate(); // 세션에 들어가 있는 정보를 지워주는 것.
%>

<script type="text/javascript">

alert("안녕히 가세요~");
location.href = "main.do";

</script>