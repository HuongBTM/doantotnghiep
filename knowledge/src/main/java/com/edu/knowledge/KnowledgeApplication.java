package com.edu.knowledge;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

/*-- enable when didnt setup database in application.properties --
@EnableAutoConfiguration(exclude = { DataSourceAutoConfiguration.class,
        HibernateJpaAutoConfiguration.class,
        DataSourceTransactionManagerAutoConfiguration.class,
        ErrorMvcAutoConfiguration.class })*/
@ServletComponentScan
@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
@ComponentScan(basePackages={"com.edu.knowledge.controllers", 
		"com.edu.knowledge.services", "com.edu.knowledge.daos", "com.edu.knowledge.validator"})
@EntityScan("com.edu.knowledge.entities")
@EnableJpaRepositories(basePackages= {"com.edu.knowledge.daos"})
public class KnowledgeApplication{

	public static void main(String[] args) {
		SpringApplication.run(KnowledgeApplication.class, args);
	}

}
