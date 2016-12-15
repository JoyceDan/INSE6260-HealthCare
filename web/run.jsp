<%-- 
    Document   : run
    Created on : Dec 1, 2016, 2:59:36 PM
    Author     : DanQiao
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<!DOCTYPE html>

<%
    if("POST".equalsIgnoreCase(request.getMethod())){
        
        long start = new Date().getTime();
        
        if(request.getParameter("run")!=null ){
            if(request.getParameter("run").equals("Run")){
                
                        Connection con = null;
                        PreparedStatement ps;
                        PreparedStatement ps3;
                        ResultSet rs;
                        PreparedStatement ps2;
                        ResultSet rs2;
                        PreparedStatement ps4;
                        ResultSet rs4;
                        PreparedStatement ps5;
                        PreparedStatement ps6;
                        PreparedStatement ps7;
                        ResultSet rs7;
                        String query;
                        PreparedStatement ps8;
                        PreparedStatement ps9;
                        PreparedStatement ps10;
                        PreparedStatement ps11;
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
                            
                            
//                                int index = 0;
//                                String maxIDSql="select max(Request_ID) as Request_ID from Request";
//                                ps = con.prepareStatement(maxIDSql);
//                                rs = ps.executeQuery();
//                                if(rs.next()){
//                                    index = rs.getInt("Request_ID");
//                                }else{
//                                    index = 0;
//                                }
                                int indexN = 0;
                                String maxIDSqlN="select max(CG_ID) as CG_ID from Caregivers";
                                ps = con.prepareStatement(maxIDSqlN);
                                rs = ps.executeQuery();
                                if(rs.next()){
                                    indexN = rs.getInt("CG_ID");
                                }else{
                                    indexN = 0;
                                }
                                query = "select Time1,Time2,Time3,Time4,BloodTest,DayCare,BloodPressure,English,French,Gender,Request_ID,StatusID, (Time1+Time2+Time3+Time4) AS Request_Flex from Request Order by Request_Flex";
                                ps = con.prepareStatement(query);
                                rs = ps.executeQuery();
                                int i=1;
                                for(i=1;i<=indexN;i++){
                                    String shit = "update Caregivers set Caregivers_Flex = (Time1+Time2+Time3+Time4) Where CG_ID=?";
                                    ps11 = con.prepareStatement(shit);
                                    ps11.setInt(1, i);
                                    ps11.executeUpdate();
                                }
                                
                                while (rs.next()){
                                    
//                                    out.println("Next Request:"+rs.getString("Request_ID"));
                                    String statusid = rs.getString("StatusID");
                                    
                                    if(rs.getString("StatusID").equalsIgnoreCase("1")){
                                        String query1 = "select Time1,Time2,Time3,Time4,BloodTest,DayCare,BloodPressure,English,French,CG_Gender,CG_ID,Caregivers_Flex from Caregivers Order by Caregivers_Flex DESC";
//                                        
                                        ps2 = con.prepareStatement(query1);
                                        rs2 = ps2.executeQuery();
                                    
                                        while (rs2.next()){
//                                            out.println(" Nurse: "+rs2.getString("CG_ID"));
                                            
                                            
                                            if (((rs.getString("BloodTest").equalsIgnoreCase("1"))&&(rs2.getString("BloodTest").equalsIgnoreCase("1")))||((rs.getString("DayCare").equalsIgnoreCase("1"))&&(rs2.getString("DayCare").equalsIgnoreCase("1")))||((rs.getString("BloodPressure").equalsIgnoreCase("1"))&&(rs2.getString("BloodPressure").equalsIgnoreCase("1"))))
                                            {
                                                if(rs.getString("Time1").equalsIgnoreCase("1")&&rs2.getString("Time1").equalsIgnoreCase("1"))
                                                {
                                                    if(rs.getString("Gender").equalsIgnoreCase("Male")&&rs2.getString("CG_Gender").equalsIgnoreCase("Male")||rs.getString("Gender").equalsIgnoreCase("Female")&&rs2.getString("CG_Gender").equalsIgnoreCase("Female")||rs.getString("Gender").equalsIgnoreCase("Female")&&rs2.getString("CG_Gender").equalsIgnoreCase("None"))
                                                    {
                                                        if((rs.getString("English").equalsIgnoreCase("1")&&rs2.getString("English").equalsIgnoreCase("1")) || (rs.getString("French").equalsIgnoreCase("1")&&rs2.getString("French").equalsIgnoreCase("1")))
                                                        {
                                                            int indexID = 0;
                                                            String maxSql="select max(AppointmentID) as AppointmentID from Appointments";
                                                            ps4 = con.prepareStatement(maxSql);
                                                            rs4 = ps4.executeQuery();
                                                            if(rs4.next()){
                                                                indexID = rs4.getInt("AppointmentID")+1;
                                                            }else{
                                                                indexID = 0;
                                                            }

//                                                            out.println(" APP_ID:"+indexID);

                                                            String id = rs.getString("Request_ID").toString();
                                                            String idn = rs2.getString("CG_ID").toString();

//                                                            out.println(" Requst_ID="+id+" CG_ID="+idn);

                                                            String query2 = "insert into Appointments (AppointmentID,Final_Time,Request_ID,NurseID,StatusID) values (?,9,?,?,2)";


                                                            ps3 = con.prepareStatement(query2);
                                                            ps3.setInt(1, indexID);
                                                            ps3.setString(2, id);
                                                            ps3.setString(3, idn);
                                                            ps3.executeUpdate();

                                                            String query3 = "update Request set StatusID = '2' where Request_ID= ?";
                                                            ps5 = con.prepareStatement(query3);
                                                            ps5.setString(1, id);
                                                            ps5.executeUpdate();

                                                            String query4= "update Caregivers set Time1 = '0' where CG_ID= ?";
                                                            ps6 = con.prepareStatement(query4);
                                                            ps6.setString(1, idn);
                                                            ps6.executeUpdate();
//                                                             out.println(" Confirm ");

                                                            break;

                                                        }
//                                                    
                                                    }
                                                }
                                                
                                                if(rs.getString("Time2").equalsIgnoreCase("1")&&rs2.getString("Time2").equalsIgnoreCase("1"))
                                                {
                                                    if(rs.getString("Gender").equalsIgnoreCase("Male")&&rs2.getString("CG_Gender").equalsIgnoreCase("Male")||rs.getString("Gender").equalsIgnoreCase("Female")&&rs2.getString("CG_Gender").equalsIgnoreCase("Female")||rs.getString("Gender").equalsIgnoreCase("None")&&rs2.getString("CG_Gender").equalsIgnoreCase("None"))
                                                    {
                                                        if((rs.getString("English").equalsIgnoreCase("1")&&rs2.getString("English").equalsIgnoreCase("1")) || (rs.getString("French").equalsIgnoreCase("1")&&rs2.getString("French").equalsIgnoreCase("1")))
                                                        {
                                                            int indexID = 0;
                                                            String maxSql="select max(AppointmentID) as AppointmentID from Appointments";
                                                            ps7 = con.prepareStatement(maxSql);
                                                            rs7 = ps7.executeQuery();
                                                            if(rs7.next()){
                                                                indexID = rs7.getInt("AppointmentID")+1;
                                                            }else{
                                                                indexID = 0;
                                                            }

//                                                            out.println(" APP_ID:"+indexID);

                                                            String id = rs.getString("Request_ID").toString();
                                                            String idn = rs2.getString("CG_ID").toString();

//                                                            out.println(" Requst_ID="+id+" CG_ID="+idn);

                                                            String query2 = "insert into Appointments (AppointmentID,Final_Time,Request_ID,NurseID,StatusID) values (?,11,?,?,2)";


                                                            ps8 = con.prepareStatement(query2);
                                                            ps8.setInt(1, indexID);
                                                            ps8.setString(2, id);
                                                            ps8.setString(3, idn);
                                                            ps8.executeUpdate();

                                                            String query3 = "update Request set StatusID = '2' where Request_ID= ?";
                                                            ps9 = con.prepareStatement(query3);
                                                            ps9.setString(1, id);
                                                            ps9.executeUpdate();

                                                            String query4= "update Caregivers set Time2 = '0' where CG_ID= ?";
                                                            ps10 = con.prepareStatement(query4);
                                                            ps10.setString(1, idn);
                                                            ps10.executeUpdate();
//                                                             out.println(" Confirm ");

                                                            break;

                                                        }
//                                                    
                                                    }
                                                }
                                                
                                                if(rs.getString("Time3").equalsIgnoreCase("1")&&rs2.getString("Time3").equalsIgnoreCase("1"))
                                                {
                                                    if(rs.getString("Gender").equalsIgnoreCase("Male")&&rs2.getString("CG_Gender").equalsIgnoreCase("Male")||rs.getString("Gender").equalsIgnoreCase("Female")&&rs2.getString("CG_Gender").equalsIgnoreCase("Female")||rs.getString("Gender").equalsIgnoreCase("None")&&rs2.getString("CG_Gender").equalsIgnoreCase("None"))
                                                    {
                                                        if((rs.getString("English").equalsIgnoreCase("1")&&rs2.getString("English").equalsIgnoreCase("1")) || (rs.getString("French").equalsIgnoreCase("1")&&rs2.getString("French").equalsIgnoreCase("1")))
                                                        {
                                                            int indexID = 0;
                                                            String maxSql="select max(AppointmentID) as AppointmentID from Appointments";
                                                            ps7 = con.prepareStatement(maxSql);
                                                            rs7 = ps7.executeQuery();
                                                            if(rs7.next()){
                                                                indexID = rs7.getInt("AppointmentID")+1;
                                                            }else{
                                                                indexID = 0;
                                                            }

//                                                            out.println(" APP_ID:"+indexID);

                                                            String id = rs.getString("Request_ID").toString();
                                                            String idn = rs2.getString("CG_ID").toString();

//                                                            out.println(" Requst_ID="+id+" CG_ID="+idn);

                                                            String query2 = "insert into Appointments (AppointmentID,Final_Time,Request_ID,NurseID,StatusID) values (?,2,?,?,2)";


                                                            ps8 = con.prepareStatement(query2);
                                                            ps8.setInt(1, indexID);
                                                            ps8.setString(2, id);
                                                            ps8.setString(3, idn);
                                                            ps8.executeUpdate();

                                                            String query3 = "update Request set StatusID = '2' where Request_ID= ?";
                                                            ps9 = con.prepareStatement(query3);
                                                            ps9.setString(1, id);
                                                            ps9.executeUpdate();

                                                            String query4= "update Caregivers set Time3 = '0' where CG_ID= ?";
                                                            ps10 = con.prepareStatement(query4);
                                                            ps10.setString(1, idn);
                                                            ps10.executeUpdate();
//                                                             out.println(" Confirm ");

                                                            break;

                                                        }
//                                                    
                                                    }
                                                }
                                                if(rs.getString("Time4").equalsIgnoreCase("1")&&rs2.getString("Time4").equalsIgnoreCase("1"))
                                                {
                                                    if(rs.getString("Gender").equalsIgnoreCase("Male")&&rs2.getString("CG_Gender").equalsIgnoreCase("Male")||rs.getString("Gender").equalsIgnoreCase("Female")&&rs2.getString("CG_Gender").equalsIgnoreCase("Female")||rs.getString("Gender").equalsIgnoreCase("None")&&rs2.getString("CG_Gender").equalsIgnoreCase("None"))
                                                    {
                                                        if((rs.getString("English").equalsIgnoreCase("1")&&rs2.getString("English").equalsIgnoreCase("1")) || (rs.getString("French").equalsIgnoreCase("1")&&rs2.getString("French").equalsIgnoreCase("1")))
                                                        {
                                                            int indexID = 0;
                                                            String maxSql="select max(AppointmentID) as AppointmentID from Appointments";
                                                            ps7 = con.prepareStatement(maxSql);
                                                            rs7 = ps7.executeQuery();
                                                            if(rs7.next()){
                                                                indexID = rs7.getInt("AppointmentID")+1;
                                                            }else{
                                                                indexID = 0;
                                                            }

//                                                            out.println(" APP_ID:"+indexID);

                                                            String id = rs.getString("Request_ID").toString();
                                                            String idn = rs2.getString("CG_ID").toString();

//                                                            out.println(" Requst_ID="+id+" CG_ID="+idn);

                                                            String query2 = "insert into Appointments (AppointmentID,Final_Time,Request_ID,NurseID,StatusID) values (?,4,?,?,2)";


                                                            ps8 = con.prepareStatement(query2);
                                                            ps8.setInt(1, indexID);
                                                            ps8.setString(2, id);
                                                            ps8.setString(3, idn);
                                                            ps8.executeUpdate();

                                                            String query3 = "update Request set StatusID = '2' where Request_ID= ?";
                                                            ps9 = con.prepareStatement(query3);
                                                            ps9.setString(1, id);
                                                            ps9.executeUpdate();

                                                            String query4= "update Caregivers set Time4 = '0' where CG_ID= ?";
                                                            ps10 = con.prepareStatement(query4);
                                                            ps10.setString(1, idn);
                                                            ps10.executeUpdate();
//                                                             out.println(" Confirm ");

                                                            break;

                                                        }
//                                                    
                                                    }
                                                }
                                            }
                                            
                                            else{
                                                continue;
                                            }
                                        }
                                    }else{
                                        continue;
                                    }
                                }
                           long end = new Date().getTime();
                           out.println("This project took " + (end - start) + "milliseconds. ");
                           out.println("The job allocated Successfully! ");
                           out.println("<a href=\"Agency.jsp\"> Click here</a>");
                           out.println(" to return Agency Homepage.");
                                
                            
                        }catch(SQLException e)
//                            最外层的trycatch数据库连接
                         {
                            System.out.println(e);
                           
                         }
                        
                }
                else{
                    out.println("every blank needs to be filled in! Please ");
                }
            }
      
        }

%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Run Algorithm Page</title>
    </head>
    <body>
        
    </body>
</html>
