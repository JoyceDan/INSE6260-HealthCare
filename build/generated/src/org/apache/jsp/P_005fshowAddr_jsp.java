package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class P_005fshowAddr_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <title>Show Info Page</title>\n");
      out.write("    </head>\n");
      out.write("\n");

    
     if("POST".equalsIgnoreCase(request.getMethod())){
         String username= session.getAttribute("username").toString();
         Connection con= null;
                PreparedStatement ps;
                ResultSet rs;
                String query;
                out.println("Welcome!!!");
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                }catch(Exception e)
                {
                    System.out.println(e);
                }
                
                try{
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Healthcare", "root", "root");
                    query = "SELECT * FROM Patient WHERE P_Username=?";
                    ps = con.prepareStatement(query);
                    ps.setString(1,username);
                    rs = ps.executeQuery();
//                    if(rs.first())
//                    {

      out.write("\n");
      out.write("<table border=\"1\">\n");
      out.write("    <thead>\n");
      out.write("        <tr bgcolor=\"#DEB887\">\n");
      out.write("            <th>Patient ID</th>\n");
      out.write("            <th>Username</th>\n");
      out.write("            <th>Realname</th>\n");
      out.write("            <th>Gender</th>\n");
      out.write("            <th>Age</th>\n");
      out.write("            <th>Email</th>\n");
      out.write("        </tr>\n");
      out.write("    </thead>\n");
      out.write("    <tbody>\n");
      out.write("        ");
 while (rs.next()) { 
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>");
      out.print(rs.getString("P_ID")  );
      out.write("</td>\n");
      out.write("            <td>");
      out.print(rs.getString("P_Username") );
      out.write("</td>\n");
      out.write("            <td>");
      out.print(rs.getString("P_Name"));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(rs.getString("P_Gender")  );
      out.write("</td>\n");
      out.write("            <td>");
      out.print(rs.getString("P_Age") );
      out.write("</td>\n");
      out.write("            <td>");
      out.print(rs.getString("P_Email"));
      out.write("</td>\n");
      out.write("        </tr>\n");
      out.write("        ");
 } 
      out.write("\n");
      out.write("    </tbody>\n");
      out.write("</table>\n");
      out.write("    <form method=\"POST\" action=\"P_Info.jsp\">\n");
      out.write("        <br><br>\n");
      out.write("        <input type=\"submit\" value=\"update infomation\" />\n");
      out.write("    </form>\n");
      out.write("    \n");
      out.write("    <form action=\"Patient_home.jsp\">\n");
      out.write("        <br><br>\n");
      out.write("            <input type=\"submit\" value=\"Return\" name=\"Return\" />\n");
      out.write("    </form>\n");
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
