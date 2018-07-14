<%@ codepage=65001%>
<% Response.CodePage=65001%>  
<% Response.Charset="UTF-8" %>
<%     
strconnection="driver={mysql odbc 5.3 ANSI driver};database=message;server=localhost;PORT=3306;uid=root;password=root"  
set conn = server.createobject("adodb.connection") 
conn.open strconnection
set rs=server.createobject("ADODB.RecordSet")
%>   
