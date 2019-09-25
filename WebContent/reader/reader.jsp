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

</style>
</head>

<body>
	<jsp:include page="../include/header.jsp" flush="true" />
	<%
		if (session.getAttribute("menu") == null) {
			session.setAttribute("menu", "searchBook");
		}
	%>
	<div id="menu"
		style="position: fixed; z-index:10;width: 100vw; height: 5vh; top: 15vh; background: #A9CABC; text-align: left; line-height: 5vh;">
		<a>&nbsp&nbsp</a> <a class="m" id="searchBook"
			href="menu.jsp?menu=searchBook">&nbsp&nbspSearch books&nbsp&nbsp</a>
		<a>&nbsp&nbsp|&nbsp&nbsp&nbsp</a> <a class="m" id="history"
			href="menu.jsp?menu=history">&nbsp&nbspView the borrow
			history&nbsp&nbsp</a> <a>&nbsp&nbsp|&nbsp&nbsp&nbsp</a> <a class="m"
			id="reserveBook" href="menu.jsp?menu=reserveBook">&nbsp&nbspReserve
			books&nbsp&nbsp</a>
	</div>
	<!-- 背景 -->
	<div class="background"
		style=" position:fixed;background: url(../imgs/readerBG.jpg); background-size: cover; top: 20vh; height: 80vh;">
    </div>
    <div class="background" id="board"
		style="background: none;  top: 20vh; height: 68vh;">
		<%
			if (session.getAttribute("menu").equals("searchBook")) {
		%>

		<form action="./test.jsp" method="get" id="search">
			<input type="text" name="poster" value="search"
				style="position: absolute; display: none" />
			<div class="inputArea"
				style="z-index: 2; width: 40vw; position: absolute; left: 30vw; top: 2vh; background: rgba(165, 255, 236, 0.742); margin: 0;">

				<input type="text" name="key" class="inputbar"
					placeholder="input information"
					style="background: none; border-top-right-radius: 0; border-bottom-right-radius: 0;" />
				<input type="submit" value="search"
					style="float: left; font-size: 2vh; color: white; background: rgba(76, 145, 224, 0.877); border-bottom-right-radius: 1.5vh; border-top-right-radius: 1.5vh; border: none; width: 4vw; height: 6vh; position: absolute; top: 0; right: 0; z-index: 2;" />
			</div>
		</form>

		<div id="" 
			style=" position:absolute;z-index: 0; background: none; top: 9.5vh; left: 10vw; width: 80vw; height: 57vh;">

			<div class="list" >

				<div class="foot" id="foot">

				</div>
				<div class="bm" >
					<table cellspacing="0" cellpadding="0" id="table1" style="display:none;">

							<tbody id="?" class="book">
								<tr>
									<td class="name"><a href="">《book1》</a></td>
									<td class="category"><a href="">math</a></td>
								</tr>
								
								<tr>
								<td class="author" style="width:15vw"><a href="">hu</a> <a style="color:grey">|</a><a href="">Press1</a></td>
								<td ></td>
								</tr>
							
							</tbody>
								<tbody id="?" class="book">
								<tr>
									<td class="name"><a href="">《book1》</a></td>
									<td class="category"><a href="">math</a></td>
								</tr>
								
								<tr>
								<td class="author" style="width:15vw"><a href="">hu</a> <a style="color:grey">|</a><a href="">Press1</a></td>
								<td ></td>
								</tr>
							
							</tbody>
					
					
						

					</table>
				</div>
			</div>


		</div>

		<%
			}
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
 })
 <%
			if (session.getAttribute("menu").equals("searchBook")) {
		%>
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
		
 <% }%>
$(function(){
	var bm= new Array();
	for(var i=0;i<100;i++){
		bm[i]={BookName:"book"+i,};
	}
	
    <%
    
    
    %>
	
    for(var i=0;i<100;i++){
        $(`</tbody>
				<tbody id=\"?\" class=\"book\">
				<tr>
					<td class=\"name\"><a href=\"\">《book1》</a></td>
					<td class=\"category\"><a href=\"\">math</a></td>
				</tr>
				
				<tr>
				<td class=\"author\" style=\"width:15vw\"><a href=\"\">hu</a> <a style=\"color:grey\">|</a><a href=\"\">Press1</a></td>
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
</script>
</script>
</html>