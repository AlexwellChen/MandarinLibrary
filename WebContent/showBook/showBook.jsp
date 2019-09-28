<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link type="text/css" rel="stylesheet" href="../css/index.css">
<title>book</title>
<style>
.librarianOptions{
 display:none;
 float:right;

}
#showBook span {
	font-size: 2.5vh;
	font-weight: 500;
	margin-left: 0.5vw;
	color: grey;
}

#showBook a {
	font-size: 2.5vh;
	margin-left: 0.5vw;
	word-wrap: break-word;
	width: 20vw;
}

#window1::-webkit-scrollbar {
	 /*  display:none;  */
}



#window1::-webkit-scrollbar {
 /*滚动条整体样式*/
 width : 10px;  /*高宽分别对应横竖滚动条的尺寸*/
 height: 1px;
 }
#window1::-webkit-scrollbar-thumb {
 /*滚动条里面小方块*/
 border-radius   : 10px;
 background-color: grey;
 background-image: -webkit-linear-gradient(
      45deg,
     rgba(255, 255, 255, 0.2) 25%,
     transparent 25%,
     transparent 50%,
     rgba(255, 255, 255, 0.2) 50%,
     rgba(255, 255, 255, 0.2) 75%,
     transparent 75%,
     transparent 
 );
 }
#window1::-webkit-scrollbar-track {
 /*滚动条里面轨道*/
 box-shadow   : inset 0 0 5px rgb(0,0,0, 0.2);
 background   : rgb(250,247,161);
 border-radius: 10px;
 }



a {
	text-decoration: none;
}

.list {
	text-align: center;
	margin-left: 2vw;
}

.by {
	height: 7vh;
	width: 15vw;
}

.close {
	display: block;
	position: absolute;
	text-align: center;
	left: 48vw;
	top: 81vh;
	width: 4vw;
	height: 6vh;
	z-index: 13;
}

.img09 {
	cursor: pointer;
	transition: all 0.3s;
	width: 6vh;
	overflow: hidden;
	background: rgb(0, 0, 0, 0.5);
	border-radius: 6vh;
}

.img09:hover {
	background: red;
	transform: scale(1.3);
	position: relative;
	filter: drop-shadow(0px 0 red);
}
</style>
</head>

<body>

	<%
		
	%>
	<jsp:include page="../include/header.jsp" flush="true" />
	<div class="menu"
		style="position: fixed; z-index: 10; width: 100vw; height: 5vh; top: 15vh; background: #A9CABC; text-align: left; line-height: 5vh;">
		<a>&nbsp&nbsp</a> <a class="m" href="#"
			onclick="javascript:history.back(-1);">&nbsp&nbspBack &nbsp&nbsp</a>

	</div>



	<!-- 背景 -->
	<div class="background"
		style="position: fixed; background: url(../imgs/book.jpg); background-size: 100vw 68vh; top: 20vh; height: 68vh;">
	</div>
	<div class="background" id="board"
		style="background: none; top: 20vh; height: 68vh;">





		<div id="showBook" class="login"
			style="overflow-y: auto; overflow-x: hidden; border-radius: 0vh; text-align: left; z-index: 10; background: rgb(255, 255, 200, 0.8); top: 0vh; left: 0vw; width: 100vw; height: 68vh;">
			<span>name :</span> <a style="font-size: 3vh; font-weight: bold;">《<%=request.getParameter("bookName")%>》
			</a><a class="librarianOptions" style="color:red;"href="javascript:changeValue('Name')">change name</a>
			<br> 
			<span>author :</span> <a> <%
					out.print("test");
				%>
			</a> 
			<a class="librarianOptions" style="color:red;"href="javascript:changeValue('Author')">change author</a>
			<br> <span>category :</span> <a> <%
					out.print("test");
				%>
			</a>
			<a class="librarianOptions" style="color:red;"href="javascript:changeValue('Category')">change category</a>
			 <br> <span>press :</span> <a> <%
					out.print("test");
				%>
			</a> 
			<a class="librarianOptions" style="color:red;"href="javascript:changeValue('Press')">change press</a>
			<br>
			 <span>ISBN :</span> <a> <%
					out.print("test");
				%>
			</a> 
			<a class="librarianOptions" style="color:red;"href="javascript:changeValue('ISBN')">change ISBN</a>
			<br>  <span>price :</span> <a> <%
					out.print("test");
				%>
			</a><a style="color: grey">yuan</a> 
			<a class="librarianOptions" style="color:red;"href="javascript:changeValue('Price')">change price</a>
			
			<br> <span>introduction :</span><a class="librarianOptions" style="color:red;"href="javascript:changeValue('Introduction')">change introduction</a><br>
			<a> <%
					for (int i = 0; i < 1000; i++) {
						out.print("test ");
					} ;
				%>
			</a> <br> <br> <br> <span style="margin-left: 48vw;">Library</span>
			<br> <a> </a>

        
            
			<div id="reserveButton"
				style="display:none;position: absolute; left: 80vw; top: 2vh; border-radius: 3vh; background: rgb(255, 255, 255, 0.5); height: 3vh; width: 6vw; text-align: center; line-height: 3vh;">
				<a class="logina" href="javascript:openW1()" style="margin: 0;">reserve</a>
			</div>
              
             



		</div>
		<jsp:include page="../include/footer.jsp" flush="true" />
	</div>



	<!--掩盖-->
	<div class="hide" id="hide" style=""></div>
	<div id="window1" class="login"
		style="border-radius: 1vh; overflow-y: auto; z-index: 11; background: #FAF79F; top: 16vh; left: 15vw; width: 70vw; height: 60vh; display: none;">

		<div class="list">
			<div class="head1">
				<table cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td class="by"><a style="font-weight: 700">BookId</a></td>
							<td class="by"><a style="font-weight: 700">Position</a></td>
							<td class="by"><a style="font-weight: 700">Status</a></td>
							<td class="by"><a style="font-weight: 700">Option</a></td>
						</tr>
					</tbody>
				</table>
			</div>
			</div>
			<div class="bm">
				<table cellspacing="0" cellpadding="0" id="table1">

					<tbody id="?">
						<tr>
							<td class="by"><a href="">1</a></td>
							<td class="by"><a href="">floor 1</a></td>
							<td class="by"><a href="" style="color: green">available</a></td>
							<td class="by"><a href="test.jsp?bookid=..."
								onClick="{if(confirm('ARE YOU SURE TO RESERVE THIS BOOK ?')){return ture;}return false;}"
								style="color: blue;">reserve</a></td>
						</tr>
					</tbody>

					<tbody id="?">
						<tr>
							<td class="by"><a href="">1</a></td>
							<td class="by"><a href="">floor 1</a></td>
							<td class="by"><a href="" style="color: red">occupancy</a></td>
							<td class="by"><a style="color: grey;">reserve</a></td>
						</tr>
					</tbody>
				</table>
				<br> <br>
			</div>
		</div>


	</div>
	<div class="close" id="closeButton" style="display: none;">
		<a href="javascript: closeW()"> <img class="img09"
			src="../imgs/close.png" alt="">
		</a>
	</div>



</body>
<script src="../lib/jquery/jquery-1.9.1.js"></script>
<script src="../lib/jquery/jquery.min.js"></script>
<script src="../lib/layer/layer.js"></script>
<script type="text/javascript">
function changeValue(el){
	if(el!='Introduction'){
		var e=layer.prompt({title: 'input new book '+el, formType: 3}, function(text, index){
			 layer.close(index); 
			 window.location.href="../test.jsp?new"+el+"="+text;
					
			  })	
		
	}else{
		var e=layer.prompt({title: 'input new book '+el, formType: 2}, function(text, index){
			 layer.close(index); 
			 window.location.href="../test.jsp?new"+el+"="+text;
					
			  })
	}
	
	
	
	
}
 $(function(){
	 
	 $('#title').html("&nbsp;&nbsp;&nbsp;&nbsp; MandarinLibrary &nbsp;&nbsp;&nbsp;&nbsp;☞&nbsp;&nbsp;&nbsp;&nbsp;Book Information")
	 $('.header').css({
			"display":"block",
			"background":"#E3E5D8",
			"position":"fixed"
		});
	 $('.footer').css({
		 "background":"#E3E5D8",
		 "height":"12vh",
		 "margin-bottom":"-12vh"
	 })
 })
 function openW1(){
	 $("#hide").css({"display":"block"});
	 $("#window1").css({"display":"block"});
	 $("#closeButton").css({"display":"block"});
 }
function closeW(){
	 $("#hide").css({"display":"none"});
	 $("#window1").css({"display":"none"});
	 $("#closeButton").css({"display":"none"});
}


/* 这段是重复的样例数据，可删 */
$(function(){

    for(var i=0;i<20;i++){
        $(`</tbody>
				<tbody>
				<tr>
					<td class=\"by\"><a href=\"\">`+i+`</a></td>
					<td class=\"by\"><a href=\"\">floor 1</a></td>
					 <td class=\"by\"><a href=\"\"style=\"color:green\">available</a></td>
	                    <td class=\"by\"><a href=\"test.jsp?bookid=...\" onClick=\"{if(confirm('ARE YOU SURE TO RESERVE THIS BOOK ?')){return ture;}return false;}\" style=\"color:blue;\">reserve</a></td>
				</tr>
			
			</tbody>`).appendTo($('#table1'));
    }
        
});



<%if(session.getAttribute("role")!=null &&session.getAttribute("role").equals("reader")&&( request.getParameter("option")==null||!request.getParameter("option").equals("view"))){ %>
$(function(){
	$("#reserveButton").css({
		"display":"block"
	})
})

<%}%>

<%if(session.getAttribute("role")!=null &&session.getAttribute("role").equals("librarian")){ %>
$(function(){
	$(".librarianOptions").css({
		"display":"inline"
	})
})

<%}%>

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










