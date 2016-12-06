<%-- 
    Document   : cancellog_P
    Created on : Dec 6, 2016, 1:14:51 PM
    Author     : DanQiao
--%>


<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if("POST".equalsIgnoreCase(request.getMethod())){
        String submitid = (String)request.getParameter("button1");
        
        if(request.getParameter("yes")!=null ){
            if(request.getParameter("yes").equals("Yes")){
                Connection con = null;
                    PreparedStatement ps;
                    String query;
                    PreparedStatement ps1;
                    String query1;
                    try
                    {
                        Class.forName("com.mysql.jdbc.Driver");
                    }catch(Exception e)
                    {
                        System.out.println(e);
                    }
                    try
                        {
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Healthcare", "root", "root");
                            query = "update Appointments set StatusID=3 where Request_ID=?";
                            ps = con.prepareStatement(query);
                            ps.setString(1, submitid);
                            ps.executeUpdate();
                            
                            query1 = "update Request set StatusID=3 where Request_ID=?";
                            ps1 = con.prepareStatement(query1);
                            ps1.setString(1, submitid);
                            ps1.executeUpdate();
                            
                            out.println(" Cancel Successfully... Please");
                            out.println("<a href=\"Patient_home.jsp\"> Click here</a>");
                            out.println(" to return Patient home page.");
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient cancel Page</title>
    </head>
    <body>
        <h1>Are you sure to Cancel this appointment???</h1>
        <form name="Yes" method="POST">
        <input type="submit" value="Yes" name="yes" />
        </form>
        <form action="Patient_home.jsp">
            <input type="submit" value="Return the home page" name="Return" />
        </form>
    </body>
</html>