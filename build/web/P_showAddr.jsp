<%-- 
    Document   : P_showAddr
    Created on : Dec 6, 2016, 4:03:12 PM
    Author     : DanQiao
--%>



<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

    <head>
        <title>Show Address Page</title>
    </head>

<%
    
     if("POST".equalsIgnoreCase(request.getMethod())){
         String username= session.getAttribute("username").toString();
         Connection con= null;
                PreparedStatement ps;
                ResultSet rs;
                PreparedStatement ps1;
                ResultSet rs1;
                String query;
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                }catch(Exception e)
                {
                    System.out.println(e);
                }
                
                try{
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Healthcare", "root", "root");
                    
                    int index = 0;
                    String Sql="select P_ID from Patient WHERE P_Username=?";
                    ps1 = con.prepareStatement(Sql);
                    ps1.setString(1,username);
                    rs1 = ps1.executeQuery();
                    if(rs1.next()){
                        index = rs1.getInt("P_ID");
                    }else{
                        out.println("No this Patient! Please confirm that you have already fill in the infomation in this system.");
                        }
                    
                    query = "SELECT Line1,Line2,City,PostCode FROM Address WHERE P_ID=?";
                    ps = con.prepareStatement(query);
                    ps.setInt(1,index);
                    rs = ps.executeQuery();
//                    if(rs.first())
//                    {
%>
<table border="1">
    <thead>
        <tr bgcolor="#DEB887">
            <th>Username</th>
            <th>Apartment number</th>
            <th>Street</th>
            <th>City</th>
            <th>Postcode</th>
        </tr>
    </thead>
    <tbody>
        <% while (rs.next()) { %>
        <tr>
            <td><%=username%></td>
            <td><%=rs.getString("Line1")%></td>
            <td><%=rs.getString("Line2")%></td>
            <td><%=rs.getString("City")%></td>
            <td><%=rs.getString("PostCode")%></td>
        </tr>
        <% } %>
    </tbody>
</table>
    <form method="POST" action="P_Address.jsp">
        <br><br>
        <input type="submit" value="update your address" />
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
