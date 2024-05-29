package com.gompang.gompang.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductDto {

    private String pname;
    private int stock;
    private int price;
    private MultipartFile file;
    private String descript;

    public String getFileName() {
        return file.getOriginalFilename();
    }
}
