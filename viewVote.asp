<!DOCTYPE HTML>
<HTML>
	<HEAD>
		<TITLE>投票结果</TITLE>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="">
	</HEAD>
	<body>
		<!-- #include file="conn.asp" -->
		<%
		infoId = request.QueryString("infoId")
		if infoId = "" then
			response.write "<script>alert('投票主题不存在！');history.go(-1);</script>"
			response.end()
		end if
		strsql="select * from voteinfo where infoId="&infoId
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
				if rs("total")=0 or rs("total")=" " then
					response.write "<h1>还没有开始的投票！</h1>"
					response.end()
				end if
				%>
				<h1> <%=rs("title") %></h1>
			</div> 

			<div class="voteitems">
				<%
				set rsl=server.CreateObject("ADODB.RecordSet")
				rsl.cursorlocation=3
				rsl.open "select * from votecontent where infoId = "& rs("infoId"),conn,1
				if rsl.recordcount=0 then 
					response.write "<p>选项未设置</p>"
					response.end()
				end if
				randomize
				for i = 1 to rsl.recordcount
					r=int(rnd()*256)
					g=int(rnd()*256)
					b=int(rnd()*256)
					response.write "<p><span style='float:left;width:150px;'>"& rsl("option")& "</span><span style='float:left;width:200px;'><span style='float:left;background-color:rgb("&r&","&g&","&b&");width: " & rsl("num")/rs("total") * 100 & "px;'>&nbsp;</span></span><span>" & rsl("num") & "(" & FormatNumber(rsl("num")/rs("total")*100,1) & "%)</span> </p>"
					rsl.movenext
				next
				%>
			</div>
			<input class="votebutton" type="button" name="newVote" value="返回" onclick="history.go(-1);">
		</div>
	</body>
	</html>