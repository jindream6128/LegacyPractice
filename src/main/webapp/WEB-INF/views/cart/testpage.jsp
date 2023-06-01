<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>관리자</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=10" />
    <meta http-equiv="imagetoolbar" content="no" />
    <link href="${pageContext.request.contextPath}/resources/css/contents.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>
        /* private int    no;
        private String productName;
        private String productOrigin;
        private int productPrice;
        private String productCategory;
        private String fileName;
        private String id;
        private String seller;
        private String regdate; */


        $(function(){
            $("a.delete").click(function(){
                document.location.href='${pageContext.request.contextPath}/productDelete/'+this.lang
            });
            $("a.modify").click(function(){
                //alert(this.lang);
                $.ajax({
                    url:'${pageContext.request.contextPath}/ajaxModify',
                    type:'post',
                    dataType:'json',
                    data:{no:this.lang},
                    success:function(data){
                        $("input[name='no']").val(data['no']);
                        $("input[name='productName']").val(data['productName']);
                        $("input[name='productOrigin']").val(data['productOrigin']);
                        $("input[name='productPrice']").val(data['productPrice']);
                        $("select[name='productCategory']").val(data['productCategory']).prop("selected", true);
                        $("a#save").text('수정');
                    },
                    error:function(){
                        alert('ajaxError');
                    }

                })
            });
            $("a#save").click(function(){
                //유효성 검사
                if($(this).text()=='수정'){
                    $("input#state").val('modify');
                }
                $("form").submit();
            });
        });
    </script>
</head>
<body>
${productList}
<div id="wrap">
    <div id="sub_container">
        <div id="contentsWrap" class="sub_con5">
            <div class="board_form">
                <div class="con_title">
                    <p>상품등록/보기/수정</p>
                </div>
                <div class="contents">
                    <div class="btnSet clfix mgb15">
						<span class="fr"> <span class="button"><a href="#">목록</a></span>
						</span>
                    </div>

                    <table class="bbsWrite mgb35">
                        <caption></caption>
                        <colgroup>
                            <col width="95" />
                            <col width="395" />
                            <col width="95" />
                            <col />
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>업체명</th>
                            <td><select style="width: 200px;">
                                <option>선택하세요</option>
                            </select></td>
                            <th>상품명</th>
                            <td><input type="text" name="" style="border:1px solid #ddd; height:20px;" class="inputText" size="30" />
                                <span class="button"><a href="#">검색</a></span></td>
                        </tr>
                        </tbody>
                    </table>

                    <div class="clfix">
                        <div class="tbWrapLt">
                            <table class="bbsList">
                                <colgroup>
                                    <col width="30" />
                                    <col width="100" />
                                    <col width="100" />
                                    <col width="100" />
                                    <col width="100" />
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col">NO.</th>
                                    <th scope="col">상품명</th>
                                    <th scope="col">모델</th>
                                    <th scope="col">가격</th>
                                    <th scope="col">상태</th>

                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="i" items="${productList}" varStatus="cnt">
                                    <tr>
                                        <td>${cnt.count}</td>
                                        <td><img src="${pageContext.request.contextPath}/resources/upload/${i.fileName}" width="50" height="50"/></td>
                                        <td>${i.productName } </td>
                                        <td>${i.productPrice } </td>
                                        <td>
                                            <span class="buttonFuc"><a href="#" class="modify" lang="${i.no}">수정</a></span><span
                                                class="buttonFuc"><a href="#" class="delete" lang="${i.no}">삭제</a></span>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>

                        <div class="tbWrapRt">
                            <ul class="tabA clfix mgb15">
                                <li class="over"><a href="#info1">01. 상품등록</a></li>
                            </ul>
                            <form action="${pageContext.request.contextPath}/productInsert" name="frm" method="post"  enctype="multipart/form-data">
                                <div id="info1" class="tbWrapCnt" style="display: block;">
                                    <table class="bbsWrite mgb10">
                                        <caption></caption>
                                        <colgroup>
                                            <col width="95" />
                                            <col />
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th>상품명</th>
                                            <td>
                                                <input  type="text" name="no" value="0"/>
                                                <input type="text" name="state" id="state" value="inject"/>
                                                <input type="text" style="border:1px solid #ddd; height:20px;" name="productName" class="inputText"
                                                       size="50" /></td>
                                        </tr>
                                        <tr>
                                            <th>원산지</th>
                                            <td><input type="text" style="border:1px solid #ddd; height:20px;" name="productOrigin" class="inputText"
                                                       size="50" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>상품가격</th>
                                            <td><input type="text" style="border:1px solid #ddd; height:20px;" name="productPrice" class="inputText"
                                                       size="50" />
                                                <input type="hidden" name="id"  value="${id}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>카테고리</th>
                                            <td>
                                                <select style="width: 200px;" name="productCategory">
                                                    <option selected="selected">선택하세요</option>
                                                    <option value="cloth">의류/잡화</option>
                                                    <option value="electronic">전자제품</option>
                                                    <option value="furniture">가구</option>
                                                    <option value="cosmetic">화장품/향수</option>
                                                    <option value="foods">식품/주류</option>
                                                    <option value="car">차량용품</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>상품이미지1</th>
                                            <td class="alignM"><input type="file" name="file"

                                                                      class="inputText" size="10" /></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </form>
                        </div>

                        <p class="agr">
                            <span class="button"><a href="#" id="save">저장</a></span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--Footer-->

    <!--END Footer-->
</div>

</body>
</html>