<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*" %>

<html>
<head>
<title>top_frame</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

	<!-- ----------------------------------------------------- -->
	<!-- jQuery UI CSS, js -->
	<link rel="stylesheet" href="jquery-ui.css" type="text/css" />
	<script src="jquery.min.js"></script>
	<script src="jquery-ui.min.js"></script>
	<script language="JavaScript">
		$(function() {
			$("#datepicker1").datepicker({
				dateFormat : "yymmdd",
				changeMonth : true,
				changeYear : true,
			});
			$("#datepicker2").datepicker({
				dateFormat : "yymmdd",
				changeMonth : true,
				changeYear : true,
			});
		});
	</script>
	<!-- ----------------------------------------------------- -->

	<table cellpadding="0" cellspacing="0">

		<form action="top_frame.jsp" method="post" id="form1" target="topFrame">
		<tr>
			<td height="80" width="300">
				<b>&nbsp;* Type : <br>&nbsp;
			    <input type="radio" name="type" value="id_pw" checked="checked">ID/PASSWD
				<input type="radio" name="type" value="cookie">Cookies
				</b>
			</td>
		</tr>
		<tr>
			<td height="80" width="270">
				<div align="left">
					<font color="Black"> <b>* URL : <br>&nbsp;
							<select	name="s_url" style="width: 250px">
								<option value="" selected="selected">Select URL :</option>
								
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
	conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306", "root", "toor");
	stmt = conn.createStatement();
	rs = stmt.executeQuery("select distinct url from ibory.getpasswd");

	int cnt = 0;
	while(rs.next()) { %>
								<option value="<%= rs.getString("url") %>"><%= rs.getString("url") %></option>
<%
	}
} catch (SQLException e) {	e.printStackTrace();
} finally {
	if(rs!=null)    try {	rs.close();	} catch (SQLException e) {}
	if(stmt!=null) 	try {	stmt.close(); } catch (SQLException e) {}
	if(conn!=null)	try {	conn.close(); } catch (SQLException e) {}
}
%>
							</select>
					</b>
					</font>
				</div>
			</td>
		</tr>
		<tr>
			<td height="80" width="300">
				<div align="left">
					<b>* Date : <br>&nbsp;
					<input type="text" name="sdate" id="datepicker1" size="11" value="20161101">&nbsp;~&nbsp;</b>
					<input type="text" name="edate" id="datepicker2" size="11" value="20161201">&nbsp;<br><br>&nbsp;
					<button type="submit" form="form1" value="Submit">Search</button>
				</div>
			</td>
		</tr>
		</form>
	</table>

</body>

</html>