
<%
session.setAttribute("menu",request.getParameter("menu"));
if(request.getParameter("history")!=null){
session.setAttribute("history",request.getParameter("history"));
}
response.sendRedirect("reader.jsp");
%>