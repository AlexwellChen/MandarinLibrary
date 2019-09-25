<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link type="text/css" rel="stylesheet" href="../css/index.css">
    <title>librarian</title>
</head>

<body>
     <jsp:include page="../include/header.jsp" flush="true" />
     <%
		if (session.getAttribute("menu") == null) {
			session.setAttribute("menu", "book");
		}
	%>
	<div id="menu"
		style="position: absolute; width: 100vw; height: 5vh; top: 15vh; background: #A9CABC; text-align: left; line-height: 5vh;">
		<a>&nbsp&nbsp</a> <a class="m" id="book"
			href="menu.jsp?menu=book">&nbsp&nbspBooks&nbsp&nbsp</a>
		<a>&nbsp&nbsp|&nbsp&nbsp&nbsp</a> 
		<a class="m" id="reader"
			href="menu.jsp?menu=reader">&nbsp&nbspReader&nbsp&nbsp</a> 
			<a>&nbsp&nbsp|&nbsp&nbsp&nbsp</a> 
			<a class="m"
			id="news" href="menu.jsp?menu=news">&nbsp&nbspNews&nbsp&nbsp</a>
			<a>&nbsp&nbsp|&nbsp&nbsp&nbsp</a> 
			<a class="m"
			id="income" href="menu.jsp?menu=income">&nbsp&nbspLibrary income&nbsp&nbsp</a>
	</div>
	<!-- 背景 -->
	<div class="background"
		style="background: url(../imgs/readerBG.jpg); background-size: cover; top: 20vh; height: 68vh;">
   
         <jsp:include page="../include/footer.jsp" flush="true" />
    </div>


 

</body>
<script src="../lib/jquery/jquery-1.9.1.js"></script>
<script type="text/javascript">
 function sel(){
	 document.account.submit();
 }
 $(function(){
	 $('#title').html("&nbsp;&nbsp;&nbsp;&nbsp; MandarinLibrary &nbsp;&nbsp;&nbsp;&nbsp;☞&nbsp;&nbsp;&nbsp;&nbsp;Librarian")
	 $('.header').css({
			"display":"block"
		});
	 $('#librarianButtons').css({
			"display":"block",
			"background":"#E2CEAC",
			"border-radius":"3vh"
		}); 
	 $('.footer').css({
		 "height":"12vh",
		 "margin-bottom":"-12vh"
	 })
	 $("#<%out.print(session.getAttribute("menu"));%>").css({
		 "transition-duration":"0.3s",
  "color":"white",
  "font-size": "2.7vh",
  "background":"#CD6E74"
	 })
	 
 })
</script>
</html>