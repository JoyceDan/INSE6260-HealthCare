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
                        ResultSet rs3;
                        PreparedStatement ps4;
                        ResultSet rs4;
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
                                out.println(index);
                                
                                int indexN = 0;
                                String maxIDSqlN="select max(CG_ID) as CG_ID from Caregivers";
                                ps = con.prepareStatement(maxIDSqlN);
                                rs = ps.executeQuery();
                                if(rs.next()){
                                    indexN = rs.getInt("CG_ID");
                                }else{
                                    indexN = 0;
                                }
                                out.println(indexN);
                                
                                
                                query = "select Time1,Time2,Time3,Time4,BloodTest,DayCare,BloodPressure,English,French,Gender,Request_ID, (Time1+Time2+Time3+Time4) AS Request_Flex from Request Order by Request_Flex";
                                String query1 = "select Time1,Time2,Time3,Time4,BloodTest,DayCare,BloodPressure,English,French,CG_Gender,CG_ID, (Time1+Time2+Time3+Time4) AS Caregivers_Flex from Caregivers Order by Caregivers_Flex DESC";
                                ps = con.prepareStatement(query);
                                ps2 = con.prepareStatement(query1);
                                rs = ps.executeQuery();
                                rs2 = ps2.executeQuery();
                                
                                while (rs.next()){
                                    int i=0;
                                    
                                        while (rs2.next()){
                                            
                                            if (((rs.getString("BloodTest").equalsIgnoreCase("1"))&&(rs2.getString("BloodTest").equalsIgnoreCase("1")))||((rs.getString("DayCare").equalsIgnoreCase("1"))&&(rs2.getString("DayCare").equalsIgnoreCase("1")))||((rs.getString("BloodPressure").equalsIgnoreCase("1"))&&(rs2.getString("BloodPressure").equalsIgnoreCase("1"))))
                                            {
                                                if(rs.getString("Time1").equalsIgnoreCase("1")&&rs2.getString("Time1").equalsIgnoreCase("1"))
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
                                                        
                                                        out.println(indexID);
                                                        
                                                        String id = rs.getString("Request_ID").toString();
                                                        String idn = rs2.getString("CG_ID").toString();
                                                        
                                                        out.println(id+idn);
                                                        
                                                        String query2 = "insert into Appointments (AppointmentID,Final_Time,Request_ID,NurseID,StatusID) values (?,9,?,?,2)";
                                                        
                                                        
                                                        ps3 = con.prepareStatement(query2);
                                                        ps3.setInt(1, indexID);
                                                        ps3.setString(2, id);
                                                        ps3.setString(3, idn);
                                                        
                                                        ps3.executeUpdate();
                                                        break;
                                                        
                                                    }
                                                }
                                            }
                                            else{
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
