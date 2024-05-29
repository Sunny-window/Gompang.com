package com.gompang.gompang.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.gompang.gompang.dto.Basket;
import com.gompang.gompang.dto.CartDto;

@Mapper
public interface BasketDao {
    List<CartDto> cartList(String username);
    void saveBasket(Basket basket);
    void overturnBasket(String username);
}
