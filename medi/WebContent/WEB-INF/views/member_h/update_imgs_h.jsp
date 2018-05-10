<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style type="text/css">.thumb-image{float:left;width:100px;position:relative;padding:5px;}/* .selectedItem{border:2px solid blue;} */</style>

<div id="container" class="hospitalguide"><!-- 1뎁스명 클래스 -->
	<div class="login"><!-- 2뎁스명 클래스 -->
		<!-- SUB SECTION -->
		<section id="sub_section">
			<!-- #LOCATION -->
			<!-- sub타이틀 시작 -->
			<div class="title-type01">
				<h2>병원 이미지 수정</h2>
				<em>업로드할 이미지를 모두 올려주세요</em>
			</div>
			<!-- content 시작 -->
			<div class="content"> 
				<div class="inner_flogin">
				
					<div>
						<form action="">
							<table>
								<tr>
									<th>
										업로드 된 이미지
									</th>
									<td colspan="2">
										<div>
											<c:forEach var="str_img" items="${list_imgs }">
												<img src="upload/${str_img.image }" class="thumb-image">
											</c:forEach>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										병원 이미지 업로드
										<input type="hidden" name="seq" value="${login_h.seq }">
									</th>
									<td>
										<div id="image-holder"></div>
									</td>
									<td>
										<input type="file" id="update_imgs" name="update_imgs" multiple>
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<input type="submit" value="수정하기">
									</td>
								</tr>
							</table>
						</form>
					</div>
				
				</div>
			</div>
		</section>
	</div>
			<!-- // #LOCATION -->
	<!-- phone_num 끝 -->
</div>

<script>
	$(document).ready(function() {
		$("#update_imgs").on('change', function() {
			var countFiles = $(this)[0].files.length;
			var imgPath = $(this)[0].value;
			var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
			var image_holder = $("#image-holder");
			image_holder.empty();
			if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
				if (typeof(FileReader) != "undefined") {
					for (var i = 0; i < countFiles; i++) {
						var reader = new FileReader();
						reader.onload = function(e) {
							$("<img />", {
							"src": e.target.result,
							"class": "thumb-image"
							}).appendTo(image_holder);
						}
						image_holder.show();
						reader.readAsDataURL($(this)[0].files[i]);
					}
				} else {
					alert("This browser does not support FileReader.");
				}
			} else {
				alert("Pls select only images");
				return false;
			}
		});
	});
</script>