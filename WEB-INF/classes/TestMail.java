import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import javax.sql.*;
import java.util.Properties;
import javax.naming.*;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


@WebServlet("/servlet/TestMail")
public class TestMail extends HttpServlet {
  public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    Context initCtx;
    try {
      initCtx = new InitialContext();
      Context envCtx = (Context) initCtx.lookup("java:comp/env");
      javax.mail.Session sess = (javax.mail.Session) envCtx.lookup("mail/Session");
      Message message = new MimeMessage(sess);
      message.setFrom(new InternetAddress("dashdu59@gmail.com"));
      InternetAddress to[] = new InternetAddress[1];
      to[0] = new InternetAddress("r.fevre184@gmail.com");
      message.setRecipients(Message.RecipientType.TO, to);
      message.setSubject("Inscription sur Kwa2Bo !");
      message.setContent("The best messagerie Ever ! for sure !", "text/plain");
      Transport.send(message);
    } catch (Exception e) {
      throw new ServletException("Error : "+e);
    }
  }
}
