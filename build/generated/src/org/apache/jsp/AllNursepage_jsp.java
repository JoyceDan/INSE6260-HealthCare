package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.Connection;

public final class AllNursepage_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
      out.write('\n');
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
      out.write("        <title>Show Nurse Page</title>\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("        \n");
      out.write("\n");

     if("POST".equalsIgnoreCase(request.getMethod())){
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
//                    query = "SELECT b.AvailabilityID,b.Time1,b.Time2,b.Time3,b.Time4,a.CG_ID,a.CG_Name,a.CG_AvaliableID"
//                            + "FROM Caregivers a, Availability b"
//                            + "Where b.AvailabilityID = a.CG_AvaliableID";
                    query = "SELECT Caregivers.CG_ID,Caregivers.CG_Name,Availability.Time1 FROM Caregivers LEFT JOIN Availability ON Caregivers.CG_AvaliableID = Availability.AvailabilityID";
                     
                    ps = con.prepareStatement(query);
                  
                    rs = ps.executeQuery();
                    
//                    if(rs.first())
//                    {

      out.write("\n");
      out.write("<table border=\"1\">\n");
      out.write("    <thead>\n");
      out.write("        <tr bgcolor=\"#DEB887\">\n");
      out.write("            <th>Caregiver_ID</th>\n");
      out.write("            <th>Caregiver_Name</th>\n");
      out.write("            <th>Caregiver_Name</th>\n");
      out.write("    </thead>\n");
      out.write("    <tbody>\n");
      out.write("        ");
 while (rs.next()) { 
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>");
      out.print(rs.getString("CG_ID")  );
      out.write("</td>\n");
      out.write("            <td>");
      out.print(rs.getString("CG_Name")  );
      out.write("</td>\n");
      out.write("            <td>");
      out.print(rs.getString("Time1")  );
      out.write("</td>\n");
      out.write("            \n");
      out.write("        </tr>\n");
      out.write("        ");
 } 
      out.write("\n");
      out.write("    </tbody>\n");
      out.write("</table>\n");
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    \n");
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
