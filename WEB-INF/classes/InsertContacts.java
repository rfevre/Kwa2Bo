import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import javax.sql.*;
import java.util.Properties;
import javax.naming.*;
import org.apache.commons.lang3.StringEscapeUtils;

@WebServlet("/servlet/InsertContacts")
public class InsertContacts extends HttpServlet {
  public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    DataSource ds = null;
    Connection con = null;
    PreparedStatement ps = null;
    RequestDispatcher rd = null;
    String contact;

    try{
      contact = StringEscapeUtils.escapeHtml4(request.getParameter("contact"));
      contact = StringEscapeUtils.escapeJava(contact);
    }catch(Exception e) {
      throw new ServletException("Champs du nom de groupe vide.");
    }

    String mail = StringEscapeUtils.escapeHtml4(request.getRemoteUser());
    mail = StringEscapeUtils.escapeJava(mail);

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
      String query = "INSERT INTO kwa2bo_contacts(mail1, mail2, status) " +
                      "VALUES (?, ?, 0);";
      ps = con.prepareStatement(query);
      ps.setString(1, mail);
      ps.setString(2, contact);
      ps.executeUpdate();
    }catch (Exception e) {
      throw new ServletException("Erreur lors de la requête SQL.");
    }finally {
      try {
        ps.close();
        con.close();
        response.sendRedirect("..");
      }catch(Exception e) {
        throw new ServletException("Erreur lors de la fermeture de connection à la BDD.");
      }
    }
  }
}
