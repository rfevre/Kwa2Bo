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

@WebServlet("/servlet/SelectUtilisateurs")
public class SelectUtilisateurs extends HttpServlet {
  public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    Connection con = null;
    PreparedStatement ps = null;

    String mail = request.getRemoteUser();
    String critere = "";
    if (request.getParameter("critere") != null) {
      critere = request.getParameter("critere");
    }

    try {
      Context initCtx = new InitialContext();
      Context envCtx = (Context) initCtx.lookup("java:comp/env");
      DataSource ds = (DataSource) envCtx.lookup("mabase");
      con = ds.getConnection();
    }catch(Exception e) {
      throw new ServletException("Erreur lors de la connection à la BDD " + e);
    }

    try {
      String selectSQL = "SELECT mail, pseudo, role FROM kwa2bo_utilisateur WHERE pseudo LIKE ? AND mail NOT IN (SELECT mail1 FROM kwa2bo_contacts WHERE mail1=? OR mail2=?) AND mail NOT IN (SELECT mail2 from kwa2bo_contacts WHERE mail1=? OR mail2=?);";
      ps = con.prepareStatement(selectSQL);
      ps.setString(1,critere + "%");
      ps.setString(2,mail);
      ps.setString(3,mail);
      ps.setString(4,mail);
      ps.setString(5,mail);
      ResultSet rs = ps.executeQuery();
      List<Utilisateur> contacts= new ArrayList<Utilisateur>();

      while(rs.next()) {
        contacts.add(new Utilisateur(rs.getString("mail"),null,rs.getString("pseudo"),rs.getString("role")));
      }

      //réponse en format JSON
      response.setContentType("application/json");
      out.println("{");
      out.println("\"Utilisateurs\" : [");
      for (int i = 0; i < contacts.size(); i++) {
        out.println(contacts.get(i).getJSON());
        if(i != contacts.size() -1) {
          out.println(",");
        }
      }
      out.println("]}");

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
