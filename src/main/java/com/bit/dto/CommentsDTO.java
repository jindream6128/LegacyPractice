package com.bit.dto;

import lombok.Data;

@Data
public class CommentsDTO {
    //이까지는 댓글을 위한 기술적 코드
    private int NO; // 그냥 댓글 PK 댓글의 NO
    private int REF; // 한 그룹에서 대장 댓글의 번호
    private int STEP; // 나오는 순서 나중에 긁어올때 그냥 STEP 순서대로 뿌리면 된다.
    private int LEV; // LEV 가 뎁스이다
    private int PNUM; // 바로 위에 있는 부모 댓글의 번호
    private int REPLY; //바로 밑에 댓글의 번호

    //기본 댓글 내용
    private int BOARD_NO; // 댓글 주인의 게시판 번호
    private String USER_ID; // 게시글을 작성한 사람
    private String CONTENTS; // 댓글 내용
    private String REGDATE; // 작성일자


}
