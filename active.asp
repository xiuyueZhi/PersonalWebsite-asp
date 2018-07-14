<!DOCTYPE html >
<html >
<head>
	<meta charset="utf-8" />
	<title>动态</title>
	<link rel="stylesheet" type="text/css" href="styles/active.css">
	<link rel="stylesheet" type="text/css" href="styles/common.css">
	<link rel="stylesheet" type="text/css" href="styles/default1.css" id="css">
</head>
<body>
	<!-- #include file="conn.asp" -->
	<%
	if session("curUser")="" then
		response.Redirect("Login.asp?err=会话超时")
	end if
	ischange = request.QueryString("ischange")
	strsql = "select * from voteinfo"
	rs.cursorlocation=3
	rs.open strsql,conn,1
	%>
	<div class="big-box">
		<div class="ax">
			<div class="image"></div>
			<a  class="page">首页</a>
			<a  class="friend">好友</a>
			<a  class="active act">动态</a>
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
		<p>
			<input class="votebutton" type="button" name="newVote" value="新建投票" onclick="window.location.href='votenew.asp?ischange=<%=ischange%>' ">
		</p>
		<ul class="text">
			<%
			if rs.recordcount = 0 then
				response.write "<p>没有进行中的投票！</p>"
			else
			rs.pagesize=1
			pageno = request.QueryString("pageno")
			if pageno="" or pageno=0 then
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
	rs.AbsolutePage=pageno
	do until i=rs.pagesize or rs.eof
		i=i+1
		response.write "<li ><p class='first-active' id='first'>" & rs("title")&"</p></li>"
		%>
		<input type='hidden' value='<%=rs("state")%>' id='state'>
		
		<div class="fa">
			<form id="vote_form" action="writeVote.asp?infoId=<%=rs("infoId") %>" method="post" onsubmit="return check()">
				<ul class="choice">
					<li>
						<%
						set rsl=server.CreateObject("ADODB.RecordSet")
						rsl.cursorlocation=3
						rsl.open "select * from votecontent where infoId = "& rs("infoId"),conn,1
						response.write "<ul>"
						for j = 1 to rsl.recordcount
							response.write " <div class='checkbox"&j&" checkboxOne'> <input type='checkbox' value='" & rsl("optionId") &"' id='checkboxInput"&j&"' class='ch"&j&"' name='R'> <label for='checkboxInput"&j&"' class='checkboxlabel"&j&"'></label> <li></div> <p class='choice"&j&" option'>"& rsl("option")&"</p></li><input type='hidden' value='"&rsl.recordcount&"' id='count'/>"
							rsl.movenext
						next
						response.write "</ul>"
						%>
					</li>
				</ul>
			</div>
		</ul>
		<div class="confirm">
			<%
			if rs("state")=1 then
				%>
				<%
				response.write "<input type='submit' class='confirm-button vote' id='xz' value='投票'>"
				%>
			</form>
			<%
			if session("curUser")="admin" then
				response.write  "<button class='hid'></button><button class='confirm-button' id='look' onclick='see("&rs("infoId")&")'>查看</button><button class='confirm-button' onclick='endVote("&rs("infoId")&","&ischange&","&pageno&")'>结束</button> <button class='confirm-button' onclick='delVote("&rs("infoId")&","&ischange&","&pageno&")'>删除</button>"
			end if
		else
		response.write "<button class='hid'></button><button class='confirm-button' id='look' onclick='see("&rs("infoId")&")'>查看</button>"
		if session("curUser")="admin" then
			response.write "<button class='confirm-button' onclick='delVote("&rs("infoId")&","&ischange&")'>删除</button>"
		end if
	end if
	rs.movenext
loop
end if
%>
</div>
<br>
<br>
<br>
<p><center>
	<%
	if pageno<>1 then
		response.write "<a href=active.asp?ischange="&ischange&"&pageno=1 class='firstPage'>首页</a>"&"&nbsp;"
		response.write "<a href=active.asp?ischange="&ischange&"&pageno="&pageno-1&" class='prePage'>上一页</a>"&"&nbsp;"
	end if
	t=pageno\1
	if pageno mod 1=0 then
		t=t-1
	end if
	for i=t*1+0 to t*1+1
		if i>rs.pagecount then
			exit for
		end if
		if i=pageno then
			response.write i&"&nbsp;"
		else
		if i<>0 then
			response.write "<a href=active.asp?ischange="&ischange&"&pageno="&i&">"&i&"</a>&nbsp;"
		end if
	end if
next
if pageno<>rs.pagecount then
	response.write "<a href=active.asp?ischange="&ischange&"&pageno="&pageno+1&" class='nextPage'>下一页</a>"&"&nbsp;"
	response.write "<a href=active.asp?ischange="&ischange&"&pageno="&rs.pagecount&" class='endPage'>末页</a>"&"&nbsp;"
end if
%>
<input type="text" name="pageno" id="pageno" size="1" onkeypress="goto('<%=ischange%>');"><p class="pn"><%=pageno%>/<%=rs.pagecount%>页</p>
</center>
</p>
</div>
<input id="p" type="hidden" name="newVote" value="<%=rs.pagecount%>">
<input id="pa" type="hidden" name="note" value="1">
<div class="footer">
	<p>Copyright&copy; 2014329700007 My.Website<br><a href="mailto:webmaster@xyz.com.cn">Contact Me:Administrator</a> 
	</p>
</div>
<script src="js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="js/active.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<%
response.write "<script>window.opener.location.reload();window.close();</script>"
response.end()
%>
</body>
</html>
