<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>BMI test</title>
</head>
<body>
<%
double kg= Double.parseDouble(request.getParameter("kg"));
double cm= Double.parseDouble(request.getParameter("cm")); 
String result = "";
 double bmi = kg / (cm/ 100 * cm/ 100);
if (bmi > 30.0) {
	result = "고도비만";
} else if (bmi > 25.0) {
	result = "비만";
} else if (bmi > 23.0) {
	result = "과체중";
} else if (bmi > 18.5) {
	result = "정상";
} else {
	result = "저체중";
}
%>
BMI 결과는 <%= result %>	
</body>
</html>