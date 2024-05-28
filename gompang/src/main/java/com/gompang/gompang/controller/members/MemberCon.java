package com.gompang.gompang.controller.members;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gompang.gompang.dao.ProductDao;
import com.gompang.gompang.dto.Product;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MemberCon {

    @Autowired
    ProductDao pDao;

    @RequestMapping("/mypage")
    public String mypage(){
        return "/members/mypage";
    }

    @RequestMapping("/cart")
    public String cart(){
        
        return "/members/cart";
    }
    @RequestMapping("Detail")
    public String productDetail(HttpServletRequest req, Model model){
        String pcode_ = req.getParameter("pcode");
        int pcode = Integer.parseInt(pcode_);

        Product p = pDao.getProduct(pcode);
        model.addAttribute("p", p);
        return "/members/detail";
    }

}
