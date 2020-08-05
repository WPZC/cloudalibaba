package com.cloudalibaba.securitypermission.security.jwt;

import com.cloudalibaba.securitypermission.common.entity.RoleEntity;
import com.cloudalibaba.securitypermission.common.entity.UserEntity;
import com.cloudalibaba.securitypermission.common.methods.utils.SpringUtils;
import com.cloudalibaba.securitypermission.security.entity.AuthUser;
import com.cloudalibaba.securitypermission.security.fegin.UserMangementFegin;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.stream.Collectors;
 
/**
 * @Author WQY
 * @Date 2019/11/26 15:39
 * @Version 1.0
 */
public class JwtUtil {
    //秘钥
    private static final String secret = "wqy.com";

    private static UserMangementFegin userMangementFegin = SpringUtils.getApplicationContext().getBean(UserMangementFegin.class);

    /**
     * 生成token
     * @param username
     * @param roles
     * @return
     */
    public static String generateToken(String username,List<RoleEntity> roles) {
        Map<String, Object> claims = new HashMap<>();
        claims.put("roles", roles.parallelStream().map(RoleEntity::getName).collect(Collectors.joining(",")));
 
        return Jwts.builder()
                .setClaims(claims)
                .setSubject(username)
                //.setAudience(username+".")
                //创建时间
                .setIssuedAt(new Date())
                //过期时间，我们设置为 五分钟
                .setExpiration(new Date(System.currentTimeMillis() + 60 * 60 * 60 * 1000))
                //签名，通过密钥保证安全性
                .signWith(SignatureAlgorithm.HS512, secret)
                .compact();
    }
 
    /**
     * 解析token
     * @param token
     * @return
     */
    public static AuthUser parseToken(String token) {
        Claims claims = Jwts.parser()
                .setSigningKey(secret)
                .parseClaimsJws(token)
                .getBody();
        String username = claims.getSubject();
        //String audience = claims.getAudience();
        //System.out.println(audience);
        String roles = (String) claims.get("roles");
 
        //因为生成的时候没有放入密码，所以不需要密码
        return new AuthUser(username, null, Arrays.stream(roles.split(",")).map(name -> {
            RoleEntity role = new RoleEntity();
            role.setName(name);
            return role;
        }).collect(Collectors.toList()));
    }

    /**
     * 获取用户
     * @param request
     * @return
     */
    public static UserEntity getUser(HttpServletRequest request){

        String token = request.getHeader("token");

        return userMangementFegin.findByUserName(parseToken(token).getUsername());

    }
}