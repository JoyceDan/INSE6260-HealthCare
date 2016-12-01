<%-- 
    Document   : CG_Info
    Created on : Nov 22, 2016, 12:56:12 PM
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
                String city= request.getParameter("City");
                String email= request.getParameter("Email");
                String time1= request.getParameter("time1");
                String time2= request.getParameter("time2");
                String time3= request.getParameter("time3");
                String time4= request.getParameter("time4");
                
                out.println(username+realname+gender+age+email+time1+time2+time3+time4);
                if((!realname.isEmpty())&&(!gender.isEmpty())&&(!age.isEmpty())&&(!city.isEmpty())&&(!email.isEmpty())&&(!time1.isEmpty())&&(!time2.isEmpty())&&(!time3.isEmpty())&&(!time4.isEmpty())){
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
                                String maxIDSql="select max(CG_ID) as CG_ID from Caregivers";
                                ps = con.prepareStatement(maxIDSql);
                                rs = ps.executeQuery();
                                if(rs.next()){
                                    index = rs.getInt("CG_ID")+1;
                                }else{
                                    index = 0;
                                }
                                
                                query = "insert into Caregivers (CG_ID,CG_Username,CG_Name,CG_Gender,CG_Age,CG_ContactEmail,English,Chinese,French,Japanese,CG_Location) values (?,?,?,?,?,?,?,?,?,?,?)";
                                ps = con.prepareStatement(query);
                                ps.setInt(1, index);
                                ps.setString(2, username);
                                ps.setString(3, realname);
                                ps.setString(4, gender);
                                ps.setString(5, age);
                                ps.setString(6, email);
                                ps.setString(7, time1);
                                ps.setString(8, time2);
                                ps.setString(9, time3);
                                ps.setString(10, time4);
                                ps.setString(11, city);
                                out.println(" test1");

                                ps.executeUpdate();
                                
                                out.println(" test2");
                                
                                out.println(" Update Successfully... Please ");
                                out.println("<a href=\"Nurse_home.jsp\"> Click Here to return homepage. </a>");
                            
                            
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
        <title>Caregivers information Page</title>
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
                        <td>Gender: </td>
                        <td><input type="text" name="Gender" value="" size="30" placeholder="Male or Female" /></td>
                    </tr>
                    
                    
                    <tr>
                        <td>Which city do you live ?: </td>
                        <td><select name="City">
                                <option>Montreal</option>
                                <option>Quebec</option>
                                <option>Lava</option>
                            </select></td>
                    </tr>
                    
                    <tr>
                        <td>Ill type</td>
                        <td> Blood Test: <input type="checkbox" name="Realname" value="1" />Yes <input type="checkbox" name="Realname" value="0" /> No</td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>Day Care: <input type="checkbox" name="Age" value="1" />Yes <input type="checkbox" name="Age" value="0" /> No</td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>Blood Pressure: <input type="checkbox" name="Email" value="1" />Yes <input type="checkbox" name="Email" value="0" /> No</td>
                    </tr>
                    
                    <tr>
                        <td>Time prefer</td>
                        <td> 9-10AM: <input type="checkbox" name="time1" value="1" />Yes <input type="checkbox" name="time1" value="0" /> No</td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>11-12AM:<input type="checkbox" name="time2" value="1" />Yes <input type="checkbox" name="time2" value="0" /> No</td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>2-3PM:<input type="checkbox" name="time3" value="1" />Yes <input type="checkbox" name="time3" value="0" /> No</td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>4-5PM:<input type="checkbox" name="time4" value="1" />Yes <input type="checkbox" name="time4" value="0" /> No </td>
                    </tr>
                    
                </tbody>
            </table>
            <input type="submit" value="Submit" name="submit" />
        </form>
    </body>
</html>

