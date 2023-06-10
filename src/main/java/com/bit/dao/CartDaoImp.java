package com.bit.dao;

import java.util.HashMap;
import java.util.List;

import com.bit.dto.BasketDTO;
import com.bit.dto.CommentDTO;
import com.bit.dto.SignupDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.dto.ProductDTO;

@Repository
public class CartDaoImp implements CartDao {
    @Autowired
    private SqlSessionTemplate sqlSession;
    static String nameSpace="com.bit.dto.cartMapper.";
    static String userNameSpace = "com.bit.dto.userMapper.";
    static String commentNameSpace = "com.bit.dto.commentMapper.";


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
    public ProductDTO productInfo(int no) {
        return sqlSession.selectOne(nameSpace+"productInfo",no);
    }

    @Override
    public void addBasket(BasketDTO basketDTO) {
        sqlSession.insert(nameSpace+"addBasket", basketDTO);
    }


    @Override
    public boolean checkBasketdata(BasketDTO basketDTO) {
        Boolean chk =true;
        String no = sqlSession.selectOne(nameSpace+"checkBasketdata", basketDTO);
        //null 일때만 insert해라
        if(no == null){
            chk = true;
        }else{
            chk = false;
        }
        return chk;
    }

    @Override
    public void upcntBasket(BasketDTO basketDTO) {
        sqlSession.update(nameSpace+"upcntBasket",basketDTO);
    }

    @Override
    public List<ProductDTO> selectBasketAll(String id) {
        return sqlSession.selectList(nameSpace+"selectBasketAll", id);
    }

    @Override
    public void deleteBasketproduct(BasketDTO basketDTO) {
        sqlSession.delete(nameSpace+"deleteBasketproduct",basketDTO);
    }

    @Override
    public List<ProductDTO> searchProduct(HashMap<String, String> map) {
        return sqlSession.selectList(nameSpace+"searchProduct",map);
    }

    @Override
    public List<ProductDTO> cartSearchProduct(HashMap<String, String> map) {
        return sqlSession.selectList(nameSpace+"cartlistSearch",map);
    }

    ///////////////

    @Override
    public String idDuplicationchk(String id) {
        return sqlSession.selectOne(userNameSpace+"idDuplicationchk",id);
    }

    @Override
    public void signup(SignupDTO signupDTO) {
        sqlSession.insert(userNameSpace+"signup",signupDTO);
    }

    @Override
    public int selectproductCnt(HashMap<String, String> map) {
        return sqlSession.selectOne(nameSpace+"selectproductCnt",map);
    }

    @Override
    public void minusproduct(HashMap<String, String> map) {
        sqlSession.update(nameSpace+"downproductCnt",map);
    }

    @Override
    public void plusproduct(HashMap<String, String> map) {
        sqlSession.update(nameSpace+"plusproductCnt" ,map);
    }

    @Override
    public void insertcomment(CommentDTO commentDTO) {
        sqlSession.insert(commentNameSpace+"insertcomment",commentDTO);
    }

    @Override
    public List<CommentDTO> selectallcomment(int BOARD_NO) {
        return sqlSession.selectList(commentNameSpace+"selectallcomment",BOARD_NO);
    }

    @Override
    public void addinsertcomment(CommentDTO commentDTO) {
        sqlSession.insert(commentNameSpace+"addinsertcomment",commentDTO);
    }
}
