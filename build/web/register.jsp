<%-- 
    Document   : register
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
            if(request.getParameter("register")!=null ){
                if(request.getParameter("register").equals("Register")){
                
                    String username= request.getParameter("nameReg");
                    String password= request.getParameter("passReg");
                    String repassword= request.getParameter("passReg2");
                    String securityQues= request.getParameter("secReg");
                    String identify= request.getParameter("Identify");
                
                    if((!username.isEmpty())&&(!password.isEmpty())&&(!repassword.isEmpty()&&(!securityQues.isEmpty())&&(!identify.isEmpty() ))   ){
                        if(password.equals(repassword)){
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
                            out.println("The two password are not match! Please try again.");
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
        <title>Register Page</title>
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
                        <td><input type="text" name="nameReg" value="" size="30" placeholder="Enter your login username" /></td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type="password" name="passReg" value="" size="30" placeholder="Enter your password" /></td>
                    </tr>
                   
                    <tr>
                        <td>Rewrite Password: </td>
                        <td><input type="password" name="passReg2" value="" size="30" placeholder="Enter your repassword" /></td>
                    </tr>
                    
                    <tr>
                        <td>Security Question: </td>
                        <td><input type="text" name="secReg" value="" size="30" placeholder="In which city you were born??" /></td>
                    </tr>
                    
                    <tr>
                        <td>Identify: </td>
                        <td><select name="Identify">
                            <option>Patient</option>
                            <option>Nurse</option>
                            <option>Agent</option>
                        </select>
                    </td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Register" name="register" />
        </form>
    </body>
</html>
