<%-- 
    Document   : P_Info
    Created on : Nov 9, 2016, 4:40:31 PM
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
                String realname= request.getParameter("Realname");
                String gender= request.getParameter("Gender");
                String age= request.getParameter("Age");
                String email= request.getParameter("Email");
//                out.println(username+realname+gender+age+email);
                if((!realname.isEmpty())&&(!gender.isEmpty())&&(!age.isEmpty())&&(!email.isEmpty())){
                        Connection con = null;
                        PreparedStatement ps;
                        ResultSet rs;
                        String query;
                        PreparedStatement ps1;
                        ResultSet rs1;
                        String query2;
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
                                query2 = "select P_ID from Patient where P_Username=?";
                                ps1 = con.prepareStatement(query2);
                                ps1.setString(1, username);
                                rs1 = ps1.executeQuery();
                                if(rs1.next()){
                                    index = rs1.getInt("P_ID");
                                }else{
                                     out.println("Wrong system");
                                }

                                query = "update Patient set P_Name=?,P_Gender=?,P_Age=?,P_Email=? where P_ID=?";
                                ps = con.prepareStatement(query);
                                ps.setString(1, realname);
                                ps.setString(2, gender);
                                ps.setString(3, age);
                                ps.setString(4, email);
                                ps.setInt(5,index);

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
        <title>Patient information Page</title>
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
                        <td>Real Name: </td>
                        <td><input type="text" name="Realname" value="" size="30" placeholder="Enter your real name" /></td>
                    </tr>
                    <tr>
                        <td>Gender: </td>
                        <td><input type="text" name="Gender" value="" size="30" placeholder="Male or Female" /></td>
                    </tr>
                    <tr>
                        <td>Age: </td>
                        <td><input type="text" name="Age" value="" size="30" placeholder="Enter your Age" /></td>
                    </tr>
                    
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="Email" value="" size="30" placeholder="XXXXX@XXX.com" /></td>
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
