package com.bit.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
public class ProductDTO {
    private int    no;
    private String productName;
    private String productOrigin;
    private int productPrice;
    private String productCategory;
    private String fileName;
    private String id;
    private String seller;
    private String regdate;
    private String state;



    public ProductDTO() {
        super();
    }


    public ProductDTO(int no, String productName, String productOrigin, int productPrice, String productCategory,
                      String fileName, String id, String seller, String regdate, String state) {
        super();
        this.no = no;
        this.productName = productName;
        this.productOrigin = productOrigin;
        this.productPrice = productPrice;
        this.productCategory = productCategory;
        this.fileName = fileName;
        this.id = id;
        this.seller = seller;
        this.regdate = regdate;
        this.state = state;
    }


    public String getState() {
        return state;
    }
    public void setState(String state) {
        this.state = state;
    }
    public int getNo() {
        return no;
    }
    public void setNo(int no) {
        this.no = no;
    }
    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }
    public String getProductOrigin() {
        return productOrigin;
    }
    public void setProductOrigin(String productOrigin) {
        this.productOrigin = productOrigin;
    }
    public int getProductPrice() {
        return productPrice;
    }
    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }
    public String getProductCategory() {
        return productCategory;
    }
    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }
    public String getFileName() {
        return fileName;
    }
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getSeller() {
        return seller;
    }
    public void setSeller(String seller) {
        this.seller = seller;
    }
    public String getRegdate() {
        return regdate;
    }
    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }


    @Override
    public String toString() {
        return "ProductDTO [no=" + no + ", productName=" + productName + ", productOrigin=" + productOrigin
                + ", productPrice=" + productPrice + ", productCategory=" + productCategory + ", fileName=" + fileName
                + ", id=" + id + ", seller=" + seller + ", regdate=" + regdate + ", state=" + state + "]";
    }




}
