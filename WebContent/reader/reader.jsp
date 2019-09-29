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
.bm tbody {
	transition: all 0.3s;
}

.bm tbody:hover {
	transform: scale(1.04);
	background: rgb(0, 255, 0, 0.9);
	border: 0.1vh blue solid;
}
.MList::-webkit-scrollbar {
 /*滚动条整体样式*/
 width : 10px;  /*高宽分别对应横竖滚动条的尺寸*/
 height: 1px;
 }
.MList::-webkit-scrollbar-thumb {
 /*滚动条里面小方块*/
 border-radius   : 10px;
 background-color:#CD6E74;
 }
.MList::-webkit-scrollbar-track {
 /*滚动条里面轨道*/
 box-shadow   : inset 0 0 5px rgb(100,0,0, 0.2);
 background   : rgb(200,200,200,0.3);
 border-radius: 10px;
 }
</style>
</head>

<body>


<!-- 导航菜单 -->
	<%
		if (session.getAttribute("role") == null) {
			session.setAttribute("role", "reader");
		}
	%>
	<jsp:include page="../include/header.jsp" flush="true" />
	<%
		   
			session.setAttribute("menu", "searchBook");

	%>
	<div class="menu"
		style="position: fixed; z-index: 10; width: 100vw; height: 5vh; top: 15vh; background: #A9CABC; text-align: left; line-height: 5vh;">
		<a>&nbsp&nbsp</a> <a class="m" id="searchBook"
			href="menu.jsp?menu=searchBook">&nbsp&nbspSearch books&nbsp&nbsp</a>
		<a>&nbsp&nbsp|&nbsp&nbsp&nbsp</a> 
		
		<a class="m"
			id="reservedBook" href="menu.jsp?menu=reservedBook">&nbsp&nbspReserved
			books&nbsp&nbsp</a>
		
		 <a>&nbsp&nbsp|&nbsp&nbsp&nbsp</a> 			
			<a class="m" id="history"
			href="menu.jsp?menu=history">&nbsp&nbspborrow
			history&nbsp&nbsp</a>
	</div>
	<!-- 背景 -->
	<div class="background"
		style="position: fixed; background: url(../imgs/readerBG.jpg); background-size: cover; top: 20vh; height: 80vh;">
	</div>
	
	
	<!-- 显示区 -->
	<div class="background" id="board"
		style="background: none; top: 20vh; height: 68vh;">
		
		
		
		
	<!-- searchBook板块 -->	
		
		<%
			if (session.getAttribute("menu").equals("searchBook")) {
		%>
       <!-- 搜索框 -->
		<form action="./test.jsp" method="get" id="search">
			<input type="text" name="poster" value="search"
				style="position: absolute; display: none" />
			<div class="inputArea"
				style="z-index: 2; width: 40vw; position: absolute; left: 30vw; top: 2vh; background: rgba(165, 255, 236, 0.742); margin: 0;">

				<input type="text" name="key" class="inputbar"
					placeholder="input information"
					style="background: none; width: 36vw; border-top-right-radius: 0; border-bottom-right-radius: 0;" />
				<input type="submit" value="search"
					style="float: left; font-size: 2vh; color: white; background: rgba(76, 145, 224, 0.877); border-bottom-right-radius: 1.5vh; border-top-right-radius: 1.5vh; border: none; width: 4vw; height: 6vh; position: absolute; top: 0; right: 0; z-index: 2;" />
			</div>
		</form>

   
   <!-- 图书展示区 -->

		<div id="BookView"
			style="position: absolute; z-index:0; background: none; top: 9.5vh; left: 10vw; width: 80vw; height: 57vh;">

			<div class="list">

				<div class="foot" id="foot"></div>
				<div class="bm">
					<table cellspacing="0" cellpadding="0" id="table1"
						style="display: none;">

						<tbody id="?" class="book"
							onclick="location.href='../showBook/showBook.jsp?bookName=book'">
							<tr>
								<td class="name"><a>《book1》</a></td>
								<td class="category"><a>math</a></td>
							</tr>

							<tr>
								<td class="author" style="width: 15vw"><a href="">author1</a> <a
									style="color: grey">|</a><a href="">Press1</a></td>
								<td></td>
							</tr>

						</tbody>
						<tbody id="?" class="book"
							onclick="location.href='../showBook/showBook.jsp?bookName=book'">
							<tr>
								<td class="name"><a>《book1》</a></td>
								<td class="category"><a>math</a></td>
							</tr>

							<tr>
								<td class="author" style="width: 15vw"><a>author1</a> <a
									style="color: grey">|</a><a>Press1</a></td>
								<td></td>
							</tr>

						</tbody>




					</table>
				</div>
			</div>


		</div>

		<%
			}
		%>








<!-- 历史借书记录板块 -->


<!-- 左侧菜单 -->
		<%
			if (session.getAttribute("menu").equals("history")) {
		if (session.getAttribute("history") == null) {
			session.setAttribute("history", "history_returned");
		}
	%>
<div class="menu login" style="position: absolute; z-index: 10; width: 14vw; height: 60vh; left:1vw;top: 4vh; background: #A9CABC; text-align: center; line-height: 5vh;">
<a class="m" id="history_returned"
			href="menu.jsp?menu=history&history=history_returned">&nbsp&nbspreturned books&nbsp&nbsp</a>
			<br>
<a class="m" id="history_borrowing"
			href="menu.jsp?menu=history&history=history_borrowing">&nbsp&nbspborrowing books&nbsp&nbsp</a>

</div>


    <div id="history_div" class="login" style="overflow:auto;z-index:11;background: rgb(235,213,190, 0.9);top:4vh;left:17.5vw;width:80vw;height:60vh;">



<!-- 已还书板块 -->
<%
if(session.getAttribute("history").equals("history_returned")){
%>	
<div  class="returned_div">
			<div class="head1">
				<table cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td class="by"><a style="font-weight: 700">BookId</a></td>
							<td class="by"><a style="font-weight: 700">Book name</a></td>
							<td class="by"><a style="font-weight: 700">Author</a></td>
							<td class="by"><a style="font-weight: 700">Borrow time</a></td>
							<td class="by"><a style="font-weight: 700">Deadline</a></td>
							<td class="by"><a style="font-weight: 700">Return time</a></td>
							<td class="by"><a style="font-weight: 700">Book state</a></td>
							<td class="by"><a style="font-weight: 700">fine</a></td>
						</tr>
					</tbody>
				</table>
			</div>

</div>
			<div class="returned_div">
				<table cellspacing="0" cellpadding="0" id="table_returned">

					<tbody>
						<tr>
							<td class="by"><a>1</a></td>
							<td class="by"><a>Book1</a></td>
							<td class="by"><a>Author1</a></td>
							<td class="by"><a>2019.02.03</a></td>
							<td class="by"><a>2019.03.03</a></td>
							<td class="by"><a>2019.03.13</a></td>
							<td class="by"><a style="color:red">timeout</a></td>
							<td class="by"><a>10.0  ￥</a></td>
						</tr>
					</tbody>
					
					<tbody>
						<tr>
							<td class="by"><a>2</a></td>
							<td class="by"><a>Book2</a></td>
							<td class="by"><a>Author2</a></td>
							<td class="by"><a>2019.02.04</a></td>
							<td class="by"><a>2019.03.04</a></td>
							<td class="by"><a>2019.03.01</a></td>
							<td class="by"><a style="color:red">broken</a></td>
							<td class="by"><a>20.0 ￥</a></td>
						</tr>
					</tbody>
					
					<tbody>
						<tr>
							<td class="by"><a>3</a></td>
							<td class="by"><a>Book3</a></td>
							<td class="by"><a>Author3</a></td>
							<td class="by"><a>2019.04.04</a></td>
							<td class="by"><a>2019.05.04</a></td>
							<td class="by"><a>2019.04.11</a></td>
							<td class="by"><a style="color:green">normal</a></td>
							<td class="by"><a>0.0 ￥</a></td>
						</tr>
					</tbody>
						<tbody>
						<tr>
							<td class="by"><a>3</a></td>
							<td class="by"><a>Book3</a></td>
							<td class="by"><a>Author3</a></td>
							<td class="by"><a>2019.04.04</a></td>
							<td class="by"><a>2019.05.04</a></td>
							<td class="by"><a>2019.04.11</a></td>
							<td class="by"><a style="color:green">normal</a></td>
							<td class="by"><a>0.0 ￥</a></td>
						</tr>
					</tbody>
					
					<%
					for(int i=0;i<20;i++){
						out.print("<tbody>"+
								"<tr>"+
								"<td class=\"by\"><a>3</a></td>"+
								"<td class=\"by\"><a>Book3</a></td>"+
								"<td class=\"by\"><a>Author3</a></td>"+
								"<td class=\"by\"><a>2019.04.04</a></td>"+
								"<td class=\"by\"><a>2019.05.04</a></td>"+
								"<td class=\"by\"><a>2019.04.11</a></td>"+
								"<td class=\"by\"><a style=\"color:green\">normal</a></td>"+
								"<td class=\"by\"><a>0.0 ￥</a></td>"+
							"</tr>"+
						"</tbody>");
					}
					
					%> 
					
					
				</table>
				<br> <br>
			</div>

<% 	
};
%>


<!-- 正在借的书板块 -->
<% 
if(session.getAttribute("history").equals("history_borrowing")){
%>	
<div  class="borrowing_div">
			<div class="head1">
				<table cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td class="by"><a style="font-weight: 700">BookId</a></td>
							<td class="by"><a style="font-weight: 700">Book name</a></td>
							<td class="by"><a style="font-weight: 700">Author</a></td>
							<td class="by"><a style="font-weight: 700">Borrow time</a></td>
							<td class="by"><a style="font-weight: 700">Deadline</a></td>
						</tr>
					</tbody>
				</table>
			</div>

</div>
			<div class="borrowing_div">
				<table cellspacing="0" cellpadding="0" id="table_returned">

					<tbody>
						<tr>
							<td class="by"><a>1</a></td>
							<td class="by"><a>Book1</a></td>
							<td class="by"><a>Author1</a></td>
							<td class="by"><a>2019.02.03</a></td>
							<td class="by"><a style="color:red;">2019.03.03</a></td>
						</tr>
					</tbody>
					
					<tbody>
						<tr>
							<td class="by"><a>2</a></td>
							<td class="by"><a>Book2</a></td>
							<td class="by"><a>Author2</a></td>
							<td class="by"><a>2019.02.04</a></td>
							<td class="by"><a style="color:green">2019.03.04</a></td>
						</tr>
					</tbody>
					
					<tbody>
						<tr>
							<td class="by"><a>3</a></td>
							<td class="by"><a>Book3</a></td>
							<td class="by"><a>Author3</a></td>
							<td class="by"><a>2019.04.04</a></td>
							<td class="by"><a style="color:green">2019.05.04</a></td>
						</tr>
					</tbody>
					
					<%
					for(int i=0;i<20;i++){
						out.print("<tbody>"+
								"<tr>"+
								"<td class=\"by\"><a>3</a></td>"+
								"<td class=\"by\"><a>Book3</a></td>"+
								"<td class=\"by\"><a>Author3</a></td>"+
								"<td class=\"by\"><a>2019.04.04</a></td>"+
								"<td class=\"by\"><a style=\"color:green\">2019.05.04</a></td>"+
							"</tr>"+
						"</tbody>");
					}
					
					%> 
					
					
				</table>
				<br> <br>
			</div>

<% 	
};
%>





</div>
		<%
			} ;
		%>

	

<!-- 正在预约书板块 -->

<%
			if (session.getAttribute("menu").equals("reservedBook")) {
		%>
		<div class="MList"
			style="overflow:auto; position: absolute; z-index: 0; background: none; top: 4.5vh; left: 10vw; width: 80vw; height: 57vh;">

			<div class="list">
				<div class="bm">
					<table cellspacing="0" cellpadding="0" id="table2"
						style="display: block;">

						<tbody id="?" class="book"
							onclick="location.href='../showBook/showBook.jsp?bookName=book&option=view'">
							<tr>
								<td class="name"><a>《book1》</a></td>
								<td class="category"><a>math</a></td>
							</tr>

							<tr>
								<td class="author" style="width: 15vw"><a href="">author</a> <a
									style="color: grey">|</a><a href="">bookId</a></td>
								<td>
								<a
									style="color: blue">reserve time : &nbsp&nbsp</a>
								<a>2019.02.01 13:14:15</a>
								</td>
							</tr>

						</tbody>
						<tbody id="?" class="book"
							onclick="location.href='../showBook/showBook.jsp?bookName=book&option=view'">
							<tr>
								<td class="name"><a>《book1》</a></td>
								<td class="category"><a>math</a></td>
							</tr>

							<tr>
								<td class="author" style="width: 15vw"><a href="">author</a> <a
									style="color: grey">|</a><a href="">bookId</a></td>
								<td>
								<a
									style="color: blue">reserve time : &nbsp&nbsp</a>
								<a>2019.02.01 13:14:15</a>
								</td>
							</tr>

						</tbody>




					</table>
				</div>
			</div>


		</div>

		<%
			};
		%>








		<jsp:include page="../include/footer.jsp" flush="true" />
	</div>




</body>
<script src="../lib/jquery/jquery-1.9.1.js"></script>
<script type="text/javascript">
 $(function(){
	 
	 $('#title').html("&nbsp;&nbsp;&nbsp;&nbsp; MandarinLibrary &nbsp;&nbsp;&nbsp;&nbsp;☞&nbsp;&nbsp;&nbsp;&nbsp;Reader")
	 $('.header').css({
			"display":"block",
			"background":"#E3E5D8",
			"position":"fixed"
		});
	 $('#readerButtons').css({
			"display":"block",
			"background":"#E2CEAC",
			"border-radius":"3vh"
		});
	 $('.footer').css({
		 "background":"#E3E5D8",
		 "height":"12vh",
		 "margin-bottom":"-12vh"
	 })
	 $("#<%out.print(session.getAttribute("menu"));%>").css({
		 "transition-duration":"0.3s",
     "color":"white",
     "font-size": "2.7vh",
     "background":"#CD6E74"
	 })
	 $("#table2 tbody").css({
		 "background":"orange"
	 })
	 
	 

	 $(".returned_div a").css({
		 "text-decoration": "none"
	 })
	
	 $(".returned_div .by").css({
			"height": "7vh",
		"width": "10vw"
	 })
	 $(".borrowing_div .by").css({
			"height": "7vh",
		"width": "16vw"
	 })
	 
 })
	
 <%if (session.getAttribute("menu").equals("searchBook")) {%>
		$(function(){
			$("#board").css({
				"height":"150vh"
			})
			$("#foot").css({
				"top":"133vh",
				"left":"15vw",
				"position":"absolute",
			
			})
			
				})
	
$(function(){
	var bm= new Array();
	for(var i=0;i<100;i++){
		bm[i]={BookName:"book"+i,};
	}
	
    <%%>
	
    for(var i=0;i<100;i++){
        $(`</tbody>
				<tbody id=\"?\" class=\"book\" onclick=\"location.href=\'../showBook/showBook.jsp?bookName=book\'\">
				<tr>
					<td class=\"name\"><a >《book1》</a></td>
					<td class=\"category\"><a >math</a></td>
				</tr>
				
				<tr>
				<td class=\"author\" style=\"width:15vw\"><a >author`+i+`</a> <a style=\"color:grey\">|</a><a >Press1</a></td>
				<td ></td>
				</tr>
			
			</tbody>`).appendTo($('#table1'));
    }
        
});



$(function () {
    
    var $table = $('#table1');
    var currentPage = 0;//当前页默认值为0  
    var pageSize = 12;//每一页显示的数目  
    pageSize=pageSize*2;
    $table.bind('paging', function () {
        $table.find('tbody tr').hide().slice(currentPage * pageSize, (currentPage + 1) * pageSize).show();
    });
    var sumRows = $table.find('tbody tr').length;
    var sumPages = Math.ceil(sumRows / pageSize);//总页数 
    var $pager = $('<div id="page"> </div>');  //新建div，放入a标签,显示底部分页码  
     $('<a  href="#" id="pageBack"><span>' + '👈' + '</span></a>').bind("click", { "newPage": currentPage }, function (event) {
            if(currentPage>0)currentPage --;
            $table.trigger("paging");
            changeCss1(currentPage);
            //触发分页函数  
        }).appendTo($pager);
        $pager.append(" ");
    for (var pageIndex = 0; pageIndex < sumPages; pageIndex++) {
        $('<a onclick="changeCss(this)" href="#" id="pageStyle"><span>' + (pageIndex + 1) + '</span></a>').bind("click", { "newPage": pageIndex }, function (event) {
            currentPage = event.data["newPage"];
            $table.trigger("paging");
            //触发分页函数  
        }).appendTo($pager);
        $pager.append(" ");
    //     $pager.appendTo($('.foot'));
    // $table.trigger("paging");
    }
    $('<a onclick="changeCss2()" href="#" id="pageBack"><span>' + '👉' + '</span></a>').bind("click", { "newPage": currentPage }, function (event) {
            if(currentPage < sumPages-1)currentPage ++;
            $table.trigger("paging");
            changeCss1(currentPage);
            //触发分页函数  
        }).appendTo($pager);

    
    $pager.append(" ");
    $pager.appendTo($('.foot'));
    $table.trigger("paging");
    $table.css({
    	"display":"block"
    })
   

    //默认第一页的a标签效果 
    var $pagess = $('#pageStyle');
    $pagess[0].style.backgroundColor="#006B00";  
    $pagess[0].style.color="#ffffff";  
    
});

//a链接点击变色，再点其他回复原色  
function changeCss(obj) {
    var arr = document.getElementById("foot").getElementsByTagName("a");
    for (var i = 0; i < arr.length; i++) {
        if (obj == arr[i]) {       //当前页样式  
            obj.style.backgroundColor = "#006B00";
            obj.style.color = "#ffffff";
        }
        else {
            arr[i].style.color = "";
            arr[i].style.backgroundColor = "";
        }
    }  
}
function changeCss1(o) {
    o++;
        var arr = document.getElementById("foot").getElementsByTagName("a");
    for (var i = 0; i < arr.length; i++) {
        if (o==i) {       //当前页样式  
            arr[i].style.backgroundColor = "#006B00";
            arr[i].style.color = "#ffffff";
        }
        else {
            arr[i].style.color = "";
            arr[i].style.backgroundColor = "";
        }
    } 
  
}
		
 <%}%>
 
 <%
 if(session.getAttribute("history")!=null){
%>
 $("#<%out.print(session.getAttribute("history"));%>").css({
	 "transition-duration":"0.3s",
 "color":"white",
 "font-size": "2.7vh",
 "background":"#CD6E74"
 })

	 
	 
<% 
 }
 %> 
</script>
</html>