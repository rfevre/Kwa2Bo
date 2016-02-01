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

@WebServlet("/servlet/UpdateMdp")
public class UpdateMdp extends HttpServlet {
  public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    RequestDispatcher rd = null;

    String mdp = StringEscapeUtils.escapeHtml4(request.getParameter("mdp"));
    if (mdp.equals("") || mdp==null) throw new ServletException("Champs de mot de passe vide.");
    String mdp1 = StringEscapeUtils.escapeHtml4(request.getParameter("mdp1"));
    mdp1 = StringEscapeUtils.escapeJava(mdp1);
    String mdp2 = StringEscapeUtils.escapeHtml4(request.getParameter("mdp2"));
    mdp2 = StringEscapeUtils.escapeJava(mdp2);
    if (mdp1.equals("") || mdp1==null) throw new ServletException("Champs de mot de passe vide.");
    if (mdp2.equals("") || mdp2==null) throw new ServletException("Champs de mot de passe vide.");
    if (!mdp1.equals(mdp2)) throw new ServletException("Les deux mots de passe renseigné ne sont pas identiques.");
    String mail = StringEscapeUtils.escapeHtml4(request.getRemoteUser());

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
      String query = "SELECT mail FROM kwa2bo_utilisateur " +
                      "WHERE mdp=md5(?) AND mail=?";

      ps = con.prepareStatement(query);
      ps.setString(1,mdp);
      ps.setString(2,mail);
      rs = ps.executeQuery();

      if(!rs.next()) {
        throw new ServletException("Vous n'avez pas renseigné le bon mot de passe actuel.");
      }

      query = "UPDATE kwa2bo_utilisateur " +
                "SET mdp=md5(?) " +
                "WHERE mail=?";

      ps = con.prepareStatement(query);
      ps.setString(1,mdp1);
      ps.setString(2,mail);
      ps.executeUpdate();

      request.setAttribute("message","Le mot de passe à bien été modifié.");
      ServletContext servletContext = getServletContext();
      RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/servlet/SelectProfil");
      dispatcher.forward(request, response);
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
