package com.cloudalibaba.gateway.feign;

import com.cloudalibaba.gateway.common.vo.ResultVO;
import com.cloudalibaba.gateway.config.CustomizedConfiguration;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author wqy
 * @version 1.0
 * @date 2020/8/1 16:04
 */
@FeignClient(value = "securitypermission")
public interface SecuritypePermissionFeign {

    /**
     * 验证token
     * @param token
     * @return
     */
    @RequestMapping(value = "/verificationToken",method = {RequestMethod.POST})
    ResultVO<Boolean> verificationToken(@RequestParam("token") String token);

}
