<%-- 
    Document   : CG_showInfo
    Created on : Nov 22, 2016, 12:41:33 AM
    Author     : DanQiao
--%>

<%@page import="java.sql.*" %>
<%@page import="java.sql.Connection"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>




    <head>
        <title>Show CG_Info Page</title>
    </head>
    
        

<%
//     out.println("Welcome,"+session.getAttribute("username")+"!!!");
     if("POST".equalsIgnoreCase(request.getMethod())){
         String username= session.getAttribute("username").toString();
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
                    query = "SELECT * FROM Caregivers WHERE CG_Username=?";
                    ps = con.prepareStatement(query);
                    ps.setString(1,username);
                    rs = ps.executeQuery();
//                    if(rs.first())
//                    {
%>
<table border="1">
    <thead>
        <tr bgcolor="#DEB887">
            <th>Nurse ID</th>
            <th>Username</th>
            <th>Realname</th>
            <th>Gender</th>
            <th>Age</th>
            <th>City</th>
            <th>Email</th>
        </tr>
    </thead>
    <tbody>
        <% while (rs.next()) { %>
        <tr>
            <td><%=rs.getString("CG_ID")  %></td>
            <td><%=rs.getString("CG_Username") %></td>
            <td><%=rs.getString("CG_Name")%></td>
            <td><%=rs.getString("CG_Gender")  %></td>
            <td><%=rs.getString("CG_Age") %></td>
            <td><%=rs.getString("CG_Location")%></td>
             <td><%=rs.getString("CG_ContactEmail")%></td>
        </tr>
        <% } %>
    </tbody>
</table>
        <form action="Nurse_home.jsp">
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
