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
@WebServlet("/servlet/UploadImage")
public class UploadImage extends HttpServlet {
  public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();

    // Upload d'un fichier
    String cheminImage = "";
    if (request.getPart("image")!=null){
      String path = getServletContext().getRealPath("/img");
      Part filePart = request.getPart("image");
      String fileName = getFileName(filePart);

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

    out.println(cheminImage);
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
