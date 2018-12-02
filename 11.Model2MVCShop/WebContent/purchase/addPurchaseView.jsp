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
	//Form ��ȿ�� ����
	var name = $("input[name='receiverName']").val();
	var phone = $("input[name='receiverPhone']").val();
	var divyAddr = $("input[name='divyAddr']").val();
	var divyDate = $("input[name='divyDate']").val();

	if(name == null || name.length<1){
		alert("������ �̸��� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(phone == null || phone.length<1){
		alert("�����ڿ���ó�� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(divyAddr == null || divyAddr.length<1){
		alert("�������ּҴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(divyDate == null || divyDate.length<1){
		alert("��������¥�� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	
	$("form").attr("method", "POST").attr("action","/purchase/addPurchase").submit();
}

$(function() {
	 $( "#btn01:contains('����')" ).on("click" , function() {
		fncAddPurchase();
	});
});	

$(function() {
	 $( "#btn02:contains('���')" ).on("click" , function() {
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
	
	<h3 class="bg-inverse text-left">��ǰ����</h3>
	<br/>
	<form name="form-horizontal" enctype="multipart/form-data">
	<br/>
	<div class="form-group">
    <label for="prodName">��ǰ��ȣ</label>
    <input type="text" class="form-control" name="purchaseProd.prodNo" value="${product.prodNo}" placeholder="${product.prodNo}" readonly>
  </div>
	<div class="form-group">
    <label for="prodName">��ǰ��</label>
     <input type="text" class="form-control" name="prodName" placeholder="${product.prodName}" readonly>
  </div>
  <div class="form-group">
    <label for="prodDetail">��ǰ������</label>
    <input type="text" class="form-control" name="prodDetail" placeholder="${product.prodDetail }" readonly>
  </div>
    <div class="form-group">
    <label for="manuDate">��������</label>
    <input type="text" class="form-control" name="manuDate" placeholder="${product.manuDate }" readonly>
  </div>
    <div class="form-group">
    <label for="price">����</label>
    <input type="text" class="form-control" name="price" placeholder="${product.price }" readonly>
  </div>
	<div class="form-group">
    <label for="userId">������ ID</label>
    <input type="text" class="form-control" name="userId" placeholder="${user.userId}" readonly>
    <input type="hidden" name="buyer.userId" value = "${user.userId}"/>
  </div>
  <div class="form-group">
    <label for="paymentOption">���Ź��</label>
    <select 	name="paymentOption" class="form-control">
				<option value="1" selected="selected">���ݱ���</option>
				<option value="2">�ſ뱸��</option>
			</select>
  </div>
  <div class="form-group">
    <label for="receiverName">�������̸�</label>
    <input type="text" class="form-control" name="receiverName" placeholder="${user.userName}" value="${user.userName}">
  </div>
  <div class="form-group">
    <label for="receiverPhone">�����ڿ���ó</label>
    <input type="text" class="form-control" name="receiverPhone" placeholder="${user.phone}" value="${user.phone}">
  </div>
  <div class="form-group">
    <label for="divyAddr">�������ּ�</label>
    <input type="text" class="form-control" name="divyAddr" placeholder="${user.addr}" value="${user.addr}">
  </div>
  <div class="form-group">
    <label for="divyRequest">��۽ÿ�û����</label>
    <input type="text" class="form-control" name="divyRequest">
  </div>
   <div class="form-group">
    <label for="divyDate">����������</label>
    <input type="text" class="form-control" name="divyDate" id="datepicker" placeholder="���������ڸ� �����ϼ���." autocomplete=off>
  </div>
   <button type="submit" class="btn btn-primary" id="btn01">����</button>

	<button type="button" class="btn btn-default" id="btn02">���</button>
  </div>
	
	</form>
</body>
</html>