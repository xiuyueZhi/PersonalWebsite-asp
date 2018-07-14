<!-- #include file="conn.asp" -->
<%
noteId = request.QueryString("noteId")
ischange=request.QueryString("ischange")
pagenum=request.QueryString("pagenum")
content=request.Form("replay")
rs.cursorlocation=3
rs.open "select * from note",conn,1,3
rs.addnew
rs("title")=content
rs("content")=content
rs("notetime")=now()
rs("username")=session("curUser")
rs("ip")=request.ServerVariables("REMOTE_ADDR")
rs("root")=noteId
rs.update
rs.close
rs.open "select * from note where root="&noteId,conn,1
rs.pagesize=3
response.Redirect("message.asp?ischange="&ischange&"&pagenum="&pagenum&"&no="&rs.pagecount)

%>