package com.bit.dao;

import java.util.HashMap;
import java.util.List;

import com.bit.dto.ProductDTO;

public interface CartDao {
    public boolean idPassCheck(HashMap<String, Object>map);
    public void productAdminInsert(ProductDTO dto);
    public void productAdminUpdate(ProductDTO dto);
    public void productAdminDelete(int no);
    public List<ProductDTO>prodcutList(HashMap<String, Object>map);
    public ProductDTO productAdminInfo(int no);

}
