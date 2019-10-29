<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="tools.*"%>
<%@ page import="instance.*"%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link type="text/css" rel="stylesheet" href="../css/index.css">
<link type="text/css" rel="stylesheet" href="../lib/layui/css/layui.css">
<title>administrator</title>
</head>
<style>
a {
	text-decoration: none;
}

.list {
	text-align: center;
	margin-left: 2vw;
}

.bm {
	margin-left: 2vw;
}

.by {
	height: 7vh;
	width: 15vw;
}
</style>
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
			href="menu.jsp?menu=account">&nbsp&nbspRegist Account&nbsp&nbsp</a> <a>&nbsp&nbsp|&nbsp&nbsp&nbsp</a>
		<a class="m" id="librarian" href="menu.jsp?menu=librarian">&nbsp&nbsplibrarian&nbsp&nbsp</a>
		<a>&nbsp&nbsp|&nbsp&nbsp&nbsp</a> <a class="m" id="other"
			href="menu.jsp?menu=other">&nbsp&nbspother&nbsp&nbsp</a>

	</div>
	<!-- 背景 -->
	<div class="background"
		style="background: url(../imgs/1.jpg); background-size: cover; top: 20vh; height: 68vh;">


		<%
			if (session.getAttribute("menu").equals("account")) {
		%>


		<div id="window2" class="login"
			style="z-index: 11; background: #FAF79F; top: 4vh; left: 15vw; width: 70vw; height: 60vh; display: block;">

			<form action="registLibrarian.jsp" method="post" onSubmit="return checkRegistLibrarian()">
				<div class="inputArea"
					style="width: 40vw; margin-left: 15vw; margin-top: 10vh">
					<input style="width: 40vw; background: white" type="text"
						name="acntNum" id="acntNum"
						placeholder=" please input your account number , at least 6 letters or numbers" class="inputbar" />

				</div>
				<div class="inputArea"
					style="width: 40vw; margin-left: 15vw; margin-top: 5vh">
					<input style="width: 40vw; background: white" type="password"
						name="Password" id="Password"
						placeholder=" please input your password , at least 6 letters or numbers" class="inputbar" />
				</div>
				<br>
				<br>
				<a style="color: red" class="registTips"></a>
				<br>
				
				<input type="submit" value="submit" class="layui-btn"
					style="margin-top: 4vh">
			</form>
		</div>





		<%
			}
		%>






		<%
			if (session.getAttribute("menu").equals("librarian")) {
		%>


		<div id="window2" class="login"
			style="overflow-y: auto; z-index: 11; background: #FAF79F; top: 4vh; left: 15vw; width: 70vw; height: 60vh; display: block;">
			<br>
			<form class="layui-form" action="searchLibrarian.jsp" method="get">
				<div class="layui-form-item">
					<label class="layui-form-label">librarian</label>
					<div class="layui-input-block">
						<input type="text" style="width: 400px; float: left;" name="name"
							id="name" lay-verify="required"
							placeholder="input librarian name" class="layui-input">
						<button type="submit" class="layui-btn" style="float: left">
							search
							</buttton>
					</div>
				</div>
			</form>


			<div class="list">
				<div class="head1">
					<table cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td class="by"><a style="font-weight: 700">librarian
										name</a></td>
								<td class="by"><a style="font-weight: 700">change
										password</a></td>
								<td class="by"><a style="font-weight: 700">reset</a></td>
								<td class="by"><a style="font-weight: 700">delete</a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="bm">
				<table cellspacing="0" cellpadding="0" id="table1">
					<% 
		String librariantarget = (String)session.getAttribute("librarianName");
					//System.out.println(librariantarget);
	if(session.getAttribute("librarianName") == null||librariantarget.equals("")){
		Connection conn = LibraryAutomation.getInstance().dbInterface();
		String sql = "SELECT * FROM librarian";//sql statement
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		String acntNum = null;
		while(rs.next()){
			acntNum = rs.getString("AcntNum");

	%>
					<tbody id="?">
						<tr>
							<td class="by"><a href=""><%=acntNum %></a></td>
							<td class="by"><a
								href="javascript:changePsd('<%=acntNum %>')"
								style="color: green">change password</a></td>
							<td class="by"><a
								href="resetLibrarian.jsp?name=<%=acntNum %>"
								onClick="{if(confirm('ARE YOU SURE TO RESET THIS Account ?')){return ture;}return false;}"
								style="color: red;">reset</a></td>
							<td class="by"><a
								href="deleteLibrarian.jsp?name=<%=acntNum %>"
								onClick="{if(confirm('ARE YOU SURE TO DELETE THIS Account ?')){return ture;}return false;}"
								style="color: red;">delete</a></td>
						</tr>
					</tbody>
					<%
		}
	}
	else
	{
		Connection conn = LibraryAutomation.getInstance().dbInterface();
		String target = (String)session.getAttribute("librarianName");
		String sql = "SELECT * FROM librarian where AcntNum = '"+target+"'";//sql statement
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		String acntNum = null;
		boolean DBempty = rs.next();
		rs.previous();
		 if(!DBempty){//查询结果为空

			session.setAttribute("librarianName", "-1");
		
			
		}else
			while(rs.next()){
				acntNum = rs.getString("AcntNum");
				%>
					<tbody id="?">
						<tr>
							<td class="by"><a href=""><%=acntNum %></a></td>
							<td class="by"><a
								href="javascript:changePsd('<%=acntNum %>')"
								style="color: green">change password</a></td>
							<td class="by"><a
								href="resetLibrarian.jsp?name=<%=acntNum %>"
								onClick="{if(confirm('ARE YOU SURE TO RESET THIS Account ?')){return ture;}return false;}"
								style="color: red;">reset</a></td>
							<td class="by"><a
								href="deleteLibrarian.jsp?name=<%=acntNum %>"
								onClick="{if(confirm('ARE YOU SURE TO DELETE THIS Account ?')){return ture;}return false;}"
								style="color: red;">delete</a></td>
						</tr>
					</tbody>
					<%
				}
	}
			%>

				</table>
				<br> <br>
			</div>



		</div>



	





	<%
			}
		%>











	<%
			if (session.getAttribute("menu").equals("other")) {
		if (session.getAttribute("other") == null) {
			session.setAttribute("other", "other_fine");
		}
	%>
	<div class="menu login"
		style="position: absolute; z-index: 10; width: 18vw; height: 60vh; left: 1vw; top: 4vh; background: #A9CABC; text-align: center; line-height: 5vh;">
		<a class="m" id="other_fine"
			href="menu.jsp?menu=other&other=other_fine">&nbsp&nbspSet book
			fine value&nbsp&nbsp</a><br> <a class="m" id="other_period"
			href="menu.jsp?menu=other&other=other_period">&nbsp&nbspSet book
			return period&nbsp&nbsp</a> <a class="m" id="other_deposit"
			href="menu.jsp?menu=other&other=other_deposit">&nbsp&nbspSet book
			deposit&nbsp&nbsp</a>

	</div>


	<div id="other_div" class="login"
		style="overflow: auto; z-index: 11; background: rgb(235, 213, 190, 0.9); top: 4vh; left: 24vw; width: 70vw; height: 60vh;">



		<%
if(session.getAttribute("other").equals("other_fine")){
%>
		<a
			style="position: absolute; top: 10vh; left: 28vw; font-size: 3vh; font-weight: bold">fine:<%=LibraryAutomation.getInstance().getBookFineValue()%></a>

		<form action="changeFine.jsp" method="get" name="changeFine">
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
		<a
			style="position: absolute; top: 10vh; left: 27vw; font-size: 3vh; font-weight: bold">period:<%=LibraryAutomation.getInstance().getBookReturnPeriod() %></a>
		<form action="changePeriod.jsp" method="get" name="changePeriod">
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
		<a
			style="position: absolute; top: 10vh; left: 27vw; font-size: 3vh; font-weight: bold">deposit:<%=LibraryAutomation.getInstance().getReaderSecurityDeposit() %></a>
		<form action="changeDeposit.jsp" method="get" name="changeDeposit">
			<div class="inputArea"
				style="width: 40vw; margin-left: 15vw; margin-top: 20vh">
				<input style="width: 40vw; background: white" type="text"
					name="newDeposit" placeholder=" please input new deposit"
					class="inputbar" id="newDeposit" />

			</div>
			<a style="color: red" id="changeDepositTips"></a> <a
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
		<form action="changeAdminPassword.jsp" method="post" name="changePsd">
			
			<div class="inputArea"
				style="width: 40vw; margin-left: 15vw; margin-top: 10vh">
				<input style="width: 40vw; background: white" type="password"
					name="oldPsd" id="oldPsd"
					placeholder=" please input your old password" class="inputbar"/>

			</div>
			<div class="inputArea"
				style="width: 40vw; margin-left: 15vw; margin-top: 5vh">
				<input style="width: 40vw; background: white" type="password"
					name="newPsd" id="newPsd"
					placeholder=" please input your new password" class="inputbar"/>

			</div>
			<div class="inputArea"
				style="width: 40vw; margin-left: 15vw; margin-top: 5vh">
				<input style="width: 40vw; background: white" type="password"
					name="newPsd1" id="newPsd1"
					placeholder=" please confirm your new password" class="inputbar"/>
			</div>
			<br>
			<a style="color: red" class="psdTips"></a> <a
				href="javascript:submitPsd()"
				style="font-size: 2vh; background: rgba(76, 145, 224, 0.877); border-radius: 1.5vh; color: white; width: 6vw; height: 4vh; position: absolute; top: 45vh; left: 25vw; line-height: 4vh; text-decoration: none;">submit</a>
			<a href="javascript:closeW()"
				style="font-size: 2vh; background: rgba(76, 145, 224, 0.877); border-radius: 1.5vh; color: white; width: 6vw; height: 4vh; position: absolute; top: 45vh; left: 35vw; line-height: 4vh; text-decoration: none;">cancel</a>
		</form>
	</div>

</body>
<script src="../lib/jquery/jquery-1.9.1.js"></script>
<script src="../lib/jquery/jquery.min.js"></script>
<script src="../lib/layer/layer.js"></script>
<script src="../lib/layui/layui.js"></script>
<script type="text/javascript">


function changePsd(el){
	
	layer.prompt({title: 'input new password', formType: 1}, function(pass_1, index){
		  layer.close(index);
		  layer.prompt({title: 'confirm password', formType: 1}, function(pass_2, index){
		    layer.close(index);
		    if(pass_1!=pass_2){
		    	layer.msg('please input the SAME password !');
		    	setTimeout("changePsd()","1000");
		    }else{
		    	window.location.href="changeLibrarianPassword.jsp?newpsd="+pass_1+"&name="+el;
		    }
		    
		  });
		});
	
	
}
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


function checknewDeposit(){
	var name=$("#newDeposit").val();
	if(name==null||name==""){
		$("#changeDepositTips").html("please input your new deposit");
		return false;
	}
	return true;
}
function submitChangeDeposit(){
	if(checknewDeposit()){
		 document.changeDeposit.submit();
	}
	 
}

function checkPsd(){
	var oldPsd=$("#oldPsd").val();
	var newPsd=$("#newPsd").val();
	var newPsd1=$("#newPsd1").val();
	if(oldPsd==null||oldPsd==""){
		$(".psdTips").html("please input your old password")
		return false;
	};
	if(newPsd==null||newPsd==""){
		$(".psdTips").html("please input your new password")
		return false;
	};
	if(newPsd1==null||newPsd1==""){
		$(".psdTips").html("please confirm your new password")
		return false;
	};
	if(newPsd!=newPsd1){
		$(".psdTips").html("the password you inputed must be same")
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
	ResetPsdTips();
	document.changePsd.reset();
	 $("#hide").css({"display":"none"});
	 $("#window1").css({"display":"none"});
	 
}
function ResetPsdTips(){
	$(".psdTips").html("");
}
$("#oldPsd").bind("input propertychange",function(event){
	ResetPsdTips();
});
$("#newPsd").bind("input propertychange",function(event){
	ResetPsdTips();
});
$("#newPsd1").bind("input propertychange",function(event){
	ResetPsdTips();
});
function checkRegistLibrarian(){
	//acntNum
	//Password
	if($("#acntNum").val()==""){
		$(".registTips").html("no acntNum");
		return false;
	}
	if($("#Password").val()==""){
		$(".registTips").html("no password");
		return false;
	}
	if(!$("#acntNum").val().match(/^[a-z0-9]{6,}$/i)){
		$(".registTips").html("please input correct acntNum");
		return false;
	}
	if(!$("#Password").val().match(/^[a-z0-9]{6,}$/i)){
		$(".registTips").html("please input correct password");
		return false;
	}
	return true;
}
$("#acntNum").bind("input propertychange",function(event){
	$(".registTips").html("");
});
$("#Password").bind("input propertychange",function(event){
	$(".registTips").html("");
});
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
	<%if (session.getAttribute("result") != null&&session.getAttribute("result").equals("")) {%>
	
		  <%if (session.getAttribute("result").equals("success")) {%>
			setTimeout("tip(\"sucess !\")","500");
			  <%} else {%>
				setTimeout("tip(\"<%=session.getAttribute("result")%>\")","500");
				  <%}
				session.setAttribute("result", "");
			}%>
			
			<% if(session.getAttribute("librarianName")!=null&&session.getAttribute("librarianName").equals("-1")){
				session.setAttribute("librarianName","");
				session.setAttribute("result","???");
			%>
			window.location.reload();
			<%}%>
			
			
			
//获取url中的参数
			function getUrlParam(name) {
			    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
			    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
			    if (r != null) return unescape(r[2]); return null; //返回参数值
			}
			window.onload=function(){
				switch(getUrlParam("tip")){
				case "0":setTimeout("alert('Change Success!')",500);break;
				case "1":setTimeout("alert('set success')",500);break;
				case "2":setTimeout("alert('Delete Success!')",500);break;
				case "3":setTimeout("alert('Regist success!')",500);break;
				case "4":setTimeout("alert('Reset Success!')",500);break;
				case "5":setTimeout("alert('Change Failed!')",500);break;
				case "6":setTimeout("alert('')",500);break;
				}
				var url = window.location.href; 
				var valiable = url.split("?")[0]; 
				window.history.pushState({},0,valiable);
				
			}
		

</script>
</html>