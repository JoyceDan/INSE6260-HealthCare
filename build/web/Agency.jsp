<%-- 
    Document   : logout
    Created on : Nov 8, 2016, 9:10:49 PM
    Author     : DanQiao
--%>

<%@page import="java.sql.*" %>
<%@page import="java.sql.Connection"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
     if("POST".equalsIgnoreCase(request.getMethod())){
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
                    query = "SELECT * FROM Request";
                    ps = con.prepareStatement(query);
                    rs = ps.executeQuery();
                    
                    if(rs.next())
                    {
                        System.out.println(rs.getString("Request_ID"));

                    }
                    else{
                        
                    }
                    
                }catch(SQLException e)
                {
                    System.out.println(e);
                }
            }
%>


<html>
    <head>
        <title>Agency Page</title>
    </head>
    <body>
<!--        <form method="POST" name="form1" action=Agencypage.jsp> -->
        <form method="POST" name="form1">
        <input type="submit" value="Display all Request by patients" name="DisplayRequest" />
        </form>
        <br><br>
        <input type="submit" value="Display all nurses" name="DisplayNurse" />
        <br><br>
        <input type="submit" value="Run" name="Run" />
        
    </body>
</html>
