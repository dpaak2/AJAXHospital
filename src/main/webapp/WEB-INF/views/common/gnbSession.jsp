<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<ul class="gnb width_full_size text_center bg_color_darkgray" style="height: 40px">
	<li><a href="${context}/home.do?action=logout&page=mainCommon">홈으로</a></li>
	<li><a href="${context}/patient.do?action=mypage&page=detail">마이페이지</a><li>
	<li><a href="${context}/patient.do?action=move&page=treatment_list">진료기록</a><li>
	<li><a href="${context}/board.do?action=move&page=articleList">게시판</a><li>
	<li><a href="${context}/home.do?action=logout&page=mainCommon">로그아웃</a></li>
		<li>
			<div class="tooltip"><a href="#">병원소개</a>
		    <span class="tooltiptext"> 구현되지 않는 작업입니다.</span>
		    </div>
		<li>
	</ul>
		