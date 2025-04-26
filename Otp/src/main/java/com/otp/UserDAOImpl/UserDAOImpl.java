package com.otp.UserDAOImpl;


import java.time.LocalDateTime;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.otp.Entity.User;

import jakarta.transaction.Transactional;

@Component

public class UserDAOImpl {

    private SessionFactory sessionFactory;
    
    
    
	

	@Autowired
	public UserDAOImpl(@Qualifier("sf") SessionFactory sessionFactory) { // calling this  sf method from my APPconfig class.
		super();
		this.sessionFactory = sessionFactory;
	}

    // 1. Save User (Signup)
    public void saveUser(User user) {
        sessionFactory.openSession().persist(user);
    }

    // 2. Get user by email (Login or Forget Password)
    public User getUserByEmail(String email) {
        Session session = sessionFactory.openSession();
        System.out.println("-------FROM GETEMAILBYID DAOIMPL----------");
        Query<User> query = session.createQuery("from User where email = :email", User.class);
        query.setParameter("email", email);
        List<User> result = query.list();

        return result.isEmpty() ? null : result.get(0);
    }

    // 3. Update OTP and Expiry
    public void updateOtp(String email, String otp, LocalDateTime expiry) {
        Session session = sessionFactory.openSession();
        Transaction t = session.beginTransaction();

        Query query = session.createQuery("update User set otp = :otp, otpExpiry = :expiry where email = :email");
        query.setParameter("otp", otp);
        query.setParameter("expiry", expiry);
        query.setParameter("email", email);
        query.executeUpdate();
        t.commit();
        session.close();
    }

    // 4. Update Password
    public void updatePassword(String email, String newPassword) {
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("update User set password = :password where email = :email");
        Transaction t = session.beginTransaction();
        query.setParameter("password", newPassword);
        query.setParameter("email", email);
        query.executeUpdate();
        t.commit();
        session.close();
    }

    // 5. Validate OTP (optional use in controller)
    public boolean validateOtp(String email, String enteredOtp) {
        User user = getUserByEmail(email);
        if (user != null && user.getOtp() != null) {
            return user.getOtp().equals(enteredOtp) && user.getOtpExpiry().isAfter(LocalDateTime.now());
        }
        return false;
    }
}

