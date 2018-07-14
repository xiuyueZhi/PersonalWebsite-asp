<!-- #include file="conn.asp" -->
<%
on error resume next
un=request.Form("name")
pw=request.Form("password")
strSql="select * from user where username='"&un&"'"
rs.open strSql,conn,1
if rs.eof and rs.bof then 
	response.Redirect("Login.asp?err=用户名不存在")
else
if rs("password")<>pw then
	response.Redirect("Login.asp?err=密码错误")
else
session("curUser")=un
r=request.Form("rember")
if r="Y" then 
	response.Cookies("cUsername")=un
	response.Cookies("cUsername").expires=date()+365
end if
response.Redirect("Page.asp")
end if
end if

%>