<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="beans.StudentBean"%>
<%@page import="beans.DataBean"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Complete</title>
</head>
<body>
	<%
		StudentBean student = (StudentBean) request.getAttribute("student");
		DataBean data = (DataBean) request.getAttribute("data");
		ResultSet rSet = (ResultSet) request.getAttribute("rSet");
		ResultSetMetaData rSetMeta = (ResultSetMetaData) request.getAttribute("rSetMeta");
	%>

	<h2>
		Thank you for completing the survey,<%=student.getName()%>
	</h2>
	<h4>
		Mean =
		<%=data.getMean()%></h4>
	<h4>
		Standard Deviation =
		<%=data.getSd()%></h4>

	<h4>Students List:</h4>
	<form action="StudentDAO" method="post">
		<ul>
			<%
				request.setAttribute("rSet", rSet);
				while (rSet.next()) {
					out.print("<li><button type=\"submit\" name=\"student_button\" value=\"" + rSet.getString("id") + "\">"
							+ rSet.getString("id") + "</button></li>");
				}
			%>

		</ul>
	</form>
</body>
</html>