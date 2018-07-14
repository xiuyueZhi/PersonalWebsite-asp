<!DOCTYPE html >
<html >
<head>
	<meta charset="utf-8" />
	<title>留言</title>
	<link rel="stylesheet" type="text/css" href="styles/message.css">
	<link rel="stylesheet" type="text/css" href="styles/common.css">
	<link rel="stylesheet" type="text/css" href="styles/default1.css" id="css">
</head>
<body>
	<!-- #include file="conn.asp" -->
	<%
	if session("curUser")="" then
		response.Redirect("Login.asp?err=会话超时")
	end if
	ischange=request.QueryString("ischange")
	pageno = request.QueryString("pageno")
	strsql = "select * from voteinfo"
	rs.cursorlocation=3
	rs.open strsql,conn,1
	%>
	<div class="big-box">
		<div class="ax">
			<div class="image"></div>
			<a  class="page">首页</a>
			<a  class="friend">好友</a>
			<a  class="active">动态</a>
			<a class="message  act ">留言</a>
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
		<div class="front-me"><p class="msg">小伙伴们，把想对他/她说的写下来吧！</p></div>
		<form id="note_form" action="writeNote.asp?ischange=<%=ischange%>" method="post">
			<textarea cols="50" rows="5" id="textarea" name="content" onKeyDown="textdown(event)" onKeyUp="textup()" onfocus="if(value=='留下点什么吧......'){value=''}" onblur="if (value ==''){value='留下点什么吧......'}">留下点什么吧......</textarea>
			<div class="friends"><button class="friend-text" disabled="false">添加好友</button></div>
			<div class="messg"><input type="submit" class="msg-text" value="留言"></div>
		</form>
		<%
		host=request.Form("host")
		txt=request.Form("txt")
		%>
		<%
		set rsm=server.CreateObject("ADODB.RecordSet")
		rsm.cursorlocation=3
		if host="" and txt="" then
			rsm.open "select * from note where root=0",conn,1
		else
		if host<>"" and txt="" then
			rsm.open "select * from note where root=0 and username='"&host&"'",conn,1
		else
		if host="" and txt<>"" then
			rsm.open "select * from note where root=0 and title like '%"&txt&"%'",conn,1
		else
		if host<>"" and txt<>"" then
			rsm.open "select * from note where root=0 and username='"&host&"' and title like '%"&txt&"%'",conn,1
		end if
	end if
end if
end if
if rsm.recordcount = 0 then
	response.write "<p>还没有人留言哦！</p>"
else
rsm.pagesize=3
pagenum = request.QueryString("pagenum")
if pagenum="" then
	pagenum=1
else
if isNumeric(pagenum) then
	pagenum=cint(pagenum)
	if pagenum>rsm.pagecount or pagenum<0 then
		pagenum=1
	end if
else
pagenum=1
end if
end if
rsm.AbsolutePage=pagenum
%>
<form action="" method="post">
	<div class="search">
		留言者：<input type="text" name="host" value="<%=host%>">&nbsp;
		留言标题：<input type="text" name="txt" value="<%=txt%>">
		<input type="submit" name="searchBox" value="搜索">
	</div>
</form>
<div class="num">
	<ul class="text">
		<%
		do until i=rsm.pagesize or rsm.eof
			i=i+1
			response.write "<li type='circle'><a id='note-title' href='JavaScript:void(0)' class='title"&i&" first-active' style='font-size:16px;'>" & rsm("title")&"</a>"
			response.write  "<span style='float:right;color:black;'>[<a class='replay"&i&"' href='JavaScript:void(0)' style='font-size:16px;'>回复</a>]"
			if session("curUser")="admin" or rsm("username")=session("curUser") then
				response.write "[<a class='del' href='JavaScript:void(0)' onclick='delNote("&rsm("noteId")&","&ischange&","&pagenum&")' style='font-size:16px;'>删除</a>]"
			end if
			response.write "</span></li>"
			response.write "<p id='content' class='choice"&i&"'>&nbsp;&nbsp;"& rsm("content")&"</p>"
			%>
			<form id="note_form" action="repNote.asp?ischange=<%=ischange%>&noteId=<%=rsm("noteId")%>&pagenum=<%=pagenum%>" onsubmit="return doSubmit();" method="post">
				<div class="hide<%=i%>">
					<%
					set rep=server.CreateObject("ADODB.RecordSet")
					j=0
					root = rsm("noteId")
					rep.cursorlocation=3
					rep.open "select * from note where root="&root,conn,1
					rep.pagesize=3
					no = request.QueryString("no")
					response.write "<p style='font-size:13px;'>共有"&rep.recordcount&"条回复</p>"
					if rep.recordcount = 0 then
						response.write "<p style='font-size:13px;'>成为第一个回复的人吧！</p>"
					else
					if no="" or no=0 then
						no=1
					else
					if isNumeric(no) then
						no=cint(no)
						if no>rep.pagecount or no<0 then
							no=1
						end if
					else
					no=1
				end if
			end if
			rep.AbsolutePage=no
			do until j=rep.pagesize or rep.eof
				j=j+1
				response.write "<a href='JavaScript:void(0)' onclick='openDetail("&rep("noteId")&")' class='replayer' name='replayer' style='font-size:13px;'>"&rep("username")&"</a><font size='2'>("&rep("ip")&"):&nbsp;&nbsp;"&rep("notetime")&"</font>"
				if session("curUser")=rep("username") or session("curUser")="admin" then
					response.write "<span style='float:right;'>[<a class='dell' href='JavaScript:void(0)' onclick='delNote2("&rep("noteId")&","&ischange&","&pagenum&","&no&","&root&")' style='font-size:13px;'>删除</a>]</span>"
				end if
				response.write "<p class='repcontent' style='font-size:13px;'>"&rep("content")&"</p>"
				rep.movenext
			loop
			%>
			<p><center>
				<%
				if no<>1 then
					response.write "<a href=message.asp?ischange="&ischange&"&pagenum="&pagenum&"&no=1 class='first-Page' style='font-size:13px;'>首页</a>"&"&nbsp;"
					response.write "<a href=message.asp?ischange="&ischange&"&pagenum="&pagenum&"&no="&no-1&" class='pre-Page' style='font-size:13px;'><<</a>"&"&nbsp;"
				end if
				t=no\3
				if no mod 3=0 then
					t=t-1
				end if
				for j=t*3+0 to t*3+3
					if j>rep.pagecount then
						exit for
					end if
					if j=no then
						response.write "<font size='2'>"&j&"</font>&nbsp;"
					else
					if j<>0 then
						response.write "<a href=message.asp?ischange="&ischange&"&pagenum="&pagenum&"&no="&j&" style='font-size:13px;'>"&j&"</a>&nbsp;"
					end if
				end if
			next
			if no<>rep.pagecount then
				response.write "<a href=message.asp?ischange="&ischange&"&pagenum="&pagenum&"&no="&no+1&" class='next-Page' style='font-size:13px;'>>></a>"&"&nbsp;"
				response.write "<a href=message.asp?ischange="&ischange&"&pagenum="&pagenum&"&no="&rep.pagecount&" class='end-Page' style='font-size:13px;'>末页</a>"&"&nbsp;"
			end if
			%>
			<p class="pn" style='font-size:13px;'><%=no%>/<%=rep.pagecount%>页</p>
			<input id="no" type="hidden" name="note" value="<%=no%>">
		</center>
	</p>
	<% end if %>
</div>
<div class="huifu<%=i%>">
	<input type="text" name="replay" value="回复："onfocus="if (value =='回复：'){value =''}"onblur="if (value ==''){value='回复：'}"/>  
	<input type="button" name="confirm" onclick="this.form.submit()" value="发表">
</div>
</form>
<%
rsm.movenext
loop
%>
<p><center>
	<%
	if pagenum<>1 then
		response.write "<a href=message.asp?ischange="&ischange&"&pagenum=1 class='firstPage'>首页</a>"&"&nbsp;"
		response.write "<a href=message.asp?ischange="&ischange&"&pagenum="&pagenum-1&" class='prePage'>上一页</a>"&"&nbsp;"
	end if
	t=pagenum\3
	if pagenum mod 3=0 then
		t=t-1
	end if
	for i=t*3+0 to t*3+3
		if i>rsm.pagecount then
			exit for
		end if
		if i=pagenum then
			response.write i&"&nbsp;"
		else
		if i<>0 then
			response.write "<a href=message.asp?ischange="&ischange&"&pagenum="&i&">"&i&"</a>&nbsp;"
		end if
	end if
next
if pagenum<>rsm.pagecount then
	response.write "<a href=message.asp?ischange="&ischange&"&pagenum="&pagenum+1&" class='nextPage' >下一页</a>"&"&nbsp;"
	response.write "<a href=message.asp?ischange="&ischange&"&pagenum="&rsm.pagecount&" class='endPage'>末页</a>"&"&nbsp;"
end if
%>
<input type="text" name="pagenum" id="pagenum" size="1" onkeypress="goto('<%=ischange%>');"><p class="pn"><%=pagenum%>/<%=rsm.pagecount%>页</p>
<input type="text" style="display:none" value="此处的input删掉然后回车按钮就会触发提交" />
</center>
</p>
<% end if %>
</ul>
</div>
</div>
<input id="pa" type="hidden" name="note" value="<%=pagenum%>">
<input id="p" type="hidden" name="newVote" value="<%=rs.recordcount%>">
<div class="footer">
	<p>Copyright&copy; 2014329700007 My.Website<br><a href="mailto:webmaster@xyz.com.cn">Contact Me:Administrator</a> 
	</p>
</div>
<script src="js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="js/zDrag.js"></script>
<script type="text/javascript" src="js/zDialog.js"></script>
<script type="text/javascript" src="js/message.js"></script>
<script type="text/javascript" src="js/common.js"></script>
</body>
</html>
