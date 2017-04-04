<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<ul id="patGnb">
	<li><a>홈으로</a></li>
	<li><a>마이페이지</a></li>
	<li><a>진료기록</a></li>
	<li><a>게시판</a></li>
	<li><a>로그아웃</a></li>
	<li>
		<div class="tooltip"><a href="#">병원소개</a>
	    <span class="tooltiptext"> 구현되지 않는 작업입니다.</span>
	    </div>
	</li>
	</ul>
		<script>
	
		$(function(){
			var patGnb=$('#patGnb');
			$('#patGnb').addClass('gnb').addClass('width_full_size ').addClass('bg_color_darkgray').addClass('text_center').css('height: 40px');
			$('#patGnb li:nth-child(1)').click(function(){
				alert('jQueryTest');
				location.href="${context.path}/home"
			});
			patGnb.find('li:nth-child(2)').click(function() {
				alert('jQuery Test');
				goPage('${context.path}/patient');
				});
		patGnb.find('li:nth-child(3)').click(function() {
				alert('jquery test');
			goPage('${context.path}/patient');
			});
		patGnb.find('li:nth-child(4)').click(function() {
				alert('jquery test');
				goPage('${context.path}/board');
			});
		patGnb.find('li:nth-child(5)').click(function() {
				alert('jquery test');
				goPage('${context.path}/home');
			});
		});
		</script>