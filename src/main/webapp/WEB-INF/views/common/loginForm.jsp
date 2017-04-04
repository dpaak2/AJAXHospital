<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="container">
<div id="loginInputBox">
<form id="loginForm" >
<table class="table_default">
<tr>
	<td>
	<input type="text" placeholder="아이디" name="id">
	</td>
	<td rowspan="2">
	<input id="inputLogin" type="submit" value="LOGIN"/>
	<!-- <a href="admin.html">로그인</a> -->
	</td>
</tr>
<tr>
	<td>
	<input type="password" placeholder="비밀번호" name="password"/>
	</td>
	
</tr>

</table>
 <input type="radio" name="permission" value="patient" checked>고객
  <input type="radio" name="permission" value="doctor">의사
  <input type="radio" name="permission" value="nurse">간호사
   <input type="radio" name="permission" value="admin">관리자
<input type="hidden" name="action" value="login"/>
<input type="hidden" name="page" value="main"/>
</form>
</div>
<script>
$(function() {
	var $loginForm = $('#loginForm');
	$loginForm.addClass('margin_center').css('width','20%');
	var tab = $loginForm.find('table');
	/* 버튼이 눌렸을때 부터 작동되는것들 비동기적  */
	
	$('#loginForm input[value=LOGIN]').click(function(event) {
		var permission=$loginForm.find(':radio[name=permission]:checked').val();
		alert('PERMISSION:' +permission);
		$loginForm.attr("action", "${context.path}/"+permission+"/login");
		$loginForm.attr("method", "post");
		var idVal = tab.find('input[name=id]').val();
		var pwVal = tab.find('input[name=password]').val();
		if(idVal=='' || pwVal==''){
			alert('값을 먼저 입력해주세요!');
		}else{
			alert('로그인하기 위해 입력한 ID, PW 값 ID=' + idVal + ', PW=' + pwVal);
			$loginForm.submit();
		}
	});
	
	$('#container').addClass('width_full_size').css('height','500px');
	$('#loginInputBox').addClass('width_full_size').css('margin-top','170px');
	$('#inputLogin').addClass('width_full_size').addClass('height_full_size'); 
});
</script>
