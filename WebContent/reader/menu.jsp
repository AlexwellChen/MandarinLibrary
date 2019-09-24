<%
session.setAttribute("menu",request.getParameter("menu"));
response.sendRedirect("reader.jsp");
%>