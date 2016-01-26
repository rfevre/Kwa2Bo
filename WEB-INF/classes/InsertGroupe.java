import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import javax.sql.*;
import java.util.Properties;
import javax.naming.*;

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
    Statement st = null;

    String nomGroupe = request.getParameter("nomGroupe");
    if (nomGroupe.equals("") || nomGroupe==null) throw new ServletException("Champs du nom de groupe vide.");

    String mail = request.getRemoteUser();

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

      // On récupére l'id du groupe créer
      query = "SELECT MAX(idGroupe) as idGroupe FROM kwa2bo_groupe;";
      st = con.createStatement();
      rs = st.executeQuery(query);
      rs.next();
      int idGroupe = rs.getInt("idGroupe");

      // On enregistre l'utilisateur courant dans ce groupe
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
        st.close();
        ps.close();
        con.close();
      }catch(Exception e) {
        throw new ServletException("Erreur lors de la fermeture de connection à la BDD.");
      }
    }
  }
}
