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

@WebServlet("/servlet/SelectContact")
public class SelectContact extends HttpServlet {
  public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    Context initCtx = null;
    Context envCtx = null;
    DataSource ds = null;
    Connection con = null;
    PreparedStatement ps = null;
    Statement st = null;
    ResultSet rs=null;
    ResultSet rs2=null;
    RequestDispatcher rd = null;

    List<Utilisateur> contacts= new ArrayList<Utilisateur>();
    String mail = request.getRemoteUser();

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

      String mail1 = null;
      String mail2 = null;

      while (rs.next()){

        mail1 = rs.getString("mail1");
        mail2 = rs.getString("mail2");

        st = con.createStatement();

        if (!mail1.equals(mail)) {
          rs2=st.executeQuery("select mail,pseudo,role from kwa2bo_utilisateur where mail='"+mail1+"';");
        } else {
          rs2=st.executeQuery("select mail,pseudo,role from kwa2bo_utilisateur where mail='"+mail2+"';");
        }
        rs2.next();
        contacts.add(new Utilisateur(rs2.getString("mail"),null,rs2.getString("pseudo"),rs2.getString("role")));

      }

      rs2=st.executeQuery("select mail,pseudo,role from kwa2bo_utilisateur where mail='"+mail+"';");
      rs2.next();
      Utilisateur utilisateur = new Utilisateur(rs2.getString("mail"),null,rs2.getString("pseudo"),rs2.getString("role"),contacts);

      //réponse en format JSON
      response.setContentType("application/json");
      out.print("{");
      out.print("\"Utilisateur\" : [");
      out.print(utilisateur.getJSON());
      out.print("]");
      out.print("}");
    }catch (Exception e) {
      throw new ServletException("Erreur lors de la requête SQL.");
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
