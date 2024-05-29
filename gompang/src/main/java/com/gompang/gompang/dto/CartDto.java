package com.gompang.gompang.dto;

import lombok.Data;

@Data
public class CartDto {
    private int bcode;
    private int amount;
    private int pcode;
    private String pname;
    private int price;
    private int stock;
    private String img;
}
