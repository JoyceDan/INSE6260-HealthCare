<%-- 
    Document   : CG_viewJob
    Created on : Dec 5, 2016, 9:08:17 PM
    Author     : DanQiao
--%>

<%@page import="java.sql.*" %>
<%@page import="java.sql.Connection"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>




    <head>
        <title>Nurse view all job Page</title>
    </head>
    
        

<%
     if("POST".equalsIgnoreCase(request.getMethod())){
      
            String user = session.getAttribute("username").toString() ;
            
            Connection con= null;
                PreparedStatement ps;
                ResultSet rs;
                String query;
                PreparedStatement ps1;
                ResultSet rs1;
                String query1;
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                }catch(Exception e)
                {
                    System.out.println(e);
                }
                
                try{
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Healthcare", "root", "root");
                    query ="SELECT CG_ID from Caregivers Where CG_Username = ? ";
                    ps = con.prepareStatement(query);
                    ps.setString(1, user);
                    rs = ps.executeQuery();
                    int indexID = 0;
                    if(rs.next()){
                                    indexID = rs.getInt("CG_ID");
                                }else{
                                   out.println("No this Nurse");
                                }
                   
                    query1 = "SELECT * FROM Appointments WHERE NurseID= ? ";
                    ps1 = con.prepareStatement(query1);
                    ps1.setInt(1, indexID);
                    rs1 = ps1.executeQuery();
                    
//                    if(rs.first())
//                    {
%>
<table border="1">
    <thead>
        <tr bgcolor="#DEB887">
            <th>Appointment_ID</th>
            <th>Final_Time</th>
            <th>Request_ID</th>
            <th>Status</th>
            <th>Option1</th>
            <th>Option2</th>
        </tr>
    </thead>
    <tbody>
        <% while (rs1.next()) {
            String a = "";
            String time = rs1.getString("Final_Time");
            String idn = rs1.getString("Request_ID");
//            session = request.getSession();
//            session.setAttribute("submitid", idn);
            
            if(time.endsWith("9")){
                a = "9-10AM";
            }
            if(time.endsWith("11")){
                a = "11-12AM";
            }
            if(time.endsWith("2")){
                a = "2-3PM";
            }
            if(time.endsWith("9")){
                a = "4-5PM";
            }
        %>
        <tr>
            <td><%=rs1.getString("AppointmentID")  %></td>
            <td><%=a%></td>
            <td><%=rs1.getString("Request_ID")  %></td>
            <td>Allocated</td>
            <td>
                <form action="cancellog.jsp" method="POST">
                <input type="submit" value="Cancel" name="cancel" />
                </form>
            </td>
            <td>
                <form action="complog.jsp" method="GET">
                <input type="submit" value="Completed" name="completed" />
                <input type="hidden" name= "button" value=<%=idn%> />
                </form>
<!--                <a herf="complog.jsp?id=idn">completed</a>-->
            </td>
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
