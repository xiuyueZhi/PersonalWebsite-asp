(function() {
    /**
     鼠标悬浮在头像上的动作
     */
     $(".photo").hover(function(){
         //这里写鼠标悬浮其上的动作
         $(".as").show();
       },function(){
        //这里写鼠标移动出去的动作        
        $(".as").hide();
      })
     $(".as").hover(function(){
         //这里写鼠标悬浮其上的动作
         $(".as").show();
       },function(){
        //这里写鼠标移动出去的动作
        $(".as").hide();
      })

   })();

   function exit(){
    if(confirm("您真的要退出吗？"))
    {
      window.location.href="../logout.asp";
    }
  }
     //获取url中的参数
     function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); 
            return 1; //返回参数值
          }
          if (getUrlParam("ischange") == 1) {
            var css=document.getElementById("css"); 
            css.setAttribute("href","./styles/default1.css");
          }
          if (getUrlParam("ischange") == 2) {
            var css=document.getElementById("css"); 
            css.setAttribute("href","./styles/default2.css");
          }
          if (getUrlParam("ischange") == 3) {
            var css=document.getElementById("css"); 
            css.setAttribute("href","./styles/default3.css");
          }
          if (getUrlParam("ischange") == 4) {
            var css=document.getElementById("css"); 
            css.setAttribute("href","./styles/default4.css");
          }
          if (getUrlParam("ischange") == 5) {
            var css=document.getElementById("css"); 
            css.setAttribute("href","./styles/default5.css");
          }
          if (getUrlParam("ischange") == 6) {
            var css=document.getElementById("css"); 
            css.setAttribute("href","./styles/default6.css");
          }
          var index = getUrlParam("ischange"); 
          var pageno= document.getElementById("p").value; 
          var pagenum= document.getElementById("pa").value;
          var url1 = "./Page.asp?ischange="+index; 
          var url2 = "./friend.asp?ischange="+index; 
          var url3="./active.asp?ischange="+index+"&pageno="+pageno; 
          var url4="./message.asp?ischange="+index+"&pagenum="+pagenum;
          $(".page").click(function(){ window.location.href = url1; });
          $(".friend").click(function(){ window.location.href = url2; });
          $(".active").click(function(){ window.location.href = url3; });
          $(".message").click(function(){ window.location.href = url4; });

          