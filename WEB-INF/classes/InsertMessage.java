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
    Context initCtx = null;
    Context envCtx = null;
    ResultSet rs = null;
    DataSource ds = null;
    Connection con = null;
    PreparedStatement ps = null;
    RequestDispatcher rd = null;


    String texte = request.getParameter("texte");

    String image = request.getParameter("image");

    Integer idGroupe = Integer.parseInt(request.getParameter("idGroupe"));
    if (idGroupe==null) throw new ServletException("Id groupe vide.");

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

      String query = "SELECT mail FROM kwa2bo_appartient WHERE idgroupe=?;";
      ps = con.prepareStatement(query);
      ps.setInt(1,idGroupe);

      rs = ps.executeQuery();

      boolean tmp = false;
      while (rs.next()){
        if(rs.getString("mail").equals(mail)) {
          tmp = true;
          break;
        }
      }

      if(!tmp) throw new ServletException("Vous n'appartenez point à cette discution !");

      query = "INSERT INTO Kwa2Bo_message(idGroupe,mail,texte,image) " +
              "VALUES (?,?,?,?);";

      ps = con.prepareStatement(query);

      ps.setInt(1, idGroupe);
      ps.setString(2, mail);
      ps.setString(3, texte);
      ps.setString(4, image);

      ps.executeUpdate();
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
