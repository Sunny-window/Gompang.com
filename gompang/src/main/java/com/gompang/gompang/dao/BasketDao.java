package com.gompang.gompang.dao;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;

import com.gompang.gompang.entity.Basket;
import com.gompang.gompang.dto.CartDto;

@Mapper
public interface BasketDao {
    List<CartDto> cartList(String username);
    void saveBasket(Basket basket);
    void overturnBasket(String username);
    void deleteBasket(int bcode);
    Optional<Basket> findExistAmount(String username, int pcode);
    void updateAmount(int bcode, int amount);
}
