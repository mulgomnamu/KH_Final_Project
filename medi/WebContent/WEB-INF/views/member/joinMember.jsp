<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<div id="container" class="hospitalguide">
	<!-- 1뎁스명 클래스 -->
	<div class="login">
		<!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section"> <!-- #LOCATION --> <!-- sub타이틀 시작 -->
		<div class="title-type01">
			<h2>회원가입</h2>
			<em>정보를 입력해주세요.</em>
		</div>
		<!-- content 시작 -->
		<div class="content">
			<div class="inner_flogin">
				<!-- 이부분에 컨텐츠 시작 -->
				ID : <input name="id" type="text" class="form-control" id="id"
					placeholder="id" required=""><br>
				<p id="result_id_msg"></p>

				PWD : <input name="password1" type="password" class="form-control"
					id="password1" placeholder="password" required=""><br>
			    PWD :<input name="password2" type="password" class="form-control"
					id="password2" placeholder="password" required=""> <font
					name="check" size="2"></font> <br>
				NAME:<input name="name" type="name"
					class="form-control" id="name" placeholder="name" required="">
<br>
				EMAIL:<input name="email" type="email" class="form-control" id="email"
					placeholder="email" required=""><input type="button" name="emailpass" value="email인증" onclick="emailcheck()"> <br>
				BIRTH:<input name="birth" type="date" class="form-control" id="birth" value="birth"
					title="birth" placeholder="birth" required=""><br> 
				TEL:<input type="tel" name="phone" id="phone" title="phone number"
					placeholder="000-0000-0000"
					pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13"
					required=""> <br>
				POST:<input type="text" id="sample4_postcode"
					placeholder="우편번호" required="">
				<input type="button"
					onclick="sample4_execDaumPostcode()" value="주소검색" required=""><br>
				<input type="text" id="sample4_roadAddress" name="addr1"
					placeholder="도로명주소" size="40" required=""><br>
			    <input type="text" id="addr" name="addr2" placeholder="추가주소" required=""><br>
				<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"><br>
				<span id="guide" style="color: #999"></span>

				<fieldset>
					<button id="form-submit" disabled="disabled" type="submit"
						class="btn">join us</button>
				</fieldset>
				<!-- 이부분에 컨텐츠 끝 -->
			</div>
		</div>
		</section>
	</div>
	<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>
<script type="text/javascript">
function emailcheck(){
	alert("인증");
}
</script>

<script type="text/javascript">
//전화번호 형식검사 스크립트
var patt = new RegExp("[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}");
var res = patt.test( $("#phone").val());

if( !patt.test( $("#phone").val()) ){
    alert("전화번호를 정확히 입력하여 주십시오.");
    return false;
}

</script>

<script>
//우편번호 검색 스크립트
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
<script type="text/javascript">
//id중복검사 스크립트
$(document).ready(function(){
	console.log("1");
    $('#id').keyup(function(){
    	console.log("2");
        if ( $('#id').val().length > 0) {
        	console.log("3");
            var id = $(this).val();
            var url = "idcheck.do";
            // ajax 실행
            $.ajax({
                type : "GET",
                url : url,
                data:"id=" + $('#id').val(),
                success : function(data) {
                    console.log("4");
                    console.log("data = "+data);
                 
                  	//$("#result_id_msg").html(result);
                    /* if(data != "??"){
                    	
    					
    				} */
					if(data == "??") {
    					console.log("6");
    					$("#result_id_msg").css("color", "#ff0000");
    					$("#result_id_msg").text("사용 중인 id입니다");	
    					$("#result_id_msg").prop("disabled", true);
    					
    					
    				} 
                    
                },error : function() {
                	console.log("5");
					$("#result_id_msg").css("color", "#0000ff");
					$("#result_id_msg").text("사용할 수 있는 id입니다");
					$("#result_id_msg").prop("disabled", false);
				}
            }); // end ajax
        }
    }); // end keyup
});
</script>

<script type="text/javascript">
//동일 pwd 검사
$(function(){
  $('#password1').keyup(function(){
   $('font[name=check]').text('');
  }); //#user_pass.keyup

  $('#password2').keyup(function(){
   if($('#password1').val()!=$('#password2').val()){
    $('font[name=check]').html("다시 입력해주세요.");
    $('font[name=check]').css("color", "#ff0000");
   }else{
    $('font[name=check]').text('');
    $('font[name=check]').html("동일합니다.");
    $('font[name=check]').css("color", "#0000ff");
   }
  }); //#chpass.keyup
 });
</script>

<script type="text/javascript">
//동일 pwd 검사
$(function(){
	$('#form-submit').mouseenter(function(){ 
	   if($('#password1').val()!=$('#password2').val() || $("#result_id_msg").prop("disabled") ){
		   $("#form-submit").prop("disabled", true);
		   $('#password1').text('');
		   $('#password2').text('');
	   }else{
		   $("#form-submit").prop("disabled", false);
	   }
  	}); //#chpass.keyup
 });
</script>

<script type="text/javascript">
//동일 pwd 검사
$(function(){
	/* $('#dogChoice1').click(function(){
		 console.log("!!!");
	   if($('#dogChoice1').val() == "yes" ){
		   console.log("dogyes");
		   $("#dname").attr("disabled", false);
		   $("#dbirth").attr("disabled", false);
		   $("#dcatagory").attr("disabled", false);
		   
	   }else{
		   console.log("dogno");
		   $("#dname").attr("disabled", true);
		   $("#dbirth").attr("disabled", true);
		   $("#dcatagory").attr("disabled", true);
	   }
  	}); //#chpass.keyup */
	$("input:radio[name=hadDog]").click(function(){
	    
	    if($("input:radio[name=hadDog]:checked").val()=='yes'){
	    	$("#dname").attr("disabled", false);
			$("#dbirth").attr("disabled", false);
			$("#dcatagory").attr("disabled", false);
	    }else{
	    	$("#dname").attr("disabled", true);
		    $("#dbirth").attr("disabled", true);
			$("#dcatagory").attr("disabled", true);
	        
	    }
	});
  	
 });
 


</script>


