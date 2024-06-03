package com.gompang.gompang.entity;

import lombok.Data;

@Data
public class Basket {
    private int bcode;
    private String username;
    private int pcode;
    private int amount;

    public void setAmountAddNum(int num){
        this.amount += num;
    }
}
