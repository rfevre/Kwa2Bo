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
    List<Message> messages = new ArrayList<Message>();

    String mail = request.getRemoteUser();

    Integer idGroupe = Integer.parseInt(request.getParameter("idGroupe"));
    if (idGroupe==null) throw new ServletException("Id groupe vide.");

    try {
      Context initCtx = new InitialContext();
      Context envCtx = (Context) initCtx.lookup("java:comp/env");
      DataSource ds = (DataSource) envCtx.lookup("mabase");
      con = ds.getConnection();
    }catch(Exception e) {
      throw new ServletException("Erreur lors de la connection à la BDD.");
    }

    try {
      // String query = "SELECT utilisateur.pseudo, message.mail, message.texte, message.datemessage from kwa2bo_appartient AS appartient, " +
      //                "kwa2bo_groupe AS groupe, kwa2bo_message AS message, kwa2bo_utilisateur as utilisateur " +
      //                "WHERE appartient.mail = ? AND " +
      //                "groupe.idGroupe = ? AND utilisateur.mail = message.mail " +
      //                "ORDER BY datemessage ASC";

      String query = "SELECT mail FROM kwa2bo_appartient WHERE idgroupe=?;";
      ps = con.prepareStatement(query);
      ps.setInt(1,idGroupe);

      rs = ps.executeQuery();

      boolean tmp = false;
      while (rs.next()){
        if(rs.getString("mail").equals(mail)) {
          tmp = true;
          break;
        }
      }

      if(!tmp) throw new ServletException("Vous n'appartenez point à cette discution !");

      query = "SELECT pseudo,utilisateur.mail,dateMessage,texte,image " +
                      "FROM kwa2bo_message AS message INNER JOIN kwa2bo_utilisateur AS utilisateur " +
                      "ON message.mail = utilisateur.mail WHERE idGroupe=?" +
                      "ORDER BY dateMessage ASC;";

      ps = con.prepareStatement(query);
      ps.setInt(1,idGroupe);

      rs = ps.executeQuery();

      while (rs.next()){
        Utilisateur u = new Utilisateur(rs.getString("mail"), "", rs.getString("pseudo"), "");
        messages.add(new Message(u, rs.getString("texte"), "lol", rs.getDate("datemessage")));
      }

      //réponse en format JSON
      response.setContentType("application/json");
      out.print("{");
      out.print("\"Messages\" : [");
      for (int i = 0; i < messages.size(); i++) {
        out.print(messages.get(i).getJSON());
        if (i != messages.size()-1) {
          out.print(",");
        }
      }
      out.print("]");
      out.print("}");
    }catch (Exception e) {
      throw new ServletException("Erreur lors de la requête SQL. : " + e);
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
