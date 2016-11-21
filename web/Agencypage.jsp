<%-- 
    Document   : Agencypage
    Created on : Nov 18, 2016, 1:44:01 PM
    Author     : DanQiao
--%>
<%@page import= "java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    if("POST".equalsIgnoreCase(request.getMethod())){
    
    }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agency Page</title>
    </head>
    <body>
       sadasd
        <form action="" method="POST">
        <input type="submit" value="Display all Request by patients" name="DisplayRequest" />
        </form>
        <br><br>
        <input type="submit" value="Display all nurses" name="DisplayNurse" />
        <br><br>
        <input type="submit" value="Run" name="Run" />
        
    </body>
</html>
