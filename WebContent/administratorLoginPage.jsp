<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link type="text/css" rel="stylesheet" href="css/index.css">
    <title>MandarinLibrary</title>
</head>

<body>
     <jsp:include page="include/header.jsp" flush="true" />
    <!-- 背景 -->
    <div class="background" style="background: url(imgs/1.png);background-size: cover;">
         <jsp:include page="include/footer.jsp" flush="true" />
    </div>


    <!-- 登录 -->

<!-- 将test.jsp改为处理 管理员 登录的文件。传递参数：用户名username , 密码psd -->

<form  name="account" method="post" action="adminLogin.jsp">

    <input type="text" name="poster" value="account" style="position:absolute;display:none"/>
    
    <div class="login">
        <div class="title">
                <a style="font-size:3vh;" >login</a>
        </div>

        <div class="inputArea" style="margin-top:13vh;">
            <input type="text" name="username" placeholder=" please input your username" class="inputbar" id="username"autofocus>
        </div>
        <a style="color:red" id="tip1"></a>
        <div class="inputArea">
            <input type="password" name="psd" placeholder=" please input your password" class="inputbar" id="psd">
        </div>
		<a style="color:red" id="tip2"></a><br>
        <div class="loginbar" id="loginbar"  onclick="sel()">
            <a   class="login_1">login</a>
        </div>
        <br>
        <a class="logina" style="font-size:2vh" href="reader/forget/one.jsp">forget your password ?</a>  
    </div>
</form>

</body>
<script src="lib/jquery/jquery-1.9.1.js"></script>
<script type="text/javascript">
function sel(){
	 if(check()){
	 document.account.submit();
	 }
}

function check(){
	 var username=$("#username").val();
		var psd=$("#psd").val();	
		if(username!=null&&username!=""){
			$("#tip1").html("");
		}else{
			$("#tip1").html("please input your username !");
		}
		if(psd!=null&&psd!=""){
			$("#tip2").html("");
		}else{
			$("#tip2").html("please input your password !");
		}
		
		if(username!=null&&username!=""&&psd!=null&&psd!=""){
			return true;
		}
		
		
	 return false; 
}
//获取url中的参数
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
}
window.onload=function(){
				switch(getUrlParam("tip")){
				case "0":setTimeout("alert('Change Success!')",500);break;
				case "1":setTimeout("alert('Invalid account or password')",500);break;
				}
				var url = window.location.href; 
				var valiable = url.split("?")[0]; 
				window.history.pushState({},0,valiable);
				
			}
 $(function(){
	 $('#title').html("&nbsp;&nbsp;&nbsp;&nbsp; administrator login")
	 $('.header').css({"text-align":"center"})
	 $('.header').css({
			"display":"block"
		});
 })

</script>
</html>