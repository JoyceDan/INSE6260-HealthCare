<%-- 
    Document   : logincheck
    Created on : Nov 7, 2016, 9:43:46 PM
    Author     : DanQiao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login check Page</title>
    </head>
    <body>
        <%
            if(session.getAttribute("userinfo") == null){
        %>
        <script type="text/javascript" language="javascript">
            alert("Please login first!");
            window.document.location.href="index.jsp";
        </script>
        <%
            }
        %>
    </body>
</html>
