<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


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
				
					<form action="">
						<table>
							<tr>
								<td>
									의사 이름
								</td>
								<td>
									<input type="text" id="name" name="name">
								</td>
							</tr>
							<tr>
								<td>
									진료 분야
								</td>
									
								<td>
									<table>
										<tr>
											<td>
												<div>				
													전체 진료과목
													<div>
														<select name="all_cl_sjt" id="all_cl_sjt" multiple="multiple" size="14" style="width:200px" onclick="click_select('all_cl_sjt');" ondblclick="append_cl();">
														<option value="001">내과</option><option value="002">치과</option><option value="003">소아청소년과</option><option value="004">산부인과</option><option value="030">산후조리원</option><option value="031">조산원</option><option value="005">이비인후과</option><option value="006">안과</option><option value="007">피부과</option><option value="008">비뇨기과</option><option value="009">신경정신과</option><option value="010">외과</option><option value="011">정형외과</option><option value="012">성형외과</option><option value="013">신경외과</option><option value="014">항문외과</option><option value="015">흉부외과</option><option value="016">한방</option><option value="017">한의원</option><option value="018">가정의학과</option><option value="019">재활의학과</option><option value="020">노인전문</option><option value="021">치매</option><option value="022">통증클리닉</option><option value="023">방사선과</option><option value="024">마취과</option><option value="025">결핵과</option><option value="026">임상병리과</option><option value="027">알콜병원</option><option value="028">일반</option><option value="029">종합</option><option value="032">기타</option></select>						
													</div>
												</div>
											</td>
											<td>
												<div class="pad_tp80l">					
													<br><input type="button" class="bg_blue" value="▶" onclick="append_cl();" style="width:25px;height:25px"><br><br>
													<input type="button" class="bg_blue" value="◀" onclick="remove_cl();" style="width:25px;height:25px">
												</div>
											</td>
											<td>
												<div>		
													선택한 진료과목
													<div>
														<select name="cl_sjt" id="cl_sjt" multiple="multiple" size="14" style="width:200px" onclick="click_select('cl_sjt');" ondblclick="remove_cl();">
														</select>
														<input type="hidden" name="cl_sjt_list">		
													</div>
												</div>
											</td>
											<td>
												<div class="pad_tp80">
													<input type="button" class="bg_blue" value="▲" onclick="move_up();" style="width:25px;height:25px"><br><br>
													<input type="button" class="bg_blue" value="▼" onclick="move_down();" style="width:25px;height:25px">
												</div>
												<p class="clear"></p>
											</td>
										<tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									진료 시간
								</td>
								<td>
									<input type="text" id="" name="">
								</td>
							</tr>
							<tr>
								<td>
									의사 프로필 사진
								</td>
								<td>
									<input type="text" id="profile" name="profile">
								</td>
							</tr>
							<tr>
								<td>
									의사 소개
								</td>
								<td>
									<textarea rows="10" cols="10" id="doc_content" name="doc_content"></textarea>
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

<script>
/*진료과목 추가*/
function append_cl() {
	var box = document.getElementById("cl_sjt");
	var oribox;
	oribox = document.getElementById("all_cl_sjt");

	for (i = oribox.length - 1; i >= 0 ; i--) {
		if (oribox.options[i].selected) {
			// 중복 체크
			for (j = 0; j < box.length; j++) {
				if (box.options[j].value == oribox.options[i].value) {
					alert("\""+oribox.options[i].text+"\"은 이미 추가되었습니다.");
					break;
				}
			}
			// 옵션 추가
			if (j == box.length) {
				box.options[box.length] = new Option(oribox.options[i].text, oribox.options[i].value);
			}
		}
	}
}

/*다른 쪽에 포커스가 갔을때 선택이 되어져있으면 해지 시킨다.*/
function click_select(select_name) {
	if (select_name != "cl_sjt") {
		document.getElementById("cl_sjt").selectedIndex = -1;
	}

	if (select_name != "all_cl_sjt") {
		document.getElementById("all_cl_sjt").selectedIndex = -1;
	}
}

/*진료과목 빼기*/
function remove_cl() {
	var box = document.getElementById("cl_sjt"); 
	var oribox;
	oribox = document.getElementById("all_cl_sjt");
	
	for (i = box.length - 1; i >= 0 ; i--) {
		if (box.options[i].selected) {
				box.options[i] = null;
		}
	}
}

/*삭제진료과목 체크 (진료과목을 선택한 의사가 있을때 오류 메시지를 낸다.*/
function remove_cl_final_notok(arg) {
	document.getElementById("cl_sjt").options[arg].selected = false;
	remove_cl();
}

/*삭제진료과목 체크(진료과목을 선택한 의사가 없을때 해당 과목을 삭제한다.)*/
function remove_cl_final_ok(arg) {
	var box = document.getElementById("cl_sjt");
	box.options[arg] = null;
	remove_cl();
}

/*진료과목 순서올리기*/
function move_up() {
	var box = document.getElementById("cl_sjt");
	for (i = 0; i < box.length ; i++) {
		if(i == 0) continue;
		if (box.options[i].selected && !box.options[i-1].selected) {
			swap_option(box, i, i-1);
		}
	}
}

/*진료과목 순서내리기*/
function move_down() {
	var box = document.getElementById("cl_sjt");
	for (i = box.length - 1; i >= 0 ; i--) {
		if(i == box.length - 1) continue;
		if (box.options[i].selected && !box.options[i+1].selected) {
			swap_option(box, i, i+1);
		}
	}
}

/*진료과목 순서정렬*/
function swap_option(target, swap_a, swap_b) {
	var temp_option = new Option(target.options[swap_a].text,target.options[swap_a].value,false,true);
	target[swap_a] = new Option(target.options[swap_b].text,target.options[swap_b].value);
	target[swap_b] = temp_option;
}
</script>