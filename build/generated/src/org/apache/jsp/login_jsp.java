package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.Date;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


        public class Actor {
            String URL = "jdbc:mysql://localhost:3306/Healthcare";
            String USERNAME = "root";
            String PASSWORD = "root";
            
            Connection connection = null;
            PreparedStatement selectActors = null;
            ResultSet resultSet = null;

            public Actor(){
                    try{
                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                        
                        selectActors = connection.prepareStatement(
                            "SELECT ID,Password,Idetify FROM Login"
//                            +"WHERE Login.ID = ?"
//                            +"AND Login.Password = ?"
//                            +"AND Login.Idetify = ?"
                        );


                    }catch(SQLException e){
                        e.printStackTrace();
                }

            }

            public ResultSet getActors(){
                try{
//                    String UserID, String Password, String Charater
//                    selectActors.setString(1, UserID);
//                    selectActors.setString(2, Password);
//                    selectActors.setString(3, Charater);
                    resultSet = selectActors.executeQuery();

                } catch(SQLException e){
                    e.printStackTrace();
                }
            return resultSet;
            }
        
        }
        
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
 Class.forName("com.mysql.jdbc.Driver"); 
      out.write("\n");
      out.write("\n");
      out.write(" \n");
      out.write("<!DOCTYPE html>\n");
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
      out.write("        ");
      out.write("\n");
      out.write("        ");

//            String userid = new String();
//            String userpwd = new String();
//            String useridt = new String();
//            
//            if (request.getParameter("UserID") != null){
//                userid = request.getParameter("UserID");
//            }
//            
//            if (request.getParameter("Password") != null){
//                userpwd = request.getParameter("Password");
//            }
//            
//            if (request.getParameter("Charater") != null){
//                useridt = request.getParameter("Charater");
//            }
//         
            Actor actor = new Actor();
            ResultSet actors = actor.getActors();
            
            
        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <table border=\"1\">\n");
      out.write("            \n");
      out.write("            <tbody>\n");
      out.write("                <tr>\n");
      out.write("                    <td>ID</td>\n");
      out.write("                    <td>PWD</td>\n");
      out.write("                    <td>WORK</td>\n");
      out.write("                </tr>\n");
      out.write("               ");
 while (actors.next()) { 
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                   <td>");
      out.print(actors.getString("ID")   );
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(actors.getString("Password")   );
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(actors.getString("Idetify")   );
      out.write("</td>\n");
      out.write("                </tr>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
      out.write("\n");
      out.write("\n");
      out.write("        \n");
      out.write("        \n");
      out.write("          ");
  
//        String USERNAME = "admin";  
//        String USERPWD = "123456"; 
//        String USERWORK = "Nurse";
        
          
//        request.setCharacterEncoding("utf8");  
//      
//        String useriD = request.getParameter("UserID").trim();  
//        String userPwd = request.getParameter("Password").trim();  
//        String userwork = request.getParameter("Charater".trim());
//        if(useriD == null || userPwd == null || userwork == null){  
//            response.sendRedirect("index.jsp");  
//            return;  
//        }  
//          
//        if(useriD.equals(actors.getString("ID")) && userPwd.equals(actors.getString("Password")) && userwork.equals(actors.getString("Idetify"))) {  
//            session.setMaxInactiveInterval(30*60);          // 设置session失效时间（timeout），单位为秒  
//            session.setAttribute("userinfo", actors.getString("userid"));     // 用户名和密码正确，保存登录信息  
//            response.sendRedirect("Patient_home.jsp");  
//        } else {  
//            response.sendRedirect("index.jsp");        // 用户名和密码错误，跳转到登录界面  
//        }  
    
      out.write(" \n");
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
