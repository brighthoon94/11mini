<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>구매정보 수정</title>
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
<script type="text/javascript">
$(function() {
	 $( "td.ct_btn01:contains('수정')" ).on("click" , function() {
		 self.location = "/purchase/updatePurchaseView?tranNo=${purchase.tranNo}";
	});
	 
	 $( "td.ct_btn01:contains('취소')" ).on("click" , function() {
		 	history.go(-1);
	});
});
$("form").attr("method" , "POST").attr("action" , "/purchase/updatePurchase?tranNo=${purchase.tranNo}").submit();
</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">구매정보수정</h3>
	       <h5 class="text-muted">배송이후에는 수정이 불가합니다. 신중하게 진행하세요.</h5>
	    </div>	

	<form  class="form-horizontal">

 		<div class="form-group">
		    <label for="buyer.userId" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="buyer.userId" name="buyer.userId" value="${purchase.buyer.userId}" placeholder="중복확인하세요"  readonly>
		    </div>
		  </div>
		
	<div class="form-group">
  			 <label for="paymentOption"  class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
   		<div class="col-sm-4">
   		<select  class="form-control" name="paymentOption">
   			<option value="1  " ${purchase.paymentOption.trim() == 1 ? "selected":""}>현금구매</option>
			<option value="2  "${purchase.paymentOption.trim() == 2 ? "selected":""}>신용구매</option>
	 		</select>
	 		</div>
	  </div>
 	  
	<div class="form-group">
   		 <label for="receiverName"   class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
   		 <div class="col-sm-4">
   			 <input type="text" class="form-control" name="receiverName" vlaue="${purchase.receiverName}" placeholder="${purchase.receiverName}">
	 	</div>
	  </div>
	
	<div class="form-group">
   		 <label for="receiverPhone"   class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
   		 <div class="col-sm-4">
   		 	<input type="text" class="form-control" name="receiverPhone" vlaue="${purchase.receiverPhone}" placeholder="${purchase.receiverPhone}">
  		</div>
  	</div>

	<div class="form-group">
   		 <label for="divyAddr"  class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
   		 <div class="col-sm-4">
   		 	<input type="text" class="form-control" name="divyAddr" vlaue="${purchase.divyAddr}" placeholder="${purchase.divyAddr}">
  		</div>
  	</div>
  	
	<div class="form-group">
   		 <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
   		 <div class="col-sm-4">
   		 	<input type="text" class="form-control" name="divyRequest" vlaue="${purchase.divyRequest}" placeholder="${purchase.divyRequest}">
  		</div>
  	</div>
  	
	<div class="form-group">
   		 <label for="divyDate"class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
   		 <div class="col-sm-4">
   		 	<input type="text" class="form-control" id="datepicker" name="divyDate" vlaue="${purchase.divyDate}" autocomplete=off>
  		</div>
  	</div>
  	
	  <div class="form-group">
	    <div class="col-sm-offset-4  col-sm-4 text-center">
	      <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
		  <button type="button" class="btn btn-primary" >취 &nbsp;소</button>
	    </div>
	  </div>
</form>
</div>
</body>
</html>