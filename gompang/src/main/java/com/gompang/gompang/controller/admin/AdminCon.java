package com.gompang.gompang.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminCon {
    @RequestMapping("/")
    public String admin(HttpServletRequest req){
        String view = "redirect:/";
        HttpSession session = req.getSession();
        String role = session.getAttribute("role").toString();
        if(role.equals("admin")){
            view = "/admin/admin";
        }
        return view;
    }
    
    @RequestMapping("/productList")
    public String productList(){
        
        
        return "/admin/productList";
    }

    @RequestMapping("/saveProduct")
    public String saveProduct(){
        
        
        return "/admin/saveProduct";
    }
}
