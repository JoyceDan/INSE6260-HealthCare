<%-- 
    Document   : complog
    Created on : Dec 5, 2016, 10:35:31 PM
    Author     : DanQiao
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if("POST".equalsIgnoreCase(request.getMethod())){
        String submitid = (String)request.getParameter("button");
        out.println(submitid);
        if(request.getParameter("yes")!=null ){
            if(request.getParameter("yes").equals("Yes")){
                Connection con = null;
                    PreparedStatement ps;
                    ResultSet rs;
                    String query;
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
//                            query = "update Appointments set StatusID=1 where CG_Username=?";
//                            ps = con.prepareStatement(query);
//                            
//                            ps.executeUpdate();
//                            out.println(" Update Successfully... Please ");
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
        <title>Nurse cancel Page</title>
    </head>
    <body>
        <h1>Are you sure to Completed this appointment???</h1>
        <form name="Yes" method="POST">
        <input type="submit" value="Yes" name="yes" />
        </form>
    </body>
</html>
