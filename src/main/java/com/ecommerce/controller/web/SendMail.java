package com.ecommerce.controller.web;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.ecommerce.model.User;

public class SendMail {
    public String getRandom(){
        Random rd = new Random();
        int begin = 100000;
        int end = 999999;
        int number = rd.nextInt(end - begin) + begin;
        return String.format("%06d", number);
    }
    public boolean sendMail(User user){
         boolean sended = false;

         String toMail = user.getEmail();
         String fromMail = "minhdatdhn@gmail.com";
         String password = "01654675251dhn";

         try {
             Properties properties = new Properties();
             properties.setProperty("mail.smtp.host", "smtp.gmail.com");
             properties.setProperty("mail.smtp.port", "587");
             properties.setProperty("mail.smtp.auth", "true");
             properties.setProperty("mail.smtp.starttls.enable", "true");

             /*properties.put("mail.smtp.socketFactory.port", "587");
             properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");*/

             //get Session
             Session ss = Session.getInstance(properties, new Authenticator() {
                 @Override
                 protected PasswordAuthentication getPasswordAuthentication() {
                     return new PasswordAuthentication(fromMail, password);
                 }
             });

             //content e-mail
             Message msg = new MimeMessage(ss);
             msg.setFrom(new InternetAddress(fromMail));
             msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
             msg.setSubject("MA OTP XAC NHAN MAT KHAU");
             msg.setText("Ma xac nhan cua ban la: " + user.getCode().getCode());

             // sends the e-mail
             Transport.send(msg);

             sended = true;
         }catch (Exception e){
             e.printStackTrace();
             sended = false;
         }
         return sended;
    }
}
