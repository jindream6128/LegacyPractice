package com.bit.dao;

import java.util.HashMap;
import java.util.List;

import com.bit.dto.BasketDTO;
import com.bit.dto.ProductDTO;

public interface CartDao {
    // 로그인 id pass 체크
    public boolean idPassCheck(HashMap<String, Object>map);
    // 데이터 추가하기
    public void productAdminInsert(ProductDTO dto);
    //로그인한 아이디에 해당하는 List 뿌리기
    public List<ProductDTO>prodcutList(HashMap<String, Object>map);
    //전체 리스트 불러오기
    public List<ProductDTO> allProductList();
    //상세보기 -> 해당하는 게시글의 번호로 해당 글들의 정보 보기
    public ProductDTO productInfo(int no);

    //장바구니
    //인설트 전에 데이터가 있는지 확인하기
    public boolean checkBasketdata(BasketDTO basketDTO);
    //장바구니에 id 상품번호 넣기
    public void addBasket(BasketDTO basketDTO);
    //insert된거 누르면 update하기
    public void upcntBasket(BasketDTO basketDTO);
    //아이디에 해당하는 장바구니 데이터 조회하기
    public List<ProductDTO> selectBasketAll(String id);
    //장바구니에서 지우기
    public void deleteBasketproduct(BasketDTO basketDTO);
    //검색하기 (카테고리랑, 검색 키워드 가지고가기)
    public List<ProductDTO> searchProduct(HashMap<String,String> map);
    /////////////////////////////////////////////

    //해당하는 번호에 해당하는 게시글 삭제하기
    public void productDelete(int no);

    // 데이터 modify 하기 -> 근데 이거 아직 구현 안된거 같음
    public void productAdminUpdate(ProductDTO dto);


    //전체 데이터 리스트 뽑아내기



}
