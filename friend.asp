<!DOCTYPE html >
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>好友</title>
</script>
<link rel="stylesheet" type="text/css" href="styles/friend.css">
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
	<div class="big-box">
		<div class="ax">
			<div class="image"></div>
			<a  class="page">首页</a>
			<a class="friend  act ">好友</a>
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
		<div class="friend-list">
			<ul class="fri-list">
				<li class="friend1" id="one"><img src="styles\image\friend1.jpg" class="friend1-photo"><p class="name1">简</p><p class="motto1">Pretend modesty often is nonsense,sometimes just is the beat around the bushboast.</p></li>
				<li class="friend2"><img src="styles\image\friend2.jpg" class="friend2-photo"><p class="name2">凯蒂</p><p class="motto2">Pretend modesty often is nonsense,sometimes just is the beat around the bushboast.</p></li>
				<li class="friend3"><img src="styles\image\friend3.jpg" class="friend3-photo"><p class="name3">珍</p><p class="motto3">Pretend modesty often is nonsense,sometimes just is the beat around the bushboast.</p></li>
			</ul>
			<div class="as1">
				<div class="friend1-box"></div>
				<div class="friend11-box">
					<p onclick="open11()" class="information1">详细信息</p>
					<p onclick="open12()" class="modify1">修改</p>
					<p class="delete" id="one">删除</p>
				</div>
			</div>
			<div class="as2">
				<div class="friend2-box"></div>
				<div class="friend22-box">
					<p onclick="open11()" class="information2">详细信息</p>
					<p onclick="open12()" class="modify2">修改</p>
					<p class="delete">删除</p>
				</div>
			</div>
			<div class="as3">
				<div class="friend3-box"></div>
				<div class="friend33-box">
					<p onclick="open11()" class="information3">详细信息</p>
					<p onclick="open12()" class="modify3">修改</p>
					<p class="delete">删除</p>
				</div>
			</div>
		</div>
	</div>
</div>
<input id="p" type="hidden" name="newVote" value="<%=rs.recordcount%>">
<input id="pa" type="hidden" name="note" value="1">
<div class="footer">
	<p>Copyright&copy; 2014329700007 My.Website<br><a href="mailto:webmaster@xyz.com.cn">Contact Me:Administrator</a> 
	</p>
</div>
<script src="js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="js/zDrag.js"></script>
<script type="text/javascript" src="js/zDialog.js"></script>
<script type="text/javascript" src="js/friend.js"></script>
<script type="text/javascript" src="js/common.js"></script>
</body>
</html>
