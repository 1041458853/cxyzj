package com.cxyzj.demo.controller.homePage.front;

/**
 * @author 夏庆涛
 */

import com.cxyzj.demo.domain.homePage.Board;
import org.springframework.beans.factory.annotation.Autowired;
import com.cxyzj.demo.service.homePage.imp.HomePageService;
import org.springframework.web.bind.annotation.*;
import java.util.List;

public class BoardController {

    @Autowired
    HomePageService homePageservice;

    //查询版块列表
    @GetMapping(value = "/board")
    List<Board> boardGet(){
        List<Board> board = homePageservice.boardGet();
        System.out.println(board);
        return board;
    }
    //添加版块
    @PostMapping(value = "/board")
    Integer boardAdd(@RequestParam("img_url") String img_url,
                          @RequestParam("board_url") String board_url,
                          @RequestParam("seq") int seq) {
        Integer board = homePageservice.boardAdd(img_url,board_url,seq);
        System.out.println(board);
        return board;
    }

    //更新版块
    @PutMapping(value = "/board/{board_id}")
    Long boardUpdate(@PathVariable("board_id") int board_id,
                             @RequestParam("img_url") String img_url,
                             @RequestParam("board_url") String board_url,
                             @RequestParam("seq") int seq){
        Long board = homePageservice.boardUpdate(board_id,img_url,board_url,seq);
        System.out.println(board);
        return board;
    }

    //更新版块次序
    @PutMapping(value = "/board/{board_id}")
    Long board_seqUpdate(@PathVariable("board_id") int board_id,
                                 @RequestParam("seq") int seq){
        Long board = homePageservice.board_seqUpdate(board_id,seq);
        System.out.println(board);
        return board;
    }

    //删除版块
    @DeleteMapping(value = "/board/{board_id}")
    Long boardDelete(@PathVariable("board_id") int board_id){
        Long board = homePageservice.boardDelete(board_id);
        System.out.println(board);
        return board;
    }

}
