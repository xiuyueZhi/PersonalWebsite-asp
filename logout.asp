<%
response.Cookies("cUsername")=""
session.Abandon()
response.Redirect("Login.asp")
%>