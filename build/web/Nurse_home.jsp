<%-- 
    Document   : Nurse_home
    Created on : Nov 22, 2016, 12:19:53 AM
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
        <title>Nurse's HomePage</title>
    </head>
    <body>
        <form method="POST" action="CG_showInfo.jsp">
        <br><br>
        <input type="submit" value="show CGinfomation" />
        </form>
        <form method="POST" action="CG_Info.jsp">
        <br><br>
        <input type="submit" value="update CGinfomation" />
        </form>
        <form method="POST" action="changeAvaliable.jsp">
        <br><br>
        <input type="submit" value="Change the avalibility"/>
        </form>
        <form method="POST" action="CG_viewJob.jsp">
        <br><br>
        <input type="submit" value="view all Work"/>
        </form>
        <br><br>
        <form action="logout.jsp" method="POST">
            <input type="submit" value="Logout" name="logout">
        </form>
        
    </body>
</html>

