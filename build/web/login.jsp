
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
    if(session.getAttribute("username")!=null){
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
                    query = "SELECT * FROM Login WHERE Login.Username = ?";
                    ps = con.prepareStatement(query);
                    ps.setString(1,session.getAttribute("username").toString());
                    rs = ps.executeQuery();
                    if(rs.next()){
                        
//                        out.println("Welcome,"+rs.getString("Username")+"!!!");
//                        out.println("<br><br> Login!!! ");
//                        
//                        //create a logout button
//                        out.println("<form action=\"logout.jsp\" method=\"post\">");
//                        out.println("<input type=\"submit\" name=\"logout\" value=\"Logout\">");
//                        out.println("</form>");
//                        
//                        out.println("<br><br><a href=\"changePassword.jsp?uname="+session.getAttribute("username").toString()+"\"> Change password </a>");
//                          out.println("<form action=\"Patient_home.jsp\" method=\"post\">");
//                          out.println("<input type=\"submit\" name=\"welcome\" value=\"welcome\">");
//                          out.println("</form>");
                         
                             response.sendRedirect("Patient_home.jsp");
                        
                          
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
                String USERNAME = request.getParameter("UserName");
                String PASSWORD = request.getParameter("Password");
                String IDENTIFY = request.getParameter("Charater");

                
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
                    query = "SELECT * FROM Login WHERE Login.Username = ? AND Login.Password = ? AND Login.Identify = ?";
                    ps = con.prepareStatement(query);
                    ps.setString(1, USERNAME);
                    ps.setString(2, PASSWORD);
                    ps.setString(3, IDENTIFY);
                    rs = ps.executeQuery();
                    
                    if(rs.next())
                    {
                        //Login sucessful;
                        //creating session;
                        session = request.getSession();
                        //Start session with the help of attribute ID being unique
                        session.setAttribute("username", USERNAME);
                        response.sendRedirect("login.jsp");
                        
                    }
                    else{
                        out.println("Invalid Username or Password! Please ");
                        out.println("<a href=\"index.jsp\"> Try Again. </a>");
                    }
                    
                }catch(SQLException e)
                {
                    System.out.println(e);
                }
            }
        }
        else if (request.getParameter("registerLogin")!=null  )
        {
            if(request.getParameter("registerLogin").equals("Register"))
            {
                response.sendRedirect("register.jsp");
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
