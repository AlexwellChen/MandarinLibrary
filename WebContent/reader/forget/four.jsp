<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>forget password</title>
   <link type="text/css" rel="stylesheet" href="../../css/index.css">
<style type="text/css">
<%@ include file="forget.css" %>
</style>
</head>
<body style="background:url('../../imgs/1.jpg');background-size: cover;">
<jsp:include page="../../include/header.jsp" flush="true" />
<div id="msform">
	
	<ul id="progressbar">
		<li class="active"><span>1</span>input account<i class="first-i"></i></li>
		<li class="active"><span>2</span>input security code<i></i></li>
		<li class="active"><span>3</span>reset password<i></i></li>
		<li class="active"><span>4</span>reset success<i></i></li>
	</ul>
	
	<fieldset style="display:block;padding: 20px 20px;border-radius:25px;background:rgb(236, 233, 250,0.9);">
		<h2 class="fs-title">reset successfully !</h2>
		<br>
		<div onclick="back()" class="next action-button" style="margin-top:10px;margin-left:310px;">
		<a style="color:white;text-decoration:none;">return</a>
		</div>
		
	</fieldset>

</div>
<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
<script src="../../lib/jquery/jquery-1.9.1.js"></script>
<script type="text/javascript">
 function sel(){
	 document.account.submit();
 }
 $(function(){
	$('.header').css({
		"text-align":"center",
		"display":"block"
	});
 })
 function back(){
	 window.location.href="../../index.jsp";
 }
</script>
</html>