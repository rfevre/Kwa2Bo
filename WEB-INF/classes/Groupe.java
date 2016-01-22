import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import javax.sql.*;
import java.util.Properties;
import javax.naming.*;

@WebServlet("/servlet/Groupe")
public class Groupe extends HttpServlet {
  public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();

    Context initCtx = null;
    Context envCtx = null;
    DataSource ds = null;
    Connection con = null;
    Statement st = null;
    ResultSet rs=null;
    RequestDispatcher rd = null;

    String mail = request.getParameter("mail");
    //if (mail.equals("") || mail==null) throw new ServletException("Mail vide.");

    //String pageRedirect = request.getParameter("pageRedirect");
    //if (pageRedirect.equals("") || pageRedirect==null) throw new ServletException("pageRedirect vide.");

    String jspName = request.getParameter("jspName");

    // ligne de test
    // mail = "leleu@gmail.com";

    try {
      initCtx = new InitialContext();
      envCtx = (Context) initCtx.lookup("java:comp/env");
      ds = (DataSource) envCtx.lookup("mabase");
      con = ds.getConnection();
    }catch(Exception e) {
      throw new ServletException("Erreur lors de la connection à la BDD.");
    }

    try {
      st=con.createStatement();
      rs = st.executeQuery("SELECT nomgroupe,groupe.idgroupe" +
                                " FROM kwa2bo_appartient AS appartient" +
                                " INNER JOIN kwa2bo_groupe AS groupe" +
                                " ON appartient.idGroupe = groupe.idGroupe" +
                                " WHERE mail='"+mail+"';");

      String result="";
      while (rs.next()){
        // result = rs.getString("nomgroupe") + " " + Integer.parseInt(rs.getString("idgroupe"));
        // out.println(result+"\n");
        result += rs.getString("nomgroupe") + " " + Integer.parseInt(rs.getString("idgroupe")) + "\n";
      }

      request.setAttribute("groupes",result);
      rd = getServletContext().getRequestDispatcher(jspName);
      rd.forward(request, response);
    }catch (Exception e) {
      throw new ServletException("Erreur lors de la requête SQL.");
    }finally {
      try {
        con.close();
      }catch(Exception e) {
        throw new ServletException("Erreur lors de la fermeture de connection à la BDD.");
      }
    }
  }
}
