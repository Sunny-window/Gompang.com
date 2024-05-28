package com.gompang.gompang.controller.members;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberCon {
    @RequestMapping("/mypage")
    public String mypage(){
        return "/members/mypage";
    }

    @RequestMapping("/cart")
    public String cart(){
        
        return "/members/cart";
    }


}
