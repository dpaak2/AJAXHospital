<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<%!
	public int add(int a, int b){
	int c= a+b;
	return c;
}
	public int subtract(int a,int b){
		int c= a-b;
		return c;
	}
%>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
</head>
<body>
<%
	int value1=3;
	int value2=9;
	
	int addResult =add(value1,value2);
	int substractResult=subtract(value1,value2);
	%>
	<%= value1 %> + <%=value2 %> =<%= addResult %>
	<br>
	<%= value1 %>-<%=value2 %> =<%=substractResult %>
</body>
</html>