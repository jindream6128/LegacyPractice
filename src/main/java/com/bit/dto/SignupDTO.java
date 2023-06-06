package com.bit.dto;

import lombok.Data;

@Data
public class SignupDTO {

    private String ID;
    private String PASSWORD;
    private String NAME;

    public SignupDTO(String ID, String PASSWORD, String NAME) {
        super();
        this.ID = ID;
        this.PASSWORD = PASSWORD;
        this.NAME = NAME;
    }
}
