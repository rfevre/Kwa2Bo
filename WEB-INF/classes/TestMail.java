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
import org.apache.commons.lang3.StringEscapeUtils;


@WebServlet("/servlet/TestMail")
public class TestMail extends HttpServlet {
  public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    Context initCtx = null;
    RequestDispatcher rd = null;

    String codeVerif = StringEscapeUtils.escapeHtml4(request.getParameter("codeVerif"));
    if (codeVerif.equals("") || codeVerif==null) throw new ServletException("Code de verification vide.");

    String mailDest = StringEscapeUtils.escapeHtml4(request.getParameter("mailDest"));
    if (mailDest.equals("") || mailDest==null) throw new ServletException("Mail destinataire vide.");

    String lien = getServletContext()+"/confirmation?codeVerif="+codeVerif;

    try {
      initCtx = new InitialContext();
      Context envCtx = (Context) initCtx.lookup("java:comp/env");
      javax.mail.Session sess = (javax.mail.Session) envCtx.lookup("mail/Session");
      Message message = new MimeMessage(sess);
      message.setFrom(new InternetAddress("r.fevre184@gmail.com"));
      InternetAddress to[] = new InternetAddress[1];
      to[0] = new InternetAddress(mailDest);
      message.setRecipients(Message.RecipientType.TO, to);
      message.setSubject("Confirmation d'inscription sur Kwa2Bo !");
      message.setContent("Pour comfirmer votre inscription veuillez suivre ce lien : " + lien, "text/plain");
      Transport.send(message);
    } catch (Exception e) {
      throw new ServletException("Error : "+e);
    }

    request.setAttribute("message","Un mail pour confirmer votre inscription vous à été envoyé");
    rd = getServletContext().getRequestDispatcher("/confirmation.jsp");
    rd.forward(request, response);
  }
}
