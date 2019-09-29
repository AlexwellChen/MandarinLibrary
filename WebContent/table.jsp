<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>MandarinLibrary</title>
</head>
<style>
a {
	text-decoration: none;
}

.list {
	text-align: center;
}

.by {
	height: 7vh;
	width: 8vw;
}
</style>
<body>
	<div class="list">
		<div class="head1">
			<table cellspacing="0" cellpadding="0">
				<tbody>
					<tr>
						<td class="by"><a style="font-weight: 700">BookName</a></td>
						<td class="by"><a style="font-weight: 700">Press</a></td>
						<td class="by"><a style="font-weight: 700">Price</a></td>
						<td class="by"><a style="font-weight: 700">Position</a></td>
						<td class="by"><a style="font-weight: 700">Category</a></td>
						<td class="by"><a style="font-weight: 700">Option</a></td>
						<td class="by"><a style="font-weight: 700">Change</a></td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="foot" id="foot" style="position: absolute; top: 50vh;">

		</div>
		<div class="bm">
			<table cellspacing="0" cellpadding="0" id="table1">

				<tbody id="?">
					<tr>
						<td class="by"><a href="">book1</a></td>
						<td class="by"><a href="">Press1</a></td>
						<td class="by"><a href="">12yuan</a></td>
						<td class="by"><a href="">floor 1</a></td>
						<td class="by"><a href="">math</a></td>
						<td class="by"><a href="test.jsp?bookid=..."
							onClick="{if(confirm('ARE YOU SURE TO DELETE THIS BOOK ?')){return ture;}return false;}"
							style="color: red;">delete</a></td>
						<td class="by"><a href="" style="color: red;">change</a></td>

					</tr>
				</tbody>


			</table>
		</div>
	</div>
</body>
<script src="lib/jquery/jquery-1.9.1.js"></script>
<script>

$(function(){
	var bm= new Array();
	for(var i=0;i<100;i++){
		bm[i]={link:"test.jsp",BookName:"book"+i,Press:"press"+i,Price:"13"+i,Position:"floor 2",Category:"???",BookId:"2"+i};
	}
	
    <%
    
    
    %>
	
    for(var i=0;i<100;i++){
        $(`<tbody >
                <tr>
                    <td class=\"by\"><a href=\"`+bm[i].link+`\">`+bm[i].BookName+`</a></td>
                    <td class=\"by\"><a href=\"\">`+bm[i].Press+`</a></td>
                    <td class=\"by\"><a href=\"\">`+bm[i].Price+` yuan</a></td>
                    <td class=\"by\"><a href=\"\">`+bm[i].Position+`</a></td>
                    <td class=\"by\"><a href=\"\">`+bm[i].Category+`</a></td>
                    <td class=\"by\"><a href=\"test.jsp?bookid=`+bm[i].BookId+`\"onClick=\"{if(confirm(\'ARE YOU SURE TO DELETE THIS BOOK ?\')){return ture;}return false;}\" style=\"color:red;\">delete</a></td>
               
                </tr>
            </tbody>`).appendTo($('#table1'));
    }
        
});
$(function () {
    
    var $table = $('#table1');
    var currentPage = 0;//当前页默认值为0  
    var pageSize = 5;//每一页显示的数目  
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
</html>