package com.bit.controller;

import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.stream.DoubleStream;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.dto.BasketDTO;
import com.bit.dto.CommentDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bit.dto.ProductDTO;
import com.bit.service.CartService;

@Controller
public class CartController {

    @Autowired
    private CartService cartService;
    @GetMapping("/login")
    public String loginView(@CookieValue(value = "idCook",required = false)Cookie cookie,Model model) {//쿠키생성 여부 확인
        if(cookie!=null)
            model.addAttribute("idCook", cookie.getValue());

        return "cart/adminLogin";
    }

    @GetMapping("/gosignup")
    public String gosignin(){
        return "cart/signup";
    }

    @GetMapping("/logout")
    public String logoutView(HttpSession session){
        session.removeAttribute("id");
        return "redirect:/productList";
    }

    @PostMapping("/loginCheck")// 로그인처리
    public String loginCheckPro(@RequestParam(value = "id",required = true)String id,
                                @RequestParam(value = "password",required = true)String password,String checker,
                                HttpSession session,HttpServletResponse response ) {
        //쿠키....
        Cookie cookie=new Cookie("idCook", id);
        cookie.setMaxAge((checker!=null)?30:0);
       // System.out.println(checker+"checker");
       // System.out.println(cookie.getMaxAge()+"maxAge");
        response.addCookie(cookie);


        HashMap<String, Object>map=new HashMap<String, Object>();
        map.put("id", id);
        map.put("password", password);
        if(cartService.idPassCheck(map)) {
            session.setAttribute("id", id);
            session.setMaxInactiveInterval(600);
            return  "redirect:productList";
        }
        return "redirect:/login";
    }
    @GetMapping("/productList")
    public String productListProcess(Model model) {
        //HttpSession session,
        //HashMap<String, Object>map=new HashMap<String, Object>();
        //map.put("id",session.getAttribute("id"));

        //model.addAttribute("productList", cartService.prodcutList(map));
        model.addAttribute("productList",cartService.allProductList());
        return "cart/productList";
    }

    @GetMapping("/productAdd")
    public String productaddProcess(HttpSession session,Model model){

        HashMap<String, Object>map=new HashMap<String, Object>();
        map.put("id",session.getAttribute("id"));

        model.addAttribute("productList", cartService.prodcutList(map));
        return "cart/productAdd";
    }


    @PostMapping(value = "productInsert")
    public String productAddProcess(ProductDTO dto,@RequestParam(value = "file", required = false)
    MultipartFile file) {
        //upload, insert
        String locations ="/Users/kimjingeun/IdeaProjects/SpringLegacy3re/src/main/webapp/resources/upload/";
        FileOutputStream fos;
        String fileDemo = file.getOriginalFilename();
        if (fileDemo.length() > 0) {
            try {
                fos = new FileOutputStream(locations + file.getOriginalFilename());
                fos.write(file.getBytes());
                dto.setFileName(file.getOriginalFilename());
                //cartService.productAdminInsert(dto);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        } // update

        if(dto.getState().equals("inject")) {
            cartService.productAdminInsert(dto);
        }else {
            cartService.productAdminUpdate(dto);
        }

        return "redirect:productAdd";
    }




    @GetMapping(value = "cartAdd")
    public String cartAddProcess() {
        //System.out.println("cartAddProcess");
        return "cart/cartList";
    }

    @PostMapping(value = "ajaxModify")
    @ResponseBody
    public ProductDTO productUpdate(@RequestParam("no")int no) {
        return  cartService.productInfo(no);
    }

    @GetMapping("/productDelete/{no}")
    public String productDeleteProcess(@PathVariable("no")int no) {
       // System.out.println("no===="+no);
        cartService.productDelete(no);
        return "redirect:/productAdd";
    }
    @GetMapping("/productInfo/{no}/{cnt_no}")
    public String productInfoProcess(@PathVariable("no")int no,@PathVariable("cnt_no")int cnt_no, Model model){
        //해당 게시글 번호의 데이터 가져오기
        model.addAttribute("list", cartService.productInfo(no));
        //no <- 이게 실질적인 제품 번호 ~! cnt_no <- 이거는 상품의 갯수
        model.addAttribute("cnt_no",cnt_no);

        /*List<CommentDTO> selectallcomment = cartService.selectallcomment(no);
        System.out.println(selectallcomment);
        model.addAttribute("commentlist",selectallcomment);*/

        return "cart/productInfo";
    }

    @GetMapping("/cart/productminus")
    @ResponseBody
    public String minusproduct(String id,String productno){
        System.out.println(id);
        System.out.println(productno);
        HashMap<String,String > map = new HashMap<>();
        map.put("id",id);
        map.put("productno",productno);
        int cnt =cartService.selectproductCnt(map);
        if(cnt == 1){
            return "fail";
        }

        cartService.minusproduct(map);

        return "success";
    }

    @GetMapping("/cart/productplus")
    @ResponseBody
    public String plusproduct(String id, String productno){
        HashMap<String,String > map = new HashMap<>();
        map.put("id",id);
        map.put("productno",productno);
        cartService.plusproduct(map);
        return "sucess";
    }



}










