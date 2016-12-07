<%-- 
    Document   : Patient send a request to the system
    Created on : Nov 9, 2016, 3:29:25 PM
    Author     : DanQiao
--%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html" %> 
<!DOCTYPE html>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="CSS_style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Send Request Page</title>
    </head>
    <body>
        <form name="form1" action="sendrequestlog.jsp" method="POST">     
            <table border="1">
                <thead>
                    <tr>
                        <th>Attribute</th>
                        <th>Content</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Ill type: </td>
                        <td>Blood Test :<input type="checkbox" name="BT" value="1" />Yes <input type="checkbox" name="BT" value="0" /> No</td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>Day Care :<input type="checkbox" name="DC" value="1" />Yes <input type="checkbox" name="DC" value="0" /> No</td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>Blood Pressure :<input type="checkbox" name="BP" value="1" />Yes <input type="checkbox" name="BP" value="0" /> No</td>
                    </tr>
                    
                    <tr>
                        <td>Patient Name: </td>
                        <td><% out.println(session.getAttribute("username")); %></td>
                    </tr>
                   
                    <tr>
                        <td>Time prefer 9-10AM: </td>
                        <td> <input type="checkbox" name="time1" value="1" />Yes <input type="checkbox" name="time1" value="0" /> No</td>
                      
                    </tr>
                    
                    <tr>
                        <td>Time prefer 11-12AM: </td>
                        <td><input type="checkbox" name="time2" value="1" />Yes <input type="checkbox" name="time2" value="0" /> No</td>
                    </tr>
                    
                    <tr>
                        <td>Time prefer 2-3PM</td>
                        <td><input type="checkbox" name="time3" value="1" />Yes <input type="checkbox" name="time3" value="0" /> No</td>
                    </tr>
                    
                    <tr>
                        <td>Time prefer 4-5PM</td>
                        <td><input type="checkbox" name="time4" value="1" />Yes <input type="checkbox" name="time4" value="0" /> No</td>
                    </tr>
                    
                    <tr>
                        <td>Nurse's gender prefer</td>
                        <td><select name="genderP">
                                <option>Male</option>
                                <option>Female</option>
                            </select></td>
                    </tr>
                    
                    <tr>
                        <td>The nurse's Language: </td>
                        <td>English <input type="checkbox" name="English" value="1" />Yes <input type="checkbox" name="English" value="0" /> No</td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>French <input type="checkbox" name="French" value="1" />Yes <input type="checkbox" name="French" value="0" /> No</td>
                    </tr>
                    
                </tbody>
            </table>
            <input type="submit" value="Send" name="send" />
        </form>
                    <form action="Patient_home.jsp">
            <input type="submit" value="Return" name="Return" />
        </form>
    </body>
</html>
