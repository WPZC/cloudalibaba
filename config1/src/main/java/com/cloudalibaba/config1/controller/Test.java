package com.cloudalibaba.config1.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author wqy
 * @version 1.0
 * @date 2020/7/23 18:38
 */
@RestController
public class Test {

    @Value("${info}")
    private String info;
    @Value("${foo}")
    private String foo;

    @RequestMapping(value = "/getInfo")
    @ResponseBody
    public String getInfo(){
        return info;
    }

    @RequestMapping(value = "/getFoo")
    @ResponseBody
    public String getFoo(){
        return foo;
    }

}
