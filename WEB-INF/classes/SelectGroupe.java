import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import javax.sql.*;
import java.util.Properties;
import javax.naming.*;

import beans.*;
import java.util.List;
import java.util.ArrayList;

@WebServlet("/servlet/SelectGroupe")
public class SelectGroupe extends HttpServlet {
  public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    Connection con = null;
    PreparedStatement ps = null;
    // Création liste de groupes
    List<Groupe> groupes = new ArrayList<Groupe>();

    String mail = request.getRemoteUser();

    try {
      Context initCtx = new InitialContext();
      Context envCtx = (Context) initCtx.lookup("java:comp/env");
      DataSource ds = (DataSource) envCtx.lookup("mabase");
      con = ds.getConnection();
    }catch(Exception e) {
      throw new ServletException("Erreur lors de la connection à la BDD.");
    }

    try {
      String query = "SELECT nomgroupe,groupe.idgroupe" +
                          " FROM kwa2bo_appartient AS appartient" +
                          " INNER JOIN kwa2bo_groupe AS groupe" +
                          " ON appartient.idGroupe = groupe.idGroupe" +
                          " WHERE mail = ?";

      ps = con.prepareStatement(query);
      ps.setString(1,mail);

      ResultSet rs = ps.executeQuery();

      while (rs.next()){
        // On ajoute à la liste de Groupes
        groupes.add(new Groupe(rs.getInt("idgroupe"),rs.getString("nomgroupe")));
      }

      //réponse en format JSON
      response.setContentType("application/json");
      out.print("{");
      out.print("\"Groupes\" : [");
      for (int i = 0; i < groupes.size(); i++) {
        out.print(groupes.get(i).getJSON());
      }
      out.print("]");
      out.print("}");
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
