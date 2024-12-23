<%@ page import="java.sql.*"%>
<%
    String name = request.getParameter("uname");
    String pass = request.getParameter("pass");

    try {
		
Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","liki");

        PreparedStatement pst = con.prepareStatement("select * from regforms where name=? and pass=?");

        pst.setString(1, name);
        pst.setString(2, pass);

        ResultSet rs = pst.executeQuery();

        if(rs.next()) {
            response.sendRedirect("home.html");
        }
        else {
            out.print("<br><br><br><center><h1>Incorrect username or password</h1><br><h1>Please register</h1></center>");
        }
    } catch(Exception e) {
        out.print(e);
    }
%>