package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.Date;
import java.sql.Connection;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
 Class.forName("com.mysql.jdbc.Driver"); 
      out.write("\n");
      out.write("\n");
      out.write(" \n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");

    
    session = request.getSession(false);
    if(session.getAttribute("username")!=null){
        Connection con = null;
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
                    query = "SELECT * FROM Login WHERE Login.Username = ?";
                    ps = con.prepareStatement(query);
                    ps.setString(1,session.getAttribute("username").toString());
                    rs = ps.executeQuery();
                    if(rs.next()){
                        
//                        out.println("Welcome,"+rs.getString("Username")+"!!!");
//                        out.println("<br><br> Login!!! ");
//                        
//                        //create a logout button
//                        out.println("<form action=\"logout.jsp\" method=\"post\">");
//                        out.println("<input type=\"submit\" name=\"logout\" value=\"Logout\">");
//                        out.println("</form>");
//                        
//                        out.println("<br><br><a href=\"changePassword.jsp?uname="+session.getAttribute("username").toString()+"\"> Change password </a>");
//                          out.println("<form action=\"Patient_home.jsp\" method=\"post\">");
//                          out.println("<input type=\"submit\" name=\"welcome\" value=\"welcome\">");
//                          out.println("</form>");
                         if("POST".equalsIgnoreCase(request.getMethod()))
                         {
                             response.sendRedirect("Patient_home.jsp");
                         }
                          
                    }
                    
                    
                }catch(SQLException e)
                {
                    System.out.println(e);
                }
        
    }
    
    
    if("POST".equalsIgnoreCase(request.getMethod()))
    {
        if(request.getParameter("login")!= null)
        {
            if(request.getParameter("login").equals("Login"))
            {
                String USERNAME = request.getParameter("UserName");
                String PASSWORD = request.getParameter("Password");
                String IDENTIFY = request.getParameter("Charater");

                
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
                    query = "SELECT * FROM Login WHERE Login.Username = ? AND Login.Password = ? AND Login.Identify = ?";
                    ps = con.prepareStatement(query);
                    ps.setString(1, USERNAME);
                    ps.setString(2, PASSWORD);
                    ps.setString(3, IDENTIFY);
                    rs = ps.executeQuery();
                    
                    if(rs.next())
                    {
                        //Login sucessful;
                        //creating session;
                        session = request.getSession();
                        //Start session with the help of attribute ID being unique
                        session.setAttribute("username", USERNAME);
                        response.sendRedirect("login.jsp");
                        
                    }
                    else{
                        out.println("Invalid Username or Password! Please ");
                        out.println("<a href=\"index.jsp\"> Try Again. </a>");
                    }
                    
                }catch(SQLException e)
                {
                    System.out.println(e);
                }
            }
        }
        else if (request.getParameter("registerLogin")!=null  )
        {
            if(request.getParameter("registerLogin").equals("Register"))
            {
                response.sendRedirect("register.jsp");
            }
        }
    
    }



      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>login Page</title>\n");
      out.write("    </head>\n");
      out.write("    ");
 Date date = new Date(); 
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <p>Today's date is ");
      out.print( date );
      out.write(" </p>\n");
      out.write("\n");
      out.write("        \n");
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
