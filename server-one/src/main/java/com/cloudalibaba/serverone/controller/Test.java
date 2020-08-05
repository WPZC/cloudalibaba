package com.cloudalibaba.serverone.controller;

import com.cloudalibaba.serverone.fegin.NacosFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author wqy
 * @version 1.0
 * @date 2020/7/22 18:51
 */
@RestController
public class Test {

    @Autowired
    private NacosFeign nacosFeign;

    @RequestMapping(value = "/hello")
    public String hello(){

        return nacosFeign.hello();

    }

}
