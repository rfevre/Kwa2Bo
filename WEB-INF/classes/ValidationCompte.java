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

@WebServlet("/servlet/ValidationCompte")
public class ValidationCompte extends HttpServlet {
  public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String codeVerif = StringEscapeUtils.escapeHtml4(request.getParameter("codeVerif"));
    if (codeVerif.equals("") || codeVerif==null) throw new ServletException("Code de verification vide.");

    try {
      Context initCtx = new InitialContext();
      Context envCtx = (Context) initCtx.lookup("java:comp/env");
      DataSource ds = (DataSource) envCtx.lookup("mabase");
      con = ds.getConnection();
    }catch(Exception e) {
      throw new ServletException("Erreur lors de la connection à la BDD." + e);
    }

    try {
      String query = "SELECT role FROM kwa2bo_utilisateur " +
      "WHERE codeVerif=?";
      ps = con.prepareStatement(query);
      ps.setString(1,codeVerif);
      rs = ps.executeQuery();
      rs.next();
      String role = rs.getString("role");
      if (role.equals("logged")) throw new ServletException("Vous avez déjà confirmé votre compte");

      query = "UPDATE kwa2bo_utilisateur " +
      "SET role='logged'" +
      "WHERE codeVerif=?";
      ps = con.prepareStatement(query);
      ps.setString(1,codeVerif);
      ps.executeUpdate();

      request.setAttribute("message","Compte validé.");
      ServletContext servletContext = getServletContext();
      RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/login.jsp");
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
