import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import javax.sql.*;
import java.util.Properties;
import javax.naming.*;

import beans.*;
import java.util.*;

@WebServlet("/servlet/SelectMessage")
public class SelectMessage extends HttpServlet {
  public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    // Création liste de groupes
    Groupe groupe;

    String mail = request.getRemoteUser();
    Integer idGroupe;
    try {
      idGroupe = Integer.parseInt(request.getParameter("idGroupe"));
    }catch(Exception e) {
      throw new ServletException("Format incorrect pour idGroupe (entier requis) : " + e);
    }
    try {
      Context initCtx = new InitialContext();
      Context envCtx = (Context) initCtx.lookup("java:comp/env");
      DataSource ds = (DataSource) envCtx.lookup("mabase");
      con = ds.getConnection();
    }catch(Exception e) {
      throw new ServletException("Erreur de connexion à la BDD : " + e);
    }

    try {
      String query = "SELECT pseudo,utilisateur.mail, dateMessage, texte, image " +
              "FROM kwa2bo_message AS message INNER JOIN kwa2bo_utilisateur AS utilisateur " +
              "ON message.mail = utilisateur.mail WHERE idGroupe IN (SELECT idGroupe FROM kwa2bo_appartient WHERE idgroupe=? AND mail=?)" +
              "ORDER BY dateMessage ASC;";

      ps = con.prepareStatement(query);
      ps.setInt(1,idGroupe);
      ps.setString(2,mail);
      rs = ps.executeQuery();

      List<Message> messages = new ArrayList<Message>();
      while (rs.next()){
        Utilisateur u = new Utilisateur(rs.getString("mail"), "", rs.getString("pseudo"), "");
        messages.add(new Message(u, rs.getString("texte"), rs.getString("image"), rs.getDate("datemessage")));
      }

      query = "SELECT nomgroupe, u.* FROM kwa2bo_groupe as g INNER JOIN kwa2bo_appartient as a " +
              "ON g.idGroupe = a.idGroupe INNER JOIN kwa2bo_utilisateur as u ON a.mail = u.mail WHERE g.idGroupe=?";

      ps = con.prepareStatement(query);
      ps.setInt(1,idGroupe);
      rs = ps.executeQuery();

      List<Utilisateur> participants = new ArrayList<Utilisateur>();
      String nomgroupe = null;
      while (rs.next()){
        participants.add(new Utilisateur(rs.getString("mail"), "x", rs.getString("pseudo"), rs.getString("role")));
        if (rs.getString("nomgroupe") != null)
            nomgroupe = rs.getString("nomgroupe");
      }
      Groupe g = new Groupe(idGroupe, nomgroupe, participants, messages);

      //réponse en format JSON
      response.setContentType("application/json");
      out.print("{");
      out.print("\"remoteUser\" : \"" + mail + "\",");
      out.print("\"Groupe\" : " + g.getJSON());
      out.print("}");

    }catch (Exception e) {
      throw new ServletException("Erreur de requête SQL : " + e);
    }finally {
      try {
        ps.close();
        con.close();
      }catch(Exception e) {
        throw new ServletException("Erreur de fermeture de la BDD : " + e);
      }
    }
  }
}
