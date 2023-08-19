package com.haipv.estore;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.data.jpa.JpaRepositoriesAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.quartz.QuartzAutoConfiguration;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

// Disable Spring Security and Spring Data JPA
@SpringBootApplication(exclude = {
  SecurityAutoConfiguration.class,
  JpaRepositoriesAutoConfiguration.class,
  DataSourceAutoConfiguration.class,
  QuartzAutoConfiguration.class
})
public class EStoreApplication {
  public static void main(String[] args) {
    SpringApplication.run(EStoreApplication.class, args);
  }
}
