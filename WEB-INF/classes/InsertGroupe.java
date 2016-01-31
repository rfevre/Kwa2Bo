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
    try{
      nomGroupe = StringEscapeUtils.escapeHtml4(request.getParameter("nomGroupe"));
    }catch(Exception e) {
      throw new ServletException("Champs du nom de groupe vide.");
    }

    String mail = StringEscapeUtils.escapeHtml4(request.getRemoteUser());
    String[] membres = request.getParameterValues("membre");

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
                      "VALUES (?);";
      ps = con.prepareStatement(query);
      ps.setString(1, nomGroupe);
      ps.executeUpdate();
      // On enregistre l'utilisateur courant dans ce groupe
      query = "INSERT INTO kwa2bo_appartient(mail, idGroupe) " +
              "VALUES (?,(SELECT MAX(idGroupe) AS idGroupe FROM kwa2bo_groupe));";
      ps = con.prepareStatement(query);
      ps.setString(1, mail);
      ps.executeUpdate();

      for (int i = 0; i < membres.length; i++) {
        query = "INSERT INTO kwa2bo_appartient(mail, idGroupe) " +
              "VALUES (?,(SELECT MAX(idGroupe) AS idGroupe FROM kwa2bo_groupe));";
        ps = con.prepareStatement(query);
        ps.setString(1, StringEscapeUtils.escapeHtml4(membres[i]));
        ps.executeUpdate();
      }
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
