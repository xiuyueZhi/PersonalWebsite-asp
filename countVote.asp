<!-- #include file="conn.asp" -->
<%
on error resume next
if request.Cookies("alvote")<>"" then
	response.write "<script>alert('每天只能投一票!');history.go(-1);</script>"
	response.end()
end if
infoId = request.QueryString("infoId")
if infoId = "" then
	response.write "<script>alert('数据读取出错');history.go(-1);</script>"
else 
rs.open "select * from voteinfo where infoId = " & infoId,conn,1,3
if conn.errors.count>0 then
	response.write "<script>alert('数据读取出错');history.go(-1);</script>"
	response.end()
end if
if rs.eof and rs.bof then
	response.write "<script>alert('数据读取出错');history.go(-1);</script>"
else
rs("total") = rs("total")+1
rs.update
optionId = request.Form("R")
rs.close
rs.open "select * from votecontent where optionId = " & optionId,conn,1,3
rs("num") = rs("num")+1
rs.update
response.Cookies("alvote")="Yes"
response.Cookies("alvote").expires = date()+1
end if
end if

%>