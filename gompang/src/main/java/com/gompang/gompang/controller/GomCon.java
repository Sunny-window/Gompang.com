package com.gompang.gompang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gompang.gompang.dao.MemberDao;
import com.gompang.gompang.dao.ProductDao;
import com.gompang.gompang.entity.Product;
import com.gompang.gompang.service.GompangService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class GomCon {

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

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
        
        return "index";
    }

    @RequestMapping("/login")
    public String loginForm() {
        System.out.println();

        return "loginForm";
    }

    // @RequestMapping("/login")
    // public String login(HttpServletRequest req){
    //     String username = req.getParameter("username");
    //     String pwd = req.getParameter("pwd");
    //     String view = "/registForm";

    //     HttpSession session = req.getSession(false);
    //     if (session != null) {
    //         session.invalidate();
    //     }
    //     session = req.getSession(true);
        
    //     String role = mdao.login(username, pwd);
    //     if(role == null || role.equals("")){
    //         // 로그인 실패
    //     }   
    //     else{
    //         if(role.equals("ROLE_ADMIN")){
    //             view = "redirect:/admin/";
    //         }
    //         else{
    //             view = "redirect:/members/";
    //         }
    //         session.setAttribute("logged", username);
    //         session.setAttribute("role", role);
    //     }

    //     return view;
    // }

    @RequestMapping("/registForm")
    public String registForm() {

        return "registForm";
    }

    @RequestMapping("/registProc")
    public String regist(HttpServletRequest req) {
        String view = "/home";
        String name = req.getParameter("username");
        int check_result = service.nameCheck(name);
        if( check_result == 1 ) { // result 1 means possible creation
            String pwd_ = req.getParameter("password");
            String pwd = passwordEncoder.encode(pwd_);
            mdao.saveMember(name, pwd);
            view = "redirect:/login";
        }
        
        return view;
    }

    // @RequestMapping("/logout")
    // public String logout(HttpServletRequest req){
    //     HttpSession session = req.getSession(false);
    //     if(session != null){
    //         session.invalidate();
    //     }
    //     return "redirect:/";
    // }

    @RequestMapping("/errors")
    public String error(HttpServletRequest req,Model model){
        String err_msg = " 500 : 알수 없는 오류 ";
        String ecode = req.getParameter("ecode");
        switch (ecode) {
            case "1":
                err_msg = " 401 : 로그인 세션 만료" ;
                break;
            case "2":
                err_msg = " 403 : 접근 권한 제한" ;
                break;
        }

        model.addAttribute("err_code", ecode);
        model.addAttribute("err_msg", err_msg);
        return "error";
    }

}
