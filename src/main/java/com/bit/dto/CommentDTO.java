package com.bit.dto;

import lombok.Data;

@Data
public class CommentDTO {
    private int NO;
    private int BOARD_NO;
    private int PARENT_NO;
    private String USER_ID;
    private String CONTENTS;
    private String REGDATE;

    public CommentDTO() {
    }

    public CommentDTO(int NO, int BOARD_NO, int PARENT_NO, String USER_ID, String CONTENTS, String REGDATE) {
        this.NO = NO;
        this.BOARD_NO = BOARD_NO;
        this.PARENT_NO = PARENT_NO;
        this.USER_ID = USER_ID;
        this.CONTENTS = CONTENTS;
        this.REGDATE = REGDATE;
    }

    public CommentDTO(int BOARD_NO, String USER_ID, String CONTENTS) {
        this.BOARD_NO = BOARD_NO;
        this.USER_ID = USER_ID;
        this.CONTENTS = CONTENTS;
    }

    public CommentDTO(int BOARD_NO, int PARENT_NO, String USER_ID, String CONTENTS) {
        this.BOARD_NO = BOARD_NO;
        this.PARENT_NO = PARENT_NO;
        this.USER_ID = USER_ID;
        this.CONTENTS = CONTENTS;
    }
}
