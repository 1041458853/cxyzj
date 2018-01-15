package com.cxyzj.demo.controller.homePage.front;

import com.cxyzj.demo.domain.homePage.Slideshow;
import com.cxyzj.demo.service.homePage.imp.HomePageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author 夏庆涛
 */
public class SlideshowController {

    @Autowired
    HomePageService homePageService;

    //获取轮播图列表
    @GetMapping(value = "slideshow")
     List<Slideshow> slideGet(){
        List<Slideshow> slideshow = homePageService.slideGet();
        System.out.println(slideshow);
        return slideshow;
    }

    //添加轮播图
    @PostMapping(value = "slideshow")
     Integer slideAdd (@RequestParam("img_url") String img_url,
                     @RequestParam("seq") int seq,
                     @RequestParam("img_title") String img_title,
                     @RequestParam("target_url") String target_url){
         Integer slideshow = homePageService.slideAdd(img_url,seq,img_title,target_url);
         System.out.println(slideshow);
        return slideshow;

    }

    //更新轮播图列表
    @PutMapping(value = "/slideshow/{slideshow_id}")
    Long slideUpdate(@PathVariable("slideshow_id") int slideshow_id,
                            @RequestParam("img_url") String img_url,
                            @RequestParam("seq") int seq,
                            @RequestParam("img_title") String img_title,
                            @RequestParam("target_url") String target_url){
        Long slideshow = homePageService.slideUpdate(slideshow_id,img_url,seq,img_title,target_url);
        System.out.println(slideshow);
        return slideshow;
    }

    //更新轮播图次序
    @PutMapping(value = "/slideshow/{slideshow_id}")
    Long slide_seqUpdate(@PathVariable("slideshow_id")int slideshow_id,
                                @RequestParam("seq")int seq){
        Long slideshow = homePageService.slide_seqUpdate(slideshow_id,seq);
        System.out.println(slideshow);
        return slideshow;
    }

    //删除轮播图
    @DeleteMapping(value = "/slideshow/{slideshow_id}")
    Long  slideDelete(@PathVariable("slideshow_id")int slideshow_id){
        Long slideshow = homePageService.slideDelete(slideshow_id);
        System.out.println(slideshow);
        return slideshow;
    }
}
