<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
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




    <head>
        <title>Show Nurse Page</title>
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
//                    query = "SELECT b.AvailabilityID,b.Time1,b.Time2,b.Time3,b.Time4,a.CG_ID,a.CG_Name,a.CG_AvaliableID"
//                            + "FROM Caregivers a, Availability b"
//                            + "Where b.AvailabilityID = a.CG_AvaliableID";
                    query = "SELECT Caregivers.CG_ID,Caregivers.CG_Name,Availability.Time1 FROM Caregivers LEFT JOIN Availability ON Caregivers.CG_AvaliableID = Availability.AvailabilityID";
                     
                    ps = con.prepareStatement(query);
                  
                    rs = ps.executeQuery();
                    
//                    if(rs.first())
//                    {
%>
<table border="1">
    <thead>
        <tr bgcolor="#DEB887">
            <th>Caregiver_ID</th>
            <th>Caregiver_Name</th>
            <th>Caregiver_Name</th>
    </thead>
    <tbody>
        <% while (rs.next()) { %>
        <tr>
            <td><%=rs.getString("CG_ID")  %></td>
            <td><%=rs.getString("CG_Name")  %></td>
            <td><%=rs.getString("Time1")  %></td>
            
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


    

