(function() {

    $(".friend1-photo").hover(function(){
         //这里写鼠标悬浮其上的动作
         $(".as1").show();
     },function(){
        //这里写鼠标移动出去的动作        
        $(".as1").hide();
    })
    $(".as1").hover(function(){
         //这里写鼠标悬浮其上的动作
         $(".as1").show();
     },function(){
        //这里写鼠标移动出去的动作
        $(".as1").hide();
    })

    $(".friend2-photo").hover(function(){
         //这里写鼠标悬浮其上的动作
         $(".as2").show();
     },function(){
        //这里写鼠标移动出去的动作        
        $(".as2").hide();
    })
    $(".as2").hover(function(){
         //这里写鼠标悬浮其上的动作
         $(".as2").show();
     },function(){
        //这里写鼠标移动出去的动作
        $(".as2").hide();
    })
    
    $(".friend3-photo").hover(function(){
         //这里写鼠标悬浮其上的动作
         $(".as3").show();
     },function(){
        //这里写鼠标移动出去的动作        
        $(".as3").hide();
    })
    $(".as3").hover(function(){
         //这里写鼠标悬浮其上的动作
         $(".as3").show();
     },function(){
        //这里写鼠标移动出去的动作
        $(".as3").hide();
    })

})();

function open11()
{
    var diag = new Dialog();
    diag.Width = 200;
    diag.Height = 180;
    diag.Title = "个人信息";
    diag.URL = "information1.html";
    diag.show();
}

function open12()
{
    var diag = new Dialog();
    diag.Width = 250;
    diag.Height = 200;
    diag.Title = "个人信息";
    diag.URL = "modify1.html";
    diag.show();
}
$('.delete').click(function() {
    alert("确定要删除该好友吗？");
    document.getElementById(this.id).remove();
})


