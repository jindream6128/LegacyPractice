package com.bit.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.dto.ProductDTO;

@Repository
public class CartDaoImp implements CartDao {
    @Autowired
    private SqlSessionTemplate sqlSession;
    static String nameSpace="com.bit.dto.cartMapper.";

    @Override
    public List<ProductDTO> allProductList() {
        return sqlSession.selectList(nameSpace+"allProductList");
    }

    @Override
    public boolean idPassCheck(HashMap<String, Object> map) {
        // TODO Auto-generated method stub
        String dbPass=null;
        return (dbPass=sqlSession.selectOne(nameSpace+"idPassCheck",map))!=null&&dbPass.equals(map.get("password"));
    }
    @Override
    public void productAdminInsert(ProductDTO dto) {
        // TODO Auto-generated method stub
        sqlSession.insert(nameSpace+"productAdminInsert",dto);
    }

    @Override
    public void productAdminUpdate(ProductDTO dto) {
        // TODO Auto-generated method stub
        sqlSession.update(nameSpace+"productAdminUpdate",dto);
    }

    @Override
    public void productDelete(int no) {
        // TODO Auto-generated method stub
        sqlSession.delete(nameSpace+"productAdminDelete", no);
    }
    @Override
    public List<ProductDTO> prodcutList(HashMap<String, Object> map) {
        // TODO Auto-generated method stub
        return sqlSession.selectList(nameSpace+"prodcutList",map);
    }
    @Override
    public ProductDTO productAdminInfo(int no) {
        // TODO Auto-generated method stub
        return sqlSession.selectOne(nameSpace+"productAdminInfo",no);
    }


}
