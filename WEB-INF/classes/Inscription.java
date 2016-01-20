import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import javax.sql.*;
import java.util.Properties;
import javax.naming.*;

@WebServlet("/servlet/Inscription")
public class Inscription extends HttpServlet {
  public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    Context initCtx = null;
    Context envCtx = null;
    DataSource ds = null;

    Connection con = null;

    PreparedStatement ps = null;

    RequestDispatcher rd = null;

    String mail1 = request.getParameter("mail1");
    String mail2 = request.getParameter("mail2");
    if (!mail1.equals(mail2)) throw new ServletException("Les deux mails renseigné ne sont pas identiques.");

    String mdp1 = request.getParameter("mdp1");
    String mdp2 = request.getParameter("mdp2");
    if (!mdp1.equals(mdp2)) throw new ServletException("Les deux mots de passe renseigné ne sont pas identiques.");

    String pseudo = request.getParameter("pseudo");

    // mail = "test@gmail.com";
    // mdp = "testmdp";
    // pseudo = "testpseudo";

    try {
      initCtx = new InitialContext();
      envCtx = (Context) initCtx.lookup("java:comp/env");
      ds = (DataSource) envCtx.lookup("mabase");
    }catch(Exception e) {
      request.setAttribute("message","Erreur connection");
      rd = getServletContext().getRequestDispatcher("/erreur.jsp");
    }

    try {
      con = ds.getConnection();
      ps = con.prepareStatement("INSERT INTO kwa2bo_utilisateur(mail,mdp,pseudo) VALUES (?,?,?)");

      ps.setString(1, mail1);
      ps.setString(2, mdp1);
      ps.setString(3, pseudo);

      ps.executeUpdate();

      request.setAttribute("message","OK");
      rd = getServletContext().getRequestDispatcher("/confirmation.jsp");
    }catch (Exception e) {
      request.setAttribute("message","Mail déjà utilisé");
      rd = getServletContext().getRequestDispatcher("/erreur.jsp");
    }finally {
      try {
        con.close();
      }catch(Exception e) {
        request.setAttribute("message","Erreur fermeture de connection");
        rd = getServletContext().getRequestDispatcher("/erreur.jsp");
      }
      rd.forward(request, response);
    }
  }
}
