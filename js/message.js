(function() {

    $('.title1').click(function() {
        $(".choice1").toggle();
        $(this).addClass('act2');
    })
    $('.title2').click(function() {
        $(".choice2").toggle();
        $(this).addClass('act2');
    })
    $('.title3').click(function() {
        $(".choice3").toggle();
       $(this).addClass('act2');
   })
    $('.replay1').click(function() {
        $(".huifu1").toggle();
    })
    $('.replay2').click(function() {
        $(".huifu2").toggle();
    })
    $('.replay3').click(function() {
        $(".huifu3").toggle();
    })
})();
function textdown(e) {
    textevent = e;
    if (textevent.keyCode == 8) {
        return;
    }
    if (document.getElementById('textarea').value.length >= 100) {
        alert("不能超过100字！")
        if (!document.all) {
            textevent.preventDefault();
        } else {
            textevent.returnValue = false;
        }
    }
}
function textup() {
    var s = document.getElementById('textarea').value;
    //判断ID为text的文本区域字数是否超过100个 
    if (s.length > 100) {
        document.getElementById('textarea').value = s.substring(0, 100);
    }
}
function openDetail(noteId)
{
    var diag = new Dialog();
    diag.Width = 270;
    diag.Height = 250;
    diag.Title = "个人信息";
    diag.URL = "details.asp?noteId="+noteId;
    diag.show();
}
function delNote(noteId,ischange,pagenum){
    if(confirm("您真的要删除此留言吗？"))
    {
        window.location.href="delNote.asp?ischange="+ischange+"&noteId="+noteId+"&pagenum="+pagenum;
    }
}
function doSubmit() {
    return false;
}
function delNote2(noteId,ischange,pagenum,no,rot){
    if(confirm("您真的要删除此回复吗？"))
    {
        window.location.href="delNote2.asp?ischange="+ischange+"&noteId="+noteId+"&pagenum="+pagenum+"&no="+no+"&root="+rot;
    }
}
function goto(ischange){
    if(window.event.keyCode==13){
        var pagenum=document.getElementById('pagenum').value;
        if(isNaN(pagenum)||pagenum==""){
            alert('请输入一个数字！');
            document.getElementById('pagenum').value='';
            return ;
        }
        window.location.href='message.asp?ischange='+ischange+'&pagenum='+pagenum;
    }
}
function goto2(ischange,pagenum){
    if(window.event.keyCode==13){
        var no=document.getElementById('no').value;
        if(isNaN(no)||no==""){
            alert('请输入一个数字！');
            document.getElementById('no').value='';
            return ;
        }
        window.location.href='message.asp?ischange='+ischange+'&pagenum='+pagenum+'&no='+no;
    }
}

