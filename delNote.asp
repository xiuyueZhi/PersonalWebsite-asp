<!-- #include file="conn.asp" -->
<%
noteId = request.QueryString("noteId")
ischange = request.QueryString("ischange")
pagenum = request.QueryString("pagenum")
if noteId="" then
	response.write "<script>alert('留言不存在！');history.go(-1);</script>"
else
strsql="delete from note where noteId="&noteId&" or root="&noteId
conn.execute strsql
rs.cursorlocation=3
rs.open "select * from note where root=0",conn,1
rs.pagesize=3
response.write rs.pagecount&pagenum
if rs.pagecount>pagenum then 
	response.Redirect("message.asp?ischange="&ischange&"&pagenum="&pagenum-1)
else
response.Redirect("message.asp?ischange="&ischange&"&pagenum="&rs.pagecount)
end if
end if
%>