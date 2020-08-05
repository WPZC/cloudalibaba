package com.cloudalibaba.serverone.fegin;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author wqy
 * @version 1.0
 * @date 2020/7/22 18:52
 */
@FeignClient(value = "nacos-server")
public interface NacosFeign {

    @RequestMapping(value = "/hello")
    String hello();

}
