package com.gompang.gompang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gompang.gompang.dto.Member;

@Mapper
public interface MemberDao {
    List<Member> selectAll();
    String login(String membername, String pwd); // 결과 : role 값 
    String selectByName(String membername);
    void saveMember(String membername, String pwd);
}
