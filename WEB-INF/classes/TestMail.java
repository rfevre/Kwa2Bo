import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import javax.sql.*;
import java.util.Properties;
import javax.naming.*;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

@WebServlet("/servlet/TestMail")
public class TestMail extends HttpServlet {
  public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    try {
      Context initCtx = new InitialContext();
      Context envCtx = (Context) initCtx.lookup("java:comp/env");
      javax.mail.Session sess = (javax.mail.Session) envCtx.lookup("mail/Session");
      Message message = new MimeMessage(sess);
      message.setFrom(new InternetAddress("dashdu59@gmail.com"));
      InternetAddress to[] = new InternetAddress[1];
      to[0] = new InternetAddress("r.fevre184@gmail.com");
      message.setRecipients(Message.RecipientType.TO, to);
      message.setSubject("test");
      message.setContent("taratata taratata", "text/plain");
      Transport.send(message);
    }catch(Exception e){
      throw new ServletException("Y'a un probléme quelque part.");
    }
  }
}
