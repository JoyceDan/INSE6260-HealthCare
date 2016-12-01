<%-- 
    Document   : P_Info
    Created on : Nov 9, 2016, 4:40:31 PM
    Author     : DanQiao
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    if("POST".equalsIgnoreCase(request.getMethod())){
        if(request.getParameter("submit")!=null ){
            if(request.getParameter("submit").equals("Submit")){
                String username= session.getAttribute("username").toString();
                String realname= request.getParameter("Realname");
                String gender= request.getParameter("Gender");
                String age= request.getParameter("Age");
                String email= request.getParameter("Email");
//                out.println(username+realname+gender+age+email);
                if((!realname.isEmpty())&&(!gender.isEmpty())&&(!age.isEmpty())&&(!email.isEmpty())){
                        Connection con = null;
                        PreparedStatement ps;
                        ResultSet rs;
                        String query;
                        try
                        {
                            Class.forName("com.mysql.jdbc.Driver");
                        }catch(Exception e)
                        {
                            System.out.println(e);
                        }
                        
                        try
                        {
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Healthcare", "root", "root");
                                
                                int index = 0;
                                String maxIDSql="select max(P_ID) as P_ID from Patient";
                                ps = con.prepareStatement(maxIDSql);
                                rs = ps.executeQuery();
                                if(rs.next()){
                                    index = rs.getInt("P_ID")+1;
                                }else{
                                    index = 0;
                                }
                                query = "insert into Patient (P_ID,P_Username,P_Name,P_Gender,P_Age,P_Email) values (?,?,?,?,?,?)";
                                ps = con.prepareStatement(query);
                                out.println(index); 
                                ps.setInt(1, index);
                                ps.setString(2, username);
                                ps.setString(3, realname);
                                ps.setString(4, gender);
                                ps.setString(5, age);
                                ps.setString(6, email);

                                ps.executeUpdate();
                                
                                out.println(" Update Successfully... Please ");
                                out.println("<a href=\"Patient_home.jsp\"> Click Here to return homepage. </a>");
                            
                            
                        }catch(SQLException e)
                         {
                            System.out.println(e);
                           
                         }
                        
                }
                else{
                    out.println("every blank needs to be filled in! Please ");
                }
            }
            
        }
    }

%>


<html>
    <head>
        <link rel="stylesheet" type="text/css" href="CSS_style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient information Page</title>
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
                        <td><% out.println(session.getAttribute("username")); %></td>
                    </tr>
                    <tr>
                        <td>Real Name: </td>
                        <td><input type="text" name="Realname" value="" size="30" placeholder="Enter your real name" /></td>
                    </tr>
                    <tr>
                        <td>Gender: </td>
                        <td><input type="text" name="Gender" value="" size="30" placeholder="Male or Female" /></td>
                    </tr>
                    <tr>
                        <td>Age: </td>
                        <td><input type="text" name="Age" value="" size="30" placeholder="Enter your Age" /></td>
                    </tr>
                    
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="Email" value="" size="30" placeholder="XXXXX@XXX.com" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Submit" name="submit" />
        </form>
    </body>
</html>
