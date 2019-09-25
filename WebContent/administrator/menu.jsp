<%
session.setAttribute("menu",request.getParameter("menu"));
response.sendRedirect("administrator.jsp");
%>