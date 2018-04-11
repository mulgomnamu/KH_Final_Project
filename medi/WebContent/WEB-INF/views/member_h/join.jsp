<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
<!-- SUB SECTION -->
		<section id="sub_section">
<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>Big jbc</h2>
				<em>ex) ㅇㅇㅇ 에 등록된 모든 병원의 정보를<br/>한눈에 보여드립니다</em>
			</div>
<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
					<form action="#none" id="_from" method="post">
						<table border="1 solid">
							<tr>
								<td>
									아이디
								</td>
								<td>
									<input type="text" id="id" name="id" placeholder="아이디를 입력하세요">
								</td>
							</tr>
							<tr>
								<td>
									패스워드
								</td>
								<td>
									<input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요">
								</td>
							</tr>
							<tr>
								<td>
									패스워드 확인
								</td>
								<td>
									<input type="password" id="pwd2" name="pwd2" placeholder="비밀번호를 입력하세요">
								</td>
							</tr>
							<tr>
								<td>
									병원명
								</td>
								<td>
									<input type="text" id="name" name="name" placeholder="병원 이름을 입력하세요">
								</td>
							</tr>
							<tr>
								<td>
									대표 전화번호
								</td>
								<td>
									<select id="tel1" name="tel1">
										<option value="02">02</option>
									</select>
									-
									<input type="text" id="tel2" name="tel2" placeholder="xxx">
									-
									<input type="text" id="tel3" name="tel3" placeholder="xxxx">
								</td>
							</tr>
							<tr>
								<td>
									주소
								</td>
								<td>
									<input type="text" id="post" placeholder="우편번호">
									<input type="button" onclick="btnPost()" value="우편번호 찾기"><br>
									<input type="text" id="address1" placeholder="주소">
									<input type="text" id="address2" placeholder="상세주소">
								</td>
							</tr>
							<tr>
								<td>
									이메일
								</td>
								<td>
									<input type="email" id="email" name="email" placeholder="abc">
									@
									<select>
										<option value="naver.com">naver.com</option>
										<option value="google.com">google.com</option>
										<option value="daum.net">daum.net</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									질문
								</td>
								<td>
									<select id="question" name="question">
										<option value="감명 깊게 읽은 책은?">감명 깊게 읽은 책은?</option>
										<option value="가장 가고 싶은 여행지는?">가장 가고 싶은 여행지는?</option>
										<option value="가장 기억나는 선생님은?">가장 기억나는 선생님은?</option>
										<option value="내가 가장 아끼는 보물 1호는?">내가 가장 아끼는 보물 1호는?</option>
										<option value="제일 감명깊게 본 영화는?">제일 감명깊게 본 영화는?</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									답변
								</td>
								<td>
									<input type="text" id="answer" name="answer" placeholder="답변을 입력하세요">
								</td>
							</tr>
							<tr>
								<td>
									의료 자격증
								</td>
								<td>
									<input type="text" id="confirm_img" name="confirm_img">
								</td>
							</tr>
							<tr>
								<td>
									병원 소개
								</td>
								<td>
									<input type="text" id="info" name="info">
								</td>
							</tr>
							<tr>
								<td>
									병원 이미지 업로드
								</td>
								<td>
									<input type="text" id="image" name="imgae">
								</td>
							</tr>
							<tr>
								<td>
									<input type="submit" value="회원가입">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
<!-- 이부분에 컨텐츠 끝 -->
		</section>
	</div>
</div>

<script>
우편번호
	function btnPost() {
    	new daum.Postcode({
            oncomplete: function(data) {
                var fullAddr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') {
                    fullAddr = data.roadAddress;

                } else {
                    fullAddr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                document.getElementById('post').value = data.zonecode;
                document.getElementById('address1').value = fullAddr;
                document.getElementById('address2').focus();
            }
        }).open();
    }
/* 우편번호 */

</script>