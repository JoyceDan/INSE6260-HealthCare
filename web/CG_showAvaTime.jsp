<%-- 
    Document   : CG_showAvaTime
    Created on : Dec 7, 2016, 11:12:09 AM
    Author     : DanQiao
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

    <head>
        <title>Show Avaliable Time Page</title>
    </head>

<%
    
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
                    
                    
                    query = "SELECT Time1,Time2,Time3,Time4 FROM Caregivers WHERE CG_Username=?";
                    ps = con.prepareStatement(query);
                    ps.setString(1, username);
                    rs = ps.executeQuery();
//                    if(rs.first())
//                    {
%>
<table border="1">
    <thead>
        <tr bgcolor="#DEB887">
            <th>Username</th>
            <th>  9-10AM </th>
            <th> 11-12AM </th>
            <th>  2-3PM  </th>
            <th>  4-5PM  </th>
        </tr>
    </thead>
    <tbody>
        <% while (rs.next()) { %>
        <tr>
            <td><%=username%></td>
            <td><%=rs.getString("Time1")%></td>
            <td><%=rs.getString("Time2")%></td>
            <td><%=rs.getString("Time3")%></td>
            <td><%=rs.getString("Time4")%></td>
        </tr>
        <% } %>
    </tbody>
</table>
    <form method="POST" action="changeAvaliable.jsp">
        <br><br>
        <input type="submit" value="update your Avaliablity" />
    </form>
    
    <form action="Nurse_home.jsp">
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
