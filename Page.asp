<!DOCTYPE html >
<html >
<head>
	<meta charset="utf-8" />
	<title>首页</title>
	<link rel="stylesheet" type="text/css" href="styles/page.css">
	<link rel="stylesheet" type="text/css" href="styles/common.css">
	<link rel="stylesheet" type="text/css" href="styles/default1.css" id="css">
</head>
<body>
	<!-- #include file="conn.asp" -->
	<%
	if session("curUser")="" then
		response.Redirect("Login.asp?err=会话超时")
	end if
	strsql = "select * from voteinfo"
	rs.cursorlocation=3
	rs.open strsql,conn,1
	%>
	<div class="big-box" id="bg">
		<div class="ax">
			<div class="image"></div>
			<a class="page  act ">首页</a>
			<a  class="friend">好友</a>
			<a  class="active">动态</a>
			<a  class="message">留言</a>
		</div>
		<div class="cicle">
			<img src="styles\image\photo.png" class="photo">
		</div>
		<div class="as">
			<div class="non-box">
			</div>
			<div class="none-box">
				<p class="name">昵称:<%=session("curUser")%></p>
				<p class="sex">性别:女</p>
				<p class="nature">个性:自信 优雅</p>
				<p class="address">IP:<%=request.ServerVariables("REMOTE_ADDR")%></p>
				<a href="change.html" class="set">换肤</a>
				<a href="#" class="exit" onclick="exit();">退出</a>
			</div>
		</div>
		<div class="line"></div>
		<ul class="text">
			<%
			if rs.recordcount = 0 then
				response.write "<p>没有进行中的投票！</p>"
			else
			rs.pagesize=3
			pageno = request.QueryString("pageno")
			if pageno="" then
				pgeno=1
			else
			if isNumeric(pageno) then
				pageno=cint(pageno)
				if pageno>rs.pagecount or pageno<0 then
					pageno=1
				end if
			else
			pageno=1
		end if
	end if
		do until i=rs.pagesize or rs.eof
			i=i+1
			response.write "<li><a id='first-active' href='JavaScript:void(0)' class='title"&i&"'>" & rs("title")&"</a></li>"
			%>
			<div class="list<%=i%>" id="list">
				<%
				set rsl=server.CreateObject("ADODB.RecordSet")
				rsl.cursorlocation=3
				rsl.open "select * from votecontent where infoId = "& rs("infoId"),conn,1
				response.write "<ul>"
				for j = 1 to rsl.recordcount
					response.write "<li><p class='choice"&j&"'>"& rsl("option")&"</p></li>"
					rsl.movenext
				next
				response.write "</ul>"
				%>
			</div>
			<%
			rs.movenext
		loop
	end if
	%>
</ul>
</div>
<input id="p" type="hidden" name="newVote" value="<%=rs.recordcount%>">
<input id="pa" type="hidden" name="note" value="1">
<div class="footer">
	<p>Copyright&copy; 2014329700007 My.Website<br><a href="mailto:webmaster@xyz.com.cn">Contact Me:Administrator</a> 
	</p>
</div>
<script src="js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/page.js"></script>
<script type="text/javascript" src="js/common.js"></script>
</body>
</html>
