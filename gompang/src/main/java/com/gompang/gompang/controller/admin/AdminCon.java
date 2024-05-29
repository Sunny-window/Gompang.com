package com.gompang.gompang.controller.admin;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gompang.gompang.dao.Filetest;
import com.gompang.gompang.dao.ProductDao;
import com.gompang.gompang.dto.Product;
import com.gompang.gompang.dto.ProductDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminCon {

    @Autowired  
    Filetest testFileDao;

    @Autowired
    ProductDao pDao;

    @Value("${spring.servlet.multipart.location}")
	private String uploadPath;

    @RequestMapping("/")
    public String admin(HttpServletRequest req){
        String view = "redirect:/";
        HttpSession session = req.getSession();
        String role =(String) session.getAttribute("role");
        if(role != null ){
            if(role.equals("admin")){
                view = "/admin/admin";
            }
        }
        return view;
    }
    
    @RequestMapping("/productList")
    public String productList(){
        
        
        return "/admin/productList";
    }

    @RequestMapping("/saveProductForm")
    public String saveProduct(){
        
        return "/admin/saveProduct";
    }

    @RequestMapping("/regProduct")
    public String registProduct(ProductDto file){
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
