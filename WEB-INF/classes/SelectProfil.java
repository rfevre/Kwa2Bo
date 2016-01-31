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

@WebServlet("/servlet/SelectProfil")
public class SelectProfil extends HttpServlet {
  public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    Connection con = null;
    PreparedStatement ps = null;

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
      String query = "SELECT pseudo, nom, prenom, role, photo" +
                          " FROM kwa2bo_profil AS profil " +
                          " INNER JOIN kwa2bo_utilisateur AS utilisateur " +
                          " ON profil.idProfil = utilisateur.idProfil " +
                          " WHERE mail = ?";

      ps = con.prepareStatement(query);
      ps.setString(1,mail);

      ResultSet rs = ps.executeQuery();
      rs.next();
      Profil profil = new Profil(rs.getString("nom"),rs.getString("prenom"),rs.getString("photo"));
      Utilisateur user = new Utilisateur(mail, "", rs.getString("pseudo"), rs.getString("role"));
      user.setProfil(profil);

      request.setAttribute("utilisateur", user);
      ServletContext servletContext = getServletContext();
      RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/logged/parametres.jsp");
      dispatcher.forward(request, response);
    }catch (Exception e) {
      throw new ServletException("Erreur lors de la requête SQL " + e);
    }finally {
      try {
        ps.close();
        con.close();
      }catch(Exception e) {
        throw new ServletException("Erreur lors de la fermeture de connection à la BDD " + e);
      }
    }
  }
}
