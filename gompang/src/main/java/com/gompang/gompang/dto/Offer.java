package com.gompang.gompang.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Offer {
    private int ocode;
    private String username;
    private int pcode;
    private int amount;
    private LocalDate odate;
}
