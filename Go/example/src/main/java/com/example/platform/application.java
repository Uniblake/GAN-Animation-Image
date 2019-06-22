package com.example.platform;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

/**
 * @author 夏之阳
 *         创建时间：2018-07-05 15:56
 *         创建说明：starter
 */

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
@ComponentScan("com.example")
public class application extends SpringBootServletInitializer{
    /*@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(application.class);
    }*/
    public static void main(String[] args) {
        SpringApplication.run(application.class, args);
    }
}

//public class application extends SpringBootServletInitializer {
//    @Override
//    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
//        return application.sources(application.class);
//    }
//
//    public static void main(String[] args) throws Exception {
//        SpringApplication.run(application.class, args);
//    }
//}
