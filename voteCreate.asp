<!-- #include file="conn.asp" -->
<%
topic=request.Form("topic")
ischange=request.QueryString("ischange")
dim o()
num=request.QueryString("optionNum")
if num="" then
	response.write "<script>alert('参数错误！');history.go(-1);</script>"
else
if isnumeric(num) then
	redim o(num)
	for i = 1 to num
		o(i)=request.Form("option" & i)
	next
	rs.open "select * from voteinfo",conn,1,3
	rs.addnew
	rs("title")=topic
	rs("total")=0
	rs("state")=1
	rs.update
	rs.close
	rs.open "select * from voteinfo order by infoId desc",conn,1,3
	infoId = rs("infoId")
	rs.close
	rs.open "select * from votecontent",conn,1,3
	for i =1 to num
		rs.addnew
		rs("option")=o(i)
		rs("infoId")=infoId
		rs("num")=0
		rs.update
	next
	rs.close
	rs.cursorlocation=3
	rs.open "select * from voteinfo",conn,1
	rs.pagesize=1
	response.Redirect("active.asp?ischange="&ischange&"&pageno="&rs.recordcount)
else
response.write "<script>alert('参数错误!');history.go(-1);</script>"
end if
end if
%>