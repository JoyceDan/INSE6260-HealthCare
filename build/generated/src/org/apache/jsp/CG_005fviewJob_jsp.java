package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.Connection;

public final class CG_005fviewJob_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
 Class.forName("com.mysql.jdbc.Driver"); 
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <title>Nurse view all job Page</title>\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("        \n");
      out.write("\n");

     if("POST".equalsIgnoreCase(request.getMethod())){
      
            String user = session.getAttribute("username").toString() ;
            
            Connection con= null;
                PreparedStatement ps;
                ResultSet rs;
                String query;
                PreparedStatement ps1;
                ResultSet rs1;
                String query1;
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                }catch(Exception e)
                {
                    System.out.println(e);
                }
                
                try{
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Healthcare", "root", "root");
                    query ="SELECT CG_ID from Caregivers Where CG_Username = ? ";
                    ps = con.prepareStatement(query);
                    ps.setString(1, user);
                    rs = ps.executeQuery();
                    int indexID = 0;
                    if(rs.next()){
                                    indexID = rs.getInt("CG_ID");
                                }else{
                                   out.println("No this Nurse");
                                }
                   
                    query1 = "SELECT * FROM Appointments WHERE NurseID= ? ";
                    ps1 = con.prepareStatement(query1);
                    ps1.setInt(1, indexID);
                    rs1 = ps1.executeQuery();
                    
//                    if(rs.first())
//                    {

      out.write("\n");
      out.write("<table border=\"1\">\n");
      out.write("    <thead>\n");
      out.write("        <tr bgcolor=\"#DEB887\">\n");
      out.write("            <th>Appointment_ID</th>\n");
      out.write("            <th>Final_Time</th>\n");
      out.write("            <th>Request_ID</th>\n");
      out.write("            <th>Status</th>\n");
      out.write("            <th>Option1</th>\n");
      out.write("            <th>Option2</th>\n");
      out.write("            <th>Option3</th>\n");
      out.write("        </tr>\n");
      out.write("    </thead>\n");
      out.write("    <tbody>\n");
      out.write("        ");
 while (rs1.next()) {
            String a = "";
            String b = "";
            String time = rs1.getString("Final_Time");
            String idn = rs1.getString("Request_ID");
            String status = rs1.getString("StatusID");
//            session = request.getSession();
//            session.setAttribute("submitid", idn);
            
            if(time.endsWith("9")){
                a = "9-10AM";
            }
            if(time.endsWith("11")){
                a = "11-12AM";
            }
            if(time.endsWith("2")){
                a = "2-3PM";
            }
            if(time.endsWith("9")){
                a = "4-5PM";
            }
            if(status.equalsIgnoreCase("1")){
                b = "Submitted";
            }
            if(status.equalsIgnoreCase("2")){
                b = "Allocated";
            }
            if(status.equalsIgnoreCase("3")){
                b = "Cancelled";
            }
            if(status.equalsIgnoreCase("4")){
                b = "Completed";
            }
        
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>");
      out.print(rs1.getString("AppointmentID")  );
      out.write("</td>\n");
      out.write("            <td>");
      out.print(a);
      out.write("</td>\n");
      out.write("            <td>");
      out.print(rs1.getString("Request_ID")  );
      out.write("</td>\n");
      out.write("            <td>");
      out.print(b);
      out.write("</td>\n");
      out.write("            <td>\n");
      out.write("                <form action=\"cancellog.jsp\" method=\"GET\">\n");
      out.write("                <input type=\"submit\" value=\"Cancel\" name=\"cancel\" />\n");
      out.write("                <input type=\"hidden\" name= \"button1\" value=");
      out.print(idn);
      out.write(" />\n");
      out.write("                </form>\n");
      out.write("            </td>\n");
      out.write("            <td>\n");
      out.write("                <form action=\"complog.jsp\" method=\"GET\">\n");
      out.write("                <input type=\"submit\" value=\"Completed\" name=\"completed\" />\n");
      out.write("                <input type=\"hidden\" name= \"button\" value=");
      out.print(idn);
      out.write(" />\n");
      out.write("                </form>\n");
      out.write("<!--                <a herf=\"complog.jsp?id=idn\">completed</a>-->\n");
      out.write("            </td>\n");
      out.write("            <td>\n");
      out.write("                <form action=\"View_P_Addr.jsp\" method=\"POST\">\n");
      out.write("                <input type=\"submit\" value=\"View_Address\" name=\"view\" />\n");
      out.write("                <input type=\"hidden\" name= \"button2\" value=");
      out.print(idn);
      out.write(" />\n");
      out.write("                </form>\n");
      out.write("<!--                <a herf=\"complog.jsp?id=idn\">completed</a>-->\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("        ");
 } 
      out.write("\n");
      out.write("    </tbody>\n");
      out.write("</table>\n");
      out.write("    <form action=\"Nurse_home.jsp\">\n");
      out.write("            <input type=\"submit\" value=\"Return\" name=\"Return\" />\n");
      out.write("        </form>\n");
      out.write("\n");

//                        System.out.println(rs.getInt("Request_ID"));
//                        System.out.println(rs.getString("P_ID"));

//                    }
//                    else{
//                        
//                    }
                    
                }catch(SQLException e)
                {
                    System.out.println(e);
                }
            }

      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
