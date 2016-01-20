import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.Properties;

@WebServlet("/servlet/Controller")
public class Controller extends HttpServlet {
  public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    RequestDispatcher dispatcher = null;
    String param = request.getParameter("go");
    if (param == null) throw new ServletException(" Missing parameter in Controller.");
    else if (param.equals("test")) dispatcher = getServletContext().getNamedDispatcher("Test");
    else if (param.equals("inscription")) dispatcher = getServletContext().getNamedDispatcher("Inscription");
<<<<<<< HEAD
    else if (param.equals("identification")) dispatcher = getServletContext().getNamedDispatcher("Identification");
=======
>>>>>>> master
    else throw new ServletException(" Improper parameter passed to Controller.");
    /*check for a null dispatcher, then dispatch the request to the correct URL*/
    if (dispatcher != null) dispatcher.forward(request,response);
    else throw new ServletException(" Controller received a null dispatcher.");
  }
}
