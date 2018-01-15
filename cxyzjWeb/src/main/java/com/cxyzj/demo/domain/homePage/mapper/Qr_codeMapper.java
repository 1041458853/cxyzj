package com.cxyzj.demo.domain.homePage.mapper;

import org.apache.ibatis.annotations.*;
import com.cxyzj.demo.domain.homePage.Qr_code;

import java.util.List;

/**
 * @author 夏庆涛
 */

@Mapper
public interface Qr_codeMapper {

    //添加二维码
    @Insert("insert into qr_code(qr_code_url,seq,qr_title) values(#{qr_code_url},#{seq},#{qr_title})")
    @Options(useGeneratedKeys = true,keyColumn = "qr_id",keyProperty = "qr_id")
    void qrdAdd(Qr_code qr_code);

    //更新二维码
    @Update("update qr_code set qr_code_url=#{qr_code_url},seq=#{seq},qr_title=#{qr_title} " +
            "where qr_id=#{qr_id}")
    Long qrUpdate(Qr_code qr_code);

    //更新二维码次序
    @Update("update qr_code set seq=#{seq} where qr_id=#{qr_id}")
    Long qr_seqUpdate(Qr_code qr_code);

    //获取二维码列表信息
    @Select("select qr_id,qr_code_url,seq,qr_title from qr_code")
    List<Qr_code> qrGet();

    //删除二维码
    @Delete("delete from qr_code where qr_id=#{qr_id}")
    Long qrDelete(Qr_code qr_code);
}
