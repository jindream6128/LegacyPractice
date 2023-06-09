<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
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
  <div id="sub_container">
    <div id="contentsWrap" class="sub_con5">
      <div class="board_form">
        <div class="con_title">
          <p>게시판 상세보기</p>
        </div>
        <div class="contents">
          <div class="btnSet clfix mgb15">
                  <span class="fr">
                            <span class="button"><a href="#">물품구매</a></span>
                     <span class="button"> <a href="#">장바구니</a></span>
                     <span class="button"><a href="#">목록</a></span>
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
              <td>${product.id}</td>
            </tr>
            <tr>
              <td class="fir" rowspan="7"><img
                      src="${pageContext.request.contextPath}/resources/upload/${product.imgUrl}"
                      width="400" height="300"/></td>
              <th scope="col">아이디</th>
              <td>${product.userId}</td>
            </tr>
            <tr>
              <th scope="col">상품이름</th>
              <td>${product.name}</td>
            </tr>
            <tr>
              <th scope="col">가격</th>
              <td>${product.price}</td>
            </tr>
            <tr>
              <th scope="col">상품설명</th>
              <td>${product.description}</td>
            </tr>
            <tr>
              <th scope="col">카테고리</th>
              <td>${product.category}</td>
            </tr>
          </table>

        </div>
      </div>
    </div>
  </div>


  <div class="board_form">
    <div class="board_writer03">
      <ul>
        <li><textarea rows="" cols=""></textarea>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button"
                                                                                            value="등록"
                                                                                            onclick="location.href='.jsp'"/>
        </li>
      </ul>
    </div>
    <div id="comment_loc">
    </div>

    <div class="board_writer03" style="display: none;">
      <ul>
        <li><textarea rows="" cols=""></textarea>&nbsp;&nbsp;<input type="button" value="등록"
                                                                    onclick="location.href='.jsp'"/></li>
      </ul>
    </div>
  </div>
</div>

<!--Footer-->

<!--END Footer-->
</div>


<script type="text/javascript">
  window.onload = function onLoadFunction() {

    const list = JSON.parse('${commentList}');

    console.log(list[0]);
    const visited = new Array(list.length).fill(false);

    for(let i=0; i<list.length; i++) {
      if(list[i].parents==0) {
        recur(0, i,list,visited);
      }
    }

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
    strongTag.innerText = comment.userEmail
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

    var aTag = document.createElement("a");
    aTag.innerHTML = "답글"
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
    drawing(depth*20, curComment);

    for(let i=0; i <list.length; i++) {
      if(!visited[i] && list[i].parents == curComment.id) {
        recur(depth+1, i, list, visited);
      }
    }
  }



</script>

</body>

</html>





