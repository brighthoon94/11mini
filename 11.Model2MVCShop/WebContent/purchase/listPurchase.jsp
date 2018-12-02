<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	function fncGetPageList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
	};
	
	 $(function() {
		$( "#delivery" ).on("click" , function() {
			//alert( "�ٲٷ�����.");
			var prodNo=$(this).data("param");
			//alert(prodNo);
			self.location = "/purchase/updateTranCode?prodNo="+prodNo+"&tranCode=3"
		});
		
	$( "tr td:nth-child(1)" ).on("click" , function() {
		var tranNo=$(this).data("param1");
		//alert(tranNo);
		self.location = "/purchase/getPurchase?tranNo="+tranNo
		});
	 });
	
</script>
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	
<div class="container">

	<div class="page-header text-info">
		<h3>���Ÿ����ȸ</h3>
		<h5 class="text-muted">��ǰ��ȣ�� Ŭ���Ͽ� Ȯ�ι� ������ �����մϴ�.</h5>
	</div>
	
	<div class="row">
	
		<div class="col-md-6 text-left">
			   <p class="text-primary">
			    	��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
			   </p>
		</div>
	</div>
	
	<table class="table table-hover table-striped" >
	
	<thead>
		<tr>
			<th align="center">��ǰ��ȣ</th>
			<th align="left" >������ID</th>
			<th align="left" >ȸ����</th>
			<th align="left" >��ȭ��ȣ</th>
			<th align="left" >�����Ȳ</th>
			<th align="left" >��������</th>
		</tr>
	</thead>
	
	<tbody>
	
	<c:set var="i" value="0" />
		<c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
				<tr>
				<td align="center" id="buy" data-param1="${purchase.tranNo}">${purchase.tranNo}</td>
				<td align="left">${purchase.buyer.userId}</td>
				<td align="left">${purchase.receiverName}</td>
				<td align="left">${purchase.receiverPhone}</td>
				 <td align="left">
				<c:if test = "${purchase.tranCode.trim() == '1' }">
		 		���� ���ſϷ� ���� �Դϴ�.
		 		</c:if>
		 		<c:if test = "${purchase.tranCode.trim() == '2' }">
		 		���� ����� ���� �Դϴ�.
		 		</c:if>
		 		<c:if test = "${purchase.tranCode.trim() == '3' }">
		 		���� ��ۿϷ� ���� �Դϴ�.
		 		</c:if>
				<c:if test = "${purchase.tranCode.trim() == '2' }">
				<td align="left" id="delivery" data-param="${purchase.purchaseProd.prodNo}">���ǵ���</td>
				</c:if> 
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>
    <!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->

</body>
</html>