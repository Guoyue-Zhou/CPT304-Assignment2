package com.house.wym;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;





@MapperScan("com.house.wym.dao")
@SpringBootApplication
public class WymApplication {

    public static void main(String[] args) {
        SpringApplication.run(WymApplication.class, args);
    }

}
