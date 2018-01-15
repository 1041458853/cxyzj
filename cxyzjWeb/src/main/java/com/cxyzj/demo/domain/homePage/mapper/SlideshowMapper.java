package com.cxyzj.demo.domain.homePage.mapper;

import com.cxyzj.demo.domain.homePage.Slideshow;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author 夏庆涛
 */

@Mapper
public interface SlideshowMapper {

    //添加轮播图
    @Insert("insert into slideshow(img_url,seq,img_title,target_url) values(#{img_url},#{seq},#{img_title},#{target_url})")
    @Options(useGeneratedKeys = true,keyColumn = "slideshow_id",keyProperty = "slideshow_id")
    void slideAdd(Slideshow slideshow);

    //更新轮播图
    @Update("update slideshow set img_url=#{img_url},seq=#{seq},img_title=#{img_title},target_url=#{target_url} " +
            "where slideshow_id=#{slideshow_id}")
    Long slideUpdate(Slideshow slideshow);

    //更新轮播图次序
    @Update("update slideshow set seq=#{seq} where slideshow_id=#{slideshow_id}")
    Long slide_seqUpdate(Slideshow slideshow);

    //获取轮播图列表
    @Select("select slideshow_id,img_url,seq,img_title,target_url from slideshow")
    List<Slideshow> slideGet();

    //删除轮播图
    @Delete("delete from slideshow where slideshow_id=#{slideshow_id}")
    Long slideDelete(Slideshow slideshow);
}
