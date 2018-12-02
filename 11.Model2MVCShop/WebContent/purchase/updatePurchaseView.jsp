<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>�������� ����</title>
    <link rel="stylesheet" href="/css/admin.css" type="text/css">
 	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	 
<script type="text/javascript" src="../javascript/calendar.js">
$(function() {
	 $( "td.ct_btn01:contains('����')" ).on("click" , function() {
		 self.location = "/purchase/updatePurchaseView?tranNo=${purchase.tranNo}";
	});
	 
	 $( "td.ct_btn01:contains('���')" ).on("click" , function() {
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
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">������������</h3>
	       <h5 class="text-muted">������Ŀ��� ������ �Ұ��մϴ�. �����ϰ� �����ϼ���.</h5>
	    </div>	

	<form  class="form-horizontal">

 		<div class="form-group">
		    <label for="buyer.userId" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="buyer.userId" name="buyer.userId" value="${purchase.buyer.userId}" placeholder="�ߺ�Ȯ���ϼ���"  readonly>
		    </div>
		  </div>
		
	<div class="form-group">
  			 <label for="paymentOption"  class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
   		<div class="col-sm-4">
   		<select  class="form-control" name="paymentOption">
   			<option value="1  " ${purchase.paymentOption.trim() == 1 ? "selected":""}>���ݱ���</option>
			<option value="2  "${purchase.paymentOption.trim() == 2 ? "selected":""}>�ſ뱸��</option>
	 		</select>
	 		</div>
	  </div>
 	  
	<div class="form-group">
   		 <label for="receiverName"   class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
   		 <div class="col-sm-4">
   			 <input type="text" class="form-control" name="receiverName" vlaue="${purchase.receiverName}" placeholder="${purchase.receiverName}">
	 	</div>
	  </div>
	
	<div class="form-group">
   		 <label for="receiverPhone"   class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
   		 <div class="col-sm-4">
   		 	<input type="text" class="form-control" name="receiverPhone" vlaue="${purchase.receiverPhone}" placeholder="${purchase.receiverPhone}">
  		</div>
  	</div>

	<div class="form-group">
   		 <label for="divyAddr"  class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
   		 <div class="col-sm-4">
   		 	<input type="text" class="form-control" name="divyAddr" vlaue="${purchase.divyAddr}" placeholder="${purchase.divyAddr}">
  		</div>
  	</div>
  	
	<div class="form-group">
   		 <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
   		 <div class="col-sm-4">
   		 	<input type="text" class="form-control" name="divyRequest" vlaue="${purchase.divyRequest}" placeholder="${purchase.divyRequest}">
  		</div>
  	</div>
  	
	<div class="form-group">
   		 <label for="divyDate"class="col-sm-offset-1 col-sm-3 control-label">����������</label>
   		 <div class="col-sm-4">
   		 	<input type="text" class="form-control" id="datepicker" name="divyDate" vlaue="${purchase.divyDate}" autocomplete=off>
  		</div>
  	</div>
  	
	  <div class="form-group">
	    <div class="col-sm-offset-4  col-sm-4 text-center">
	      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
		  <button type="button" class="btn btn-primary" >�� &nbsp;��</button>
	    </div>
	  </div>
</form>
</div>
</body>
</html>