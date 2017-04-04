<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div style="height: 100px;"></div>
<div id="container"  class="width_full_size" style="height:600px">

<form id="registerForm"  style="width:40%;margin:0 auto;">
<table class="table_default">

	<tr>
		<td class="color_blue margin_center">
		ID   <input type="text" name="id" placeholder="Id"/> 
		<input type="button" name="check out" value="중복 확인" /><br/>
		영문 소문자 하나이상으로  숫자으로 입력해 주세요 <br />
		</td>
	</tr>
	<tr>
		<td> email
  <input type="email" name="email">
  <input type="button" onclick="alert('사용가능한 e-mail 입니다')" value="중복확인">

</td>
	</tr>
	<tr>
		<td class="color_blue">비밀번호 확인<input type="password" name="password" placeholder="비밀번호">
		<p class="color_blue">*8~15자의 영문자,숫자,특수문자를 함께 입력해 주세요.</p>
		</td>
		</tr>
	<tr>
		 <td>이  름 <input type="text" name="name" placeholder="이 름"></td>
	</tr>
	<tr>
	    <td>주민번호 <input type="text" name="oatJumin" placeholder="ex)900101-1000000" /> </td>
	   </tr>
	<tr>
		<td class="color_blue">주 소<input type="text" name="addr" placeholder="주 소 "></td>
	</tr>

	<tr>
		<td class="color_blue">
		생년월일
  <select name="year">
  <option value="생년" >생년</option>
  <option value="1989">1989년</option>
  <option value="1990">1990년</option>
  <option value="1991">1991년</option>
  <option value="1992">1992년</option>
  <option value="1993">1993년</option>
  <option value="1994">1994년</option>
  <option value="1995">1995년</option>
  <option value="1996">1996년</option>
  <option value="1997">1997년</option>
</select>
<select name="month">
  <option value="월">월</option>
  <option value="1월">1월</option>
  <option value="2월">2월</option>
  <option value="3월">3월</option>
  <option value="4월">4월</option>
  <option value="5월">5월</option>
  <option value="6월">6월</option>
  <option value="7월">7월</option>
  <option value="8월">8월</option>
  <option value="9월">9월</option>
  <option value="10월">10월</option>
  <option value="11월">11월</option>
  <option value="12월">12월</option>
</select>
<select name="date">
  <option value="일">일</option>
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3">3</option>
  <option value="4">4</option>
  <option value="5">5</option>
  <option value="6">6</option>
  <option value="7">7</option>
  <option value="8">8</option>
  <option value="9">9</option>
  <option value="10">10</option>
</select> <br />
  담당의사, 간호사 선택
  <select name="doctor">
  <option value="" selected>의사 선택</option>
  <option value="dhong">피부과: 홍길동</option>
  <option value="dahn">내과: 안성기</option>
  <option value="dkim">외과: 김민종</option>
  <option value="dkim2">소아과: 김연아</option>
</select>
  <select name="nurse">
  <option value="" >간호사 선택</option>
  <option value="nkim">김은영</option>
  <option value="nyoon">윤성애</option>
  <option value="nshin">신지원</option>
  <option value="nyou">유정화</option>
</select>
  </td>
	</tr>
	<tr>
		<td class="color_blue" >전화번호<select name="telecom">
			<option value="SKT">SKT</option>
			<option value="LGU+">LGU+</option>
			<option value="KT">KT</option>
		</select>
		<select name="phoneNo1">	
		<option value="SKT">010</option>
				<option value="KT">010</option>
				<option value="LGU">010</option>
		
		</select>
		-
		<input type="text" name="phoneNo2" style="width: 50px;"  />-
		<input type="text" name="phoneNo3" style="width: 50px;" />
		</td>
		
	</tr>
	
	
<tr>
<!-- 
job: 회사원 employee 개발자 developer 스탭 staff  요리사 cook 선생님 teacher 학생 student
나는 직장 다니면서 학생입니다. 
 -->
</tr>
	<tr>
		<td class="color_blue"> 직업(두개이상 선택가능, 단 스탭은 병원 관계자만 체크하세요 )	<br />
	
		<input type="checkbox" name="job" value="employee" />회사원
		<input type="checkbox" name="job" value="developer" />개발자
		<input type="checkbox" name="job" value="staff" />스탭
		<br/> <!-- 줄바꿈 -->
		<input type="checkbox" name="job" value="doctor"/>의사
		<input type="checkbox" name="job" value="nurse"/>간호사
		<input type="checkbox" name="job" value="admin"/>관리자
		<br/>
		 </td>
	</tr>
	<tr>
		<td>성별
		성별 <input type="radio" name="gender" value="m">남
			<input type="radio" name="gender" value="f">여
		</td>
	</tr>
	
</table>
<input type="hidden" name="action" value="register"/>
<input type="hidden" name="page" value="mainPat"/>
<input type="submit" name="register" value="완료" />
</form>
</div>
<jsp:include page="../common/footer.jsp"/>
<script>
$(function() {
	var $registerForm=$('#registerForm');
	var tab=$registerForm.find('table');  /* registerForm 자손중에 table 인것 찾는거쇼 */
	$().click(function() {
		$registerForm.attr('action','${context.path}/patient/join');
		$registerForm.attr('method','post');
		alert('전송직전');
		$registerForm.submit();
		
	});
	
	
});
</script>

