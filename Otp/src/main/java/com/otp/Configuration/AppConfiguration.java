package com.otp.Configuration;

import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;

import com.zaxxer.hikari.HikariDataSource;

@Configuration
@ComponentScan(basePackages = "com.richartgroups.Entity, com.otp.UserDAOImpl")
public class AppConfiguration {

    @Bean
    public LocalSessionFactoryBean sf() {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(dataSource()); // Set the data source for database connection
        sessionFactory.setPackagesToScan("com.otp.Entity");
        sessionFactory.setHibernateProperties(hibernateProperties());
        return sessionFactory;
    }

    @Bean
    public DataSource dataSource() {
        // Using HikariCP for better connection pooling
        HikariDataSource dataSource = new HikariDataSource();
        dataSource.setJdbcUrl("jdbc:mysql://localhost:3306/otp");
        dataSource.setUsername("root");
        dataSource.setPassword("viniba");
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        return dataSource;
    }

    private Properties hibernateProperties() {
        Properties properties = new Properties();
        properties.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
        properties.put("hibernate.show_sql", "true"); // fro Show the querys.
        properties.put("hibernate.hbm2ddl.auto", "update"); // Change this for production: "validate" or "none"
        
        // Connection Pool Properties (optional)
        properties.put("hibernate.c3p0.min_size", "5");
        properties.put("hibernate.c3p0.max_size", "20");
        properties.put("hibernate.c3p0.timeout", "300");

        return properties;
    }
}
