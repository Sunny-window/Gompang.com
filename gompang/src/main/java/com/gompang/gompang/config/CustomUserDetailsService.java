package com.gompang.gompang.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.gompang.gompang.dao.MemberDao;
import com.gompang.gompang.entity.Member;

@Service
public class CustomUserDetailsService implements UserDetailsService{

    @Autowired
    private MemberDao memberRepo;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // security에서 사용자 정보를 확인/활용 하기위해 
        // security로 사용자 정보를 전달해야함.
        Member member = memberRepo.findByUsername(username);
        if(member != null){
            return new CustomUserDetails(member);
        }
        return null;
    }
    
}
