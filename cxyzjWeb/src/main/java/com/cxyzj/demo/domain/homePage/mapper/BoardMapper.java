package com.cxyzj.demo.domain.homePage.mapper;

import com.cxyzj.demo.domain.homePage.Board;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author 夏庆涛
 */
@Mapper
public interface BoardMapper {
    //添加版块
    @Insert("insert into board(img_url,board_url,seq) values(#{board_id},#{img_url},#{board_url},#{seq})")
    @Options(useGeneratedKeys = true,keyColumn = "board_id",keyProperty = "board_id")
    void boardAdd(Board board);

    //更新版块
    @Update("update board set img_url=#{img_url},board_url=#{board_url},seq=#{seq} " +
            "where board_id=#{board_id}")
    Long boardUpdate(Board board);

    //更新版块次序
    @Update("update board set seq=#{seq} where board_id=#{board_id}")
    Long board_seqUpdate(Board board);

    //获取版块列表信息
    @Select("select board_id,img_url,board_url,seq from board")
    List<Board> boardGet();

    //删除版块
    @Delete("delete from board where board_id=#{board_id}")
    Long boardDelete(Board board);
}
