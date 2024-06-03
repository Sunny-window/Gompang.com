package com.gompang.gompang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gompang.gompang.entity.Offer;
import com.gompang.gompang.dto.OfferWithPnameDto;

@Mapper
public interface OfferDao {
    void regOffer(Offer offer);
    List<OfferWithPnameDto> getList(String username);
}
