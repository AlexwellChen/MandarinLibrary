<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="instance.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>regist Librarian</title>
</head>
<body>
	<%
		String accountNum = new String(request.getParameter("acntNum").getBytes("UTF-8"),"UTF-8");//注册用户名
		String password = new String(request.getParameter("Password").getBytes("UTF-8"),"UTF-8");//注册密码
		Admin.registerLibrarian(accountNum, password);
		String script = "<script>alert('Regist success!');location.href='administrator.jsp'</script>";
		response.getWriter().println(script);
	%>
</body>
</html>