<!-- #include file="conn.asp" -->
<%
infoId = request.QueryString("infoId")
if infoId = "" then
	response.write "<script>alert('投票主题不存在！');history.go(-1);</script>"
	response.end()
end if
strsql = "select * from voteinfo where infoId="&infoId
rs.cursorlocation=3
rs.open strsql,conn,1
%>

<div class="voteboard">
	<div class="voteQuestion">
		<%
		if rs.recordcount=0 then
			response.write "<h1>还没有开始的投票！</h1>"
			response.end()
		end if
		%>

		<h1><%= rs("title") %></h1>

	</div>

	<div class="voteitems">
		<form id="vote_form" action="writeVote.asp?infoId=<%=rs("infoId") %>" method="post">
			<%
			set rsl = server.createobject("ADODB.RecordSet")
			rsl.cursorlocation=3
			rsl.open "select * from votecontent where infoId ="&rs("infoId"),conn,1
			if rsl.bof and rsl.eof then
				response.write "选项未设置"
				response.end()
			end if 
			for i=1 to rsl.recordcount
				if i=1 then
					response.write "<p><input type='radio' name='R' value='" & rsl("optionId") &"' checked='checked'>"& rsl("option") &"</p>"
				else
				response.write "<p><input type='radio' name='R' value='" & rsl("optionId") &" '>"& rsl("option") &"</p>"
			end if
			rsl.movenext 
		next
		%>

		<p>
			<input type="submit" class="votebutton" value="投票" name="submit">
			<input type="submit" class="votebutton" value="查看" name="view" onclick="window.location.href='view.asp'">

		</p>
	</form>


</div>


</div>