<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link type="text/css" rel="stylesheet" href="../css/index.css">
<title>administrator</title>
</head>

<body>
	<jsp:include page="../include/header.jsp" flush="true" />
	<%
		if (session.getAttribute("menu") == null) {
			session.setAttribute("menu", "account");
		}
	%>
	<div class="menu"
		style="position: absolute; width: 100vw; height: 5vh; top: 15vh; background: #A9CABC; text-align: left; line-height: 5vh;">
		<a>&nbsp&nbsp</a> <a class="m" id="account"
			href="menu.jsp?menu=account">&nbsp&nbspAccount&nbsp&nbsp</a> <a>&nbsp&nbsp|&nbsp&nbsp&nbsp</a>
		<a class="m" id="librarian" href="menu.jsp?menu=librarian">&nbsp&nbsplibrarian&nbsp&nbsp</a>
		<a>&nbsp&nbsp|&nbsp&nbsp&nbsp</a> <a class="m" id="other"
			href="menu.jsp?menu=other">&nbsp&nbspother&nbsp&nbsp</a>
	</div>
	<!-- 背景 -->
	<div class="background"
		style="background: url(../imgs/1.jpg); background-size: cover ; top: 20vh; height: 68vh;">


<%
			if (session.getAttribute("menu").equals("other")) {
		if (session.getAttribute("other") == null) {
			session.setAttribute("other", "other_fine");
		}
	%>
<div class="menu login" style="position: absolute; z-index: 10; width: 18vw; height: 60vh; left:1vw;top: 4vh; background: #A9CABC; text-align: center; line-height: 5vh;">
<a class="m" id="other_fine"
			href="menu.jsp?menu=other&other=other_fine">&nbsp&nbspSet book fine value&nbsp&nbsp</a><br>
<a class="m" id="other_period"
			href="menu.jsp?menu=other&other=other_period">&nbsp&nbspSet book return period&nbsp&nbsp</a>

<a class="m" id="other_deposit"
			href="menu.jsp?menu=other&other=other_deposit">&nbsp&nbspSet book  deposit&nbsp&nbsp</a>

</div>


    <div id="other_div" class="login" style="overflow:auto;z-index:11;background: rgb(235,213,190, 0.9);top:4vh;left:24vw;width:70vw;height:60vh;">



<%
if(session.getAttribute("other").equals("other_fine")){
%>	
<a style="margin-top:5vh;;font-size:3vh;font-weight:bold">fine:<% %></a>
			
<form action="../test.jsp" method="get" name="changeFine">

			<input type="text" name="poster" value="changeFine"
				style="position: absolute; display: none" />
			<div class="inputArea"
				style="width: 40vw; margin-left: 15vw; margin-top: 20vh">
				<input style="width: 40vw; background: white" type="text"
					name="newFine" placeholder=" please input new book fine value"
					class="inputbar" id="newFine" />

			</div>
			<a style="color: red" id="changeFineTips"></a> <a
				href="javascript:submitChangeFine()"
				style="font-size: 2vh; background: rgba(76, 145, 224, 0.877); border-radius: 1.5vh; color: white; width: 6vw; height: 4vh; position: absolute; top: 35vh; left: 33vw; line-height: 4vh; text-decoration: none;">submit</a>
		</form>
<% 	
};
%>



<% 
if(session.getAttribute("other").equals("other_period")){
%>	
<a style="margin-top:5vh;;font-size:3vh;font-weight:bold">period:<% %></a>
<form action="../test.jsp" method="get" name="changePeriod">

			<input type="text" name="poster" value="changePeriod"
				style="position: absolute; display: none" />
			<div class="inputArea"
				style="width: 40vw; margin-left: 15vw; margin-top: 20vh">
				<input style="width: 40vw; background: white" type="text"
					name="newPeriod" placeholder=" please input new book return period"
					class="inputbar" id="newPeriod" />

			</div>
			<a style="color: red" id="changePeriodTips"></a> <a
				href="javascript:submitChangePeriod()"
				style="font-size: 2vh; background: rgba(76, 145, 224, 0.877); border-radius: 1.5vh; color: white; width: 6vw; height: 4vh; position: absolute; top: 35vh; left: 33vw; line-height: 4vh; text-decoration: none;">submit</a>
		</form>

<% 	
};
%>


<% 
if(session.getAttribute("other").equals("other_deposit")){
%>	
<a style="margin-top:5vh;;font-size:3vh;font-weight:bold">deposit:<% %></a>
<form action="../test.jsp" method="get" name="changePeriod">

			<input type="text" name="poster" value="changePeriod"
				style="position: absolute; display: none" />
			<div class="inputArea"
				style="width: 40vw; margin-left: 15vw; margin-top: 20vh">
				<input style="width: 40vw; background: white" type="text"
					name="newDeposit" placeholder=" please input new deposit"
					class="inputbar" id="newPeriod" />

			</div>
			<a style="color: red" id="changePeriodTips"></a> <a
				href="javascript:submitChangeDeposit()"
				style="font-size: 2vh; background: rgba(76, 145, 224, 0.877); border-radius: 1.5vh; color: white; width: 6vw; height: 4vh; position: absolute; top: 35vh; left: 33vw; line-height: 4vh; text-decoration: none;">submit</a>
		</form>

<% 	
};
%>




</div>
		<%
			} ;
		%>























		<jsp:include page="../include/footer.jsp" flush="true" />
	</div>




<!--掩盖-->
	<div class="hide" id="hide"></div>
<div id="window1" class="login"
		style="z-index: 11; background: #FAF79F; top: 14vh; left: 15vw; width: 70vw; height: 60vh; display: none;">
		<form action="../test.jsp" method="post" name="changePsd">
				<input type="text" name="poster" value="AdminchangePsd"
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
				href="javascript:submitPsd()"
				style="font-size: 2vh; background: rgba(76, 145, 224, 0.877); border-radius: 1.5vh; color: white; width: 6vw; height: 4vh; position: absolute; top: 45vh; left: 25vw; line-height: 4vh; text-decoration: none;">submit</a>
			<a href="javascript:closeW()"
				style="font-size: 2vh; background: rgba(76, 145, 224, 0.877); border-radius: 1.5vh; color: white; width: 6vw; height: 4vh; position: absolute; top: 45vh; left: 35vw; line-height: 4vh; text-decoration: none;">cancel</a>
		</form>
	</div>

</body>
<script src="../lib/jquery/jquery-1.9.1.js"></script>
<script type="text/javascript">
function checknewFine(){
	var name=$("#newFine").val();
	if(name==null||name==""){
		$("#changeFineTips").html("please input your new book fine value");
		return false;
	}
	return true;
}
function submitChangeFine(){
	if(checknewFine()){
		 document.changeFine.submit();
	}
	 
}
function checknewPeriod(){
	var name=$("#newPeriod").val();
	if(name==null||name==""){
		$("#changePeriodTips").html("please input your new book return period");
		return false;
	}
	return true;
}
function submitChangePeriod(){
	if(checknewPeriod()){
		 document.changePeriod.submit();
	}
	 
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
function submitPsd(){
	if(checkPsd()){ document.changePsd.submit();}
}
function changPsdW(){
	 $("#hide").css({"display":"block"});
	 $("#window1").css({"display":"block"});
}
function closeW(){
	 $("#hide").css({"display":"none"});
	 $("#window1").css({"display":"none"});
}
 $(function(){
	 $('#title').html("&nbsp;&nbsp;&nbsp;&nbsp; MandarinLibrary &nbsp;&nbsp;&nbsp;&nbsp;☞&nbsp;&nbsp;&nbsp;&nbsp;administrator")
	 $('.header').css({
			"display":"block"
		});
	 $('#administratorButtons').css({
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
	 <%
	 if(session.getAttribute("other")!=null){
	%>
	 $("#<%out.print(session.getAttribute("other"));%>").css({
		 "transition-duration":"0.3s",
     "color":"white",
     "font-size": "2.7vh",
     "background":"#CD6E74"
	 })

		 
		 
	<% 
	 }
	 %> 
 })
 /* 提示词 */
function tip(e){
	alert(e);
}
	<%if (session.getAttribute("result") != null) {%>
		openW1();
		  <%if (session.getAttribute("result") == "success") {%>
			setTimeout("tip(\"sucess !\")","500");
			  <%} else {%>
				setTimeout("tip(\"fail !\")","500");
				  <%}
				session.setAttribute("result", null);
			}%>

</script>
</html>