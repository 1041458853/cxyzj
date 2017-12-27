package com.cxyzj.demo.service.userInfo;

import java.util.Map;

/**
 * @author 耿志强
 */
public interface UserServiceInterface {
    //用户注册的接口
    Map<String, Object> userRegist(String nickname, String email, String password);

    //用户登陆的接口
    Map<String, Object> userLogin(String email, String password);

}