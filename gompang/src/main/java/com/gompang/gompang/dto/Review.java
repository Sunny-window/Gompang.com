package com.gompang.gompang.dto;

import lombok.Data;

@Data
public class Review {
    private int rcode;
    private String username;
    private int pcode;
    private String comment;
}
