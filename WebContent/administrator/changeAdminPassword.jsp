<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="instance.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>change Admin password</title>
</head>
<body>
	<%
		String oldPwd = new String(request.getParameter("oldPsd").getBytes("UTF-8"),"UTF-8");//老密码
		String newPwd = new String(request.getParameter("newPsd").getBytes("UTF-8"),"UTF-8");//新密码
		String currentAcntNum = (String)session.getAttribute("acntNum");
		if(Admin.login(currentAcntNum, oldPwd))
		{
			Admin.changeAdminPwd(currentAcntNum, newPwd);
			String script = "<script>alert('Change Success!');location.href='../administratorLoginPage.jsp'</script>";
			session.invalidate();
			response.getWriter().println(script);
		}
		else
		{
			String script = "<script>alert('Change Failed!');location.href='administrator.jsp'</script>";
			response.getWriter().println(script);
		}
	
	%>
</body>
</html>