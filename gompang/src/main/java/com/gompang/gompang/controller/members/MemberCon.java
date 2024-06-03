package com.gompang.gompang.controller.members;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gompang.gompang.config.CustomUserDetails;
import com.gompang.gompang.dao.BasketDao;
import com.gompang.gompang.dao.OfferDao;
import com.gompang.gompang.dao.ProductDao;
import com.gompang.gompang.entity.Basket;
import com.gompang.gompang.dto.CartDto;
import com.gompang.gompang.entity.Offer;
import com.gompang.gompang.dto.OfferWithPnameDto;
import com.gompang.gompang.entity.Product;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/members")
public class MemberCon {

    @Autowired
    ProductDao pDao;

    @Autowired
    BasketDao bDao;

    @Autowired
    OfferDao oDao;

    @RequestMapping("/")
    public String mypage(HttpServletRequest req, @AuthenticationPrincipal CustomUserDetails customUserDetails){
        String view= "members/mypage";
        String logged = customUserDetails.getUsername();
        if(logged == null){
            view = "redirect:/errors?ecode=1";
        }
        return view;
    }

    @RequestMapping("/cart")
    public String cart(HttpServletRequest req, Model model, @AuthenticationPrincipal CustomUserDetails customUserDetails){
        String logged = customUserDetails.getUsername();
        if(logged == null ){
            return "redirect:/errors?ecode=1";
        }
        else{
            List<CartDto> cartList = bDao.cartList(logged);
    
            model.addAttribute("cartList",cartList);
            return "members/cart";
        }
    }
    @RequestMapping("/Detail")
    public String productDetail(HttpServletRequest req, Model model){
        String pcode_ = req.getParameter("pcode");
        int pcode = Integer.parseInt(pcode_);

        Product p = pDao.getProduct(pcode);
        model.addAttribute("p", p);
        return "members/detail";
    }

    @RequestMapping("/inputBasket")
    public String inputBasket(Basket basket, Model model, HttpServletRequest req, @AuthenticationPrincipal CustomUserDetails customUserDetails){
        String logged = customUserDetails.getUsername();
        basket.setUsername(logged);
        // 이미 장바구니에 존재하는 인지
        Optional<Basket> amountDB = bDao.findExistAmount(logged,basket.getPcode());
        if(amountDB.isPresent()){ // 존재하면
            
            Basket basketDB = amountDB.get(); 
            basketDB.setAmountAddNum(basket.getAmount()); // 수량 업데이트 : 기존 수량 + 추가 수량

            //   // 삭제하고 그대로 다시 저장
            // bDao.deleteBasket(basketDB.getBcode());
            // bDao.saveBasket(basketDB); 
            // 

                // 그냥 수량만 수정 업데이트
            bDao.updateAmount(basketDB.getBcode(), basketDB.getAmount());

        }else{ // 존재하지 않으면 그대로 저장
            bDao.saveBasket(basket);
        }
        
        return "redirect:/members/cart";
    }

    @RequestMapping("/BasketOverturn")
    public String cartOverturn(HttpServletRequest req, Model model , @AuthenticationPrincipal CustomUserDetails customUserDetails){
        String logged = customUserDetails.getUsername();
        if(logged == null ){
            return "redirect:/errors?ecode=1";
        }
        else {
            bDao.overturnBasket(logged);
            return "redirect:/members/cart";
        }
    }

    @RequestMapping("/BasketDelete")
    public String cartDelete(HttpServletRequest req, Model model, @AuthenticationPrincipal CustomUserDetails customUserDetails){
        String logged = customUserDetails.getUsername();
        if(logged == null ){
            return "redirect:/errors?ecode=1";
        }
        else{
            String  delCode = req.getParameter("bcode");
            String[] deleteList = delCode.split(",");
            for(String bcode : deleteList){
                bDao.deleteBasket(Integer.parseInt(bcode));
            }
            return "redirect:/members/cart";
        }
    }

    @RequestMapping("/offerList")
    public String offerList(HttpServletRequest req, Model model, @AuthenticationPrincipal CustomUserDetails customUserDetails){
        String logged = customUserDetails.getUsername();

        if(logged == null){
            return "redirect:/errors?ecode=1";
        }else{
            List<OfferWithPnameDto> offerList = oDao.getList(logged);
            
            model.addAttribute("offerList", offerList);
            return "members/offerList";

        }
    }

    @RequestMapping("/offer")
    public String offer(HttpServletRequest req, @AuthenticationPrincipal CustomUserDetails customUserDetails){
        String logged = customUserDetails.getUsername();

        if(logged == null){
            return "redirect:/errors?ecode=1";
        }else{
            int pcode = Integer.parseInt(req.getParameter("pcode"));
            int amount =Integer.parseInt(req.getParameter("amount"));

            Offer offer = new Offer();
            offer.setPcode(pcode);
            offer.setUsername(logged);
            offer.setAmount(amount);
            
            oDao.regOffer(offer);

        }

        return "redirect:/members/offerList";
    }

}
