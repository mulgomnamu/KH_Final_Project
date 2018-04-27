<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/consulting.css?ver=1.04"/>

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
				<!-- 이부분에 컨텐츠 시작 -->
					

					<div>
						<form action="">
							<table border="1" class="list_table">
								<tr>
									<th>
										회원 번호
									</th>
									<th>
										아이디
									</th>
									<th>
										이름
									</th>
									<th>
										이메일
									</th>
									<th>
										질문
									</th>
									<th>
										답변
									</th>
									<th>
										전화번호
									</th>
									<th>
										우편번호
									</th>
									<th>
										주소
									</th>
									<th>
										회원 구분
									</th>
									<th>
										탈퇴유무
									</th>
									<th>
										프로필 사진
									</th>
									<th>
										Black List
									</th>
									<th>
										가입 날짜
									</th>
								</tr>
								<c:forEach var="memberList" items="${loginList }">
									<tr>
										<td>
											${memberList.seq }
										</td>
										<td>
											${memberList.id }
										</td>
										<td>
											${memberList.name }
										</td>
										<td>
											${memberList.email }
										</td>
										<td>
											${memberList.question }
										</td>
										<td>
											${memberList.answer }
										</td>
										<td>
											${memberList.phone }
										</td>
										<td>
											${memberList.post }
										</td>
										<td>
											${memberList.address }
										</td>
										<td>
											${memberList.auth }
										</td>
										<td>
											${memberList.del }
										</td>
										<td>
											${memberList.myimg }
										</td>
										<td>
											${memberList.blacklist }
										</td>
										<td>
											${memberList.regdate }
										</td>
									</tr>
								</c:forEach>
							</table>
						</form>
					</div>



				<!-- 이부분에 컨텐츠 끝 -->
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>