package com.bit.dto;

import lombok.Data;

@Data
public class Comment2DTO {
    private int NO;
    private String USER_ID;
    private String CONTENTS;
    private String REGDATE;
    private int BOARD_NO;

    public Comment2DTO(String USER_ID, String CONTENTS, int BOARD_NO) {
        this.USER_ID = USER_ID;
        this.CONTENTS = CONTENTS;
        this.BOARD_NO = BOARD_NO;
    }

    public Comment2DTO(int NO, String USER_ID, String CONTENTS, String REGDATE, int BOARD_NO) {
        this.NO = NO;
        this.USER_ID = USER_ID;
        this.CONTENTS = CONTENTS;
        this.REGDATE = REGDATE;
        this.BOARD_NO = BOARD_NO;
    }

    public Comment2DTO() {
    }
}
