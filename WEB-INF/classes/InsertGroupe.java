import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import javax.sql.*;
import java.util.Properties;
import javax.naming.*;
import org.apache.commons.lang3.StringEscapeUtils;

@WebServlet("/servlet/InsertGroupe")
public class InsertGroupe extends HttpServlet {
  public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    Context initCtx = null;
    Context envCtx = null;
    ResultSet rs = null;
    DataSource ds = null;
    Connection con = null;
    PreparedStatement ps = null;
    RequestDispatcher rd = null;

    String nomGroupe;
    String[] membres = null;
    if (request.getParameter("nomGroupe")==null || request.getParameter("nomGroupe").equals("")) {
      nomGroupe = "Unnamed";
    } else {
      nomGroupe = StringEscapeUtils.escapeHtml4(request.getParameter("nomGroupe"));
      nomGroupe = StringEscapeUtils.escapeJava(nomGroupe);
    }

    String mail = StringEscapeUtils.escapeHtml4(request.getRemoteUser());
    mail = StringEscapeUtils.escapeJava(mail);
    membres = request.getParameterValues("membre");

    try {
      initCtx = new InitialContext();
      envCtx = (Context) initCtx.lookup("java:comp/env");
      ds = (DataSource) envCtx.lookup("mabase");
      con = ds.getConnection();
    }catch(Exception e) {
      throw new ServletException("Erreur lors de la connection à la BDD.");
    }

    try {
      // On insére le groupe dans la table
      String query = "INSERT INTO kwa2bo_groupe(nomGroupe) " +
                      "VALUES (?) RETURNING idGroupe;";
      ps = con.prepareStatement(query);
      ps.setString(1, nomGroupe);
      ps.execute();
      rs = ps.getResultSet();
      rs.next();
      Integer idGroupe = rs.getInt("idGroupe");
      // On enregistre l'utilisateur courant dans ce groupe
      query = "INSERT INTO kwa2bo_appartient(mail, idGroupe) " +
              "VALUES (?,?);";
      ps = con.prepareStatement(query);
      ps.setString(1, mail);
      ps.setInt(2, idGroupe);
      ps.executeUpdate();
      if (membres != null) {
        for (int i = 0; i < membres.length; i++) {
          query = "INSERT INTO kwa2bo_appartient(mail, idGroupe) " +
                "VALUES (?,?);";
          ps = con.prepareStatement(query);
          ps.setString(1, StringEscapeUtils.escapeHtml4(membres[i]));
          ps.setInt(2, idGroupe);
          ps.executeUpdate();
        }
      }
    }catch (Exception e) {
      throw new ServletException("Erreur lors de la requête SQL." + e);
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
