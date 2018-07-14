<!-- #include file="conn.asp" -->
<%
noteId = request.QueryString("noteId")
ischange = request.QueryString("ischange")
pagenum = request.QueryString("pagenum")
no=request.QueryString("no")
root=request.QueryString("root")
if noteId="" then
	response.write "<script>alert('该回复不存在！');history.go(-1);</script>"
else
strsql="delete from note where noteId="&noteId
conn.execute strsql
rs.cursorlocation=3
rs.open "select * from note where root="&root,conn,1
rs.pagesize=3
response.write rs.pagecount&no
if rs.pagecount>no then 
	response.Redirect("message.asp?ischange="&ischange&"&pagenum="&pagenum&"&no="&no-1)
else
response.Redirect("message.asp?ischange="&ischange&"&pagenum="&pagenum&"&no="&rs.pagecount)
end if
end if
%>