<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!
	String greetingMsg;
	String instructionMsg;
	String name;
    public void jspInit () {
		 instructionMsg = getInitParameter("instructionMessage");
		 greetingMsg = getInitParameter("greetingMessage");
   	}%>
	<% 
		name=request.getParameter("nameField");
		java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    if( name== null || "".equals(name)) {
		%>
				<form name='nameForm' method='post'>
				<div style='text-align:center'>
				<h2><%=instructionMsg %></h2>
				<input type=text name='nameField' value=''>&nbsp
				<input type='submit' name='Submit' value='Submit'/>
				</div>
				</form>
	    <% }else {%>
			<h2 style='text-align:center'>Hello <%=name %></h2>
			<h2 style='text-align:center'><%=greetingMsg %></h2>
			<br>
			<br>
			<h3 style='text-align:center'>The current time is:</h3>
			<h3 style='text-align:center'><%=df.format(new java.util.Date()) %></h3>
			<br>
		<%}%>
</body>
</html>