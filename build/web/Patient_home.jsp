<%-- 
    Document   : Patient_home
    Created on : Nov 7, 2016, 9:56:13 PM
    Author     : DanQiao
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%   
        out.println("Welcome,"+session.getAttribute("username")+"!!!");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient's HomePage</title>
    </head>
    <body>
        <form method="POST" action="P_showInfo.jsp">
        <br><br>
        <input type="submit" value="show information" />
        </form>
        <form method="POST" action="P_showAddr.jsp">
        <br><br>
        <input type="submit" value="View/Update address" />
        </form>
        <br><br>
        <input type="submit" value="send a request" onclick='window.location.href="SendRequest.jsp"'/>
        
        <form method="POST" action="P_viewReq.jsp">
        <br><br>
        <input type="submit" value="view all request" />
        </form>
        <br><br>
        <form action="logout.jsp" method="POST">
            <input type="submit" value="Logout" name="logout">
        </form>
    </body>
</html>
