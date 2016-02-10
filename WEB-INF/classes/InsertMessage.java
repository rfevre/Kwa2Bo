import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import javax.sql.*;
import java.util.Properties;
import javax.naming.*;
import org.apache.commons.lang3.StringEscapeUtils;
import javax.servlet.annotation.MultipartConfig;

@MultipartConfig
@WebServlet("/servlet/InsertMessage")
public class InsertMessage extends HttpServlet {
  public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String mail = StringEscapeUtils.escapeHtml4(request.getRemoteUser());
    mail = StringEscapeUtils.escapeJava(mail);
    String texte = StringEscapeUtils.escapeHtml4(new String (request.getParameter("content").getBytes("iso-8859-1"), "UTF-8"));
    texte = StringEscapeUtils.escapeJava(texte);
    Integer idGroupe;

    try {
       idGroupe = Integer.parseInt(request.getParameter("idGroupe"));
     }catch(Exception e) {
       throw new ServletException("Format incorrect pour idGroupe (entier requis) : " + e);
    }

    // Upload d'un fichier
    String cheminImage = "";
    Part filePart = request.getPart("image");
    String fileName = getFileName(filePart);
    if (!fileName.equals("")){
      String path = getServletContext().getRealPath("/img/")+mail;

      File f = new File (path);
      if (!f.exists()){
           f.mkdir();
      }

      cheminImage = path + File.separator + fileName;

      OutputStream sortie = null;
      InputStream filecontent = null;

      try {
        sortie = new FileOutputStream(new File(cheminImage));
        filecontent = filePart.getInputStream();

        int read = 0;
        final byte[] bytes = new byte[1024];

        while ((read = filecontent.read(bytes)) != -1) {
          sortie.write(bytes, 0, read);
        }
        cheminImage = "./img/" + mail + File.separator + fileName;
      } catch (Exception e) {
        throw new ServletException("Error upload : "+e);
      } finally {
        if (sortie != null) {
          sortie.close();
        }
        if (filecontent != null) {
          filecontent.close();
        }
      }
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

      if(cheminImage.equals("")){
        query = "INSERT INTO Kwa2Bo_message(idGroupe,mail,texte) VALUES (?,?,?);";
        ps = con.prepareStatement(query);
        ps.setInt(1, idGroupe);
        ps.setString(2, mail);
        ps.setString(3, texte);
      } else {
        query = "INSERT INTO Kwa2Bo_message(idGroupe,mail,texte,image) VALUES (?,?,?,?);";
        ps = con.prepareStatement(query);
        ps.setInt(1, idGroupe);
        ps.setString(2, mail);
        ps.setString(3, texte);
        ps.setString(4, cheminImage);
      }

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

  private String getFileName(final Part part) {
    final String partHeader = part.getHeader("content-disposition");
    for (String content : part.getHeader("content-disposition").split(";")) {
      if (content.trim().startsWith("filename")) {
        return content.substring(
        content.indexOf('=') + 1).trim().replace("\"", "");
      }
    }
    return null;
  }
}
