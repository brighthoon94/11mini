<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>

<head>
    <title>상품수정</title>
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    


    <!-- Bootstrap Dropdown Hover CSS -->
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>


    <!-- jQuery UI toolTip 사용 CSS-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery UI toolTip 사용 JS-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<!--  ///////////////////////// CSS ////////////////////////// -->	
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
    <script type="text/javascript">
        function fncUpdateProduct() {

            $("form").attr("method", "POST").attr("action", "/product/updateProduct").submit();
        }
        $(function() {
            $("button:contains('취소')").on("click", function() {
                $("form")[0].reset();
            });
        });

        $(function() {
            $("button:contains('수정')").on("click", function() {
                fncUpdateProduct();
            });
        });
        
        $( function() {
        	$('#datepicker').datepicker({
        		changeYear: true,
        		changeMonth: true,
        		dateFormat: 'yy-mm-dd'
        	});
          } );
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
   	
    <form name="form-horizontal" enctype="multipart/form-data">

        <input type="hidden" name="prodNo" value="${product.prodNo}">
        <input type="hidden" name="menu" value="${param.menu }">

	<div class="container">
	
		<div class="page-header">
		<h3 class="text-info">상품수정</h3>
		<h5 class="text-muted">상품을 수정합니다.</h5>
		</div>
	<div class="form-group">
    <label for="prodName">상품명</label>
    <input type="text"  class="form-control" name="prodName"  value="${product.prodName }"placeholder="${product.prodName }">
    <p class="help-block">*변경하실 상품명을 입력하세요</p>
  </div>
  <div class="form-group">
    <label for="prodDetail">상품상세정보</label>
    <input type="text" class="form-control" name="prodDetail" vlaue="${product.prodDetail}" placeholder="${product.prodDetail}">
    <p class="help-block">*변경하실 상세정보를 입력해주세요</p>
  </div>
    <div class="form-group">
    <label for="manuDate">제조일자</label>
    <input type="text" class="form-control" name="manuDate" id="datepicker" value="${product.manuDate}" placeholder="${product.manuDate}" autocomplete=off >
    <p class="help-block">*변경하실 제조일자를 지정해주세요</p>
  </div>
    <div class="form-group">
    <label for="price">가격</label>
    <input type="text" class="form-control" name="price" value="${product.price }" placeholder="${product.price }">
    <p class="help-block">*변경하실 가격을 입력해주세요</p>
  </div>
  <div class="form-group">
    <label for="fileData">File input</label>
    <input type="file" id="fileData" name="fileData">
    <p class="help-block">*제품명과 동일하고 선명한 사진을 업로드 해주세요.</p>
  </div>
   <button type="submit" class="btn btn-primary" id="btn01">수정</button>

	<button type="button" class="btn btn-default" id="btn02">취소</button>
  </div>
	
	</form>
</body>

</html>