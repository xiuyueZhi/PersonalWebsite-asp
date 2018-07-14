<!-- #include file="conn.asp" -->
<%
un=request.Form("name")
email=request.Form("email")
pw=request.Form("password")
strSql="select * from user where username='"&un&"'" 
rs.open strSql,conn,1
if not (rs.eof and rs.bof) then
	response.Write "<script>alert('该用户已注册!');history.go(-1);</script>" 
else
response.Write "<script>window.location='reg.asp?username="&un&"&email="&email&"&password="&pw&"';</script>" 
end if
%>