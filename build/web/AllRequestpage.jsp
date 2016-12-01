<%-- 
    Document   : AllRequestpage
    Created on : Nov 8, 2016, 9:10:49 PM
    Author     : DanQiao
--%>

<%@page import="java.sql.*" %>
<%@page import="java.sql.Connection"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>




    <head>
        <title>Show Request Page</title>
    </head>
    
        

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
                    query = "SELECT * FROM Request INNER JOIN Status ON Request.StatusID=Status.StatusID";
                    ps = con.prepareStatement(query);
                    rs = ps.executeQuery();
                    
//                    if(rs.first())
//                    {
%>
<table border="1">
    <thead>
        <tr bgcolor="#DEB887">
            <th>Request_ID</th>
            <th>Patient ID</th>
            <th>Username</th>
            <th>9-10AM?</th>
            <th>11-12AM?</th>
            <th>2-3PM?</th>
            <th>4-5PM?</th>
            <th>Gender</th>
            <th>Blood Test?</th>
            <th>Day Care?</th>
            <th>Blood Pressure</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        <% while (rs.next()) { %>
        <tr>
            <td><%=rs.getString("Request_ID")  %></td>
            <td><%=rs.getString("P_ID") %></td>
            <td><%=rs.getString("Username")  %></td>
            <td><%=rs.getString("Time1") %></td>
            <td><%=rs.getString("Time2")  %></td>
            <td><%=rs.getString("Time3") %></td>
            <td><%=rs.getString("Time4")  %></td>
            <td><%=rs.getString("Gender") %></td>
            <td><%=rs.getString("BloodTest")  %></td>
            <td><%=rs.getString("DayCare") %></td>
            <td><%=rs.getString("BloodPressure")  %></td>
            <td><%=rs.getString("APPstatus")%></td>
        </tr>
        <% } %>
    </tbody>
</table>

<%
//                        System.out.println(rs.getInt("Request_ID"));
//                        System.out.println(rs.getString("P_ID"));

//                    }
//                    else{
//                        
//                    }
                    
                }catch(SQLException e)
                {
                    System.out.println(e);
                }
            }
%>


    

