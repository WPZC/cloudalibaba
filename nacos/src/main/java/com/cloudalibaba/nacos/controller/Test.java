package com.cloudalibaba.nacos.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author wqy
 * @version 1.0
 * @date 2020/7/22 18:19
 */
@RestController
public class Test {

    @RequestMapping(value = "/hello")
    @ResponseBody
    public String hello(){

        return "hello world!";

    }

}
