package controlador;

import java.io.File;
import java.util.Properties;

import jakarta.activation.DataHandler;
import jakarta.activation.FileDataSource;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMultipart;
import javax.swing.JOptionPane;

public class Email {

    private static final String CORREO_ENVIA = "safp.3802@gmail.com";
    private static final String CONTRASENA = "imtytysmoilzuudh";
    private static final String SUBJECT = "Código de Verificación";
    private static final String LOGO_PATH = "C:\\Users\\jorge\\Documents\\Codigos\\Daniel\\SA\\src\\main\\webapp\\IMG\\logo.png";

    public static void main(String[] args) {
        String mail = JOptionPane.showInputDialog("Digite el correo al cual desea enviar");
        int x = JOptionPane.showConfirmDialog(null, "¿Desea enviar un correo?", "Enviando correo...", JOptionPane.PLAIN_MESSAGE);

        if (x == 0) {
            Email email = new Email();
            email.transfer_to_email(mail, "5324");

            JOptionPane.showMessageDialog(null, "¡Que tenga un buen día!");
        } else {
            JOptionPane.showMessageDialog(null, "Gracias por utilizar esta app...");
        }
    }

    public void transfer_to_email(String correo, String mensaje) {
        Properties mailProps = new Properties();
        mailProps.put("mail.smtp.host", "smtp.gmail.com");
        mailProps.setProperty("mail.smtp.starttls.enable", "true");
        mailProps.put("mail.smtp.port", "587");
        mailProps.setProperty("mail.smtp.user", CORREO_ENVIA);
        mailProps.setProperty("mail.smtp.auth", "true");
        mailProps.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getInstance(mailProps, null);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(CORREO_ENVIA));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(correo));
            message.setSubject(SUBJECT);

            // Crear contenido HTML del correo
            String htmlContent = "<html>"
                    + "<body style='font-family: Arial, sans-serif; text-align: center;'>"
                    + "<div style='margin-bottom: 20px;'>"
                    + "<img src='cid:logo' alt='Logo' style='width: 200px;'>"
                    + "</div>"
                    + "<div style='border: 1px solid #f2f2f2; padding: 20px; text-align: left; margin: 0 auto; max-width: 500px;'>"
                    + "<h2 style='color: #003366;'>Código de Verificación</h2>"
                    + "<p>Gracias por iniciar el proceso de creación de la nueva cuenta de SGAFP.</p>"
                    + "<p>Queremos asegurarnos de que es realmente usted.</p>"
                    + "<div style='background-color: #f2f2f2; padding: 10px; margin: 20px 0;'>"
                    + "<p style='margin: 10px 0; font-size: 20px;'>" + mensaje + "</p>"
                    + "</div>"
                    + "<p>Si no desea crear una cuenta, puede omitir este mensaje.</p>"
                    + "<p>Atentamente,</p>"
                    + "<p>Equipo de SGAFP</p>"
                    + "</div>"
                    + "</body>"
                    + "</html>";

            MimeBodyPart bodyPart = new MimeBodyPart();
            bodyPart.setContent(htmlContent, "text/html");

            MimeMultipart multiPart = new MimeMultipart();
            multiPart.addBodyPart(bodyPart);

            // Adjuntar el logo
            MimeBodyPart logoPart = new MimeBodyPart();
            File logoFile = new File(LOGO_PATH);
            FileDataSource fileDataSource = new FileDataSource(logoFile);
            logoPart.setDataHandler(new DataHandler(fileDataSource));
            logoPart.setHeader("Content-ID", "<logo>");
            multiPart.addBodyPart(logoPart);

            message.setContent(multiPart);

            Transport transport = session.getTransport("smtp");
            transport.connect(CORREO_ENVIA, CONTRASENA);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();

            System.out.println("EL TRANSPORTE SE LLEVÓ EXITOSAMENTE");
        } catch (MessagingException ex) {
            System.out.println("ERROR DE ENVÍO EN CORREO: ");
            ex.printStackTrace();
        }
    }
}
