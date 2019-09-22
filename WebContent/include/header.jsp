 <!-- header -->
    <div class="header" style="display:none">
        <a>&nbsp;&nbsp;&nbsp;&nbsp; MandarinLibrary</a>
        
    <!--    action的链接改为处理search的jsp文件 传递参数：索引 “key” -->
          <form  action="./test.jsp" method="get" id="search" style="display:none">
           <input type="text" name="poster" value="search" style="position:absolute;display:none"/>
           <div class="inputArea" style="width:29vw;position: absolute;left:40vw;top:4.5vh;background:rgba(165, 255, 236, 0.342);margin: 0;">
           
            <input type="text" name="key" class="inputbar" placeholder="input information" style="background: none;border-top-right-radius: 0;border-bottom-right-radius: 0;" />
            <input type="submit" value="search" style="color:white; background: rgba(76, 145, 224, 0.877) ;  border-bottom-right-radius: 1.5vh;  border-top-right-radius: 1.5vh; border:none; width:4vw;height:6vh;position: absolute;top:0;right:0;z-index: 2;" />
           </div>
            </form>
        
    </div>