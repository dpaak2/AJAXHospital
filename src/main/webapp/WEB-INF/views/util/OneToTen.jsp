<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>One to Ten</title>
</head>
<body>
	<% 
	int sum=0;
	for(int i=0;i<=10;i++){
		sum=sum+i;
	}
	%>
	1부터 10까지의 합은 <%=sum %> 입니다.
</body>
</html>