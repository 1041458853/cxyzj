package com.cxyzj.demo.domain.userInfo.mapper;

import com.cxyzj.demo.domain.userInfo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Map;

@Mapper
public interface UserMapper {

/*     2，不使用@Param注解
    不使用@Param注解时，参数只能有一个，并且是Javabean。在SQL语句里可以引用JavaBean的属性，而且只能引用JavaBean的属性。
    // 这里id是user的属性
    @Select("SELECT * from Table where id = ${id}")
    Enchashment selectUserById(User user);*/

    //向数据库中插入nickname，email，password，is_admin ,regist_date,gender,head_url,bg_url,introduce等注册时填写或默认的值
    @Insert("insert into user(nickname,email,password,is_admin,regist_date,gender,head_url,bg_url,introduce) values ('${nickname}','${email}','${password}',${is_admin},now()," +
            "'${gender}','${head_url}','${bg_url}','${introduce}')")
    void registerUser(User user);

    //根据邮箱查找用户id
    @Select("select user_id from user where email=#{email}")
    int getUsers_Id(@Param("email")String email);

    //根据邮箱查找，看这个邮箱在数据库中是否已存在
    @Select("SELECT COUNT(*) FROM user WHERE email=#{email}")
    int isExist(@Param("email")String email);

    //根据邮箱密码进行验证登录``````````
    //数据库里没有 access_token 列暂时随意返回一些值
    //@Select("SELECT access_token from user WHERE email=#{email} and password=#{password}")
    //String login_access_token(@Param("email")String email,@Param("password")String password);

    @Select("SELECT user_id from user WHERE email=#{email} and password=#{password}")
    String login_user_id(@Param("email")String email,@Param("password")String password);

    @Select("SELECT nickname from user WHERE email=#{email} and password=#{password}")
    String login_nickname(@Param("email")String email,@Param("password")String password);

    @Select("SELECT head_url from user WHERE email=#{email} and password=#{password}")
    String login_head_url(@Param("email")String email,@Param("password")String password);

    @Select("SELECT is_admin from user WHERE email=#{email} and password=#{password}")
    int login_is_admin(@Param("email")String email,@Param("password")String password);

    @Select("SELECT email from user WHERE email=#{email} and password=#{password}")
    String login_email(@Param("email")String email,@Param("password")String password);

    @Select("SELECT introduce from user WHERE email=#{email} and password=#{password}")
    String login_introduce(@Param("email")String email,@Param("password")String password);

    @Select("SELECT gender from user WHERE email=#{email} and password=#{password}")
    String login_gender(@Param("email")String email,@Param("password")String password);

    @Select("SELECT bg_url from user WHERE email=#{email} and password=#{password}")
    String login_bg_url(@Param("email")String email,@Param("password")String password);
}
