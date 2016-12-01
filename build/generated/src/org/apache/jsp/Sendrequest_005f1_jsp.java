package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class Sendrequest_005f1_jsp extends org.apache.jasper.runtime.HttpJspBase
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
                String time1= request.getParameter("time1");
                String time2= request.getParameter("time2");
                String time3= request.getParameter("time3");
                String time4= request.getParameter("time4");
                
                out.println(username+realname+gender+age+email+time1+time2+time3+time4);
                if((!realname.isEmpty())&&(!gender.isEmpty())&&(!age.isEmpty())&&(!city.isEmpty())&&(!email.isEmpty())&&(!time1.isEmpty())&&(!time2.isEmpty())&&(!time3.isEmpty())&&(!time4.isEmpty())){
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
                                
                                int index = 0;
                                String maxIDSql="select max(CG_ID) as CG_ID from Caregivers";
                                ps = con.prepareStatement(maxIDSql);
                                rs = ps.executeQuery();
                                if(rs.next()){
                                    index = rs.getInt("CG_ID")+1;
                                }else{
                                    index = 0;
                                }
                                
                                query = "insert into Caregivers (CG_ID,CG_Username,CG_Name,CG_Gender,CG_Age,CG_ContactEmail,English,Chinese,French,Japanese,CG_Location) values (?,?,?,?,?,?,?,?,?,?,?)";
                                ps = con.prepareStatement(query);
                                ps.setInt(1, index);
                                ps.setString(2, username);
                                ps.setString(3, realname);
                                ps.setString(4, gender);
                                ps.setString(5, age);
                                ps.setString(6, email);
                                ps.setString(7, time1);
                                ps.setString(8, time2);
                                ps.setString(9, time3);
                                ps.setString(10, time4);
                                ps.setString(11, city);
                                out.println(" test1");

                                ps.executeUpdate();
                                
                                out.println(" test2");
                                
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
      out.write("        <title>Caregivers information Page</title>\n");
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
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td>Gender: </td>\n");
      out.write("                        <td><input type=\"text\" name=\"Gender\" value=\"\" size=\"30\" placeholder=\"Male or Female\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td>Which city do you live ?: </td>\n");
      out.write("                        <td><select name=\"City\">\n");
      out.write("                                <option>Montreal</option>\n");
      out.write("                                <option>Quebec</option>\n");
      out.write("                                <option>Lava</option>\n");
      out.write("                            </select></td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td>Ill type</td>\n");
      out.write("                        <td> Blood Test: <input type=\"checkbox\" name=\"Realname\" value=\"1\" />Yes <input type=\"checkbox\" name=\"Realname\" value=\"0\" /> No</td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td></td>\n");
      out.write("                        <td>Day Care: <input type=\"checkbox\" name=\"Age\" value=\"1\" />Yes <input type=\"checkbox\" name=\"Age\" value=\"0\" /> No</td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td></td>\n");
      out.write("                        <td>Blood Pressure: <input type=\"checkbox\" name=\"Email\" value=\"1\" />Yes <input type=\"checkbox\" name=\"Email\" value=\"0\" /> No</td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td>Time prefer</td>\n");
      out.write("                        <td> 9-10AM: <input type=\"checkbox\" name=\"time1\" value=\"1\" />Yes <input type=\"checkbox\" name=\"time1\" value=\"0\" /> No</td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td></td>\n");
      out.write("                        <td>11-12AM:<input type=\"checkbox\" name=\"time2\" value=\"1\" />Yes <input type=\"checkbox\" name=\"time2\" value=\"0\" /> No</td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td></td>\n");
      out.write("                        <td>2-3PM:<input type=\"checkbox\" name=\"time3\" value=\"1\" />Yes <input type=\"checkbox\" name=\"time3\" value=\"0\" /> No</td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td></td>\n");
      out.write("                        <td>4-5PM:<input type=\"checkbox\" name=\"time4\" value=\"1\" />Yes <input type=\"checkbox\" name=\"time4\" value=\"0\" /> No </td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("            <input type=\"submit\" value=\"Submit\" name=\"submit\" />\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
