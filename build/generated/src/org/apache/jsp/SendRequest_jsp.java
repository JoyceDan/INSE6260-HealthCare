package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.Date;

public final class SendRequest_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write(" \n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"CSS_style.css\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Send Request Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form name=\"form1\" action=\"sendrequestlog.jsp\" method=\"POST\">     \n");
      out.write("            <table border=\"1\">\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Attribute</th>\n");
      out.write("                        <th>Content</th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Ill type: </td>\n");
      out.write("                        <td>Blood Test :<input type=\"checkbox\" name=\"BT\" value=\"1\" />Yes <input type=\"checkbox\" name=\"BT\" value=\"0\" /> No</td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td></td>\n");
      out.write("                        <td>Day Care :<input type=\"checkbox\" name=\"DC\" value=\"1\" />Yes <input type=\"checkbox\" name=\"DC\" value=\"0\" /> No</td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td></td>\n");
      out.write("                        <td>Blood Pressure :<input type=\"checkbox\" name=\"BP\" value=\"1\" />Yes <input type=\"checkbox\" name=\"BP\" value=\"0\" /> No</td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td>Patient Name: </td>\n");
      out.write("                        <td>");
 out.println(session.getAttribute("username")); 
      out.write("</td>\n");
      out.write("                    </tr>\n");
      out.write("                   \n");
      out.write("                    <tr>\n");
      out.write("                        <td>Time prefer 9-10AM: </td>\n");
      out.write("                        <td> <input type=\"checkbox\" name=\"time1\" value=\"1\" />Yes <input type=\"checkbox\" name=\"time1\" value=\"0\" /> No</td>\n");
      out.write("                      \n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td>Time prefer 11-12AM: </td>\n");
      out.write("                        <td><input type=\"checkbox\" name=\"time2\" value=\"1\" />Yes <input type=\"checkbox\" name=\"time2\" value=\"0\" /> No</td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td>Time prefer 2-3PM</td>\n");
      out.write("                        <td><input type=\"checkbox\" name=\"time3\" value=\"1\" />Yes <input type=\"checkbox\" name=\"time3\" value=\"0\" /> No</td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td>Time prefer 4-5PM</td>\n");
      out.write("                        <td><input type=\"checkbox\" name=\"time4\" value=\"1\" />Yes <input type=\"checkbox\" name=\"time4\" value=\"0\" /> No</td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td>Nurse's gender prefer</td>\n");
      out.write("                        <td><select name=\"genderP\">\n");
      out.write("                                <option>Male</option>\n");
      out.write("                                <option>Female</option>\n");
      out.write("                            </select></td>\n");
      out.write("                    </tr>\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("            <input type=\"submit\" value=\"Send\" name=\"send\" />\n");
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
