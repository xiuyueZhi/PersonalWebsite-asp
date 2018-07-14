<!-- #include file="conn.asp" -->

<%
on error resume next
un=request.QueryString("username")
email=request.QueryString("email")
pw=request.QueryString("password")
strSql="select * from user" 
rs.open strSql,conn,1,3
rs.addnew
rs("username")=un
rs("email")=email
rs("password")=pw
rs.update
if conn.errors.count>0 then
	response.Write "<script>alert('数据库异常，请重新注册!');history.go(-1);</script>" 
else
response.Write "<script>alert('注册成功，立即登录!');window.location.href='Login.asp';</script>" 
end if
%>