package com.bit.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.dao.CartDao;
import com.bit.dto.ProductDTO;


@Service
public class CartServiceImp implements CartService{

    @Autowired
    private CartDao dao;

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
    public void productAdminDelete(int no) {
        // TODO Auto-generated method stub
        dao.productAdminDelete(no);
    }
    @Override
    public List<ProductDTO> prodcutList(HashMap<String, Object> map) {
        // TODO Auto-generated method stub
        return dao.prodcutList(map);
    }

    @Override
    public ProductDTO productAdminInfo(int no) {
        // TODO Auto-generated method stub
        return dao.productAdminInfo(no);
    }



}
