import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import javax.sql.*;
import java.util.Properties;
import javax.naming.*;
import org.apache.commons.lang3.StringEscapeUtils;
import javax.mail.*;
import javax.mail.internet.*;

@WebServlet("/servlet/Inscription")
public class Inscription extends HttpServlet {
  public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    Context initCtx = null;
    Context envCtx = null;
    DataSource ds = null;
    Connection con = null;
    ResultSet rs = null;
    PreparedStatement ps = null;
    RequestDispatcher rd = null;

    String mail1 = StringEscapeUtils.escapeHtml4(request.getParameter("mail1"));
    String mail2 = StringEscapeUtils.escapeHtml4(request.getParameter("mail2"));
    if (mail1.equals("") || mail1==null) throw new ServletException("Champs de mail vide.");
    if (mail2.equals("") || mail2==null) throw new ServletException("Champs de mail vide.");
    if (!mail1.equals(mail2)) throw new ServletException("Les deux mails renseigné ne sont pas identiques.");

    String mdp1 = StringEscapeUtils.escapeHtml4(request.getParameter("mdp1"));
    String mdp2 = StringEscapeUtils.escapeHtml4(request.getParameter("mdp2"));
    if (mdp1.equals("") || mdp1==null) throw new ServletException("Champs de mot de passe vide.");
    if (mdp2.equals("") || mdp2==null) throw new ServletException("Champs de mot de passe vide.");
    if (!mdp1.equals(mdp2)) throw new ServletException("Les deux mots de passe renseigné ne sont pas identiques.");

    String pseudo = StringEscapeUtils.escapeHtml4(request.getParameter("pseudo"));
    if (pseudo.equals("") || pseudo==null) throw new ServletException("Champs de pseudo vide.");

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

      // On créer l'utilisateur
      query = "INSERT INTO kwa2bo_utilisateur(mail,mdp,pseudo,codeVerif,idProfil) VALUES (?,md5(?),?,md5(?),(SELECT MAX(idProfil) as idProfil FROM kwa2bo_profil))";
      ps = con.prepareStatement(query);
      ps.setString(1, mail1);
      ps.setString(2, mdp1);
      ps.setString(3, pseudo);
      ps.setString(4, pseudo);
      ps.executeUpdate();

      // On récupére le codeVerif
      query = "SELECT codeVerif FROM kwa2bo_utilisateur WHERE mail=?";
      ps = con.prepareStatement(query);
      ps.setString(1, mail1);
      rs = ps.executeQuery();
      rs.next();
      
      String codeVerif = rs.getString("codeVerif");
      String lien = "http://localhost:8080/Kwa2Bo/confirmation.jsp?codeVerif="+codeVerif;

      try {
        javax.mail.Session sess = (javax.mail.Session) envCtx.lookup("mail/Session");
        Message message = new MimeMessage(sess);
        message.setFrom(new InternetAddress("r.fevre184@gmail.com"));
        InternetAddress to[] = new InternetAddress[1];
        to[0] = new InternetAddress(mail1);
        message.setRecipients(Message.RecipientType.TO, to);
        message.setSubject("Confirmation d'inscription sur Kwa2Bo !");
        message.setContent("Pour comfirmer votre inscription veuillez suivez ce lien : "+
        "<a href="+ lien +">" + "Lien de confirmation" + "</a>", "text/plain");
        Transport.send(message);
      } catch (Exception e) {
        throw new ServletException("Error : "+e);
      }

      request.setAttribute("message","Un mail pour confirmer votre inscription vous à été envoyé");
      rd = getServletContext().getRequestDispatcher("/confirmation.jsp");
      rd.forward(request, response);
    }catch (Exception e) {
      throw new ServletException("Mail déjà utilisé." + e);
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
