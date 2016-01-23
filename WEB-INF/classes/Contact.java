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

@WebServlet("/servlet/Contact")
public class Contact extends HttpServlet {
  public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

    Context initCtx = null;
    Context envCtx = null;
    DataSource ds = null;
    Connection con = null;
    PreparedStatement ps = null;
    Statement st = null;
    ResultSet rs=null;
    ResultSet rs2=null;
    RequestDispatcher rd = null;

    // Création du bean
    BeanUtilisateur utilisateur = null;
    // Création liste de groupes
    ArrayList<BeanUtilisateur> listeUtilisateurs = new ArrayList<BeanUtilisateur>();

    String mail = request.getParameter("mail");
    if (mail.equals("") || mail==null) throw new ServletException("Mail vide.");

    String jspName = request.getParameter("jspName");
    if (jspName.equals("") || jspName==null) throw new ServletException("Page de redirection vide.");

    try {
      initCtx = new InitialContext();
      envCtx = (Context) initCtx.lookup("java:comp/env");
      ds = (DataSource) envCtx.lookup("mabase");
      con = ds.getConnection();
    }catch(Exception e) {
      throw new ServletException("Erreur lors de la connection à la BDD.");
    }

    try {
      String selectSQL = "SELECT mail1,mail2 FROM Kwa2Bo_contacts WHERE mail1 = ? OR mail2 = ?";

      ps = con.prepareStatement(selectSQL);

      ps.setString(1,mail);
      ps.setString(2,mail);

      rs = ps.executeQuery();

      String mail1 = "";
      String mail2 = "";
      String pseudo= "";
      while (rs.next()){
        // On créer et on remplie un BeanUtilisateur
        utilisateur = new BeanUtilisateur();

        mail1 = rs.getString("mail1");
        mail2 = rs.getString("mail2");

        if (!mail1.equals(mail)) {
          st = con.createStatement();
          rs2=st.executeQuery("select pseudo from kwa2bo_utilisateur where mail='"+mail1+"';");
          rs2.next();
          pseudo= rs2.getString("pseudo");
          utilisateur.setMailUtilisateur(mail1);
          utilisateur.setPseudoUtilisateur(pseudo);
        } else {
          st = con.createStatement();
          rs2=st.executeQuery("select pseudo from kwa2bo_utilisateur where mail='"+mail2+"';");
          rs2.next();
          pseudo= rs2.getString("pseudo");
          utilisateur.setMailUtilisateur(mail2);
          utilisateur.setPseudoUtilisateur(pseudo);
        }

        // Puis on l'ajoute à la liste d'Utilisateurs
        listeUtilisateurs.add(utilisateur);
      }

      // On envoie cette liste à la JSP voulu
      request.setAttribute("listeUtilisateurs",listeUtilisateurs);
      rd = getServletContext().getRequestDispatcher(jspName);
      rd.forward(request, response);
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
