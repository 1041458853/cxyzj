package com.cxyzj.demo.domain.homePage;

/**
 *张为毅
 */
public class Qr_code {
    private int qr_id;//二维码表主键
    private String qr_code_url;//二维码路径
    private int seq;//二维码次序
    private String qr_title;//二维码标题

    public Qr_code(int qr_id,String qr_code_url,int seq,String qr_title){
        this.qr_code_url=qr_code_url;
        this.qr_id=qr_id;
        this.seq=seq;
        this.qr_title=qr_title;
    }
    public Qr_code(){

    }

    public int getQr_id() {
        return qr_id;
    }

    public void setQr_id(int qr_id) {
        this.qr_id = qr_id;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }


    public void setQr_code_url(String qr_code_url) {
        this.qr_code_url = qr_code_url;
    }

    public String getQr_code_url() {
        return qr_code_url;
    }

    public String getQr_title() {
        return qr_title;
    }

    public void setQr_title(String qr_title) {
        this.qr_title = qr_title;
    }

    @Override
    public String toString(){
        return "Qr_code"+"{"+
                "qr_id="+qr_id+
                ",qr_code_url="+qr_code_url+
                ",seq="+seq+
                ",qr_title="+qr_title+
                '}';

    }





}
