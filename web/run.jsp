<%-- 
    Document   : run
    Created on : Dec 1, 2016, 2:59:36 PM
    Author     : DanQiao
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    if("POST".equalsIgnoreCase(request.getMethod())){
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
                                String maxIDSql="select max(Request_ID) as Request_ID from Request";
                                ps = con.prepareStatement(maxIDSql);
                                rs = ps.executeQuery();
                                if(rs.next()){
                                    index = rs.getInt("Request_ID");
                                }else{
                                    index = 0;
                                }
//                                out.println(index);
                                
                                int indexN = 0;
                                String maxIDSqlN="select max(CG_ID) as CG_ID from Caregivers";
                                ps = con.prepareStatement(maxIDSqlN);
                                rs = ps.executeQuery();
                                if(rs.next()){
                                    indexN = rs.getInt("CG_ID");
                                }else{
                                    indexN = 0;
                                }
//                                out.println(indexN);
                                
                                
                                query = "select Time1,Time2,Time3,Time4,BloodTest,DayCare,BloodPressure,English,French,Gender,Request_ID, (Time1+Time2+Time3+Time4) AS Request_Flex from Request Order by Request_Flex";
                                ps = con.prepareStatement(query);
                                
                                rs = ps.executeQuery();
                                
                                
                                while (rs.next()){
                                    out.println("Next Request:"+rs.getString("Request_ID"));
                                    String query1 = "select Time1,Time2,Time3,Time4,BloodTest,DayCare,BloodPressure,English,French,CG_Gender,CG_ID, (Time1+Time2+Time3+Time4) AS Caregivers_Flex from Caregivers Order by Caregivers_Flex DESC";
                                    ps2 = con.prepareStatement(query1);
                                    rs2 = ps2.executeQuery();
//                                        rs2.first();
                                        while (rs2.next()){
                                            out.println(" Nurse: "+rs2.getString("CG_ID"));
                                            if (((rs.getString("BloodTest").equalsIgnoreCase("1"))&&(rs2.getString("BloodTest").equalsIgnoreCase("1")))||((rs.getString("DayCare").equalsIgnoreCase("1"))&&(rs2.getString("DayCare").equalsIgnoreCase("1")))||((rs.getString("BloodPressure").equalsIgnoreCase("1"))&&(rs2.getString("BloodPressure").equalsIgnoreCase("1"))))
                                            {
                                                if(rs.getString("Time1").equalsIgnoreCase("1")&&rs2.getString("Time1").equalsIgnoreCase("1"))
                                                {
                                                    if(rs.getString("Gender").equalsIgnoreCase("Male")&&rs2.getString("CG_Gender").equalsIgnoreCase("Male")||rs.getString("Gender").equalsIgnoreCase("Female")&&rs2.getString("CG_Gender").equalsIgnoreCase("Female"))
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

                                                            out.println(" APP_ID:"+indexID);

                                                            String id = rs.getString("Request_ID").toString();
                                                            String idn = rs2.getString("CG_ID").toString();

                                                            out.println(" Requst_ID="+id+" CG_ID="+idn);

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

    //                                                        String maxSql0="select Time1 from Caregivers";
    //                                                        ps7 = con.prepareStatement(maxSql0);
    //                                                        rs7 = ps7.executeQuery();
    //                                                        
    //                                                        out.println(" Time1="+rs7.getString("Time1"));
                                                            out.println(" Confirm ");
                                                            break;

                                                        }
//                                                    out.println(" language is not match! "+" < br> ");
                                                    }
                                                }
//                                                out.println(" Time1 is not match! "+" < br> ");
                                            }
                                            
                                            else{
//                                                out.println(" Type is not match, change to next nurse! "+" < br> ");
                                                continue;
                                            }
                                        }
                        
                                    }
                                
                                
                            
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

%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Run Algorithm Page</title>
    </head>
    <body>
        
    </body>
</html>
