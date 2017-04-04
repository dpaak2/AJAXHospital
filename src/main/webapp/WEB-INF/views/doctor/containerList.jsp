<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>templet</title>
<link rel="stylesheet" type="text/css" href="../../css/hanbit.css" />
<style type="text/css">
[title~= chief]{border: 5px solid yellow;}

</style>
</head>

<body >
<div id="wrapper" class="width_full_size">
<div id="header"  class="width_full_size" style="height:50px">
<div class="logo_box width_full_size text_center" style="height:80%" >
<a href="../../index.html"><img src="../../images/common/index_logo.png" alt="" /></a>

</div>
<div  class="width_full_size" >
	<ul class="gnb width_full_size text_center bg_color_darkgray" style="height: 40px">
		<li><a href="../common/join.html">회원가입</a></li>
		<li><a href="../common/login.html">로그인</a><li>
		<li><a href="../bbs/bbs_list.html">게시판</a><li>
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
		<li>
	</ul>
</div>
</div>
<div style="height: 100px;"></div>
<div id="container"  class="width_full_size" style="height:600px">
<!-- content begin -->
<div class="gallery" >
  <a target="_blank" href="../staff/staff_detail" title="chief">
    <img src="../../images/staff/doctor_1.jpg" alt="Trolltunga Norway" width="600" height="400">
  </a>
  <div class="desc">Add a description of the image here</div>
</div>

<div class="gallery">
  <a target="_blank" href="../../images/staff/doctor_2.jpg">
    <img src="../../images/staff/doctor_2.jpg" alt="Forest" width="600" height="400">
  </a>
  <div class="desc">Add a description of the image here</div>
</div>

<div class="gallery">
  <a target="_blank" href="../../images/staff/doctor_3.jpg">
    <img src="../../images/staff/doctor_3.jpg" alt="Northern Lights" width="600" height="400">
  </a>
  <div class="desc">Add a description of the image here</div>
</div>

<div class="gallery">
  <a target="_blank" href="../../images/staff/doctor_4.jpg">
    <img src="../../images/staff/doctor_4.jpg" alt="Mountains" width="600" height="400">
  </a>
  <div class="desc">Add a description of the image here</div>
</div>

<div class="gallery">
  <a target="_blank" href="../../images/staff/doctor_2.jpg">
    <img src="../../images/staff/doctor_2.jpg" alt="Forest" width="600" height="400">
  </a>
  <div class="desc">Add a description of the image here</div>
</div>
<!-- content end -->
</div>
		<div id="footer" class="width_full_size" style="height: 80px; border-top:2px solid #5a5a5a;">
		<dl class="notice">
		<dt><a href="/NOTICE" class="h_notice">공지사항</a></dt>
		
		<dd><a href="http://www.naver.com/NOTICE/read/1100001014/10000000000030649309" onclick="clickcr(this, 'ntc.notice','78011B01_0000000EA10F', '', event)" >네이버 단체 회원 서비스 및 ‘단체회원 이용약관’ 변경에 대한 안내</a></dd>
		</dl>
		
		<dl class="policy">
			<dt >네이버 정책 및 약관</dt> <!-- class="blind" -->
			<dd class="f"><a href="http://www.navercorp.com/" target="_blank" id="plc.intronhn">회사소개</a></dd>
			<dd><a href="http://mktg.naver.com/" id="plc.adinfo">광고</a></dd>
			<dd><a href="https://submit.naver.com/" id="plc.search">마이비즈니스</a></dd>
			<dd><a href="https://www.navercorp.com/ko/company/proposalGuide.nhn" target="_blank" id="plc.contact">제휴제안</a></dd>
			<dd><a href="rules/service.html" id="plc.service">이용약관</a></dd>
			<dd><a href="rules/privacy.html" id="plc.privacy"><strong>개인정보처리방침</strong></a></dd>
			<dd><a href="rules/youthpolicy.html" id="plc.youth">청소년보호정책</a></dd>
			<dd><a href="rules/spamcheck.html" id="plc.policy">네이버 정책</a></dd>
			<dd><a href="https://help.naver.com/" id="plc.helpcenter">네이버 고객센터</a></dd>
		</dl>
		<address>&copy; <strong><a href="http://www.navercorp.com/" target="_blank">NAVER Corp.</a></strong></address>
		</div>
		</div>
</body>
</html>