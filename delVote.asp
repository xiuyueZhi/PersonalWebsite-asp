<!-- #include file="conn.asp" -->
<%
infoId = request.QueryString("infoId")
ischange = request.QueryString("ischange")
pageno=request.QueryString("pageno")
if infoId="" then
	response.write "<script>alert('投票主题不存在！');history.go(-1);</script>"
else
strsql="delete from votecontent where infoId="&infoId
conn.execute strsql
strsql="delete from voteinfo where infoId="&infoId
conn.execute strsql
rs.cursorlocation=3
rs.open "select * from voteinfo",conn,1
rs.pagesize=1
if rs.pagecount<pageno then 
	response.Redirect("active.asp?ischange="&ischange&"&pageno="&pageno-1)
else
response.Redirect("active.asp?ischange="&ischange&"&pageno="&pageno)
end if
end if
%>