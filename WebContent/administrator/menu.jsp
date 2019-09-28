
<%
session.setAttribute("menu",request.getParameter("menu"));
if(request.getParameter("other")!=null){
session.setAttribute("other",request.getParameter("other"));
}
response.sendRedirect("administrator.jsp");
%>