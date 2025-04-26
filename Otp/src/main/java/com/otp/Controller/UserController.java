package com.otp.Controller;


import java.time.LocalDateTime;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.otp.Configuration.AppConfiguration;
import com.otp.Entity.User;
import com.otp.UserDAOImpl.UserDAOImpl;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	
	
    AnnotationConfigApplicationContext ac = new AnnotationConfigApplicationContext(AppConfiguration.class);
    UserDAOImpl userDao = (UserDAOImpl) ac.getBean("userDAOImpl");





    // ========== SIGNUP ================
    @RequestMapping("/signup")
    public String signup(@ModelAttribute User user, Model model) {
        userDao.saveUser(user);
        model.addAttribute("msg", "Signup successful!");
        return "index"; // redirect to login page
    }

    // ========== LOGIN =================
    @RequestMapping("/login")
    public String login(@RequestParam String email,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {
        User user = userDao.getUserByEmail(email);
        if (user != null && user.getPassword().equals(password)) {
        	session.setAttribute("user", user);
            return "dashboard"; // success page
        }
        model.addAttribute("error", "Invalid credentials!");
        return "index";
    }

    // ========== FORGOT PASSWORD =============
   @RequestMapping("/forgot-password")
    public String forgotPassword(@RequestParam String email, Model model) {
    	System.out.println("FROM THE  forgot password controller- ur mail - " +email);
        User user = userDao.getUserByEmail(email);
        System.out.println("User Object  - "+user);
        if (user == null) {
            model.addAttribute("error", "Email not registered.");
            return "forgot_password";
        }

        // Generate OTP
        String otp = String.valueOf(new Random().nextInt(900000) + 100000);
        LocalDateTime expiry = LocalDateTime.now().plusMinutes(5); // valid 5 mins
        userDao.updateOtp(email, otp, expiry);

        // Send OTP to Email
        sendOtpMail(email, otp);

        model.addAttribute("email", email);
        model.addAttribute("msg", "OTP sent to your email.");
        return "verify_otp";
    }

    // ========== VERIFY OTP =============
   @RequestMapping("/verify-otp")
    public String verifyOtp(@RequestParam String email,
                            @RequestParam String otp,
                            Model model) {
        if (userDao.validateOtp(email, otp)) {
            model.addAttribute("email", email);
            return "reset_password";
        }
        model.addAttribute("error", "Invalid or expired OTP!");
        return "verify_otp";
    }

    // ========== RESET PASSWORD ============
    @RequestMapping("/reset-password")
    public String resetPassword(@RequestParam String email,
                                @RequestParam String newPassword,
                                Model model) {
        userDao.updatePassword(email, newPassword);
        model.addAttribute("msg", "Password updated. Please login.");
        return "index";
    }

    // ========== SEND MAIL FUNCTION ============
    public void sendOtpMail(String toEmail, String otp) {
        final String fromEmail = "imjeeva888@gmail.com"; // your mail
        final String password = "eudr kwwr rspe ngxr";    // App password
        System.out.println("Your google app password is - "+ password);

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); 
        props.put("mail.smtp.port", "587");  
        props.put("mail.smtp.auth", "true");  
        props.put("mail.smtp.starttls.enable", "true"); 

        Session session = Session.getInstance(props,
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail, "Your App"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Your OTP Code");
            message.setText("Your OTP for password reset is: " + otp);
            System.out.println("sendOtpMail methos Toemail- "+ toEmail);
            System.out.println("sendOtpMail methos otp - "+ otp);


            Transport.send(message);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

