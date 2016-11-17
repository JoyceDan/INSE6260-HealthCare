package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.Connection;

public final class changePassword_jsp extends org.apache.jasper.runtime.HttpJspBase
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
                               // out.println("<br> Password Changed Successfully... Please <a herf=\"index.jsp\"> Click Here </a> to login ... <br>");
                                out.println(" Password Changed Successfully... Please ");
                                out.println("<a href=\"index.jsp\"> Click Here to login. </a>");
                            }
                            
                            
                        }catch(SQLException e)
                         {
                            System.out.println(e);
                         }
                    }
                }
            }
        
        }
    
    }


      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"CSS_style.css\">\n");
      out.write("        <title>Change Password Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form action=\"\" method=\"POST\">\n");
      out.write("            <input type=\"text\" name=\"nameFP\" placeholder=\"What's your username for login?\" size=\"50\">\n");
      out.write("            <br><br>\n");
      out.write("            <input type=\"text\" name=\"securityFP\" placeholder=\"In which city you were born? \" value=\"\" size=\"50\" /> \n");
      out.write("            <br><br>\n");
      out.write("            <input type=\"password\" name=\"passFP\" value=\"\" size=\"50\" placeholder=\"Enter your Password\" />\n");
      out.write("            <br><br>\n");
      out.write("            <input type=\"password\" name=\"repassFP\" placeholder=\"Re-Enter your new Password\" size=\"50\">\n");
      out.write("            <br><br>\n");
      out.write("            <input type=\"submit\" name=\"changePwd\" value=\"Change Password\">\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
