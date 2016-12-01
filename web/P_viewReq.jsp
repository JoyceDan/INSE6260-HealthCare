<%-- 
    Document   : P_viewReq
    Created on : Nov 30, 2016, 10:54:07 PM
    Author     : DanQiao
--%>

<%@page import="java.sql.*" %>
<%@page import="java.sql.Connection"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>




    <head>
        <title>Patient Show Request Page</title>
    </head>
    
        

<%
     if("POST".equalsIgnoreCase(request.getMethod())){
         String username = session.getAttribute("username").toString();
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
                    query = "SELECT * FROM Request JOIN Status where Request.StatusID = Status.StatusID AND Username = ?";
                  
                    ps = con.prepareStatement(query);
                    ps.setString(1,username);
                    rs = ps.executeQuery();
//                     String flaga= "";
//                    while(rs.next()){
//                        if(rs.getString("BloodTest")=="1")
//                        {
//                           flaga = "BloodTest";
//                        }
//                        out.println(flaga);
//                    }
//                    if(rs.first())
//                    {
%>
<table border="1">
    <thead>
        <tr bgcolor="#DEB887">
            <th>Request_ID</th>
            <th>Patient ID</th>
            <th>Username</th>
            <th>Free on 9-10AM?</th>
            <th>Free on 11-12AM?</th>
            <th>Free on 2-3AM?</th>
            <th>Free on 4-5AM?</th>
            <th>The gender of nurse (prefer)?</th>
            <th>Ill Type</th>
            <th>Request_Status</th>
            
        </tr>
    </thead>
    <tbody>
        <% while (rs.next()) { 
             String flaga= "";
             String t1= "";
             String t2= "";
             String t3= "";
             String t4= "";
             String a = rs.getString("BloodTest");
             String b = rs.getString("DayCare");
             String c = rs.getString("BloodPressure");
            if(a.equalsIgnoreCase("1"))
                 {
                    flaga = "BloodTest";
                 }
            if(b.equalsIgnoreCase("1"))
                 {
                    flaga = "DayCare";
                 }
            if(c.equalsIgnoreCase("1"))
                 {
                    flaga = "BloodPressure";
                 }
            if(rs.getString("Time1").equalsIgnoreCase("1"))
            {
                t1 = "YES";
            }else{
                t1 = "NO";
            }
            if(rs.getString("Time2").equalsIgnoreCase("1"))
            {
                t2 = "YES";
            }else{
                t2 = "NO";
            }
            if(rs.getString("Time3").equalsIgnoreCase("1"))
            {
                t3 = "YES";
            }else{
                t3 = "NO";
            }
            if(rs.getString("Time4").equalsIgnoreCase("1"))
            {
                t4 = "YES";
            }else{
                t4 = "NO";
            }
                    
        %>
        <tr>
            <td><%=rs.getString("Request_ID")  %></td>
            <td><%=rs.getString("P_ID") %></td>
            <td><%=rs.getString("Username")%></td>
            <td><%=t1%></td>
            <td><%=t2 %></td>
            <td><%=t3%></td>
            <td><%=t4 %></td>
            <td><%=rs.getString("Gender") %></td>
            <td><%=flaga%></td>
            <td><%=rs.getString("APPstatus")%></td>
        </tr>
        <% } %>
    </tbody>
</table>
    <form name="return" action="Patient_home.jsp">
        <input type="submit" value="Return" name="Return" />
    </form>
        
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