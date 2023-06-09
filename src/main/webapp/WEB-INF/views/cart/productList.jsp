<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>


    $(function () {
        $('#search').click(function (){
            let selectqeury = $('#query').val();
            let selectvalue = $("input#data").val();
            if(selectqeury == '선택하세요' || selectvalue.length === 0){
                alert("검색할 데이터를 입력해 주세요")
                return false;
            }
            $('form#searchfrom').submit();
        })
    });
<!--  관리자페이지 구현 X  -->
    $(function () {
            let session_id = '${sessionScope.id}';
            if (session_id == '') {
                $("span#logout").hide();
                $("span#add").hide();
            } else {
                $("span#login").hide();
            }
        })
    </script>
        <title>관리자</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=10"/>
        <meta http-equiv="imagetoolbar" content="no"/>
        <!-- <link href="${pageContext.request.contextPath}/resources/css/contents.css" rel="stylesheet" type="text/css" /> -->
        <link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css"/>
        </head>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


<body>
<div id="wrap">
    <!-- header -->

    <!--// header -->
    <%--${sessionScope.id}--%>
    <div id="sub_container">
        <div id="contentsWrap" class="sub_con5">
            <div class="board_form">
                <div class="con_title">
                    <p>상품 등록/보기/수정</p>
                </div>

                <div class="contents">
                    <div class="btnSet clfix mgb15">
						<span class="fr">
                            <span class="button" id="logout"><a
                                    href="${pageContext.request.contextPath}/logout">로그아웃</a></span>
                            <span class="button" id="add"><a href="${pageContext.request.contextPath}/productAdd">등록</a></span>
                            <span class="button" id="login"><a
                                    href="${pageContext.request.contextPath}/login">로그인</a></span>
						</span>
                    </div>
                    <form id ="searchfrom" action="/search" method="post">
                        <table class="bbsWrite mgb35">
                            <caption></caption>
                            <colgroup>
                                <col width="95"/>
                                <col width="395"/>
                                <col width="95"/>
                                <col/>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th>업체명</th>
                                <td>
                                    <select style="width: 200px;">
                                        <option>선택하세요</option>
                                    </select>
                                </td>
                                <th>
                                    <select id="query" name="query">
                                        <option selected="selected">선택하세요</option>
                                        <option value="PRODUCTNAME">상품명</option>
                                        <option value="PRODUCTLOCATION">원산지</option>
                                        <option value="PRODUCTCATEGORY">카테고리</option>
                                    </select>
                                </th>

                                <td><input type="text" id="data" name="data" style="border:1px solid #ddd; height:20px;"
                                           class="inputText" size="30"/>
                                    <span class="button"><a id="search">검색</a></span>
                                    <span class="button"><a href="/productList">새로고침</a></span>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                    <table class="bbsList">
                        <colgroup>
                            <col width="50"/>
                            <col width="170"/>
                            <col width="170"/>
                            <col width="170"/>
                            <col width="170"/>
                            <col width="170"/>
                            <col width="200"/>
                            <col width="150"/>
                        </colgroup>
                        <thead>

                        <tr>
                            <th scope="col">NO.</th>
                            <th scope="col">상품명</th>
                            <th scope="col">이미지</th>
                            <th scope="col">원산지</th>
                            <th scope="col">가격</th>
                            <th scope="col">종류</th>
                            <th scope="col">날짜</th>
                            <th scope="col">판매자</th>

                        </tr>
                        </thead>

                        <tbody>

                        <tr>
                            <c:forEach var="i" items="${productList}" varStatus="cnt">
                        <tr>
                            <td>${cnt.count}</td>
                            <td>${i.productName}</td>
                            <td><a href="${pageContext.request.contextPath}/productInfo/${i.no}/${cnt.count}"><img
                                    src="${pageContext.request.contextPath}/resources/upload/${i.fileName}" width="50"
                                    height="50"/></a></td>
                            <td>${i.productOrigin}</td>
                            <td>${i.productPrice}</td>
                            <td>${i.productCategory}</td>
                            <td>${i.regdate}</td>
                            <td>${i.id}</td>
                        </tr>
                        </c:forEach>
                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!--Footer-->

    <!--END Footer-->
</div>
</body>
</html>