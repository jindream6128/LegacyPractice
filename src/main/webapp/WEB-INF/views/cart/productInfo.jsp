<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
    $(function () {
        $('span#deleteButton').click(function (){
            var sessionid = '${sessionScope.id}';
            var listid = '${list.id}';
            console.log(sessionid)
            console.log(listid)

            var question = confirm("정말 글을 삭제하시겠습니까?");

            if(sessionid !== listid){
                alert("작성자가 아닙니다.");
                return false;
            }else {
                if (question) {
                    location.href = "/delete/${list.no}";
                } else {
                    return false;
                }
            }
        })
    });
    <!--  관리자페이지 구현 X  -->
</script>
<head>
    <title>관리자</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=10" />
    <meta http-equiv="imagetoolbar" content="no" />

    <link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/reply.css" rel="stylesheet" type="text/css" />
</head>
<body >

<div id="wrap">
    <!-- header -->

    <!--// header -->

    <div id="sub_container">
        <div id="contentsWrap" class="sub_con5">
            <div class="board_form">
                <div class="con_title">
                    <p>게시판 상세보기</p>
                </div>
                <div class="contents">
                    <div class="btnSet clfix mgb15">
						<span class="fr">
                            <span class="button" id="deleteButton"><a> 제품 삭제 </a></span>
                            <span class="button"><a href="#">물품구매</a></span>
							<span class="button"> <a href="${pageContext.request.contextPath}/basket/${list.no}/${sessionScope.id}">장바구니</a></span>
							<span class="button"><a href="/productList">목록</a></span>
						</span>
                    </div>
                    <table class="bbsList">
                        <colgroup>
                            <col width="400" />
                            <col width="100" />
                            <col width="" />
                        </colgroup>
                        <tr>
                            <th scope="col" class="fir">이미지</th>
                            <th scope="col">글번호</th>
                            <td>${cnt_no}</td>
                        </tr>
                        <tr>

                            <td class="fir" rowspan="7"><img src = "${pageContext.request.contextPath}/resources/upload/${list.fileName}" width="400" height="300"/></td>
                            <th scope="col">아이디</th>
                            <td>${list.id}</td>
                        </tr>
                        <tr>
                            <th scope="col">상품이름</th>
                            <td>${list.productName}</td>
                        </tr>
                        <tr>
                            <th scope="col">가격</th>
                            <td>${list.productPrice}</td>
                        </tr>
                        <tr>
                            <th scope="col">원산지</th>
                            <td>${list.productOrigin}</td>
                        </tr>
                        <tr>
                            <th scope="col">카테고리</th>
                            <td>${list.productCategory}</td>
                        </tr>
                        <tr>
                            <th scope="col">등록일</th>
                            <td>${list.regdate}</td>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
    </div>
    <div class="board_form">
        <div class="board_writer03">
            <ul>
                <li><textarea rows="" cols="" ></textarea>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%--여기에 댓글 데이터 입력--%>
                    <input type="button" value="등록" onclick="location.href='.jsp'"/></li> <%--이거 누르면 데이터 전송--%>
            </ul>
        </div>
        <%--여기는 뿌리는 영역임--%>
        <div class="contents">
            <div class="letter_top">
                <ul>
                    <li class="letter_f"><strong>작성자</strong> </li><%--여기에 작성자 와야함--%>
                    <li><span>|</span></li>
                    <li class="letter_f02"><img alt="" src="${pageContext.request.contextPath}/resources/img/re.jpg" style="width:10px;height:10px;">&nbsp;답글</li> <%--여기서 이거누르면 답글--%>
                    <li class="letter_cl">내용이들어갑니다.</li><%--내용--%>
                </ul>

                <!-- 내가 작성한 부분만 수정 삭제 가능 -->
                <ul class="letter_r">
                    <li><span>수정 </span></li>
                    <li><span>|</span></li>
                    <li><span>삭제</span></li>
                </ul>
            </div>
            <div class="letter_bottom">
                <ul>
                    <li></li>
                </ul>
            </div>
        </div>

        <div class="board_writer03" style="display: none;">
            <ul>
                <li ><textarea rows="" cols="" ></textarea>&nbsp;&nbsp;<input type="button" value="등록" onclick="location.href='.jsp'"/></li>
            </ul>
        </div>
    </div>
</div>

<!--Footer-->

<!--END Footer-->
</div>
</body>

</html>






