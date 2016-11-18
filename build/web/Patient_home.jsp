<%-- 
    Document   : Patient_home
    Created on : Nov 7, 2016, 9:56:13 PM
    Author     : DanQiao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient's HomePage</title>
    </head>
    <body>
        <input type="submit" value="update infomation"  onclick='window.location.href="P_Info.jsp"' />
        <br><br>
        <input type="submit" value="send a request" onclick='window.location.href="Patient_request.jsp"'/>
        <br><br>
        <input type="submit" value="view all request" onclick='window.location.href="Patient_allrequest.jsp"'/>
        <br><br>
        <form action="logout.jsp" method="POST">
            <input type="submit" value="Logout" name="logout">
        </form>
    </body>
</html>
