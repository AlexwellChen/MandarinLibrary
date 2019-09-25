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
        <div class="inputArea">
            <input type="password" name="psd" placeholder=" please input your password" class="inputbar" id="psd">
        </div>

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
	 document.account.submit();
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