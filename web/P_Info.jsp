<%-- 
    Document   : P_Info
    Created on : Nov 9, 2016, 4:40:31 PM
    Author     : DanQiao
--%>

<%-- 
    Document   : register
    Created on : Nov 9, 2016, 3:29:25 PM
    Author     : DanQiao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    if("POST".equalsIgnoreCase(request.getMethod())){
        if(request.getParameter("register")!=null ){
            if(request.getParameter("register").equals("Register")){
                String username= request.getParameter("Username");
                String realname= request.getParameter("Realname");
                String gender= request.getParameter("Gender");
                String age= request.getParameter("Age");
                String address= request.getParameter("Address");
                String email= request.getParameter("Email");
                
                if((!username.isEmpty())&&(!realname.isEmpty())&&(!gender.isEmpty())&&(!age.isEmpty())&&(!address.isEmpty())&&(!email.isEmpty())){
                    
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
                        <td><input type="text" name="Username" value="" size="30" placeholder="Enter your login username" /></td>
                    </tr>
                    <tr>
                        <td>Real Name: </td>
                        <td><input type="text" name="Realname" value="" size="30" placeholder="Enter your real name" /></td>
                    </tr>
                    <tr>
                        <td>Gender: </td>
                        <td><input type="text" name="Gender" value="" size="30" placeholder="Enter your gender" /></td>
                    </tr>
                    <tr>
                        <td>Age: </td>
                        <td><input type="text" name="Age" value="" size="30" placeholder="Enter your Age" /></td>
                    </tr>
                    <tr>
                        <td>Address: </td>
                        <td><input type="text" name="Address" value="" size="30" placeholder="Enter your Address" /></td>
                    </tr>
                    
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="Email" value="" size="30" placeholder="Enter your email" /></td>
                    </tr>
                </tbody>
            </table>

        </form>
    </body>
</html>
