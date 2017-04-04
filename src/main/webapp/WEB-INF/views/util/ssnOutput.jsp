<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>주민번호</title>
</head>
<body>
	<div>
	<%!
	public String getGender(String ssn){
		String gender = "";
		char ch = ssn.charAt(7);
		switch (ch) {
		case '1':
		case '3':
			gender = "남자";
			break;
		case '2':
		case '4':
			gender = "여자";
			break;
		case '5':
		case '6':
			gender = "외국인";
			break;
		default:
			gender = "나올수 없는 결과입니다.";
		}	
		 return gender;
	}
	%>
	<%
	String ssn= request.getParameter("ssn");
	%>
	</div>
	주민번호 <%= ssn %>
	성별은 <%= getGender(ssn)%>

</body>
</html>