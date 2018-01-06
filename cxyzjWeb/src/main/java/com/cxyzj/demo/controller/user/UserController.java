package com.cxyzj.demo.controller.user;

import com.cxyzj.demo.service.userInfo.imp.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * @author 耿志强
 */

@RestController
@RequestMapping("/v1.0/front/users")
public class UserController {

    @Autowired
    UserService userService;



    /**
     * @author 耿志强
     */
    @PostMapping(value = "/register",produces = "application/json;charset=UTF-8")
    Map<String,Object> register(@RequestParam String nickname,@RequestParam String email,@RequestParam String password){

        Map<String,Object> map = userService.userRegist(nickname,email,password);

        System.out.println(map);
        return map;
    }

    /**
     * 张为毅
     * @param email
     * @param password
     * @return
     */
    @PostMapping(value =  "/login",produces = "application/json;charset=UTF-8")
    Map<String,Object> login(@RequestParam String email,@RequestParam String password){

        Map<String,Object> map = userService.userLogin(email,password);
        return map;
    }

}
