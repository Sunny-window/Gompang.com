package com.gompang.gompang.controller.members;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gompang.gompang.dao.BasketDao;
import com.gompang.gompang.dao.ProductDao;
import com.gompang.gompang.dto.Basket;
import com.gompang.gompang.dto.CartDto;
import com.gompang.gompang.dto.Product;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/members")
public class MemberCon {

    @Autowired
    ProductDao pDao;

    @Autowired
    BasketDao bDao;

    @RequestMapping("/")
    public String mypage(HttpServletRequest req){
        String view= "/members/mypage";
        HttpSession session = req.getSession();
        String logged = (String) session.getAttribute("logged");
        if(logged == null){
            view = "redirect:/loginForm";
        }
        return view;
    }

    @RequestMapping("/cart")
    public String cart(HttpServletRequest req, Model model){
        HttpSession session = req.getSession();
        String logged = (String) session.getAttribute("logged");
        if(logged == null ){
            return "redirect:/loginForm";
        }
        else{
            List<CartDto> cartList = bDao.cartList(logged);
    
            model.addAttribute("cartList",cartList);
            return "/members/cart";
        }
    }
    @RequestMapping("/Detail")
    public String productDetail(HttpServletRequest req, Model model){
        String pcode_ = req.getParameter("pcode");
        int pcode = Integer.parseInt(pcode_);

        Product p = pDao.getProduct(pcode);
        model.addAttribute("p", p);
        return "/members/detail";
    }

    @RequestMapping("/inputBasket")
    public String inputBasket(Basket basket, Model model, HttpServletRequest req){
        HttpSession session = req.getSession();
        String logged = (String) session.getAttribute("logged");
        if(logged == null){
            return "redirect:/loginForm";
        }
        else{
            basket.setUsername(logged);
            bDao.saveBasket(basket);
            System.out.println(basket);
            
            return "redirect:/members/cart";
        }
    }

    @RequestMapping("/CartOverturn")
    public String cartOverturn(HttpServletRequest req, Model model){
        HttpSession session = req.getSession();
        String logged = (String) session.getAttribute("logged");
        if(logged == null ){
            return "redirect:/loginForm";
        }
        else {
            
            return "redirect:/members/cart";
        }
    }

}
