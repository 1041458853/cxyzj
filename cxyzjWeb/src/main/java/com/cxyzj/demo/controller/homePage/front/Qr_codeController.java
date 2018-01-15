package com.cxyzj.demo.controller.homePage.front;

import com.cxyzj.demo.service.homePage.imp.HomePageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.cxyzj.demo.domain.homePage.Qr_code;

import java.util.List;

/**
 * @author 夏庆涛
 */
public class Qr_codeController {
    @Autowired
    HomePageService homePageService;

    //获取二维码列表
    @GetMapping(value = "/qrcode")
    List<Qr_code> qrGet(){
        List<Qr_code> qr_code = homePageService.qrGet();
        System.out.println(qr_code);
        return qr_code;
    }

    //添加二维码
    @PostMapping(value = "/qrcode")
    Integer qrAdd(@RequestParam("qr_code_url") String qr_code_url,
                            @RequestParam("seq") int seq,
                            @RequestParam("qr_title") String qr_title){
        Integer qr_code = homePageService.qrAdd(qr_code_url,seq,qr_title);
        System.out.println(qr_code);
        return qr_code;
    }

    //修改二维码
    @PutMapping(value = "/qrcode/{qr_id}")
    Long qrUpdate(@PathVariable int qr_id,
                               @RequestParam("qr_code_url") String qr_code_url,
                               @RequestParam("seq") int seq,
                               @RequestParam("qr_title") String qr_title){
        Long qr_code = homePageService.qrUpdate(qr_id,qr_code_url,seq,qr_title);
        System.out.println(qr_code);
        return qr_code;
    }

    //更新二维码次序
    @PutMapping(value = "/qrcode/{qr_id}")
    Long qr_seqUpdate(@PathVariable("qr_id") int qr_id,
                                   @RequestParam("seq") int seq){
        Long qr_code = homePageService.qr_seqUpdate(qr_id,seq);
        System.out.println(qr_code);
        return qr_code;
    }

    //删除二维码
    @DeleteMapping(value = "qrcode/{qr_id}")
    Long qrDelete(@PathVariable("qr_id")int qr_id){
        Long qr_code = homePageService.qrDelete(qr_id);
        System.out.println(qr_code);
        return qr_code;
    }
}
