package com.gompang.gompang.entity;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    private String pcode;
    private String pname;
    private int stock;
    private int price;
    private String img;
    private String descript;
    private LocalDate regdate;
}
