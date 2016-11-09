
<%-- 
    Document   : login
    Created on : Nov 7, 2016, 9:53:36 PM
    Author     : DanQiao
--%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.sql.Connection"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html" %> 
<!DOCTYPE html>

<%
    
    session = request.getSession(false);
    if(session.getAttribute("userid")!=null){
        Connection con = null;
        PreparedStatement ps;
        ResultSet rs;
        String query;
        
        try{
                    Class.forName("com.mysql.jdbc.Driver");
                }catch(Exception e)
                {
                    System.out.println(e);
                }
        
         try{
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Healthcare", "root", "root");
                    query = "SELECT * FROM Login WHERE Login.ID = ?";
                    ps = con.prepareStatement(query);
                    ps.setString(1,session.getAttribute("userid").toString());
                    rs = ps.executeQuery();
                    if(rs.next()){
                        out.println("Welcome,"+rs.getString("Name")+"!!!");
                        out.println("<br><br> Login!!! Finally!!!");
                        
                        //create a logout button
                        out.println("<form action=\"logout.jsp\" method=\"post\">");
                        out.println("<input type=\"submit\" name=\"logout\" value=\"Logout\">");
                        out.println("</form>");
                    }
                    
                    
                }catch(SQLException e)
                {
                    System.out.println(e);
                }
        
    }
    
    
    if("POST".equalsIgnoreCase(request.getMethod()))
    {
        if(request.getParameter("login")!= null)
        {
            if(request.getParameter("login").equals("Login"))
            {
                String USERID = request.getParameter("UserID");
                String PASSWORD = request.getParameter("Password");
                String IDETIFY = request.getParameter("Charater");

                
                Connection con= null;
                PreparedStatement ps;
                ResultSet rs;
                String query;
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                }catch(Exception e)
                {
                    System.out.println(e);
                }
                
                try{
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Healthcare", "root", "root");
                    query = "SELECT * FROM Login WHERE Login.ID = ? AND Login.Password = ? AND Login.Idetify = ?";
                    ps = con.prepareStatement(query);
                    ps.setString(1, USERID);
                    ps.setString(2, PASSWORD);
                    ps.setString(3, IDETIFY);
                    rs = ps.executeQuery();
                    
                    if(rs.next())
                    {
                        //Login sucessful;
                        //creating session;
                        session = request.getSession();
                        //Start session with the help of attribute ID being unique
                        session.setAttribute("userid", USERID);
                        response.sendRedirect("login.jsp");
                        
                    }
                    
                }catch(SQLException e)
                {
                    System.out.println(e);
                }
            }
        }
    
    }


%>
<html>
    <head>
        <title>login Page</title>
    </head>
    <% Date date = new Date(); %>
    <body>
        <p>Today's date is <%= date %> </p>

        
    </body>
</html>
