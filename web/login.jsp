<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : login
    Created on : Nov 7, 2016, 9:53:36 PM
    Author     : DanQiao
--%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html" %> 
<!DOCTYPE html>
<html>
    <head>
        <title>login Page</title>
    </head>
    <% Date date = new Date(); %>
    <body>
        <p>Today's date is <%= date %> </p>

        <%!
        public class Actor {
            String URL = "jdbc:mysql://localhost:3306/Healthcare";
            String USERNAME = "root";
            String PASSWORD = "root";
            
            Connection connection = null;
            PreparedStatement selectActors = null;
            ResultSet resultSet = null;

            public Actor(){
                    try{
                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                        
                        selectActors = connection.prepareStatement(
                            "SELECT ID,Password,Idetify FROM Login"
//                            +"WHERE Login.ID = ?"
//                            +"AND Login.Password = ?"
//                            +"AND Login.Idetify = ?"
                        );


                    }catch(SQLException e){
                        e.printStackTrace();
                }

            }

            public ResultSet getActors(){
                try{
//                    String UserID, String Password, String Charater
//                    selectActors.setString(1, UserID);
//                    selectActors.setString(2, Password);
//                    selectActors.setString(3, Charater);
                    resultSet = selectActors.executeQuery();

                } catch(SQLException e){
                    e.printStackTrace();
                }
            return resultSet;
            }
        
        }
        %>
        <%
//            String userid = new String();
//            String userpwd = new String();
//            String useridt = new String();
//            
//            if (request.getParameter("UserID") != null){
//                userid = request.getParameter("UserID");
//            }
//            
//            if (request.getParameter("Password") != null){
//                userpwd = request.getParameter("Password");
//            }
//            
//            if (request.getParameter("Charater") != null){
//                useridt = request.getParameter("Charater");
//            }
//         
            Actor actor = new Actor();
            ResultSet actors = actor.getActors();
            
            
        %>


        <table border="1">
            
            <tbody>
                <tr>
                    <td>ID</td>
                    <td>PWD</td>
                    <td>WORK</td>
                </tr>
               <% while (actors.next()) { %>
                <tr>
                   <td><%=actors.getString("ID")   %></td>
                    <td><%=actors.getString("Password")   %></td>
                    <td><%=actors.getString("Idetify")   %></td>
                </tr>
                <%}%>
            </tbody>
        </table>


        
        
          <%  
//        String USERNAME = "admin";  
//        String USERPWD = "123456"; 
//        String USERWORK = "Nurse";
        
          
//        request.setCharacterEncoding("utf8");  
//      
//        String useriD = request.getParameter("UserID").trim();  
//        String userPwd = request.getParameter("Password").trim();  
//        String userwork = request.getParameter("Charater".trim());
//        if(useriD == null || userPwd == null || userwork == null){  
//            response.sendRedirect("index.jsp");  
//            return;  
//        }  
//          
//        if(useriD.equals(actors.getString("ID")) && userPwd.equals(actors.getString("Password")) && userwork.equals(actors.getString("Idetify"))) {  
//            session.setMaxInactiveInterval(30*60);          // 设置session失效时间（timeout），单位为秒  
//            session.setAttribute("userinfo", actors.getString("userid"));     // 用户名和密码正确，保存登录信息  
//            response.sendRedirect("Patient_home.jsp");  
//        } else {  
//            response.sendRedirect("index.jsp");        // 用户名和密码错误，跳转到登录界面  
//        }  
    %> 
    </body>
</html>
