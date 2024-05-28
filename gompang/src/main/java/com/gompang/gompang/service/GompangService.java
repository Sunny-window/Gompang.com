package com.gompang.gompang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gompang.gompang.dao.MemberDao;

@Service
public class GompangService {
    
    @Autowired
    MemberDao memberDao;

    public int nameCheck(String name){
        int result = 0;

        String check = memberDao.selectByName(name);
        if(check == null){
            result = 1;
        }

        return result;
    }
}
