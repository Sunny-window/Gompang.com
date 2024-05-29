package com.gompang.gompang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gompang.gompang.dao.MemberDao;
import com.gompang.gompang.dao.ProductDao;
import com.gompang.gompang.dto.Product;
import com.gompang.gompang.service.GompangService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class GomCon {

    @Autowired
    private ProductDao pdao;

    @Autowired
    private MemberDao mdao;

    @Autowired
    private GompangService service;

    @RequestMapping("/")
    public String requestMethodName(Model model) {
        List<Product> pList = pdao.selectAll();
        model.addAttribute("pList", pList);

        List<Product> hotList = pdao.selectHot();
        model.addAttribute("hotList", hotList);
        
        return "/home";
    }

    @RequestMapping("/loginForm")
    public String loginForm() {
        System.out.println();

        return "/loginForm";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest req){
        String membername = req.getParameter("membername");
        String pwd = req.getParameter("pwd");
        String view = "/registForm";

        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        session = req.getSession(true);
        
        String role = mdao.login(membername, pwd);
        if(role == null || role.equals("")){
            // 로그인 실패
        }   
        else{
            if(role.equals("admin")){
                view = "redirect:/admin/";
            }
            else{
                view = "redirect:/members/";
            }
            session.setAttribute("logged", membername);
            session.setAttribute("role", role);
        }

        return view;
    }

    @RequestMapping("/registForm")
    public String registForm() {

        return "/registForm";
    }

    @RequestMapping("/regist")
    public String regist(HttpServletRequest req) {
        String view = "/home";
        String name = req.getParameter("membername");
        int check_result = service.nameCheck(name);
        if( check_result == 1 ) { // result 1 means possible creation
            mdao.saveMember(name, req.getParameter("pwd"));
            view = "redirect:/loginForm";
        }
        
        return view;
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest req){
        HttpSession session = req.getSession(false);
        if(session != null){
            session.invalidate();
        }
        return "redirect:/";
    }

}
