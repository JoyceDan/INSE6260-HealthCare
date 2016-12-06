<%-- 
    Document   : changeAvaliable
    Created on : Dec 5, 2016, 7:52:45 PM
    Author     : DanQiao
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    if("POST".equalsIgnoreCase(request.getMethod())){
        if(request.getParameter("submit")!=null ){
            if(request.getParameter("submit").equals("Submit")){
                String time1= request.getParameter("Time1");
                String time2= request.getParameter("Time2");
                String time3= request.getParameter("Time3");
                String time4= request.getParameter("Time4");
                String username= session.getAttribute("username").toString();
                
                if((!time1.isEmpty())&&(!time2.isEmpty())&&(!time3.isEmpty())&&(!time4.isEmpty())){
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
                            query = "update Caregivers set Time1=?,Time2=?,Time3=?,Time4=? where CG_Username=?";
                            ps = con.prepareStatement(query);
                            ps.setString(1, time1);
                            ps.setString(2, time2);
                            ps.setString(3, time3);
                            ps.setString(4, time4);
                            ps.setString(5, username);
                            ps.executeUpdate();
                            out.println(" Update Successfully... Please ");
                        }catch(SQLException e)
                         {
                            System.out.println(e);
                         }
               
            
                }else{
                    out.println("every blank needs to be filled in! Please ");
                }
                
            }
        }
    }

%>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="CSS_style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nurse change the avaliable time Page</title>
    </head>
    <body>
        <form action="" method="POST">
            <table border="1">
                <thead>
                    <tr>
                        <th> Free Time</th>
                        <th> Yes/No </th>
                    </tr>
                </thead>
                <tbody>
                    
                    
                    <tr>
                        <td>Free between 9-10 AM:</td>
                        <td><input type="checkbox" name="Time1" value="1" />Yes <input type="checkbox" name="Time1" value="0" /> No</td>
                    </tr>
                    <tr>
                        <td>Free between 11-12 AM:</td>
                        <td><input type="checkbox" name="Time2" value="1" />Yes <input type="checkbox" name="Time2" value="0" /> No</td>
                    </tr>
                    <tr>
                        <td>Free between 2-3 PM:</td>
                        <td><input type="checkbox" name="Time3" value="1" />Yes <input type="checkbox" name="Time3" value="0" /> No</td>
                    </tr>
                    <tr>
                        <td>Free between 4-5 PM:</td>
                        <td><input type="checkbox" name="Time4" value="1" />Yes <input type="checkbox" name="Time4" value="0" /> No</td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Submit" name="submit" />

        </form>
    </body>
</html>
