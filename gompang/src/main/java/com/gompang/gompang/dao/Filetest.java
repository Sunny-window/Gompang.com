package com.gompang.gompang.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface Filetest {
    void saveFileUrl(String url);
}
