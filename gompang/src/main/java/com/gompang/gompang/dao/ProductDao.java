package com.gompang.gompang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gompang.gompang.dto.Product;

@Mapper
public interface ProductDao {
    public List<Product> selectAll();
    public List<Product> selectHot();
    public Product getProduct(int pcode);
    public void saveP(Product product);
}
