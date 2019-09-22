<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>forget password</title>
<style type="text/css">
<%@ include file="forget.css" %>
</style>
   <link type="text/css" rel="stylesheet" href="../../css/index.css">
</head>


<body style="background:url('../../imgs/1.jpg');background-size: cover;">
<jsp:include page="../../include/header.jsp" flush="true" />

<!-- 链接到此jsp的文件需传递security的值 -->
<% String security = (String)request.getAttribute("security");%>
<!-- 链接到处理security的jsp文件 传递参数：验证码"security" -->

<form id="msform" action="" onsubmit="return check()">
	
	<ul id="progressbar">
		<li class="active"><span>1</span>input account<i class="first-i"></i></li>
		<li class="active"><span>2</span>input security code<i></i></li>
		<li><span>3</span>reset password<i></i></li>
		<li><span>4</span>reset success<i></i></li>
	</ul>
	
	<fieldset style="display:block;padding: 20px 20px;border-radius:25px;background:rgb(236, 233, 250,0.9);">
		<h2 class="fs-title">input security code</h2>
		<div class="fs-bag">
			<input style="padding-left:15px;padding-right:0;width:708px;" id="security" name="security" class="fs-input1" type="text">
			<p id="accounttip" class="magcws"></p>
		</div>
		<input class="next action-button" value="next" style="margin-top:50px;" type="submit">
	</fieldset>
</form>
<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
<script type="text/javascript">
function check()
{
	var security = document.getElementById("accountkey");
	if (security.value == "" || security.value == null)	{	
		document.getElementById("accounttip").innerHTML="please input security code";
		return false;
	}
	if (security.value != <%=security %>)	{	
		document.getElementById("accounttip").innerHTML="the security code is wrong";
		return false;
	}
	return true;
}
</script>
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
</script>
</html>