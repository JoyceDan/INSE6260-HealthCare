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
                String english= request.getParameter("English");
                String chinese= request.getParameter("Chinese");
                String french= request.getParameter("French");
                String japanese= request.getParameter("Japanese");
                
//                out.println(username+realname+gender+age+email+english+chinese+french+japanese);
                if((!realname.isEmpty())&&(!gender.isEmpty())&&(!age.isEmpty())&&(!city.isEmpty())&&(!email.isEmpty())&&(!english.isEmpty())&&(!chinese.isEmpty())&&(!french.isEmpty())&&(!japanese.isEmpty())){
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
                                ps.setString(7, english);
                                ps.setString(8, chinese);
                                ps.setString(9, french);
                                ps.setString(10, japanese);
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
                        <td>Which city do you live ?: </td>
                        <td><select name="City">
                                <option>Montreal</option>
                                <option>Quebec</option>
                                <option>Lava</option>
                            </select></td>
                    </tr>
                    
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="Email" value="" size="30" placeholder="XXXXX@XXX.com" /></td>
                    </tr>
                    
                    <tr>
                        <td>Language</td>
                        <td>English:<input type="checkbox" name="English" value="1" />Yes <input type="checkbox" name="English" value="0" /> No</td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>Chinese:<input type="checkbox" name="Chinese" value="1" />Yes <input type="checkbox" name="Chinese" value="0" /> No</td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>French:<input type="checkbox" name="French" value="1" />Yes <input type="checkbox" name="French" value="0" /> No</td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>Japanese:<input type="checkbox" name="Japanese" value="1" />Yes <input type="checkbox" name="Japanese" value="0" /> No </td>
                    </tr>
                    
                </tbody>
            </table>
            <input type="submit" value="Submit" name="submit" />
        </form>
    </body>
</html>

