<%-- 
    Document   : Patient send a request to the system
    Created on : Nov 9, 2016, 3:29:25 PM
    Author     : DanQiao
--%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.sql.Connection"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html" %> 
<!DOCTYPE html>

<%
        if("POST".equalsIgnoreCase(request.getMethod())){
            if(request.getParameter("send")!=null ){
                if(request.getParameter("send").equals("Send")){
                
                    String type= request.getParameter("TypeSR");
                    String id= request.getParameter("IdSR");
                    String time1= request.getParameter("time1");
                    String time2= request.getParameter("time2");
                    String time3= request.getParameter("time3");
                    String time4= request.getParameter("time4");
                    String gender= request.getParameter("genderP");
                
                    if((!type.isEmpty())&&(!id.isEmpty())&&(!time1.isEmpty()&&(!time2.isEmpty())&&(!time3.isEmpty() )&&(!time4.isEmpty() )&&(!gender.isEmpty() ))   ){
                        
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
                                query = "insert into Login (Username,Password,Identify,SecQue) values (?,?,?,?)";
                                ps = con.prepareStatement(query);
                                ps.setString(1, username);
                                ps.setString(2, password);
                                ps.setString(3, identify);
                                ps.setString(4, securityQues);

                                ps.executeUpdate();

                                session= request.getSession();
                                session.setAttribute("username", username);
                                response.sendRedirect("login.jsp");

                            }catch(SQLException e){
                                System.out.println(e);
                            }
                    
                        
                    }
                    else{
                        out.println("All the values are not empty! Please try again.");
                    }
                }
            
            }
        }

%>


<html>
    <head>
        <link rel="stylesheet" type="text/css" href="CSS_style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Send Request Page</title>
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
                        <td>Ill Type: </td>
                        <td><input type="text" name="TypeSR" value="" size="30" placeholder="Enter your illness type" /></td>
                    </tr>
                    <tr>
                        <td>Patient ID: </td>
                        <td><input type="text" name="IdSR" value="" size="30" placeholder="Enter your patientID" /></td>
                    </tr>
                   
                    <tr>
                        <td>Time prefer 9-10AM: </td>
                        <td> <input type="checkbox" name="time1" value="1" /></td>
                      
                        </tr>
                    
                    <tr>
                        <td>Time prefer 11-12AM: </td>
                        <td><input type="checkbox" name="time2" value="1" /></td>
                    </tr>
                    
                    <tr>
                        <td>Time prefer 2-3PM</td>
                        <td><input type="checkbox" name="time3" value="1" /></td>
                    </tr>
                    
                    <tr>
                        <td>Time prefer 2-3PM</td>
                        <td><input type="checkbox" name="time4" value="1" /></td>
                    </tr>
                    
                    <tr>
                        <td>Nurse's gender prefer</td>
                        <td><select name="genderP">
                                <option>Male</option>
                                <option>Female</option>
                            </select></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Send" name="send" />
        </form>
    </body>
</html>
