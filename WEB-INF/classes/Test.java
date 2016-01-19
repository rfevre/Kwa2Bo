import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import javax.sql.*;
import java.util.Properties;
import javax.naming.*;


@WebServlet("/servlet/Test")
public class Test extends HttpServlet {
  public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    DataSource ds = null;

    try {
      Context initCtx = new InitialContext();
      Context envCtx = (Context) initCtx.lookup("java:comp/env");
      ds = (DataSource) envCtx.lookup("mabase");
    }catch(Exception e) {
      throw new ServletException("Context Problem");
    }

    try (Connection con = ds.getConnection()) {
      Statement st=con.createStatement();
      ResultSet rs=null;

      rs=st.executeQuery("select * from kwa2bo_utilisateur");
      String result="";
      while (rs.next()){
        result = rs.getString("mail");
        out.println(result+"\n");
      }
      con.close();
    }catch (Exception e) {
      throw new ServletException("Connexion Problem");
    }
  }
}
