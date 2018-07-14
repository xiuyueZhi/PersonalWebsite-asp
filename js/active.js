    (function() {
    /**
    实现复选框只能选一个的功能
    */
    var fanxiBox = $(".fa input:checkbox");
    fanxiBox.click(function () {
        if(this.checked || this.checked=='checked'){
            fanxiBox.removeAttr("checked");
                //这里需注意jquery1.6以后必须用prop()方法
                //$(this).attr("checked",true);
                $(this).prop("checked", true);
            }
        });

})();
function check(){
 var state = document.getElementById("state").value;
 if(state ==  1){
    return true;
}
return false;
}

function endVote(infoId,ischange,pageno){
    if(confirm("您真的要结束此投票吗？"))
    {
        window.location.href="endVote.asp?infoId="+infoId+"&ischange="+ischange+"&pageno="+pageno;
    }
}
function delVote(infoId,ischange,pageno){
    if(confirm("您真的要删除此投票吗？"))
    {
        window.location.href="delVote.asp?ischange="+ischange+"&infoId="+infoId+"&pageno="+pageno;
    }
}
function goto(ischange){
    if(window.event.keyCode==13){
        var pageno=document.getElementById('pageno').value;
        if(isNaN(pageno)||pageno==""){
            alert('请输入一个数字！');
            document.getElementById('pageno').value='';
            return ;
        }
        window.location.href='active.asp?ischange='+ischange+'&pageno='+pageno;
    }
}
function vote(infoId){
    window.location.href="vote.asp?infoId="+infoId;
}
function see(infoId){
    window.open('viewVote.asp?infoId='+infoId,'','width=450,height=450,top='+(screen.height-400)/2+',left='+(screen.width-400)/2 + '');
}