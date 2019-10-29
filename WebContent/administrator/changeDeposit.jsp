<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="instance.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>change deposit</title>
</head>
<body>
	<%
		String newDeposit = new String(request.getParameter("newDeposit").getBytes("UTF-8"),"UTF-8");//新周期
		int Deposit = Integer.parseInt(newDeposit);
		Admin.setSecurityDeposit(Deposit);
		String script = "<script>location.href='administrator.jsp?tip=1'</script>";
		response.getWriter().println(script);
	%>
</body>
</html>