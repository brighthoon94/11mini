
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
        $(function() {
            $("#btn01:contains('확인')").on("click", function() {
                //Debug..
                //alert(  $( "td.ct_btn01:contains('확인')" ).html() );
                self.location = "/product/listProduct?menu=manage"
            });

            $("#btn02:contains('추가등록')").on("click", function() {
                self.location = "../product/addProductView.jsp;"
            });
        });
    </script>
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">판매상품등록정보</h3>
	       <h5 class="text-muted">등록된 상품정보는 다음과 같습니다.</h5>
	    </div>
	
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
			<div class="col-xs-8 col-md-4"><img src="/images/uploadFiles/${product.fileName}" /></div>
		</div>
		
		<hr/>
		</div>
		<hr/>
  		<div class="row text-right">
  			<div class="col-xs-10 col-md-9">
  			<button type="button" class="btn btn-primary" id="btn01">확인</button>
  			<button type="button" class="btn btn-primary" id="btn02">추가등록</button>
			</div>
		</div>
 
</body>
</html>