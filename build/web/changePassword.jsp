<%-- 
    Document   : changePassword
    Created on : Nov 9, 2016, 8:02:21 PM
    Author     : DanQiao
--%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    if("POST".equalsIgnoreCase(request.getMethod()))
    {
        if(request.getParameter("changePwd")!=null)
        {
            if(request.getParameter("changePwd").equals("Change Password"))
            {
                String usernameFP = request.getParameter("nameFP");
                String securityQuesFP = request.getParameter("securityFP");
                String passFP = request.getParameter("passFP");
                String repassFP = request.getParameter("repassFP");
                
                if((!usernameFP.isEmpty()) && (!securityQuesFP.isEmpty()) && (!passFP.isEmpty()) && (!repassFP.isEmpty()))
                {
                    if(passFP.equals(repassFP))
                    {
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
                            query ="Select * from Login where Username=? AND SecQue=?";
                            ps = con.prepareStatement(query);
                            ps.setString(1,usernameFP);
                            ps.setString(2, securityQuesFP);
                            
                            rs = ps.executeQuery();
                            
                            if(rs.next())
                            {
                                query = "update Login set password=? where username=?";
                                ps=con.prepareStatement(query);
                                ps.setString(1, passFP);
                                ps.setString(2, usernameFP);
                                ps.executeUpdate();
                                out.println(" Password Changed Successfully... Please ");
                                out.println("<a href=\"index.jsp\"> Click Here to login. </a>");
                            }else{
                            out.println(" The information doesn't exit. Password Changed failed... Please try again ");
                               
                            }
                            
                            
                        }catch(SQLException e)
                         {
                            System.out.println(e);
                         }
                    }
                }
                out.println(" Sorry. You need to fill in all the blank. ");
                         
            }
        
        }
    
    }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS_style.css">
        <title>Change Password Page</title>
    </head>
    <body>
        <form action="" method="POST">
            <input type="text" name="nameFP" placeholder="What's your username for login?" size="50">
            <br><br>
            <input type="text" name="securityFP" placeholder="In which city you were born? " value="" size="50" /> 
            <br><br>
            <input type="password" name="passFP" value="" size="50" placeholder="Enter your Password" />
            <br><br>
            <input type="password" name="repassFP" placeholder="Re-Enter your new Password" size="50">
            <br><br>
            <input type="submit" name="changePwd" value="Change Password">
        </form>
        <form action="index.jsp">
        <input type="submit" value="Return" name="Return" />
        </form>
    </body>
</html>
