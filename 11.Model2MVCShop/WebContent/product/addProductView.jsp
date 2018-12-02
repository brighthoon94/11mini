<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html lang="ko">
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
function fncAddProduct(){
	//Form 유효성 검증
 	var name = $("input[name='prodName']").val();
	var detail = $("input[name='prodDetail']").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();

	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}

	$("form").attr("method", "POST").attr("action","/product/addProduct").submit();
}

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	 $( "#btn02:contains('취소')" ).on("click" , function() {
			//Debug..
			alert(  $( "#btn02:contains('취소')"  ).html() );
			 history.go(-1)
	});

	 $( "#btn01:contains('등록')" ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('등록')" ).html() );
		fncAddProduct();
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
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	<h3 class="bg-inverse text-left">판매상품등록</h3>
	<br/>
	<form name="form-horizontal" enctype="multipart/form-data">
	<br/>
	<div class="form-group">
    <label for="prodName">상품명</label>
    <input type="text" class="form-control" name="prodName" placeholder="상품명을 입력하세요.">
  </div>
  <div class="form-group">
    <label for="prodDetail">상품상세정보</label>
    <input type="text" class="form-control" name="prodDetail" placeholder="제품에 대한 상세정보를 입력하세요.">
  </div>
    <div class="form-group">
    <label for="manuDate">제조일자</label>
    <input type="text" class="form-control" name="manuDate" id="datepicker" placeholder="제품의 제조일자를 선택하세요." autocomplete=off >
  </div>
    <div class="form-group">
    <label for="price">가격</label>
    <input type="text" class="form-control" name="price" placeholder="희망하시는 제품의 가격을 입력하세요.">
  </div>
  <div class="form-group">
    <label for="fileData">File input</label>
    <input type="file" id="fileData" name="fileData">
    <p class="help-block">*제품명과 동일하고 선명한 사진을 업로드 해주세요.</p>
  </div>
   <button type="submit" class="btn btn-primary" id="btn01">등록</button>

	<button type="button" class="btn btn-default" id="btn02">취소</button>
  </div>
	
	</form>
</div>
</body>
</html>