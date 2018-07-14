<!DOCTYPE HTML>
<HTML>
	<HEAD>
		<TITLE>详细信息</TITLE>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="">
		<script src="js/jquery-1.9.0.min.js"></script>
	</HEAD>

	<body>
		<!--#include file="conn.asp" -->
		<%
		noteId = request.QueryString("noteId")
		strsql = "select * from note where noteId="&noteId
		rs.cursorlocation=3
		rs.open strsql,conn,1
		username = rs("username")
		set rsm=server.CreateObject("ADODB.RecordSet")
		rsm.cursorlocation=3
		rsm.open "select * from user where username='"&username&"'",conn,1
		%>
		<div class="infor-box">
			<p class="name">昵称&nbsp;&nbsp;:&nbsp;<%=rs("username")%></p>
			<p class="email">邮箱&nbsp;&nbsp;:&nbsp;<%=rsm("email")%></p>
			<p class="address">IP地址:&nbsp;<%=rs("ip")%></p>
		</div>

	</body>


	</html>