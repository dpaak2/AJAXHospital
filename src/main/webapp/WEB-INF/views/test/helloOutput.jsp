<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
</head>
<body>
	<div>
	<% String name=request.getParameter("name");
	%>
	Hello <%= name %>
	</div>
</body>
</html>