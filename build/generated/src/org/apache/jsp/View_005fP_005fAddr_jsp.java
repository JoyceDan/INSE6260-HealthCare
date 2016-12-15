package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class View_005fP_005fAddr_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <title>View Patient Address Page</title>\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    \n");

    if("POST".equalsIgnoreCase(request.getMethod())){
        String submitid = (String)request.getParameter("button2");
        
        if(request.getParameter("view")!=null ){
            if(request.getParameter("view").equals("View_Address")){
                Connection con = null;
                    PreparedStatement ps;
                    String query;
                    ResultSet rs;
                    PreparedStatement ps1;
                    String query1;
                    ResultSet rs1;
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
                            query = "Select P_ID FROM Request where Request_ID=?";
                            ps = con.prepareStatement(query);
                            ps.setString(1, submitid);
                            rs = ps.executeQuery();
                            int patientID = 0;
                            if(rs.next()){
                                patientID = rs.getInt("P_ID");
                            }
                            else{
                                 out.println("The request isn't exsit.");
                            }
                            
                            query1 = "Select * FROM Address where P_ID=?";
                            ps1 = con.prepareStatement(query1);
                            ps1.setInt(1, patientID);
                            rs1 = ps1.executeQuery();
                            

      out.write("\n");
      out.write("\n");
      out.write("<table border=\"1\">\n");
      out.write("    <thead>\n");
      out.write("        <tr bgcolor=\"#DEB887\">\n");
      out.write("            <th>Patient ID</th>\n");
      out.write("            <th>Apartment Number</th>\n");
      out.write("            <th>Street</th>\n");
      out.write("            <th>City</th>\n");
      out.write("            <th>PostCode</th>\n");
      out.write("        </tr>\n");
      out.write("    </thead>\n");
      out.write("    <tbody>\n");
      out.write("        ");
 while (rs1.next()) {  
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>");
      out.print(patientID);
      out.write("</td>\n");
      out.write("            <td>");
      out.print(rs1.getString("Line1")  );
      out.write("</td>\n");
      out.write("            <td>");
      out.print(rs1.getString("Line2")  );
      out.write("</td>\n");
      out.write("            <td>");
      out.print(rs1.getString("City")  );
      out.write("</td>\n");
      out.write("            <td>");
      out.print(rs1.getString("PostCode")  );
      out.write("</td>\n");
      out.write("        </tr>\n");
      out.write("        ");
 } 
      out.write("\n");
      out.write("    </tbody>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

                            
                            out.println("<a href=\"Nurse_home.jsp\"> Click here</a>");
                            out.println(" to return Nurse Homepage.");
                        }catch(SQLException e)
                         {
                            System.out.println(e);
                         }
               
            }
        }
    }



      out.write("\n");
      out.write("\n");
      out.write("\n");
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
