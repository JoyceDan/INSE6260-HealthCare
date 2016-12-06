package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class P_005fAddress_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    if("POST".equalsIgnoreCase(request.getMethod())){
        if(request.getParameter("submit")!=null ){
            if(request.getParameter("submit").equals("Submit")){
                String username= session.getAttribute("username").toString();
                String realname= request.getParameter("Realname");
                String gender= request.getParameter("Gender");
                String age= request.getParameter("Age");
                String city= request.getParameter("City");
                String email= request.getParameter("Email");
                String english= request.getParameter("English");
                String french= request.getParameter("French");
                String bt= request.getParameter("BT");
                String dc= request.getParameter("DC");
                String bp= request.getParameter("BP");
                
                if((!realname.isEmpty())&&(!gender.isEmpty())&&(!age.isEmpty())&&(!city.isEmpty())&&(!email.isEmpty())&&(!english.isEmpty())&&(!french.isEmpty())){
                        Connection con = null;
                        PreparedStatement ps;
                        PreparedStatement ps1;
                        ResultSet rs1;
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
                                
//                                int index = 0;
//                                String maxIDSql="select max(CG_ID) as CG_ID from Caregivers";
//                                ps = con.prepareStatement(maxIDSql);
//                                rs = ps.executeQuery();
//                                if(rs.next()){
//                                    index = rs.getInt("CG_ID")+1;
//                                }else{
//                                    index = 0;
//                                }
                                int index = 0;
                                String IDquery = "select CG_ID from Caregivers where CG_Username=?";
                                ps1 = con.prepareStatement(IDquery);
                                ps1.setString(1, username);
                                rs1 = ps1.executeQuery();
                                if(rs1.next()){
                                    index = rs1.getInt("CG_ID");
                                }else{
                                     out.println("Wrong system");
                                }
                                
                                
                                query = "update Caregivers set CG_Name=?,CG_Gender=?,CG_Age=?,CG_ContactEmail=?,English=?,French=?,CG_Location=?,BloodTest=?,DayCare=?,BloodPressure=? where CG_ID=?";
                                ps = con.prepareStatement(query);
                                
                                ps.setString(1, realname);
                                ps.setString(2, gender);
                                ps.setString(3, age);
                                ps.setString(4, email);
                                ps.setString(5, english);
                                ps.setString(6, french);
                                ps.setString(7, city);
                                ps.setString(8, bt);
                                ps.setString(9, dc);
                                ps.setString(10, bp);
                                ps.setInt(11, index);

                                ps.executeUpdate();
                                
                                out.println(" Update Successfully... Please ");
                                out.println("<a href=\"Nurse_home.jsp\"> Click Here to return homepage. </a>");
                            
                            
                        }catch(SQLException e)
                         {
                            System.out.println(e);
                           
                         }
                        
                }
                else{
                    out.println("every blank needs to be filled in! Please ");
                }
            }
            
        }
    }


      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"CSS_style.css\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Patient's address</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form action=\"\" method=\"POST\">\n");
      out.write("            <table border=\"1\">\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Attribute</th>\n");
      out.write("                        <th>Content</th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Username: </td>\n");
      out.write("                        <td>");
 out.println(session.getAttribute("username")); 
      out.write("</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Apartment: </td>\n");
      out.write("                        <td><input type=\"text\" name=\"Apartment\" value=\"\" size=\"30\" placeholder=\"Enter your Apartment number\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Street: </td>\n");
      out.write("                        <td><input type=\"text\" name=\"Street\" value=\"\" size=\"30\" placeholder=\"Enter your street and building number\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>City: </td>\n");
      out.write("                        <td><select name=\"City\">\n");
      out.write("                                <option>Montreal</option>\n");
      out.write("                                <option>Quebec</option>\n");
      out.write("                                <option>Laval</option>\n");
      out.write("                            </select></td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td>PostCode: </td>\n");
      out.write("                        <td><input type=\"text\" name=\"PostCode\" value=\"\" size=\"30\" placeholder=\"Enter your Postcode\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("            <input type=\"submit\" value=\"Submit\" name=\"submit\" />\n");
      out.write("        </form>\n");
      out.write("         <form action=\"Nurse_home.jsp\">\n");
      out.write("            <input type=\"submit\" value=\"Return\" name=\"Return\" />\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
