<%-- 
    Document   : P_showInfo
    Created on : Nov 22, 2016, 12:24:49 AM
    Author     : DanQiao
--%>

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
        <title>Show Info Page</title>
    </head>
    
        

<%
    
     if("POST".equalsIgnoreCase(request.getMethod())){
         String username= session.getAttribute("username").toString();
         Connection con= null;
                PreparedStatement ps;
                ResultSet rs;
                String query;
                out.println("Welcome!!!");
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                }catch(Exception e)
                {
                    System.out.println(e);
                }
                
                try{
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Healthcare", "root", "root");
                    query = "SELECT * FROM Patient WHERE P_Username=?";
                    ps = con.prepareStatement(query);
                    ps.setString(1,username);
                    rs = ps.executeQuery();
//                    if(rs.first())
//                    {
%>
<table border="1">
    <thead>
        <tr bgcolor="#DEB887">
            <th>Patient ID</th>
            <th>Username</th>
            <th>Realname</th>
            <th>Gender</th>
            <th>Age</th>
            <th>Email</th>
        </tr>
    </thead>
    <tbody>
        <% while (rs.next()) { %>
        <tr>
            <td><%=rs.getString("P_ID")  %></td>
            <td><%=rs.getString("P_Username") %></td>
            <td><%=rs.getString("P_Name")%></td>
            <td><%=rs.getString("P_Gender")  %></td>
            <td><%=rs.getString("P_Age") %></td>
            <td><%=rs.getString("P_Email")%></td>
        </tr>
        <% } %>
    </tbody>
</table>
    <form method="POST" action="P_Info.jsp">
        <br><br>
        <input type="submit" value="update infomation" />
    </form>
    
    <form action="Patient_home.jsp">
        <br><br>
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


    


