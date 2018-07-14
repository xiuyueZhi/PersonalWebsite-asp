var reMethod = "GET",
pwdmin = 6;
$(document).ready(function() {

 $('#errorClose').click(function(){
    $('#error').hide();
});
 $('.login').click(function() {
    if ($('.name-box').val() == "") {
        $('.name-box').focus();
        alert("用户名不能为空");
        return false;
    }
    
    if ($('.password-box').val()=='') {
        $('.password-box').focus();
        alert("密码不能为空");
        return false;
    }

    window.location.href='./Page.html&ischage=0';
});

});