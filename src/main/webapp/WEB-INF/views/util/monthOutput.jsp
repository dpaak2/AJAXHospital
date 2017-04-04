<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Show Month</title>
</head>
<body>
	<div>
		Year=<%= request.getParameter("year")%>
		Month=<%= request.getParameter("month")%>
	</div>


	<%
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		String result ="" ;
		int date = 0;
		switch (month) {
		case 1: case 3: case 5:	case 7:	case 8:	case 10: case 12: 
			date = 31;
			break;
		case 4:	case 6:	case 9:	case 11:
			date = 30;
			break;
		case 2:
			if (year % 4 == 0 && year % 100 != 0) {
				date = 29;
			} else if (year % 4 == 0 && year % 100 == 0 && year % 400 == 0) {
				date = 29;
			} else {
				date = 28;
			}
			break;
		default:
			result="Wrong month";
		}
	%>
	<%=year%>-<%=month%>-<%= date %>

</body>
</html>