package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.Connection;

public final class Agency_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Agency Page</title>\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("        <form method=\"POST\" name=\"form1\" action=AllRequestpage.jsp> \n");
      out.write("        <!--<form method=\"POST\" name=\"form1\">-->\n");
      out.write("        <input type=\"submit\" value=\"Display all Request by patients\" name=\"DisplayRequest\" />\n");
      out.write("        </form>\n");
      out.write("        <br><br>\n");
      out.write("        <form method=\"POST\" name=\"form2\" action=AllNursepage.jsp> \n");
      out.write("        <input type=\"submit\" value=\"Display all nurses\" name=\"DisplayNurse\" />\n");
      out.write("        </form>\n");
      out.write("        <br><br>\n");
      out.write("        <form method=\"POST\" name=\"form2\" action=run.jsp> \n");
      out.write("        <input type=\"submit\" value=\"Run\" name=\"run\" />\n");
      out.write("        </form>\n");
      out.write("        <br><br>\n");
      out.write("        <form action=\"logout.jsp\" method=\"POST\">\n");
      out.write("            <input type=\"submit\" value=\"Logout\" name=\"logout\">\n");
      out.write("        </form>\n");
      out.write("        \n");
      out.write("\n");
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
