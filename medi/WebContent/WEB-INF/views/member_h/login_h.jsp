<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>Big hjh</h2>
				<em>ex) ㅇㅇㅇ 에 등록된 모든 병원의 정보를<br/>한눈에 보여드립니다</em>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
					<form action="login_hAf.do" id="loginForm" method="post">
						<table>
							<tr>
								<td>
									로그인
								</td>
								<td>
									<input type="text" id="id" name="id" placeholder="아이디">
								</td>
							</tr>
							<tr>
								<td>
									비밀번호
								</td>
								<td>
									<input type="password" id="pwd" name="pwd" placeholder="비밀번호">
								</td>
							</tr>
							<tr>
								<td>
									<input type="submit" value="로그인 " >
								</td>
							</tr>
						</table>
					</form>	
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>

<script type="text/javascript"> 
	var message = '${msg}';
	if(message != ""){
		alert(message);	
	}
</script>