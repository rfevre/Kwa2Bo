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
  public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    Context initCtx = null;
    Context envCtx = null;
    DataSource ds = null;
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    PreparedStatement ps = null;
    RequestDispatcher rd = null;

    String mail1 = request.getParameter("mail1");
    String mail2 = request.getParameter("mail2");
    if (mail1.equals("") || mail1==null) throw new ServletException("Champs de mail vide.");
    if (mail2.equals("") || mail2==null) throw new ServletException("Champs de mail vide.");
    if (!mail1.equals(mail2)) throw new ServletException("Les deux mails renseigné ne sont pas identiques.");

    String mdp1 = request.getParameter("mdp1");
    String mdp2 = request.getParameter("mdp2");
    if (mdp1.equals("") || mdp1==null) throw new ServletException("Champs de mot de passe vide.");
    if (mdp2.equals("") || mdp2==null) throw new ServletException("Champs de mot de passe vide.");
    if (!mdp1.equals(mdp2)) throw new ServletException("Les deux mots de passe renseigné ne sont pas identiques.");

    String pseudo = request.getParameter("pseudo");
    if (pseudo.equals("") || pseudo==null) throw new ServletException("Champs de pseudo vide.");

    // ligne de test
    // mail1 = "test@gmail.com";
    // mdp1 = "testmdp";
    // pseudo = "testpseudo";

    try {
      initCtx = new InitialContext();
      envCtx = (Context) initCtx.lookup("java:comp/env");
      ds = (DataSource) envCtx.lookup("mabase");
      con = ds.getConnection();
    }catch(Exception e) {
      throw new ServletException("Erreur lors de la connection à la BDD.");
    }

    try {
      // On créer le profil de l'utilisateur
      String query = "INSERT INTO Kwa2Bo_profil (prenom) VALUES (?);";
      ps = con.prepareStatement(query);
      ps.setString(1, pseudo);
      ps.executeUpdate();

      // On récupére l'id du dernier Profil créer
      query = "SELECT MAX(idProfil) as idProfil FROM kwa2bo_profil;";
      st = con.createStatement();
      rs = st.executeQuery(query);
      rs.next();
      int idProfil = rs.getInt("idProfil");

      // On créer l'utilisateur
      query = "INSERT INTO kwa2bo_utilisateur(mail,mdp,pseudo,idProfil) VALUES (?,md5(?),?,?)";
      ps = con.prepareStatement(query);
      ps.setString(1, mail1);
      ps.setString(2, mdp1);
      ps.setString(3, pseudo);
      ps.setInt(4, idProfil);
      ps.executeUpdate();

      request.setAttribute("message","Le compte utilisateur a été créé. Un courrier vous a été envoyez à l'adresse indiqué, afin de confirmer votre mail.");
      rd = getServletContext().getRequestDispatcher("/confirmation.jsp");
      rd.forward(request, response);
    }catch (Exception e) {
      throw new ServletException("Mail déjà utilisé.");
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
