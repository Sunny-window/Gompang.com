package com.gompang.gompang.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class OfferWithPnameDto {
    private int ocode;
    private int pcode;
    private int amount;
    private LocalDate odate;
    private String pname;
    private int price;
    private String img;
}
