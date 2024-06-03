package com.gompang.gompang.entity;

import lombok.Data;

@Data
public class Review {
    private int rcode;
    private String username;
    private int pcode;
    private String comment;
}
