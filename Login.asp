<!DOCTYPE html >
<html >
<head>
	<meta charset="utf-8" />
	<title>登录页</title>
	<link rel="stylesheet" type="text/css" href="styles/login.css">
</head>
<body>
	<%
	if request.QueryString("err")<>"" then
		%>
		<div id="error" class="error"><%=request.QueryString("err")%>,请重试！<a id="errorClose" href="#" style="text-decoration: none;">×</a></div>
		<%end if%>
		<%
		if request.Cookies("cUsername")<>"" then
			session("curUser")=request.Cookies("cUsername")
			response.Redirect("Page.asp")
		end if
		strBrowser=Request.ServerVariables("Http_User_Agent")
		If instr(strBrowser,"MSIE")>0 then
			response.write "<script>alert('您使用的是IE浏览器，可能会影响到部分浏览效果，建议使用Chrome浏览器');</script>"
end if
%>
<form action="checklogin.asp" method="post">
	<div class="big-box">
		<div class="middle-box">
			<p class="name">昵称</p>
			<input type="text" name="name" class="name-box" >
			<p class="password">密码</p>
			<input type="password" name="password" class="password-box" >
			<label class="rember"><input type="checkbox" class="min-box" name="rember" value="Y">记住我</label>
			<a href="#" class="forget">忘记密码？</a>
			<div class="small-box">
				<div class="ssmall-box">
					<div class="sssmall-box">
						<button class="login">登&nbsp;录</button>
						<a href="Register.html" class="register">去注册</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<p>Copyright&copy; 2014329700007 My.Website<br><a href="mailto:webmaster@xyz.com.cn">Contact Me:Administrator</a> 
		</p>
	</div>
</form>
<script src="js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
</body>
</html>
