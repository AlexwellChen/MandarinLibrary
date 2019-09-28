<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link type="text/css" rel="stylesheet" href="../css/index.css">
<title>reader</title>
<style>
/* #menu a {
	font-size: 2.5vh;
	text-decoration: none;
	font-family: "Verdana";
	transition-duration: 0.3s;
	color: black;
	border-radius: 2.5vh;
}

#menu a.m {
	background: #E3E5D8;
}

#menu a.m:hover {
	transition-duration: 0.3s;
	color: #CD6E74;
	font-size: 2.7vh;
	background: white;
} */

.list {
	background: #E2CEAC;
	border-radius: 3.5vh;
	width: 50vw;
	height: 7vh;
	position: relative;
	float: bottom;
	margin-left: 10vw;
	margin-top: 2vh;
	text-align: left;
	line-height: 7vh;
	border: 0.1vh grey solid;
	font-size: 3vh;
	font-weight: bold;
	text-indent: 2vw;
}

.list a {
	font-size: 2.5vh;
	font-weight: 400;
	margin-left: 12vw;
}

.list a.button {
	color: rgb(30, 141, 206);
	position: absolute;
	right: 3vw;
	text-decoration: none;
}

.list a.button:hover {
	text-decoration: underline;
	color: red;
}
</style>
</head>

<body>
	<jsp:include page="../include/header.jsp" flush="true" />
	<%
    if(session.getAttribute("menu1")==null){
    	 session.setAttribute("menu1","information");
    }
    %>
	<div class="menu"
		style="position: absolute; width: 100vw; height: 5vh; top: 15vh; background: #A9CABC; text-align: left; line-height: 5vh;">
		<a>&nbsp&nbsp</a> <a class="m" href="reader.jsp">&nbsp&nbspback&nbsp&nbsp</a>
		<a>&nbsp&nbsp|&nbsp&nbsp&nbsp</a> <a class="m" id="information"
			href="menu1.jsp?menu1=information">&nbsp&nbspinformation&nbsp&nbsp</a>
		<a>&nbsp&nbsp|&nbsp&nbsp&nbsp</a> <a class="m" id="changePsd"
			href="menu1.jsp?menu1=changePsd">&nbsp&nbspchange
			Password&nbsp&nbsp</a>


	</div>
	<!-- 背景 -->
	<div class="background"
		style="background: url(../imgs/readerBG.jpg); background-size: cover; top: 20vh; height: 68vh;">
		<%
    if(session.getAttribute("menu1").equals("information")){%>
		<div class="login"
			style="top: 4vh; left: 15vw; width: 70vw; height: 60vh">
			<div class="list" style="margin-top: 10vh">
				user name: <a>
					<%
      /*  填上用户名 */
       %>
				</a> <a class="button" href="javascript:openW1()">change</a>
			</div>
			<div class="list">
				role:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <a
					style="color: grey">reader</a>
			</div>
			<div class="list">
				email:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <a>
					<% 
     /*   填上emali */
       %>
				</a> <a class="button" href="javascript:openW2()">change</a>
			</div>
		</div>


		<% }
    %>



		<%
     if(session.getAttribute("menu1").equals("changePsd")){
     %>



		<div class="login"
			style="z-index: 11; background: #FAF79F; top: 4vh; left: 15vw; width: 70vw; height: 60vh;">
			<form action="../test.jsp" method="post" name="changePsd">
				<input type="text" name="poster" value="changePsd"
					style="position: absolute; display: none" />
				<div class="inputArea"
					style="width: 40vw; margin-left: 15vw; margin-top: 10vh">
					<input style="width: 40vw; background: white" type="password"
						name="oldPsd" id="oldPsd"
						placeholder=" please input your old password" class="inputbar" />

				</div>
				<div class="inputArea"
					style="width: 40vw; margin-left: 15vw; margin-top: 5vh">
					<input style="width: 40vw; background: white" type="password"
						name="newPsd" id="newPsd"
						placeholder=" please input your new password" class="inputbar" />

				</div>
				<div class="inputArea"
					style="width: 40vw; margin-left: 15vw; margin-top: 5vh">
					<input style="width: 40vw; background: white" type="password"
						name="newPsd1" id="newPsd1"
						placeholder=" please confirm your new password" class="inputbar" />
				</div>
				<a style="color: red" id="psdTips"></a> <a
					href="javascript:submitChangePsd()"
					style="font-size: 2vh; background: rgba(76, 145, 224, 0.877); border-radius: 1.5vh; color: white; width: 6vw; height: 4vh; position: absolute; top: 45vh; left: 32vw; line-height: 4vh; text-decoration: none;">submit</a>
			</form>
		</div>
		<%  }
     %>










		<jsp:include page="../include/footer.jsp" flush="true" />
	</div>

	<!--掩盖-->
	<div class="hide" id="hide"></div>
	<!-- 弹窗1 输入新用户名 ，form链接到修改用户名的jsp 传递参数：newUsername -->
	<div id="window1" class="login"
		style="z-index: 11; background: #FAF79F; top: 24vh; left: 15vw; width: 70vw; height: 60vh; display: none;">
		<form action="../test.jsp" method="get" name="changeUserName">

			<input type="text" name="poster" value="changeUserName"
				style="position: absolute; display: none" />
			<div class="inputArea"
				style="width: 40vw; margin-left: 15vw; margin-top: 20vh">
				<input style="width: 40vw; background: white" type="text"
					name="newUsername" placeholder=" please input your new username"
					class="inputbar" id="newUsername" />

			</div>
			<a style="color: red" id="nameTips"></a> <a
				href="javascript:submitUserName()"
				style="font-size: 2vh; background: rgba(76, 145, 224, 0.877); border-radius: 1.5vh; color: white; width: 6vw; height: 4vh; position: absolute; top: 35vh; left: 25vw; line-height: 4vh; text-decoration: none;">submit</a>
			<a href="javascript:cancel()"
				style="font-size: 2vh; background: rgba(76, 145, 224, 0.877); border-radius: 1.5vh; color: white; width: 6vw; height: 4vh; position: absolute; top: 35vh; left: 35vw; line-height: 4vh; text-decoration: none;">cancel</a>
		</form>
	</div>


	<!-- 弹窗2 输入新邮箱 ，form链接到修改用户邮箱的jsp 传递参数：newEmail-->
	<div id="window2" class="login"
		style="z-index: 11; background: #FAF79F; top: 24vh; left: 15vw; width: 70vw; height: 60vh; display: none;">
		<form action="../test.jsp" method="get" name="changeUserEmail">

			<input type="text" name="poster" value="changeUserEmail"
				style="position: absolute; display: none" />
			<div class="inputArea"
				style="width: 40vw; margin-left: 15vw; margin-top: 20vh">
				<input id="newEmail" style="width: 40vw; background: white"
					type="text" name="newEmail"
					placeholder=" please input your new email" class="inputbar" />

			</div>
			<a style="color: red" id="emailTips"></a> <a
				href="javascript:submitEmail()"
				style="font-size: 2vh; background: rgba(76, 145, 224, 0.877); border-radius: 1.5vh; color: white; width: 6vw; height: 4vh; position: absolute; top: 35vh; left: 25vw; line-height: 4vh; text-decoration: none;">submit</a>
			<a href="javascript:cancel()"
				style="font-size: 2vh; background: rgba(76, 145, 224, 0.877); border-radius: 1.5vh; color: white; width: 6vw; height: 4vh; position: absolute; top: 35vh; left: 35vw; line-height: 4vh; text-decoration: none;">cancel</a>
		</form>
	</div>


</body>
<script src="../lib/jquery/jquery-1.9.1.js"></script>
<script type="text/javascript">
 $(function(){
	 
	 $('#title').html("&nbsp;&nbsp;&nbsp;&nbsp; MandarinLibrary &nbsp;&nbsp;&nbsp;&nbsp;☞&nbsp;&nbsp;&nbsp;&nbsp;Reader")
	 $('.header').css({
			"display":"block",
			"background":"#E3E5D8"
		});
	 $('#readerButtons').css({
			"display":"block",
			"background":"#E2CEAC",
			"border-radius":"3vh"
		});
	 $('.footer').css({
		 "height":"12vh",
		 "margin-bottom":"-12vh"
	 })
	 $("#<%out.print(session.getAttribute("menu1"));%>").css({
		 "transition-duration":"0.3s",
     "color":"white",
     "font-size": "2.7vh",
     "background":"#CD6E74"
	 })
	 $("#Information").css({
		 "color":"red",
		 "pointer-events":"none",
	  "font-weight":"bolder",
	   "font-size": "2.5vh"
	 })
 })
function openW1(){
	 $("#hide").css({"display":"block"});
	 $("#window1").css({"display":"block"});
 }
 function openW2(){
	 $("#hide").css({"display":"block"});
	 $("#window2").css({"display":"block"});
 }
function closeW(){
	 $("#hide").css({"display":"none"});
	 $("#window1").css({"display":"none"});
	 $("#window2").css({"display":"none"});
}
function submitUserName(){
	if(checkName()){
		 closeW();
		 document.changeUserName.submit();
	}
	
	 
}
function submitEmail(){
	if(checkEmail()){

		 closeW();
		 document.changeUserEmail.submit();
		
	}
	 
}
function submitChangePsd(){
	if(checkPsd()){ document.changePsd.submit();}
	
}
function cancel(){
	 closeW();
}
function checkName(){
	var name=$("#newUsername").val();
	if(name==null||name==""){
		$("#nameTips").html("please input your new name");
		return false;
	}
	return true;
}
function checkEmail(){
	var e=$("#newEmail").val();
	if(e==null||e==""){
		$("#emailTips").html("please input your new email");
		return false;
	}
	return true;
}
function checkPsd(){
	var oldPsd=$("#oldPsd").val();
	var newPsd=$("#newPsd").val();
	var newPsd1=$("#newPsd1").val();
	if(oldPsd==null||oldPsd==""){
		$("#psdTips").html("please input your old password")
		return false;
	};
	if(newPsd==null||newPsd==""){
		$("#psdTips").html("please input your new password")
		return false;
	};
	if(newPsd1==null||newPsd1==""){
		$("#psdTips").html("please confirm your new password")
		return false;
	};
	if(newPsd!=newPsd1){
		$("#psdTips").html("the password you inputed must be same")
		return false;
	}; 
 return true; 
}


/* 提示词 */
function tip(e){
	alert(e);
}
	<%if (session.getAttribute("result") != null) {%>
		openW1();
		  <%if (session.getAttribute("result") == "sucess") {%>
			setTimeout("tip(\"sucess !\")","500");
			  <%} else {%>
				setTimeout("tip(\"fail !\")","500");
				  <%}
				session.setAttribute("result", null);
			}%>

</script>
</html>