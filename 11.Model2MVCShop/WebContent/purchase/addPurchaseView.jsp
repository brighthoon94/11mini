<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<script type="text/javascript">


function fncAddPurchase() {
	//Form 유효성 검증
	var name = $("input[name='receiverName']").val();
	var phone = $("input[name='receiverPhone']").val();
	var divyAddr = $("input[name='divyAddr']").val();
	var divyDate = $("input[name='divyDate']").val();

	if(name == null || name.length<1){
		alert("구매자 이름은 반드시 입력하여야 합니다.");
		return;
	}
	if(phone == null || phone.length<1){
		alert("구매자연락처는 반드시 입력하여야 합니다.");
		return;
	}
	if(divyAddr == null || divyAddr.length<1){
		alert("구매자주소는 반드시 입력하셔야 합니다.");
		return;
	}
	if(divyDate == null || divyDate.length<1){
		alert("배송희망날짜는 반드시 입력하셔야 합니다.");
		return;
	}
	
	$("form").attr("method", "POST").attr("action","/purchase/addPurchase").submit();
}

$(function() {
	 $( "#btn01:contains('구매')" ).on("click" , function() {
		fncAddPurchase();
	});
});	

$(function() {
	 $( "#btn02:contains('취소')" ).on("click" , function() {
		 	history.go(-1);
	});
});	

$( function() {
	$('#datepicker').datepicker({
		changeYear: true,
		changeMonth: true,
		dateFormat: 'yy/mm/dd'
	});
  } );
</script>
</head>

<body>

<form name="addPurchase">

	<div class="navbar  navbar-inverse">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	
   	<div class="container">
	
	<h3 class="bg-inverse text-left">상품구입</h3>
	<br/>
	<form name="form-horizontal" enctype="multipart/form-data">
	<br/>
	<div class="form-group">
    <label for="prodName">상품번호</label>
    <input type="text" class="form-control" name="purchaseProd.prodNo" value="${product.prodNo}" placeholder="${product.prodNo}" readonly>
  </div>
	<div class="form-group">
    <label for="prodName">상품명</label>
     <input type="text" class="form-control" name="prodName" placeholder="${product.prodName}" readonly>
  </div>
  <div class="form-group">
    <label for="prodDetail">상품상세정보</label>
    <input type="text" class="form-control" name="prodDetail" placeholder="${product.prodDetail }" readonly>
  </div>
    <div class="form-group">
    <label for="manuDate">제조일자</label>
    <input type="text" class="form-control" name="manuDate" placeholder="${product.manuDate }" readonly>
  </div>
    <div class="form-group">
    <label for="price">가격</label>
    <input type="text" class="form-control" name="price" placeholder="${product.price }" readonly>
  </div>
	<div class="form-group">
    <label for="userId">구매자 ID</label>
    <input type="text" class="form-control" name="userId" placeholder="${user.userId}" readonly>
    <input type="hidden" name="buyer.userId" value = "${user.userId}"/>
  </div>
  <div class="form-group">
    <label for="paymentOption">구매방법</label>
    <select 	name="paymentOption" class="form-control">
				<option value="1" selected="selected">현금구매</option>
				<option value="2">신용구매</option>
			</select>
  </div>
  <div class="form-group">
    <label for="receiverName">구매자이름</label>
    <input type="text" class="form-control" name="receiverName" placeholder="${user.userName}" value="${user.userName}">
  </div>
  <div class="form-group">
    <label for="receiverPhone">구매자연락처</label>
    <input type="text" class="form-control" name="receiverPhone" placeholder="${user.phone}" value="${user.phone}">
  </div>
  <div class="form-group">
    <label for="divyAddr">구매자주소</label>
    <input type="text" class="form-control" name="divyAddr" placeholder="${user.addr}" value="${user.addr}">
  </div>
  <div class="form-group">
    <label for="divyRequest">배송시요청사항</label>
    <input type="text" class="form-control" name="divyRequest">
  </div>
   <div class="form-group">
    <label for="divyDate">배송희망일자</label>
    <input type="text" class="form-control" name="divyDate" id="datepicker" placeholder="배송희망일자를 선택하세요." autocomplete=off>
  </div>
   <button type="submit" class="btn btn-primary" id="btn01">구매</button>

	<button type="button" class="btn btn-default" id="btn02">취소</button>
  </div>
	
	</form>
</body>
</html>