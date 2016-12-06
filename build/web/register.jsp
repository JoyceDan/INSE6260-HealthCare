<%-- 
    Document   : register
    Created on : Nov 9, 2016, 3:29:25 PM
    Author     : DanQiao
--%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.sql.Connection"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html" %> 
<!DOCTYPE html>

<%
        if("POST".equalsIgnoreCase(request.getMethod())){
            if(request.getParameter("register")!=null ){
                if(request.getParameter("register").equals("Register")){
                
                    String username= request.getParameter("nameReg");
                    String password= request.getParameter("passReg");
                    String repassword= request.getParameter("passReg2");
                    String securityQues= request.getParameter("secReg");
                    String identify= request.getParameter("Identify");
                
                    if((!username.isEmpty())&&(!password.isEmpty())&&(!repassword.isEmpty()&&(!securityQues.isEmpty())&&(!identify.isEmpty() ))   ){
                        if(password.equals(repassword)){
                            Connection con= null;
                            PreparedStatement ps;
                            String query;
                            PreparedStatement ps1;
                            PreparedStatement ps2;
                             ResultSet rs2;
                            String query1;
                            PreparedStatement ps3;
                            ResultSet rs3;
                            String query3;
                            PreparedStatement ps4;
                            String query5;
                            PreparedStatement ps5;
                             PreparedStatement ps6;
                             ResultSet rs6;
                        
                            try{
                            Class.forName("com.mysql.jdbc.Driver");
                            }catch(Exception e)
                            {
                                System.out.println(e);
                            }

                            try{
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Healthcare", "root", "root");
                                query = "insert into Login (Username,Password,Identify,SecQue) values (?,?,?,?)";
                                ps = con.prepareStatement(query);
                                ps.setString(1, username);
                                ps.setString(2, password);
                                ps.setString(3, identify);
                                ps.setString(4, securityQues);

                                ps.executeUpdate();

                                session= request.getSession();
                                session.setAttribute("username", username);
                                response.sendRedirect("login.jsp");
                                
                                if(identify.equalsIgnoreCase("Patient")){
                                    int index = 0;
                                    String maxIDSql="select max(P_ID) as P_ID from Patient";
                                    ps2 = con.prepareStatement(maxIDSql);
                                    rs2 = ps2.executeQuery();
                                    if(rs2.next()){
                                        index = rs2.getInt("P_ID")+1;
                                    }else{
                                        index = 1;
                                    }
                                    query1 = "insert into Patient (P_ID,P_Username,P_Name,P_Gender,P_Age,P_Email) values (?,?,?,?,?,?)";

                                    ps1 = con.prepareStatement(query1);
                                    ps1.setInt(1, index);
                                    ps1.setString(2, username);
                                    ps1.setString(3, "unknown");
                                    ps1.setString(4, "unknown");
                                    ps1.setString(5, "unknown");
                                    ps1.setString(6, "unknown");
                                    ps1.executeUpdate();
                                    
                                    int indexAP = 0;
                                    String maxIDSqlAP="select max(AddressID) as AddressID from Address";
                                    ps6 = con.prepareStatement(maxIDSqlAP);
                                    rs6 = ps6.executeQuery();
                                    if(rs6.next()){
                                        indexAP = rs6.getInt("AddressID")+1;
                                    }else{
                                        indexAP = 1;
                                    }
                                    
                                    query5 = "insert into Address (AddressID,P_ID,Line1,Line2,City,PostCode) values (?,?,?,?,?,?)";
                                    ps5 = con.prepareStatement(query5);
                                    ps5.setInt(1, indexAP);
                                    ps5.setInt(2, index);
                                    ps5.setString(3, "unknown");
                                    ps5.setString(4, "unknown");
                                    ps5.setString(5, "unknown");
                                    ps5.setString(6, "unknown");
//                                    out.println("test address");
//                                    out.println(indexAP+index);
                                    ps5.executeUpdate();
                                }else{
                                    int index1 = 0;
                                    String maxIDSql1="select max(CG_ID) as CG_ID from Caregivers";
                                    ps3 = con.prepareStatement(maxIDSql1);
                                    rs3 = ps3.executeQuery();
                                    if(rs3.next()){
                                        index1 = rs3.getInt("CG_ID")+1;
                                    }else{
                                        index1 = 1;
                                    }
                                    
                                    query3 = "insert into Caregivers (CG_ID,CG_Username,CG_Name,CG_Age,CG_Gender,CG_Location,CG_ContactEmail,English,French,BloodTest,DayCare,BloodPressure,Time1,Time2,Time3,Time4,Caregivers_Flex) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

                                    ps4 = con.prepareStatement(query3);
                                    ps4.setInt(1, index1);
                                    ps4.setString(2, username);
                                    ps4.setString(3, "unknown");
                                    ps4.setString(4, "unknown");
                                    ps4.setString(5, "unknown");
                                    ps4.setString(6, "unknown");
                                    ps4.setString(7, "unknown");
                                    ps4.setString(8, "0");
                                    ps4.setString(9, "0");
                                    ps4.setString(10, "0");
                                    ps4.setString(11, "0");
                                    ps4.setString(12, "0");
                                    ps4.setString(13, "0");
                                    ps4.setString(14, "0");
                                    ps4.setString(15, "0");
                                    ps4.setString(16, "0");
                                    ps4.setString(17, "unknown");
                                    ps4.executeUpdate();
                                }
                                

                            }catch(SQLException e){
                                System.out.println(e);
                            }
                    
                        }
                        else{
                            out.println("The two password are not match! Please try again.");
                        }
                    }
                    else{
                        out.println("All the values are not empty! Please try again.");
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
                        <td><input type="text" name="nameReg" value="" size="30" placeholder="Enter your login username" /></td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type="password" name="passReg" value="" size="30" placeholder="Enter your password" /></td>
                    </tr>
                   
                    <tr>
                        <td>Rewrite Password: </td>
                        <td><input type="password" name="passReg2" value="" size="30" placeholder="Enter your repassword" /></td>
                    </tr>
                    
                    <tr>
                        <td>Security Question: </td>
                        <td><input type="text" name="secReg" value="" size="30" placeholder="In which city you were born??" /></td>
                    </tr>
                    
                    <tr>
                        <td>Identify: </td>
                        <td><select name="Identify">
                            <option>Patient</option>
                            <option>Nurse</option>
                            
                        </select>
                    </td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Register" name="register" />
        </form>
    </body>
</html>
