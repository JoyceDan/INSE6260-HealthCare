package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class sendrequestlog_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    out.println("sada");
        if("POST".equalsIgnoreCase(request.getMethod())){
            out.println("sada1");
        if(request.getParameter("send")!=null ){
            if(request.getParameter("send").equals("Send")){
                
                    String bt= request.getParameter("BT");
                    String dc= request.getParameter("DC");
                    String bp= request.getParameter("BP");
                    String time1= request.getParameter("time1");
                    String time2= request.getParameter("time2");
                    String time3= request.getParameter("time3");
                    String time4= request.getParameter("time4");
                    String gender= request.getParameter("genderP");
                 out.println(bt+dc+bp+time1+time2+time3+time4+gender);
                    if((!bt.isEmpty())&&(!dc.isEmpty())&&(!bp.isEmpty())&&(!time1.isEmpty()&&(!time2.isEmpty())&&(!time3.isEmpty() )&&(!time4.isEmpty() )&&(!gender.isEmpty() ))   ){
                            out.println("Test1 ");
                            Connection con= null;
                            PreparedStatement ps;
                            ResultSet rs;
                            String query;
                            out.println("Test2 ");
                        
                            try{
                            Class.forName("com.mysql.jdbc.Driver");
                            out.println("Test3 ");
                            }catch(Exception e)
                            {
                                System.out.println(e);
                            }

                            try{
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Healthcare", "root", "root");
                                query = "SELECT P_ID FROM Patient WHERE P_Username = ? ";
                                ps = con.prepareStatement(query);
                                out.println("Test4 ");
                                ps.setString(1,session.getAttribute("username").toString());
                                rs = ps.executeQuery();
                                out.println("Test4.5 ");
                                 String Patient_id = session.getAttribute("username").toString();
                                 out.println("Test5 ");
                                 out.println("Patient_id");
                                 out.println("Test6 ");
//                                query = "insert into Rrequest (Username,Password,Identify,SecQue) values (?,?,?,?)";
//                                ps = con.prepareStatement(query);
//                                ps.setString(1, type);
//                                ps.setString(2, id);
//                                ps.setString(3, identify);
//                                ps.setString(4, securityQues);
//
//                                ps.executeUpdate();
//
//                                session= request.getSession();
//                                session.setAttribute("username", username);
//                                response.sendRedirect("login.jsp");

                            }catch(SQLException e){
                                System.out.println(e);
                            }
                    
                        
                    }
                    else{
                        out.println("All the values are not empty! Please try again.");
                    }
                }
            
            }
        }


      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>send a request log Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("      \n");
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
