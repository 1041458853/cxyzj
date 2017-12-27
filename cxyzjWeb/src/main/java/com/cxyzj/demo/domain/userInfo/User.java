package com.cxyzj.demo.domain.userInfo;


import java.sql.Timestamp;

//用户实体类
public class User {
    private int user_id;            //用户id
    private String password;        //密码
    private String nickname;        //昵称
    private String true_name;       //真实姓名
    private String gender;          //性别
    private String email;          //电子邮箱
    private String head_url;       //头像路径
    private String bg_url;          //主页背景图片路径
    private String introduce;       //个人简介
    private Timestamp regist_date;   //注册日期
    private Boolean is_admin;      //权限

    public User(int user_id, String password, String nickname, String true_name, String gender, String email, String head_url, String bg_url, String introduce, Timestamp regist_date, Boolean is_admin) {
        this.user_id = user_id;
        this.password = password;
        this.nickname = nickname;
        this.true_name = true_name;
        this.gender = gender;
        this.email = email;
        this.head_url = head_url;
        this.bg_url = bg_url;
        this.introduce = introduce;
        this.regist_date = regist_date;
        this.is_admin = is_admin;
    }

    public User() {
    }

    public User(String nickname, String email,String password) {
        this.password = password;
        this.nickname = nickname;
        this.email = email;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getTrue_name() {
        return true_name;
    }

    public void setTrue_name(String true_name) {
        this.true_name = true_name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHead_url() {
        return head_url;
    }

    public void setHead_url(String head_url) {
        this.head_url = head_url;
    }

    public String getBg_url() {
        return bg_url;
    }

    public void setBg_url(String bg_url) {
        this.bg_url = bg_url;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public Timestamp getRegist_date() {
        return regist_date;
    }

    public void setRegist_date(Timestamp regist_date) {
        this.regist_date = regist_date;
    }

    public Boolean getIs_admin() {
        return is_admin;
    }

    public void setIs_admin(Boolean is_admin) {
        this.is_admin = is_admin;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", true_name='" + true_name + '\'' +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", head_url='" + head_url + '\'' +
                ", bg_url='" + bg_url + '\'' +
                ", introduce='" + introduce + '\'' +
                ", regist_date=" + regist_date +
                ", is_admin=" + is_admin +
                '}';
    }
}
