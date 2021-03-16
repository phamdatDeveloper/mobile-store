package vn.com.dutmobile.utils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class UtilsSendMail {
    public static boolean sendMail(String to, String title, String text) {
        final String FROM = "cuahangdutmobile@gmail.com";
        final String PASS = "Cuahangdut123";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM, PASS);
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(title);
            message.setText(text);
            message.setHeader("Content-Type", "text/plain ; charset=UTF-8");
            Transport.send(message);
            System.out.println("Gửi Mail Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Gửi Mail Thất Bại");
            return false;
        }
        return true;
    }
}
