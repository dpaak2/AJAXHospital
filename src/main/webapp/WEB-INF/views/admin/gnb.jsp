<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<ul id="adminGnb">
		<li><a>회원가입</a></li>
		<li><a>로그인</a><li>
		<li><a>게시판</a><li>
			<li>
			<div class="dropdown">
				<a href="../admin/admin.html">관리자</a>
		  		<div class="dropdown_content">
				  	<p><a href="" style="color: black;">의사</a></p>
				  	<p><a href="" style="color: black;">간호사</a></p>
				  	<p><a href="" style="color: black;">진료</a></p>
				  	<p><a href="" style="color: black;">차트</a></p>
		  		</div>
			</div>
		</li>
	<li>
			<div class="tooltip"><a href="#">병원소개</a>
		    <span class="tooltiptext"> 구현되지 않는 작업입니다.</span>
		    </div>
		</li>
	</ul>
	<script>
	$(function() {
		$('#adminGnb').addClass('gnb').addClass('width_full_size').addClass('text_center').css('height: 40px');
		$('#adminGnb li:nth-child(1)').click(function() {
			alert('jquery test');
			location.href="join.html";
		});
		$('#adminGnb li:nth-child(2)').clcik(function() {
			alert('jquery test');
			location.href="login.html";
		});
		$('#adminGnb li:nth-child(3)').click(function() {
			alert('hey');
			location.href="../bbs/bbs_list.html";
		});
	});
	</script>