package com.gompang.gompang.controller.admin;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gompang.gompang.config.CustomUserDetails;
import com.gompang.gompang.dao.Filetest;
import com.gompang.gompang.dao.ProductDao;
import com.gompang.gompang.entity.Product;
import com.gompang.gompang.dto.ProductDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminCon {

    @Autowired  
    Filetest testFileDao;

    @Autowired
    private ProductDao pdao;

    @Autowired
    ProductDao pDao;

    @Value("${spring.servlet.multipart.location}")
	private String uploadPath;

    @RequestMapping("/")
    public String admin(HttpServletRequest req, @AuthenticationPrincipal CustomUserDetails customUserDetails){
        String view = "redirect:/errors?ecode=2";
        String role = customUserDetails.getRole();
        if(role != null ){
            if(role.equals("ROLE_ADMIN")){
                view = "admin/admin";
            }
        }
        return view;
    }
    
    @RequestMapping("/productList")
    public String productList(Model model){
        List<Product> pList = pdao.selectAll();
        model.addAttribute("pList", pList);
        
        return "admin/productList";
    }

    @RequestMapping("/saveProductForm")
    public String saveProduct(){
        
        return "admin/saveProduct";
    }

    @RequestMapping("/regProduct")
    public String registProduct(HttpServletRequest req, ProductDto file , @AuthenticationPrincipal CustomUserDetails customUserDetails){

        String role = customUserDetails.getRole();
        if(role == null){
            return "/error?ecodes=2";
        }
        else{
            String filename = file.getFileName();
            Product p = new Product();
            p.setPname(file.getPname());
            p.setImg(filename);
            p.setPrice(file.getPrice());
            p.setStock(file.getStock());
            p.setDescript(file.getDescript());
    
            pDao.saveP(p);
    
            File f = new File(filename);
            try{
                file.getFile().transferTo(f);
                System.out.println("파일 업로드 성공");
    
            }catch(Exception e){
                e.printStackTrace();
            }
            return "redirect:/admin/productList";
        }
    }
}
