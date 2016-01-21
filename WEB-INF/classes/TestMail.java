import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import javax.sql.*;
import java.util.Properties;
import javax.naming.*;
import mail.SendMail;

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
    PrintWriter out = response.getWriter();
    //SendMail mail = new SendMail();


    final String username = "dashdu59@gmail.com";
    final String password = "lapin310";

    Properties props = new Properties();
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.port", "587");

    Session session = Session.getInstance(props,
      new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
        }
      });

    try {

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress("dashdu59@gmail.com"));
        message.setRecipients(Message.RecipientType.TO,
            InternetAddress.parse("r.fevre184@gmail.com"));
        message.setSubject("A testing mail header !!!");
        message.setText("Dear Mail Crawler,"
            + "\n\n No spam to my email, please!");

        Transport.send(message);

        out.println("Done");

    } catch (MessagingException e) {
        out.println(e);
    }
  }
}
