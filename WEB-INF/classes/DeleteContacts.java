import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import javax.sql.*;
import java.util.Properties;
import javax.naming.*;
import org.apache.commons.lang3.StringEscapeUtils;

@WebServlet("/servlet/DeleteContacts")
public class DeleteContacts extends HttpServlet {
  public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    DataSource ds = null;
    Connection con = null;
    PreparedStatement ps = null;
    RequestDispatcher rd = null;
    String contact = contact = request.getParameter("contact");
    String mail = request.getRemoteUser();

    try {
      Context initCtx = new InitialContext();
      Context envCtx = (Context) initCtx.lookup("java:comp/env");
      ds = (DataSource) envCtx.lookup("mabase");
      con = ds.getConnection();
    }catch(Exception e) {
      throw new ServletException("Erreur lors de la connection à la BDD.");
    }
    try {
      // On insére le groupe dans la table
      String query = "DELETE FROM kwa2bo_contacts " +
                      "WHERE mail1=? AND mail2=? OR mail1=? AND mail2=? ;";
      ps = con.prepareStatement(query);
      ps.setString(1, mail);
      ps.setString(2, contact);
      ps.setString(3, contact);
      ps.setString(4, mail);
      ps.executeUpdate();
    }catch (Exception e) {
      throw new ServletException("Erreur lors de la requête SQL.");
    }finally {
      try {
        ps.close();
        con.close();
        response.sendRedirect("../logged/contacts.jsp");
      }catch(Exception e) {
        throw new ServletException("Erreur lors de la fermeture de connection à la BDD.");
      }
    }
  }
}
