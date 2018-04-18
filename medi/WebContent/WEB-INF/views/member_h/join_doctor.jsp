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
									<div class="centerv_left_one">
	<div class="centerv_left_one_tite">병원검색</div>
	<div class="centerv_left_one_sect">
		<label for="subject_lab" class="blind">전체</label>

        <select name="clsjt_left" style="font-size:11px; color:#338BAC; border:1 solid #B7B7B7;" class="select_text" align="absmiddle">
          <option selected value="ALL">전체</option>
          
          <option value="내과">내과</option>
          
          <option value="치과">치과</option>
          
          <option value="소아청소년과">소아청소년과</option>
          
          <option value="산부인과">산부인과</option>
          
          <option value="산후조리원">산후조리원</option>
          
          <option value="조산원">조산원</option>
          
          <option value="이비인후과">이비인후과</option>
          
          <option value="안과">안과</option>
          
          <option value="피부과">피부과</option>
          
          <option value="비뇨기과">비뇨기과</option>
          
          <option value="신경정신과">신경정신과</option>
          
          <option value="외과">외과</option>
          
          <option value="정형외과">정형외과</option>
          
          <option value="성형외과">성형외과</option>
          
          <option value="신경외과">신경외과</option>
          
          <option value="항문외과">항문외과</option>
          
          <option value="흉부외과">흉부외과</option>
          
          <option value="한방">한방</option>
          
          <option value="한의원">한의원</option>
          
          <option value="가정의학과">가정의학과</option>
          
          <option value="재활의학과">재활의학과</option>
          
          <option value="노인전문">노인전문</option>
          
          <option value="치매">치매</option>
          
          <option value="통증클리닉">통증클리닉</option>
          
          <option value="방사선과">방사선과</option>
          
          <option value="마취과">마취과</option>
          
          <option value="결핵과">결핵과</option>
          
          <option value="임상병리과">임상병리과</option>
          
          <option value="알콜병원">알콜병원</option>
          
          <option value="일반">일반</option>
          
          <option value="종합">종합</option>
          
          <option value="기타">기타</option>
          
        </select>
						
	</div>

	<div class="centerv_left_one_bom">
		<span>
			<label for="thename_lab" class="blind">병원이름</label>			
			<input type="text" name="h_name_left" align="absmiddle" value="병원이름" style="font-size:11px; height:19; width:100; color:#338BAC; border:1 solid #B7B7B7;ime-mode:active" onFocus="setValue_left()" onKeyDown="pressSearch_left()" /><input type="button" style="BACKGROUND-COLOR: #A1D935;color: white ;width:44px;border:0;height:20px;font-size:10pt;cursor:pointer;" value="검색" onclick="field_search_left()" />
		</span>		
		<span></span>
	</div>	
</div>
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
									<textarea rows="50" cols="50" id="doc_content" name="doc_content"></textarea>
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
function field_search_left(){
	var fm = document.left_menu_frm;
	
	if(fm.h_name_left.value == "병원이름"){
		fm.h_name_left.value = "";
	}
  fm.clsjt.value = fm.clsjt_left.value;
	fm.h_name.value = Trim(fm.h_name_left.value);
  fm.menu_.value = "search";
  fm.viewTitle.value = "진료과별검색";

	fm.target = "main";
	fm.action = "/field_search.do";
	fm.submit();
}
</script>