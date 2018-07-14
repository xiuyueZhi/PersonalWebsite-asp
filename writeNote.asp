<!-- #include file="conn.asp" -->
<%
content=request.Form("content")
ischange=request.QueryString("ischange")
rs.cursorlocation=3
rs.open "select * from note",conn,1,3
rs.addnew
rs("title")=left(content,5)
rs("content")=content
rs("notetime")=now()
rs("username")=session("curUser")
rs("ip")=request.ServerVariables("REMOTE_ADDR")
rs("root")=0
rs.update
rs.close
rs.open "select * from note where root=0",conn,1
rs.pagesize=3
response.Redirect("message.asp?ischange="&ischange&"&pagenum="&rs.pagecount)

%>