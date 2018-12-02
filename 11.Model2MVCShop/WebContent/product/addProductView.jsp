<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html lang="ko">
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
function fncAddProduct(){
	//Form ��ȿ�� ����
 	var name = $("input[name='prodName']").val();
	var detail = $("input[name='prodDetail']").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();

	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}

	$("form").attr("method", "POST").attr("action","/product/addProduct").submit();
}

$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
	 $( "#btn02:contains('���')" ).on("click" , function() {
			//Debug..
			alert(  $( "#btn02:contains('���')"  ).html() );
			 history.go(-1)
	});

	 $( "#btn01:contains('���')" ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('���')" ).html() );
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

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
	<h3 class="bg-inverse text-left">�ǸŻ�ǰ���</h3>
	<br/>
	<form name="form-horizontal" enctype="multipart/form-data">
	<br/>
	<div class="form-group">
    <label for="prodName">��ǰ��</label>
    <input type="text" class="form-control" name="prodName" placeholder="��ǰ���� �Է��ϼ���.">
  </div>
  <div class="form-group">
    <label for="prodDetail">��ǰ������</label>
    <input type="text" class="form-control" name="prodDetail" placeholder="��ǰ�� ���� �������� �Է��ϼ���.">
  </div>
    <div class="form-group">
    <label for="manuDate">��������</label>
    <input type="text" class="form-control" name="manuDate" id="datepicker" placeholder="��ǰ�� �������ڸ� �����ϼ���." autocomplete=off >
  </div>
    <div class="form-group">
    <label for="price">����</label>
    <input type="text" class="form-control" name="price" placeholder="����Ͻô� ��ǰ�� ������ �Է��ϼ���.">
  </div>
  <div class="form-group">
    <label for="fileData">File input</label>
    <input type="file" id="fileData" name="fileData">
    <p class="help-block">*��ǰ��� �����ϰ� ������ ������ ���ε� ���ּ���.</p>
  </div>
   <button type="submit" class="btn btn-primary" id="btn01">���</button>

	<button type="button" class="btn btn-default" id="btn02">���</button>
  </div>
	
	</form>
</div>
</body>
</html>