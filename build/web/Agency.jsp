<%-- 
    Document   : Agency
    Created on : Nov 8, 2016, 9:10:49 PM
    Author     : DanQiao
--%>

<%@page import="java.sql.*" %>
<%@page import="java.sql.Connection"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>




    <head>
        <title>Agency Page</title>
    </head>
    
        <form method="POST" name="form1" action=AllRequestpage.jsp> 
        <!--<form method="POST" name="form1">-->
        <input type="submit" value="Display all Request by patients" name="DisplayRequest" />
        </form>
        <br><br>
        <form method="POST" name="form2" action=AllNursepage.jsp> 
        <input type="submit" value="Display all nurses" name="DisplayNurse" />
        </form>
        <br><br>
        <form method="POST" name="form2" action=run.jsp> 
        <input type="submit" value="Run" name="Run" />
        </form>
        




    

