$(document).ready(function() {
    $('.register').click(function() {
        if ($('.name-box').val() == "") {
            $('.name-box').focus();
            alert("用户名不能为空");
            return false;
        }
        if ($('.name-box').val().length < 4 || $('.name-box').val().length > 16) {
            $('.name-box').focus();
            alert("用户名必须为4-16字符");
            return false;
        }

        var semail = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
        if ($('.email-box').val()=='') {
            $('.email-box').focus();
            alert("邮箱不能为空");
            return false;
        }
        if (!semail.test($('.email-box').val())) {
            $('.email-box').focus();
            alert("邮箱格式不正确");
            return false;
        }

        var pwdmin = 6;
        if ($('.password-box').val()=='') {
            $('.password-box').focus();
            alert("密码不能为空");
            return false;
        }
        if ($('.password-box').val().length < pwdmin) {
            $('.password-box').focus();
            alert("密码不能小于" + pwdmin + "位");
            return false;
        }
    });
    
});