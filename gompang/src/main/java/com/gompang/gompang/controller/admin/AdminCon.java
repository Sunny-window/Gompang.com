package com.gompang.gompang.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminCon {
    @RequestMapping("/admin")
    public String admin(){
        return "/admin/admin";
    }
}
