import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import javax.sql.*;
import java.util.Properties;
import javax.naming.*;
import org.apache.commons.lang3.StringEscapeUtils;
import beans.*;
import java.util.*;

@WebServlet("/servlet/DeleteUtilisateurGroupe")
public class DeleteUtilisateurGroupe extends HttpServlet {
  public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String mail;
    try{
      mail = StringEscapeUtils.escapeHtml4(request.getParameter("mail"));
    }catch(Exception e) {
      throw new ServletException("Aucun utilisateur à ajouter.");
    }

    Integer idGroupe;
    try {
      idGroupe = Integer.parseInt(StringEscapeUtils.escapeHtml4(request.getParameter("idGroupe")));
    }catch(Exception e) {
      throw new ServletException("Format incorrect pour idGroupe (entier requis) : " + e);
    }

    String mailCreateur = StringEscapeUtils.escapeHtml4(request.getRemoteUser());

    try {
      Context initCtx = new InitialContext();
      Context envCtx = (Context) initCtx.lookup("java:comp/env");
      DataSource ds = (DataSource) envCtx.lookup("mabase");
      con = ds.getConnection();
    }catch(Exception e) {
      throw new ServletException("Erreur lors de la connection à la BDD." + e);
    }

    try {
      // On vérifie que le créateur est bien dans ce groupe aussi
      String query = "SELECT * FROM kwa2bo_appartient WHERE mail=? AND idGroupe=?;";
      ps = con.prepareStatement(query);
      ps.setString(1, mailCreateur);
      ps.setInt(2, idGroupe);
      rs = ps.executeQuery();
      if (!rs.next()){
        throw new ServletException("Vous ne pouvez pas rajouter un utilisateur à une conversation à laquelle vous ne participez pas.");
      }

      // Update de la table profil avec jointure sur utilisateur
      query = "DELETE FROM kwa2bo_appartient WHERE mail=? AND idgroupe=?";

      ps = con.prepareStatement(query);
      ps.setString(1,mail);
      ps.setInt(2,idGroupe);

      ps.executeUpdate();
    }catch (Exception e) {
      throw new ServletException("Erreur lors de la requête SQL." + e);
    }finally {
      try {
        ps.close();
        con.close();
      }catch(Exception e) {
        throw new ServletException("Erreur lors de la fermeture de connection à la BDD." + e);
      }
    }
  }
}
