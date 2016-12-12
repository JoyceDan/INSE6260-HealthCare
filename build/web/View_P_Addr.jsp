<%-- 
    Document   : View_P_Addr
    Created on : Dec 12, 2016, 10:37:58 AM
    Author     : DanQiao
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


    <head>
        <title>View Patient Address Page</title>
    </head>
    
    
<%
    if("POST".equalsIgnoreCase(request.getMethod())){
        String submitid = (String)request.getParameter("button2");
        
        if(request.getParameter("view")!=null ){
            if(request.getParameter("view").equals("View_Address")){
                Connection con = null;
                    PreparedStatement ps;
                    String query;
                    ResultSet rs;
                    PreparedStatement ps1;
                    String query1;
                    ResultSet rs1;
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
                            query = "Select P_ID FROM Request where Request_ID=?";
                            ps = con.prepareStatement(query);
                            ps.setString(1, submitid);
                            rs = ps.executeQuery();
                            int patientID = 0;
                            if(rs.next()){
                                patientID = rs.getInt("P_ID");
                            }
                            else{
                                 out.println("The request isn't exsit.");
                            }
                            
                            query1 = "Select * FROM Address where P_ID=?";
                            ps1 = con.prepareStatement(query1);
                            ps1.setInt(1, patientID);
                            rs1 = ps1.executeQuery();
                            
%>

<table border="1">
    <thead>
        <tr bgcolor="#DEB887">
            <th>Patient ID</th>
            <th>Apartment Number</th>
            <th>Street</th>
            <th>City</th>
            <th>PostCode</th>
        </tr>
    </thead>
    <tbody>
        <% while (rs1.next()) {  %>
        <tr>
            <td><%=patientID%></td>
            <td><%=rs1.getString("Line1")  %></td>
            <td><%=rs1.getString("Line2")  %></td>
            <td><%=rs1.getString("City")  %></td>
            <td><%=rs1.getString("PostCode")  %></td>
        </tr>
        <% } %>
    </tbody>
</table>



<%
                            
                            out.println("<a href=\"Nurse_home.jsp\"> Click here</a>");
                            out.println(" to return Nurse Homepage.");
                        }catch(SQLException e)
                         {
                            System.out.println(e);
                         }
               
            }
        }
    }


%>


