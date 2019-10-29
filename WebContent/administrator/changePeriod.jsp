<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="instance.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>changePeriod</title>
</head>
<body>
		<%
			String newPeriod = new String(request.getParameter("newPeriod").getBytes("UTF-8"),"UTF-8");//新周期
			int Period = Integer.parseInt(newPeriod);
			Admin.setReturnPeriod(Period);
			String script = "<script>location.href='administrator.jsp?tip=1'</script>";
			response.getWriter().println(script);
		%>
</body>
</html>