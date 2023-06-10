<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
    $(function () {
        $('span#deleteButton').click(function () {
            var sessionid = '${sessionScope.id}';
            var listid = '${list.id}';
            console.log(sessionid)
            console.log(listid)

            var question = confirm("정말 글을 삭제하시겠습니까?");

            if (sessionid !== listid) {
                alert("작성자가 아닙니다.");
                return false;
            } else {
                if (question) {
                    location.href = "/delete/${list.no}";
                } else {
                    return false;
                }
            }
        })
    });

    $(function () {
        $('#submitcomment').click(function () {
            $('#commentdata').submit();
        })
    })

</script>
<!-- 관리자페이지 구현 X  -->

<head>
    <title>관리자</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=10"/>
    <meta http-equiv="imagetoolbar" content="no"/>

    <link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/reply.css" rel="stylesheet" type="text/css"/>
</head>
<body>

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
							<span class="button"> <a
                                    href="${pageContext.request.contextPath}/basket/${list.no}/${sessionScope.id}">장바구니</a></span>
							<span class="button"><a href="/productList">목록</a></span>
						</span>
                    </div>
                    <table class="bbsList">
                        <colgroup>
                            <col width="400"/>
                            <col width="100"/>
                            <col width=""/>
                        </colgroup>
                        <tr>
                            <th scope="col" class="fir">이미지</th>
                            <th scope="col">글번호</th>
                            <td>${cnt_no}</td>
                        </tr>
                        <tr>

                            <td class="fir" rowspan="7"><img
                                    src="${pageContext.request.contextPath}/resources/upload/${list.fileName}"
                                    width="400" height="300"/></td>
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
            <form id="commentdata" action="/comment/insertcomment" method="post">
                <ul>
                    <li>
                        <input type="hidden" name="cnt_no" value="${cnt_no}"/>
                        <input type="hidden" name="BOARD_NO" value="${list.no}"/> <%--게시글 번호--%>
                        <input type="hidden" name="USER_ID" value="${list.id}"/> <%-- 작성자 --%>
                        <textarea name="CONTENTS" rows="" cols=""></textarea>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%--여기에 댓글 데이터 입력--%>
                        <input type="button" id="submitcomment" value="등록"/>
                    </li>
                    <%--이거 누르면 데이터 전송--%>
                </ul>
            </form>
        </div>

        <div id="comment_loc">

            <script type="text/javascript">
                function dynamicReply(container, comment) {

// form 요소 생성
                    var form = document.createElement('form');
                    form.setAttribute('method', 'POST'); // form의 메소드를 POST로 설정
                    form.setAttribute('action', '/comment/addinsert'); // 액션을 "/comment"로 설정
                    // hidden input 요소 생성 (productId)
                    var productIdInput = document.createElement('input');
                    productIdInput.setAttribute('type', 'hidden');
                    productIdInput.setAttribute('name', 'session_USER_ID');
                    productIdInput.setAttribute('value', '${sessionScope.id}');

                    // hidden input 요소 생성 (productId)
                    var productIdInput = document.createElement('input');
                    productIdInput.setAttribute('type', 'hidden');
                    productIdInput.setAttribute('name', 'BOARD_NO');
                    productIdInput.setAttribute('value', comment.board_NO);

                    // hidden input 요소 생성 (parents)
                    var parentsInput = document.createElement('input');
                    parentsInput.setAttribute('type', 'hidden');
                    parentsInput.setAttribute('name', 'PARENT_NO');
                    parentsInput.setAttribute('value', comment.no);

                    // input 요소 생성
                    var input = document.createElement('input');
                    input.setAttribute('type', 'text');
                    input.setAttribute('name', 'CONTENTS');
                    input.style.width = '800px'; // Set the width to 200 pixels
                    input.style.height = '50px';
                    // submit 버튼 생성
                    var submit = document.createElement('input');
                    submit.setAttribute('type', 'submit');
                    submit.setAttribute('value', '등록');

                    // form에 input과 submit 버튼 추가
                    form.appendChild(input);
                    form.appendChild(submit);
                    form.appendChild(productIdInput);
                    form.appendChild(parentsInput);

                    container.appendChild(form);
                }


                $.ajax({
                    url: '/comment/selectallcomment',
                    data: {"board_no":${list.no}},
                    type: 'POST',
                    dataType: "json",
                    success: function (list) {
                        console.log(list); //여기서 data 는 json이다.
                        console.log(list.length)
                        const visited = new Array(list.length).fill(false);

                        for (let i = 0; i < list.length; i++) {
                            if (list[i].parent_NO == 0) {
                                recur(0, i, list, visited)
                            }
                        }

                    },
                    error: function () {
                        alert("error");
                    }
                })

                const deptinput = function () {
                    alert();
                }


                const drawing = function (margin, comment) {
                    console.log(comment);

                    const target = document.getElementById("comment_loc");

                    // Create the main container element
                    var container = document.createElement("div");
                    container.className = "contents";
                    container.style.marginLeft = margin + "px";

// Create the letter_top div
                    var letterTopDiv = document.createElement("div");
                    letterTopDiv.className = "letter_top";

// Create the ul element inside letter_top
                    var ulLetterTop = document.createElement("ul");

// Create and append the li elements to ulLetterTop
                    var liAuthor = document.createElement("li");
                    liAuthor.className = "letter_f";
                    var strongTag = document.createElement("strong");
                    strongTag.innerText = comment.user_ID
                    liAuthor.appendChild(strongTag);

                    ulLetterTop.appendChild(liAuthor);

// Create the li element for the separator
                    var liSeparator1 = document.createElement("li");
                    var spanSeparator1 = document.createElement("span");
                    spanSeparator1.innerText = "|";
                    liSeparator1.appendChild(spanSeparator1);
// Append liSeparator1 to ulLetterTop
                    ulLetterTop.appendChild(liSeparator1);

                    var liReply = document.createElement("li");
                    liReply.className = "letter_f02";

                    var formFlag = false;
                    var aTag = document.createElement("a");
                    aTag.innerHTML = "답글"
                    aTag.onclick = function () {
                        if (!formFlag) {
                            formFlag = true;
                            dynamicReply(container, comment);
                        }
                    };
                    liReply.appendChild(aTag);
                    ulLetterTop.appendChild(liReply);

                    var liContent = document.createElement("li");
                    liContent.className = "letter_cl";
                    liContent.innerText = comment.contents;
                    ulLetterTop.appendChild(liContent);

// Append ulLetterTop to letterTopDiv
                    letterTopDiv.appendChild(ulLetterTop);

// Create the ul element for letter_r
                    var ulLetterR = document.createElement("ul");
                    ulLetterR.className = "letter_r";

// Create the li element for 수정
                    var liEdit = document.createElement("li");
                    var spanEdit = document.createElement("span");
                    spanEdit.innerText = "수정";
                    liEdit.appendChild(spanEdit);

// Append liEdit to ulLetterR
                    ulLetterR.appendChild(liEdit);

// Create the li element for the separator
                    var liSeparator2 = document.createElement("li");
                    var spanSeparator2 = document.createElement("span");
                    spanSeparator2.innerText = "|";
                    liSeparator2.appendChild(spanSeparator2);

// Append liSeparator2 to ulLetterR
                    ulLetterR.appendChild(liSeparator2);

// Create the li element for 삭제
                    var liDelete = document.createElement("li");
                    var spanDelete = document.createElement("span");
                    spanDelete.innerText = "삭제";

                    spanDelete.addEventListener("click", function () {
                        var locationhref = "/comment/commentdelete/" + comment.no;

                        var xhr = new XMLHttpRequest();

                        xhr.open("DELETE", locationhref);
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState === 4) {
                                if (xhr.status === 200) {
                                    console.log(xhr.responseText);

                                    alert("댓글이 삭제되었습니다")
                                } else {
                                    console.error("댓글 삭제 싪패: " + xhr.status);
                                }
                            }
                        };
                        xhr.send();
                        location.reload();
                    });


                    liDelete.appendChild(spanDelete);

// Append liDelete to ulLetterR
                    ulLetterR.appendChild(liDelete);

// Append ulLetterR to letterTopDiv
                    letterTopDiv.appendChild(ulLetterR);

// Append letterTopDiv to the main container
                    container.appendChild(letterTopDiv);

// Create the letter_bottom div
                    var letterBottomDiv = document.createElement("div");
                    letterBottomDiv.className = "letter_bottom";

// Create the ul element inside letter_bottom
                    var ulLetterBottom = document.createElement("ul");

// Create and append an empty li element to ulLetterBottom
                    var liEmpty = document.createElement("li");
                    ulLetterBottom.appendChild(liEmpty);

// Append ulLetterBottom to letterBottomDiv
                    letterBottomDiv.appendChild(ulLetterBottom);

// Append letterBottomDiv to the main container
                    container.appendChild(letterBottomDiv);

// Append the main container to the document body
                    target.appendChild(container);
                }


                const recur = function (depth, curIdx, list, visited) {

                    const curComment = list[curIdx];
                    visited[curIdx] = true;
                    drawing(depth * 20, curComment);

                    for (let i = 0; i < list.length; i++) {
                        if (!visited[i] && list[i].parent_NO == curComment.no) {
                            recur(depth + 1, i, list, visited);
                        }
                    }

                }
            </script>

            <%--여기는 뿌리는 영역임--%>


        </div>
    </div>

    <!--Footer-->

    <!--END Footer-->
</div>
</body>

</html>






