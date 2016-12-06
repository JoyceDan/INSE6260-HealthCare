
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
                        
                        out.println("Welcome,"+rs.getString("Username")+"!!!");
                        out.println("<br><br> You register sucessfully!!! ");
                        out.println(" Please ");
                        out.println("<a href=\"index.jsp\"> Click Here</a>");
                        out.println(" to login. ");
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
                        //Start session with the help of attribute Username being unique
                        session.setAttribute("username", USERNAME);
                        if(IDENTIFY.equalsIgnoreCase("Patient")){
                        response.sendRedirect("Patient_home.jsp");
                        }
                        else if(IDENTIFY.equalsIgnoreCase("Nurse")){
                        response.sendRedirect("Nurse_home.jsp");
                        }
                        else if(IDENTIFY.equalsIgnoreCase("Agent")){
                        response.sendRedirect("Agency.jsp");
                        }
                    }
                    else{
                        out.println("Invalid Username or Password or Identify! Please ");
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
