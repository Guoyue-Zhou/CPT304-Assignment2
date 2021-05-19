package com.house.wym.controller;


import com.house.wym.common.HttpTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CityController {


    @RequestMapping("getCity")
    public ResponseEntity<Object> getCity(){

        System.out.println("123");
        return new ResponseEntity<Object>("ok", HttpStatus.OK);
    }
}
