<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
</head>
<body>
	<div>
	<%!
	public String getName(String name){
		
		return name;
	}
	%>
	<% String name=request.getParameter("name");
	%>
	Hello <%= getName(name) %>
	
	</div>
</body>
</html>