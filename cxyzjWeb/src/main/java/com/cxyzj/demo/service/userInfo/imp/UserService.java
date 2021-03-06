package com.cxyzj.demo.service.userInfo.imp;

import com.cxyzj.demo.domain.userInfo.User;
import com.cxyzj.demo.domain.userInfo.mapper.UserMapper;
import com.cxyzj.demo.service.userInfo.UserServiceInterface;
import com.cxyzj.demo.tool.StatusInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * @author 耿志强
 */
@Service
public class UserService implements UserServiceInterface {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private StatusInfo statusInfo;

    @Override
    /**
     * @author 耿志强
     */
    public Map<String, Object> userRegist(String nickname, String email, String password) {
        User user = new User(nickname, email, password);
        Map<String, Object> map = new HashMap<String, Object>();                           //用于返回的map

        if (userMapper.isExist(email) != 0) {
            map.put("status", "1");
            statusInfo.setMessage("邮箱已存在，操作失败！");
            map.put("statusInfo", statusInfo.getMessage());
            return map;
        } else {
            user.setHead_url("C:\\cxyzjStatic\\head_url\\head01.jpg");      //默认头像
            user.setIs_admin(false);                  //注册之后，默认为普通用户权限。
            user.setIntroduce("这个人很懒。。。。。");                  //默认个人简介
            user.setGender("不明");                     //默认性别
            user.setBg_url("C:\\cxyzjStatic\\user\\bg_url\\bgurl01.jpg");
            userMapper.registerUser(user);
            user.setUser_id(userMapper.getUsers_Id(email));    //根据email获取自动生成的id

            //data 对象
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("access_token", "fuck");
            data.put("user", user);

            map.put("status", "0");
            map.put("data", data);                           //将data放入map
            statusInfo.setMessage("成功");
            map.put("statusInfo", statusInfo.getMessage());
            return map;            //返回map
        }
    }

    @Override
    /*
    *
    * 在这里署名
    *
    * */
    public Map<String, Object> userLogin(String email, String password) {
        return null;
    }
}
