<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="instance.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>admin login</title>
</head>
<body>
	<% //测试通过
		String acntName = new String(request.getParameter("username").getBytes("ISO-8859-1"),"UTF-8");//用户名
		String pwd = new String(request.getParameter("psd").getBytes("ISO-8859-1"),"UTF-8");//密码
		Boolean login = Admin.login(acntName,pwd);
		if(login)
		{
			session.setAttribute("acntNum", acntName);
			response.sendRedirect("administrator/administrator.jsp");
		}
		else
		{
			String script = "<script>location.href='administratorLoginPage.jsp?tip=1';</script>";
			response.getWriter().println(script);
		}
	 %>
</body>
</html>