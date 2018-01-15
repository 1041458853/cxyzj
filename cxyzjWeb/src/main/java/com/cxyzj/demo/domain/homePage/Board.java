package com.cxyzj.demo.domain.homePage;


/**
 * @author 夏庆涛
 */

public class Board {

    private int board_id;  //版块id
    private String img_url;  //版块图片路径
    private String board_url;  //版块链接
    private int seq;  //版块次序

    public Board(){

    }

    public int getBoard_id() {
        return board_id;
    }

    public void setBoard_id(int board_id) {
        this.board_id = board_id;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public String getBoard_url() {
        return board_url;
    }

    public void setBoard_url(String board_url) {
        this.board_url = board_url;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    @Override
    public String toString(){
        return "board{"+
                "board_id="+board_id+
                ",mg_url="+img_url+
                ",board_url="+board_url+
                ",seq="+seq+
                '}';
    }
}
