package com.bit.dto;

import lombok.Data;

@Data
public class BasketDTO {
    private int BASKETNO;
    private String USERID;
    private int PRODUCTNO;
    private int PRODUCTCOUNT;
    public BasketDTO(String USERID, int PRODUCTNO) {
        this.USERID = USERID;
        this.PRODUCTNO = PRODUCTNO;
    }


}
