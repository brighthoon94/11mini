<%@ page contentType="text/html; charset=euc-kr" %>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <title>��ǰ����ȸ</title>

    <link rel="stylesheet" href="/css/admin.css" type="text/css">
    <!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
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
            $("#btn02:contains('����')").on("click", function() {
                //Debug..
                //alert(  $( "#btn02:contains('����')" ).html() );
                self.location = "javascript:history.go(-1)"
            });

            $("#btn01:contains('����')").on("click", function() {
                //Debug..
                //alert(  $( "#btn01:contains('����')" ).html() );
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
		<h3 class="text-info">��ǰ����ȸ</h3>
		<h5 class="text-muted">��ǰ�� ������ �Դϴ�. ��ſ� ����!</h5>
		</div>

		
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodNo }</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�� ǰ ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
	</div>
		
		<hr/>
		
	<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
	</div>
		
		<hr/>
		
	<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�� ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}	</div>
	</div>

	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ�̹���</strong></div>
			<div class="col-xs-8 col-md-4"><img src="/images/uploadFiles/${product.fileName}"  /></div>
	</div>
	
	<hr/>
	
	<div class="row text-right">
		<div class="col-xs-10 col-md-9">
  			<c:if test="${param.menu == 'search' && user.role == 'user' && product.proTranCode == '0'}">
  			<button type="button" class="btn btn-primary" id="btn01">����</button>
  			</c:if>
  			<button type="button" class="btn btn-primary" id="btn02">����</button>
		</div>
	</div>
</div>
</body>

</html>