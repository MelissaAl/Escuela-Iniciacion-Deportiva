/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logicadenegocios;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.sql.*;

/**
 *
 * @author melissa.aldana
 */
public class Log_in {

    private Connection con;
    Datos dat = new Datos();

    // Validar conexion
    public boolean setConnection() {
        con = dat.conexion();
        boolean b = true;
        if (con == null) {
            b = false;
        }
        return b;
    }

    //Crear conexion
    public Log_in() {
        con = dat.conexion();
    }

    // Cerrar conexion
    public void cerrarConexion() {
        Datos.cerrarConexion(con);
    }

//        public void insertarUsuario(String correoDestino, String asunto, String mensaje ) {
//        final Email email = new Email();
//        email.setFromAddress("Your name", "your_mail_address");
//        email.setSubject("TestMail");
//        email.addRecipient("Other name", "other_mail_address", RecipientType.TO);
//        email.setText("This is a test mail ... :-)");
//        new Mailer("smtp.gmail.com", 587, "your_mail_address", "your_strong_password", TransportStrategy.SMTP_TLS).sendMail(email);
//    }
    public boolean enviarCorreoRecordacion(String correoDestino, String asunto, String mensaje) {
        try {
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");

            Authenticator authenticator = new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("cursosdeppolijic@gmail.com", "Cursos2020");
                }
            };
            Session session = Session.getInstance(props, authenticator);

            MimeMessage msg = new MimeMessage(session);
            msg.setFrom("cursosdeppolijic@gmail.com");
            msg.setSubject("Recuperación contraseña");
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(correoDestino));

            String[] parts = correoDestino.split("_");
            String nombre = parts[0];
            String password = "";
            // Consultar en base de datos la contraseña
            ResultSet rs = dat.consultarUsuarioPorNombre(con, nombre);
            try {
                while (rs.next()) {
                    password = rs.getString("Contraseña");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            msg.setText("Contraseña actual: " + password);

            Transport.send(msg);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}
