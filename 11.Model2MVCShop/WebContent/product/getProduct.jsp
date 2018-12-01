<%@ page contentType="text/html; charset=euc-kr" %>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <title>상품상세조회</title>

    <link rel="stylesheet" href="/css/admin.css" type="text/css">
    <!-- CDN(Content Delivery Network) 호스트 사용 -->
 	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
    <script type="text/javascript">
        $(function() {
        	console.log("${param.menu == 'search' }")
        	console.log("${  product.proTranCode}")
        	console.log("${user.role}")
            $("#btn02:contains('이전')").on("click", function() {
                //Debug..
                //alert(  $( "#btn02:contains('이전')" ).html() );
                self.location = "javascript:history.go(-1)"
            });

            $("#btn01:contains('구매')").on("click", function() {
                //Debug..
                //alert(  $( "#btn01:contains('구매')" ).html() );
                self.location = "/purchase/addPurchaseView?prod_no=${param.prodNo}"
            });
        });
    </script>


</head>

<body>
<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-inverse">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<div class="container">
	
		<div class="page-header">
		<h3 class="text-info">상품상세조회</h3>
		<h5 class="text-muted">상품의 상세정보 입니다. 즐거운 쇼핑!</h5>
		</div>

		
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodNo }</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상 품 명</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
	</div>
		
		<hr/>
		
	<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
	</div>
		
		<hr/>
		
	<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>가 격</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}	</div>
	</div>

	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품이미지</strong></div>
			<div class="col-xs-8 col-md-4"><img src="/images/uploadFiles/${product.fileName}"  /></div>
	</div>
	
	<hr/>
	
	<div class="row text-right">
		<div class="col-xs-10 col-md-9">
  			<c:if test="${param.menu == 'search' && user.role == 'user' && product.proTranCode == '0'}">
  			<button type="button" class="btn btn-primary" id="btn01">구매</button>
  			</c:if>
  			<button type="button" class="btn btn-primary" id="btn02">이전</button>
		</div>
	</div>
</div>
</body>

</html>