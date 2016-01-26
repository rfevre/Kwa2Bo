import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import javax.sql.*;
import java.util.Properties;
import javax.naming.*;

@WebServlet("/servlet/InsertMessage")
public class InsertMessage extends HttpServlet {
  public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String mail = request.getRemoteUser();
    String texte = request.getParameter("texte");
    String image = request.getParameter("image");
    Integer idGroupe;

    try {
      idGroupe = Integer.parseInt(request.getParameter("idGroupe"));
    }catch(Exception e) {
      throw new ServletException("Format incorrect pour idGroupe (entier requis) : " + e);
    }

    try {
      Context initCtx = new InitialContext();
      Context envCtx = (Context) initCtx.lookup("java:comp/env");
      DataSource ds = (DataSource) envCtx.lookup("mabase");
      con = ds.getConnection();
    }catch(Exception e) {
      throw new ServletException("Erreur de connexion à la BDD : " + e);
    }

    try {
      String query = "SELECT mail FROM kwa2bo_appartient WHERE idgroupe=? AND mail=?;";
      ps = con.prepareStatement(query);
      ps.setInt(1, idGroupe);
      ps.setString(2, mail);
      rs = ps.executeQuery();

      if(!rs.next()) {
        throw new ServletException("Vous n'appartenez pas à cette discussion");
      }

      query = "INSERT INTO Kwa2Bo_message(idGroupe,mail,texte,image) VALUES (?,?,?,?);";

      ps = con.prepareStatement(query);
      ps.setInt(1, idGroupe);
      ps.setString(2, mail);
      ps.setString(3, texte);
      ps.setString(4, image);
      ps.executeUpdate();
    
    }catch (Exception e) {
      throw new ServletException("Erreur SQL : " + e);
    }finally {
      try {
        ps.close();
        con.close();
      }catch(Exception e) {
        throw new ServletException("Erreur de fermeture de BDD : " + e);
      }
    }
  }
}
