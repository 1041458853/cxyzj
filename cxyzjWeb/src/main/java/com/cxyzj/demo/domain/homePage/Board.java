package com.cxyzj.demo.domain.homePage;

/**
 *张为毅
 */
public class Board {
    private int board_id;//版块表主键
    private String img_url;//版块图片路径
    private String board_url;//版块链接
    private String seq;//板块次序

    public Board(int board_id,String img_url,String board_url,String seq){
        this.board_id=board_id;
        this.img_url=img_url;
        this.board_url=board_url;
        this.seq=seq;

    }

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

    public String getSeq() {
        return seq;
    }
    public void setSeq(String seq) {
        this.seq = seq;
    }

    @Override
    public String toString(){
        return "Board{"+
                "board_id="+board_id+
                ",mg_url="+img_url+
                ",board_url="+board_url+
                ",seq="+seq+
                '}';
    }







}
