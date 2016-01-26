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
      String query = "SELECT pseudo,utilisateur.mail,dateMessage,texte,image " +
              "FROM kwa2bo_message AS message INNER JOIN kwa2bo_utilisateur AS utilisateur " +
              "ON message.mail = utilisateur.mail WHERE idGroupe IN (SELECT idGroupe FROM kwa2bo_appartient WHERE idgroupe=? AND mail=?)" +
              "ORDER BY dateMessage ASC;";

      ps = con.prepareStatement(query);
      ps.setInt(1,idGroupe);
      ps.setString(2,mail);
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
