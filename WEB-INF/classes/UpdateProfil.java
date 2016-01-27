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

@WebServlet("/servlet/UpdateProfil")
public class UpdateProfil extends HttpServlet {
  public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    Connection con = null;
    PreparedStatement ps = null;

    String nom = request.getParameter("nom");
    String prenom = request.getParameter("prenom");
    String pseudo = request.getParameter("pseudo");
    String photo = "/ressources/default.jpg";
    if (request.getParameter("photo") != null) { photo = request.getParameter("photo");  }
    String mail = request.getRemoteUser();

    try {
      Context initCtx = new InitialContext();
      Context envCtx = (Context) initCtx.lookup("java:comp/env");
      DataSource ds = (DataSource) envCtx.lookup("mabase");
      con = ds.getConnection();
    }catch(Exception e) {
      throw new ServletException("Erreur lors de la connection à la BDD." + e);
    }

    try {
      // Update de la table profil avec jointure sur utilisateur
      String query = "UPDATE kwa2bo_profil AS p " +
                      "SET nom=?,prenom=?,photo=?" +
                      "FROM kwa2bo_utilisateur AS u " +
                      "WHERE p.idProfil=u.idProfil AND mail=?";

      ps = con.prepareStatement(query);
      ps.setString(1,nom);
      ps.setString(2,prenom);
      ps.setString(3,photo);
      ps.setString(4,mail);

      ps.executeUpdate();

      query = "UPDATE kwa2bo_utilisateur " +
                "SET pseudo=?" +
                "WHERE mail=?";

      ps = con.prepareStatement(query);
      ps.setString(1,pseudo);
      ps.setString(2,mail);

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
