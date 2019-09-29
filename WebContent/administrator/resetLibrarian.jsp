<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="instance.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>reset librarian password</title>
</head>
<body>
	<%
		String acntNum = new String(request.getParameter("name").getBytes("UTF-8"),"UTF-8");//得到账户
		Admin.recoveryLibrarian(acntNum);
		String script = "<script>alert('Reset Success!');location.href='administrator.jsp'</script>";
		response.getWriter().println(script);
	
	%>
</body>
</html>