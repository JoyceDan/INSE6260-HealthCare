<%-- 
    Document   : sendrequestlog
    Created on : Nov 30, 2016, 4:23:15 PM
    Author     : DanQiao
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    out.println("sada");
        if("POST".equalsIgnoreCase(request.getMethod())){
            String username= session.getAttribute("username").toString();
            out.println("sada1");
        if(request.getParameter("send")!=null ){
            if(request.getParameter("send").equals("Send")){
                
                    String bt= request.getParameter("BT");
                    String dc= request.getParameter("DC");
                    String bp= request.getParameter("BP");
                    String time1= request.getParameter("time1");
                    String time2= request.getParameter("time2");
                    String time3= request.getParameter("time3");
                    String time4= request.getParameter("time4");
                    String gender= request.getParameter("genderP");
                    if((!bt.isEmpty())&&(!dc.isEmpty())&&(!bp.isEmpty())&&(!time1.isEmpty()&&(!time2.isEmpty())&&(!time3.isEmpty() )&&(!time4.isEmpty() )&&(!gender.isEmpty() ))   ){
                            
                            Connection con= null;
                            PreparedStatement ps;
                            ResultSet rs;
                            String query;
                        
                            try{
                            Class.forName("com.mysql.jdbc.Driver");
                            }catch(Exception e)
                            {
                                System.out.println(e);
                            }

                            try{
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Healthcare", "root", "root");
//                               
                                int index = 0;
                                String Sql="select P_ID from Patient WHERE P_Username=?";
                                ps = con.prepareStatement(Sql);
                                ps.setString(1,username);
                                rs = ps.executeQuery();
                                if(rs.next()){
                                    index = rs.getInt("P_ID");
                                }else{
                                    out.println("No this Patient! Please confirm that you have already fill in the infomation in this system.");
                                }
                                
                                int Requestid = 0;
                                String maxIDSql="select max(Request_ID) as Request_ID from Request";
                                ps = con.prepareStatement(maxIDSql);
                                rs = ps.executeQuery();
                                if(rs.next()){
                                    Requestid = rs.getInt("Request_ID")+1;
                                }else{
                                    Requestid = 0;
                                }
                                
                                query = "insert into Request (Request_ID,P_ID,Username,Time1,Time2,Time3,Time4,Gender,BloodTest,DayCare,BloodPressure) values (?,?,?,?,?,?,?,?,?,?,?)";
                                ps = con.prepareStatement(query);
                                out.println("sada2");
                                ps.setInt(1, Requestid);
                                ps.setInt(2, index);
                                ps.setString(3, username);
                                ps.setString(4, time1);
                                ps.setString(5, time2);
                                ps.setString(6, time3);
                                ps.setString(7, time4);
                                ps.setString(8, gender);
                                ps.setString(9, bt);
                                ps.setString(10, dc);
                                ps.setString(11, bp);

                                ps.executeUpdate();
//
//                                session= request.getSession();
//                                session.setAttribute("username", username);
//                                response.sendRedirect("login.jsp");

                            }catch(SQLException e){
                                System.out.println(e);
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>send a request log Page</title>
    </head>
    <body>
      
    </body>
</html>
