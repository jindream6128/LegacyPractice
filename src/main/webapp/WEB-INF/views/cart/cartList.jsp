<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html >
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function () {
		$('#search').click(function (){
			let searchvalue = $('input#searchdata')
			if(searchvalue.length === 0){
				alert("검색할 데이터를 입력해 주세요")
				return false;
			}
			$('form#cartListSearch').submit();
		})
	});

	$(function(){
		$('input#checkBox_all').click(selectCheckAll);
		$('input[name=productcheckbox]').click(calculatePrice);
	})


	function selectCheckAll(){
		if($('input#checkBox_all').is(':checked')){
			$('input[name=productcheckbox]').prop('checked',true);
		}else{
			$('input[name=productcheckbox]').prop('checked',false);
		}

		calculatePrice();
	}

	//계산하기.. 총합..
	function calculatePrice(){
		//checkselectCheckAll();
		let sum =0
		//뿌리는 전체 리스트의 사이즈
		let listsize = ${listsize};
		//console.log(listsize)
		let totalprice = 0;

		for(let i =1; i <= listsize; i++) {
			//체크박스 아이디임
			let tmp = '#'+i;
			let price = '#'+i+'productprice';
			let productcnt = 'span#product' + i;
			if($(tmp).is(':checked')){
				//console.log($(price).text());
				sum += Number($(price).text()) * Number($(productcnt).text());
			}
		}
		$('input#total').val(sum);
	}

	// minus button 클릭
	$(function (){
		$("button[name=btnminus]").click(function(){
				$.ajax({
					url:'/cart/productminus',
					type:"get",
					data:{
						"id":"${sessionScope.id}",
						"productno": this.id,
					},
					success:function (data){
						if(data.trim() == "fail"){
							alert("최소 갯수 입니다.")
						}else {
							location.reload();
						}
					},
					error:function (){
						alert("ajaxError");
					}
				})

		})
	})


	// plus button 클릭
	$(function (){
		$("button[name=btnplus]").click(function(){
			$.ajax({
				url:'/cart/productplus',
				type:"get",
				data:{
					"id":"${sessionScope.id}",
					"productno": this.id,
				},
				success:function (data){
					location.reload();
				},
				error:function (){
					alert("ajaxError");
				}
			})

		})
	})

</script>
<head>

	<title>관리자</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=10" />
	<meta http-equiv="imagetoolbar" content="no" />
	<!-- <link href="../css/contents.css" rel="stylesheet" type="text/css" /> -->
	<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/resources/css/button.css" rel="stylesheet" type="text/css" />





</head>
<body>
<div id="wrap">
	<!-- header -->

	<!--// header -->

	<div id="sub_container">
		<div id="contentsWrap" class="sub_con5">
			<div class="board_form">
				<div class="con_title">
					<p>장바구니 리스트</p>
				</div>
				<div class="contents">

					<div class="btnSet clfix mgb15">
						<span class="fr"> <span class="button"><a href="/productList">목록</a></span>
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
							<td>
								<select style="border:1px solid #ddd; height:20px; width:200px;">
									<option>선택하세요</option>
								</select>
							</td>
							<th>상품명</th>
							<form id="cartListSearch" action="/cartListSearch" method="post">
							<td>
								<input type="text" name="cartlistquery" id="searchdata" size="30" style="border:1px solid #ddd; height:20px;"/>
								<span class="button">
									<a id="search" >검색</a>
								</span>
							</td>
								<td>
									<span class="button"><a href="/gocartList">새로고침</a> </span>
								</td>
							</form>
						</tr>
						</tbody>
					</table>
					<table class="bbsList">
						<colgroup>
							<col width="50"/>
							<col width="50" />
							<col width="170" />
							<col width="170" />
							<col width="150" />
							<col width="170" />
							<col width="170" />
							<col width="200" />
							<col width="100" />
							<col width="150" />
						</colgroup>
						<thead>

						<tr>
							<th scope="col"><input id ="checkBox_all" type="checkbox" /></th>
							<th scope="col">NO.</th>
							<th scope="col">상품명</th>
							<th scope="col">이미지</th>
							<th scope="col">원산지</th>
							<th scope="col">가격</th>
							<th scope="col">종류</th>
							<th scope="col">날짜</th>
							<th scope="col">갯수</th>
							<th scope="col">상태</th>
						</tr>
						</thead>


						<tbody>
						<!--여기 foreach 넣어야 하나?-->
						<c:forEach var="i" items="${list}" varStatus="cnt">

							<%--체크하면 프로덕트 no가 선택이 된다--%>
							<td><input type="checkbox" value="${i.no}" name="productcheckbox" id="${cnt.count}"/></td>
							<td>${cnt.count}</td>
							<td>${i.productName}</td>
							<td>
								<a href="${pageContext.request.contextPath}/productInfo/${i.no}/${cnt.count}"><img src="${pageContext.request.contextPath}/resources/upload/${i.fileName}" width="50" height="50"/></a></td>
							<td>${i.productOrigin}</td>
							<td id="${cnt.count}productprice">${i.productPrice}</td>
							<td>${i.productCategory}</td>
							<td>${i.regdate}</td>

							<td id="product${cnt.count}">
								<button type="button" name="btnminus" class="minus" id="${i.no}">-</button>
								<span id = "product${cnt.count}">${i.productcount}</span>
								<button type="button" name="btnplus" class="plus" id="${i.no}">+</button>
							</td>

							<td>
								<span class="buttonFuc"><a href="#">구매</a></span>
								<span class="buttonFuc">
									<a href="${pageContext.request.contextPath}/cartdelete/${i.no}/${sessionScope.id}">삭제</a></span>
							</td>
							</tr>
						</c:forEach>

						</tbody>

					</table>
					<table class="bbsList" align="right">
						<tr align="right">
							<th align="right">총합계 &nbsp; <input type="text" name="total" id="total" class="inputText" size="30"  align="right" /></th>
						</tr>
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