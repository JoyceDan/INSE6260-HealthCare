<%-- 
    Document   : index
    Created on : Nov 7, 2016, 8:47:46 PM
    Author     : DanQiao
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Nov 7, 2016, 3:47:53 PM
    Author     : DanQiao
--%>
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="CSS_style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HCS login Page</title>
    </head>
    <body>
        
        
        
        <form method="POST" name="form1" action="login.jsp"> 
        <table border="0">
            <thead>
                <tr>
                    <th>Login Info</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>User_ID:</td>
                    <td><input type="text" name="UserID" value="" /></td>
                </tr>
                
<!--                <tr>
                    <td>User_Name:</td>
                    <td><input type="text" name="UserName" value="" /></td>
                </tr>-->
                
                <tr>
                    <td>User_password:</td>
                    <td><input type="password" name="Password" value="" /></td>
                </tr>
                
                <tr>
                    <td><select name="Charater">
                            <option>Patient</option>
                            <option>Nurse</option>
                            <option>Agent</option>
                        </select>
                    </td>
                    <td><input type="submit" value="Login" name="Login" /></td>
                    <td><input type="submit" value="Register" name="Register" /></td>
                </tr>
            </tbody>
        </table>
        </form>
    </body>
</html>

