 <!-- header -->
    <div class="header" style="display:none">
    
 <!--    标题 -->
      <a id="title" style="pointer-events:none;line-height: 15vh;font-size: 8vh;color: rgb(30, 141, 206);font-family: 'Times New Roman';text-align: left;font-weight: bolder;">&nbsp;&nbsp;&nbsp;&nbsp; MandarinLibrary</a> 
       <!--  <div id="logo" style="position:absolute;left:0;top:0;width:30vw;height:15vh; background: url(imgs/logo.png);background-size: 100% 100%;">
        </div> -->
        
        
    <!--  一个搜索框  action的链接改为处理search的jsp文件 传递参数：索引 “key” -->
          <form  action="./test.jsp" method="get" id="search" style="display:none">
           <input type="text" name="poster" value="search" style="position:absolute;display:none"/>
           <div class="inputArea" style="width:29vw;position: absolute;left:40vw;top:4.5vh;background:rgba(165, 255, 236, 0.342);margin: 0;">
           
            <input type="text" name="key" class="inputbar" placeholder="input information" style="background: none;border-top-right-radius: 0;border-bottom-right-radius: 0;" />
            <input type="submit" value="search" style="float:left; font-size:2vh;color:white; background: rgba(76, 145, 224, 0.877) ;  border-bottom-right-radius: 1.5vh;  border-top-right-radius: 1.5vh; border:none; width:4vw;height:6vh;position: absolute;top:0;right:0;z-index: 2;" />
           </div>
            </form>
          
          
    <!--    reader能显示的内容  -->
           <div id="readerButtons" style="display:none; position:absolute;width:20vw;height:15vh;right:0;top:0;text-align:center;line-height:4.5vh;font-size: 2vh;">
         <!--   填获取用户名 -->
           <a style="font-size:3vh;pointer-events:none">welcome  :  <% out.print(session.getAttribute(""));%></a>
           <br>
             <a id="Information" class="logina" href="information.jsp">Personal information</a><br>
          
           <a   id="logout" class="logina" href="" onClick="{if(confirm('ARE YOU SURE TO LOGOUT ?')){return ture;}return false;}">logout</a>
           </div>
           
           
      <!--    administrator能显示的内容  -->    
    <div id="administratorButtons"   style="display:none; position:absolute;width:20vw;height:15vh;right:0;top:0;text-align:center;line-height:4.5vh;font-size: 2vh;">
    
    
     
     <a style="font-size:3vh;pointer-events:none">welcome : administrator</a>
           <br>
             <a id="" class="logina" href="javascript:changPsdW()">change password</a><br>
          
            <a   id="logout" class="logina" href="" onClick="{if(confirm('ARE YOU SURE TO LOGOUT ?')){return ture;}return false;}">logout</a>
    
    
    
    
    </div>
    
    
    
      <!--    librarian能显示的内容  -->
    <div id="librarianButtons"  style="display:none; position:absolute;width:20vw;height:15vh;right:0;top:0;text-align:center;line-height:4.5vh;font-size: 2vh;">
    
     <a style="font-size:3vh;pointer-events:none">welcome  :  <% out.print(session.getAttribute(""));%></a>
           <br>
             <a id="" class="logina" href="">call administrator for help</a><br>
          
           <a   id="logout" class="logina" href="" onClick="{if(confirm('ARE YOU SURE TO LOGOUT ?')){return ture;}return false;}">logout</a>
    
    
    </div>
    
        
    </div>