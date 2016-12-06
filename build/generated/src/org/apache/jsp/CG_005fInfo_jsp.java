package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class CG_005fInfo_jsp extends org.apache.jasper.runtime.HttpJspBase
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
                String english= request.getParameter("English");
                String chinese= request.getParameter("Chinese");
                String french= request.getParameter("French");
                String japanese= request.getParameter("Japanese");
                
//                out.println(username+realname+gender+age+email+english+chinese+french+japanese);
                if((!realname.isEmpty())&&(!gender.isEmpty())&&(!age.isEmpty())&&(!city.isEmpty())&&(!email.isEmpty())&&(!english.isEmpty())&&(!chinese.isEmpty())&&(!french.isEmpty())&&(!japanese.isEmpty())){
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
                                ps.setString(7, english);
                                ps.setString(8, chinese);
                                ps.setString(9, french);
                                ps.setString(10, japanese);
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
      out.write("                    <tr>\n");
      out.write("                        <td>Real Name: </td>\n");
      out.write("                        <td><input type=\"text\" name=\"Realname\" value=\"\" size=\"30\" placeholder=\"Enter your real name\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Gender: </td>\n");
      out.write("                        <td><input type=\"text\" name=\"Gender\" value=\"\" size=\"30\" placeholder=\"Male or Female\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Age: </td>\n");
      out.write("                        <td><input type=\"text\" name=\"Age\" value=\"\" size=\"30\" placeholder=\"Enter your Age\" /></td>\n");
      out.write("                    </tr>\n");
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
      out.write("                        <td>Email</td>\n");
      out.write("                        <td><input type=\"text\" name=\"Email\" value=\"\" size=\"30\" placeholder=\"XXXXX@XXX.com\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td>Language</td>\n");
      out.write("                        <td>English:<input type=\"checkbox\" name=\"English\" value=\"1\" />Yes <input type=\"checkbox\" name=\"English\" value=\"0\" /> No</td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td></td>\n");
      out.write("                        <td>French:<input type=\"checkbox\" name=\"French\" value=\"1\" />Yes <input type=\"checkbox\" name=\"French\" value=\"0\" /> No</td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                   \n");
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
