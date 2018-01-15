package com.cxyzj.demo.service.homePage;


import com.cxyzj.demo.domain.homePage.Board;
import com.cxyzj.demo.domain.homePage.Qr_code;
import com.cxyzj.demo.domain.homePage.Slideshow;

import java.util.List;

/**
 * @author 耿志强
 */
public interface homePageServiceInterface {

    //获取主页基本信息


    //获取动态信息


    //获取轮播图列表
    public List<Slideshow> slideGet();

    //添加轮播图
    public Integer slideAdd(String img_url,int seq,String img_title,String target_url);

    //更新轮播图列表
    public Long slideUpdate(int slideshow_id,String img_url,int seq,String img_title,String target_url);

    //更新轮播图次序
    public  Long slide_seqUpdate(int slideshow_id,int seq);

    //删除轮播图
    public Long slideDelete(int slideshow_id);

    //获取板块列表
    public List<Board> boardGet();

    //添加板块
    public Integer boardAdd(String img_url,String board_url,int seq);

    //更新板块
    public Long boardUpdate(int board_id,String img_url,String board_url,int seq);

    //更新板块次序
    public Long board_seqUpdate(int board_id,int seq);

    //删除板块
    public Long boardDelete(int board_id);


    //获取二维码列表
    public List<Qr_code> qrGet();

    //添加二维码
    public Integer qrAdd(String qr_code_url,int seq,String qr_title);

    //修改二维码
    public Long qrUpdate(int qr_id,String qr_code_url,int seq,String qr_title);

    //更新二维码次序
    public Long qr_seqUpdate(int qr_id,int seq);

    //删除二维码
    public Long qrDelete(int qr_id);
}
