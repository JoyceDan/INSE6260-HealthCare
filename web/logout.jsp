<%-- 
    Document   : logout
    Created on : Nov 8, 2016, 9:10:49 PM
    Author     : DanQiao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    session.invalidate();
    session = request.getSession();
    response.sendRedirect("index.jsp");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
