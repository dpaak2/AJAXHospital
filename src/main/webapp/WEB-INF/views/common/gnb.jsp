<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<ul id="commonGnb" style="height: 40px">
	<li><a>회원가입</a></li>
	<li><a>로그인</a></li>
	<li><a>게시판</a></li>
	<li>
		<div class="tooltip">
			<a href="#">병원소개</a> <span class="tooltiptext"> 구현되지 않는 작업입니다.</span>
		</div>
	</li>
</ul>
<script>
	$(function() {
		var  commonGnb=$('#commonGnb');
		$('#commonGnb').addClass('gnb').addClass('width_full_size').addClass(
				'text_center').addClass('bg_color_darkgray');
		commonGnb.find('li:nth-child(1)').click(function() {
							alert('회원가입');
							goPage('${context.path}/patient/join');
						});
		commonGnb.find('li:nth-child(2)').click (function() {
			alert('로그인');
			goPage('${context.path}/login');
		});
		commonGnb.find('li:nth-child(3)').click(function() {
			alert('board');
			goList('${context.path}/board/list'); /*board의 list는 메인이다*/
		});
	});

</script>