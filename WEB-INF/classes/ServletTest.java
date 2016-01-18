import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.Properties;

@WebServlet("/servlet/ServletTest")
public class ServletTest extends HttpServlet {
  public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, java.io.IOException {
    response.getWriter().println("Ouai mais ça marche");
  }
}
