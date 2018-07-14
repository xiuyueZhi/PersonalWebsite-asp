<!DOCTYPE HTML>
<HTML>
	<HEAD>
		<TITLE>投票</TITLE>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="">
		<script src="js/jquery-1.9.0.min.js"></script>
	</HEAD>
	<%
	if session("curUser")="" then
		response.write "<script>window.opener.location.reload();window.close();</script>"
		response.end()
	end if
	if session("curUser")<>"admin" then
		response.write "<script>alert('无此权限!');history.go(-1);</script>"
		response.end()
	end if
	ischange=request.QueryString("ischange")
	%>
	<script type="text/javascript">
		var optionNum = 4;
		$(document).on('click','.delOption',function(){
			optionNum--;
			$(this).parent().remove();
		});
		$(document).ready(function(){
			$('#addOption').click(function(){
				var addHtml;
				optionNum++;
				addHtml="<p>选项"+optionNum+"：<input name='option"+optionNum+"' type='text' size='50'><span class='delOption' style='cursor:pointer'>×</span></p>"
				$(addHtml).insertBefore($('#aArea'));
			});
			$('#saveOption').click(function(){
				var flag=true;
				var ischange=document.getElementById("ischange").value;
				$.each($('input[type=text]'),function(i,item){
					if($(item).val()=='')
					{
						alert('所有选项内容必填');
						flag=false;
						return false;
					}
				});
				if(flag){
					$("#vote_form").attr('action','voteCreate.asp?ischange='+ischange+'&optionNum='+optionNum);
					$("#vote_form").submit();
				}
			});
		});
	</script>
	<body>
		<form id="vote_form" action="" method="post">
			<p><center>
				<div class="voteboard" style="margin-top: 120px;">
					<div class="voteQuestion">
						<p>标题*：<input type="text" name="topic" size="50"></p>
					</div>
					<div class="voteitems">
						<p>
							选项1：<input type="text" name="option1" size="50">
						</p>
						<p>
							选项2：<input type="text" name="option2" size="50">
						</p>
						<p>
							选项3：<input type="text" name="option3" size="50">
						</p>
						<p>
							选项4：<input type="text" name="option4" size="50">
						</p>
						<p id="aArea">
							<input type="button" class="votebutton" value="+新增选项" name="addOption" id="addOption">
							<input type="button" class="votebutton" value="保存" name="saveOption" id="saveOption">
							<input type="hidden"  value="<%=ischange%>" id="ischange" >
							<!--<input type="button" class="votebutton" value="返回" name="view" onclick="history.go(-1);"><-->
						</p>
					</div>
				</div>
			</center></p>
		</form>
	</body>


	</html>