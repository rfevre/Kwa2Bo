import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import javax.sql.*;
import java.util.Properties;
import javax.naming.*;

@WebServlet("/servlet/InsertUtilisateurInGroupe")
public class InsertUtilisateurInGroupe extends HttpServlet {
  public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    Context initCtx = null;
    Context envCtx = null;
    ResultSet rs = null;
    DataSource ds = null;
    Connection con = null;
    PreparedStatement ps = null;
    RequestDispatcher rd = null;

    Integer idGroupe;
    try {
      idGroupe = Integer.parseInt(request.getParameter("idGroupe"));
    }catch(Exception e) {
      throw new ServletException("Format incorrect pour idGroupe (entier requis) : " + e);
    }

    String mail;
    try{
      mail = request.getParameter("mail");
    }catch(Exception e) {
      throw new ServletException("Aucun utilisateur à ajouter.");
    }

    String mailCreateur = request.getRemoteUser();

    try {
      initCtx = new InitialContext();
      envCtx = (Context) initCtx.lookup("java:comp/env");
      ds = (DataSource) envCtx.lookup("mabase");
      con = ds.getConnection();
    }catch(Exception e) {
      throw new ServletException("Erreur lors de la connection à la BDD.");
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

      // On enregistre l'utilisateur voulu dans le groupe voulu
      query = "INSERT INTO kwa2bo_appartient(mail,idGroupe) " +
              "VALUES (?,?);";
      ps = con.prepareStatement(query);
      ps.setString(1, mail);
      ps.setInt(2, idGroupe);
      ps.executeUpdate();
    }catch (Exception e) {
      throw new ServletException("Erreur lors de la requête SQL.");
    }finally {
      try {
        ps.close();
        con.close();
      }catch(Exception e) {
        throw new ServletException("Erreur lors de la fermeture de connection à la BDD.");
      }
    }
  }
}
