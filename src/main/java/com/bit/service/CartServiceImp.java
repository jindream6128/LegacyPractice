package com.bit.service;

import java.util.HashMap;
import java.util.List;

import com.bit.dto.BasketDTO;
import com.bit.dto.CommentDTO;
import com.bit.dto.SignupDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.dao.CartDao;
import com.bit.dto.ProductDTO;


@Service
public class CartServiceImp implements CartService{

    @Autowired
    private CartDao dao;

    @Override
    public List<ProductDTO> allProductList() {
        return dao.allProductList();
    }

    @Override
    public boolean idPassCheck(HashMap<String, Object> map) {
        // TODO Auto-generated method stub
        return dao.idPassCheck(map);
    }

    @Override
    public void productAdminInsert(ProductDTO dto) {
        // TODO Auto-generated method stub
        dao.productAdminInsert(dto);

    }

    @Override
    public void productAdminUpdate(ProductDTO dto) {
        // TODO Auto-generated method stub
        dao.productAdminUpdate(dto);
    }

    @Override
    public void productDelete(int no) {
        // TODO Auto-generated method stub
        dao.productDelete(no);
    }
    @Override
    public List<ProductDTO> prodcutList(HashMap<String, Object> map) {
        // TODO Auto-generated method stub
        return dao.prodcutList(map);
    }

    @Override
    public ProductDTO productInfo(int no) {
        return dao.productInfo(no);
    }

    @Override
    public void addBasket(BasketDTO basketDTO) {
        dao.addBasket(basketDTO);
    }

    @Override
    public boolean checkBasketdata(BasketDTO basketDTO) {
        return dao.checkBasketdata(basketDTO);
    }

    @Override
    public void upcntBasket(BasketDTO basketDTO) {
        dao.upcntBasket(basketDTO);
    }

    @Override
    public List<ProductDTO> selectBasketAll(String id) {
        return dao.selectBasketAll(id);
    }

    @Override
    public void deleteBasketproduct(BasketDTO basketDTO) {
        dao.deleteBasketproduct(basketDTO);
    }

    @Override
    public List<ProductDTO> searchProduct(HashMap<String, String> map) {
        return dao.searchProduct(map);
    }

    @Override
    public List<ProductDTO> cartSearchProduct(HashMap<String, String> map) {
        return dao.cartSearchProduct(map);
    }

    ///////////////

    @Override
    public String idDuplicationchk(String id) {
        return dao.idDuplicationchk(id);
    }

    @Override
    public void signup(SignupDTO signupDTO) {
        dao.signup(signupDTO);
    }

    @Override
    public int selectproductCnt(HashMap<String, String> map) {
        return dao.selectproductCnt(map);
    }

    @Override
    public void minusproduct(HashMap<String, String> map) {
        dao.minusproduct(map);
    }

    @Override
    public void plusproduct(HashMap<String, String> map) {
        dao.plusproduct(map);
    }

    @Override
    public void insertcomment(CommentDTO commentDTO) {
        dao.insertcomment(commentDTO);
    }

    @Override
    public List<CommentDTO> selectallcomment(int BOARD_NO) {
        return dao.selectallcomment(BOARD_NO);
    }

    @Override
    public void addinsertcomment(CommentDTO commentDTO) {
        dao.addinsertcomment(commentDTO);
    }


    @Override
    public void deletecomment(int no) {
        dao.deletecomment(no);
    }
}
