<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%!
String greetingMsg;
String instructionMsg;

public class Greeting extends HttpServlet {

	private static final String header =  "<!DOCTYPE html>" 
										+ "<html>"
										+ "<head>" 
										+ "<meta charset='ISO-8859-1'>"
										+ "<title>Insert title here</title>"
										+ "</head>"
										+ "<body>";
	private static final String footer ="</body> </html>";
	private static final long serialVersionUID = 1L;

    public Greeting() {
        super();
    }

	 public void init()
	 {
		 instructionMsg = getInitParameter("instructionMessage");
		 greetingMsg = getInitParameter("greetingMessage");
	 }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
		String name;
		name=request.getParameter("nameField");
		java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.io.PrintWriter out = response.getWriter();
	    
		if( name== null || "".equals(name)) {
			 
			    out.println(header
						    + "<form name='nameForm' method='post' action='Greeting'>"
						    + "<div style='text-align:center'>"
							+ "<h2>"+instructionMsg+"</h2>"
							+ "<input type=text name='nameField' value=''>&nbsp"
							+ "<input type='submit' name='Submit' value='Submit'/>"
							+ "</div>"
							+ "</form>"
						    + footer);
			
		}else {
		   
		    out.println(header
					    + "<h2 style='text-align:center'>Hello "+name+"</h2>"
					    + "<h2 style='text-align:center'>"+greetingMsg+"</h2>"
					    + "<br>"
					    + "<br>"
					    + "<h3 style='text-align:center'>The current time is:</h3>"
					    + "<h3 style='text-align:center'>"+df.format(new java.util.Date())+"</h3>"
					    + "<br>"
					    + footer);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {


	
}
	
%>
<body>
    <form name='nameForm' method='get' action='Greeting'>
	    <div style='text-align:center'>
		<h2><%= instructionMsg %></h2>
		<input type=text name='nameField' value=''>&nbsp
		<input type='submit' name='Submit' value='Submit'/>
	    </div>
	</form>
	
</body>
</html>