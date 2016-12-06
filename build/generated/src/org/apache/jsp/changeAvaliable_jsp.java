package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class changeAvaliable_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("\n");

    if("POST".equalsIgnoreCase(request.getMethod())){
        if(request.getParameter("submit")!=null ){
            if(request.getParameter("submit").equals("Submit")){
                String time1= request.getParameter("Time1");
                String time2= request.getParameter("Time2");
                String time3= request.getParameter("Time3");
                String time4= request.getParameter("Time4");
                String username= session.getAttribute("username").toString();
                
                if((!time1.isEmpty())&&(!time2.isEmpty())&&(!time3.isEmpty())&&(!time4.isEmpty())){
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
                            query = "update Caregivers set Time1=?,Time2=?,Time3=?,Time4=? where CG_Username=?";
                            ps = con.prepareStatement(query);
                            ps.setString(1, time1);
                            ps.setString(2, time2);
                            ps.setString(3, time3);
                            ps.setString(4, time4);
                            ps.setString(5, username);
                            ps.executeUpdate();
                            out.println(" Update Successfully... Please ");
                        }catch(SQLException e)
                         {
                            System.out.println(e);
                         }
               
            
                }else{
                    out.println("every blank needs to be filled in! Please ");
                }
                
            }
        }
    }


      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"CSS_style.css\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Nurse change the avaliable time Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form action=\"\" method=\"POST\">\n");
      out.write("            <table border=\"1\">\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <th> Free Time</th>\n");
      out.write("                        <th> Yes/No </th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td>Free between 9-10 AM:</td>\n");
      out.write("                        <td><input type=\"checkbox\" name=\"Time1\" value=\"1\" />Yes <input type=\"checkbox\" name=\"Time1\" value=\"0\" /> No</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Free between 11-12 AM:</td>\n");
      out.write("                        <td><input type=\"checkbox\" name=\"Time2\" value=\"1\" />Yes <input type=\"checkbox\" name=\"Time2\" value=\"0\" /> No</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Free between 2-3 PM:</td>\n");
      out.write("                        <td><input type=\"checkbox\" name=\"Time3\" value=\"1\" />Yes <input type=\"checkbox\" name=\"Time3\" value=\"0\" /> No</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Free between 4-5 PM:</td>\n");
      out.write("                        <td><input type=\"checkbox\" name=\"Time4\" value=\"1\" />Yes <input type=\"checkbox\" name=\"Time4\" value=\"0\" /> No</td>\n");
      out.write("                    </tr>\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("            <input type=\"submit\" value=\"Submit\" name=\"submit\" />\n");
      out.write("\n");
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
