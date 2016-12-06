<%-- 
    Document   : P_Address
    Created on : Dec 6, 2016, 3:33:09 PM
    Author     : DanQiao
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    if("POST".equalsIgnoreCase(request.getMethod())){
        if(request.getParameter("submit")!=null ){
            if(request.getParameter("submit").equals("Submit")){
                String username= session.getAttribute("username").toString();
                String apartment= request.getParameter("Apartment");
                String street= request.getParameter("Street");
                String city= request.getParameter("City");
                String postcode= request.getParameter("PostCode");
                
                if((!city.isEmpty())&&(!city.isEmpty())&&(!street.isEmpty())&&(!city.isEmpty())&&(!postcode.isEmpty())){
                        Connection con = null;
                        PreparedStatement ps;
                        PreparedStatement ps1;
                        ResultSet rs1;
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
                            
                                int index = 0;
                                String IDquery = "select P_ID from Patient where P_Username=?";
                                ps1 = con.prepareStatement(IDquery);
                                ps1.setString(1, username);
                                rs1 = ps1.executeQuery();
                                if(rs1.next()){
                                    index = rs1.getInt("P_ID");
                                }else{
                                     out.println("Wrong system");
                                }
                                
                                query = "update Address set Line1=?,Line2=?,City=?,Postcode=? where P_ID=?";
                                ps = con.prepareStatement(query);
                                
                                ps.setString(1, apartment);
                                ps.setString(2, street);
                                ps.setString(3, city);
                                ps.setString(4, postcode);
                                ps.setInt(5, index);

                                ps.executeUpdate();
                                out.println(" Update Successfully... Please ");
                                out.println("<a href=\"Patient_home.jsp\"> Click Here to return homepage. </a>");
                            
                            
                        }catch(SQLException e)
                         {
                            System.out.println(e);
                           
                         }
                        
                }
                else{
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
        <title>Patient's address</title>
    </head>
    <body>
        <form action="" method="POST">
            <table border="1">
                <thead>
                    <tr>
                        <th>Attribute</th>
                        <th>Content</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Username: </td>
                        <td><% out.println(session.getAttribute("username")); %></td>
                    </tr>
                    <tr>
                        <td>Apartment: </td>
                        <td><input type="text" name="Apartment" value="" size="30" placeholder="Enter your Apartment number" /></td>
                    </tr>
                    <tr>
                        <td>Street: </td>
                        <td><input type="text" name="Street" value="" size="30" placeholder="Enter your street and building number" /></td>
                    </tr>
                    <tr>
                        <td>City: </td>
                        <td><select name="City">
                                <option>Montreal</option>
                                <option>Quebec</option>
                                <option>Laval</option>
                            </select></td>
                    </tr>
                    
                    <tr>
                        <td>PostCode: </td>
                        <td><input type="text" name="PostCode" value="" size="30" placeholder="Enter your Postcode" /></td>
                    </tr>
                    
                    
                </tbody>
            </table>
            <input type="submit" value="Submit" name="submit" />
        </form>
         <form action="Patient_home.jsp">
            <input type="submit" value="Return" name="Return" />
        </form>
    </body>
</html>


