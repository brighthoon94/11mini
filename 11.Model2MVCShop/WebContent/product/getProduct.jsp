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
            $("#btn02:contains('이전')").on("click", function() {
                //Debug..
                //alert(  $( "td.ct_btn01:contains('확인')" ).html() );
                self.location = "javascript:history.go(-1)"
            });

            $("#btn01:contains('구매')").on("click", function() {
                //Debug..
                //alert(  $( "td.ct_btn01:contains('구매')" ).html() );
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
			<div class="col-xs-8 col-md-4"><img src="/images/uploadFiles/${product.fileName}" /></div>
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

 <%--    <table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td width="15" height="37">
                <img src="/images/ct_ttl_img01.gif" width="15" height="37">
            </td>
            <td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="93%" class="ct_ttl01">상품상세조회</td>
                        <td width="20%" align="right">&nbsp;</td>
                    </tr>
                </table>
            </td>
            <td width="12" height="37"><img src="/images/ct_ttl_img03.gif" width="12" height="37"></td>
        </tr>
    </table>

    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
        <tr>
            <td height="1" colspan="3" bgcolor="D6D6D6"></td>
        </tr>
        <tr>
            <td width="104" class="ct_write">
                상품번호 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
            </td>
            <td bgcolor="D6D6D6" width="1"></td>
            <td class="ct_write01">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="105">${product.prodNo }</td>
                        <td> </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="1" colspan="3" bgcolor="D6D6D6"></td>
        </tr>

        <tr>
            <td width="104" class="ct_write">
                상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
            </td>
            <td bgcolor="D6D6D6" width="1"></td>
            <td class="ct_write01">${product.prodName}</td>
        </tr>
        <tr>
            <td height="1" colspan="3" bgcolor="D6D6D6"></td>
        </tr>

        <tr>
            <td width="104" class="ct_write">
                상품이미지 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
            </td>
            <td bgcolor="D6D6D6" width="1"></td>
            <td class="ct_write01"><img src="/images/uploadFiles/${product.fileName}" /></td>
        </tr>
        <tr>
            <td height="1" colspan="3" bgcolor="D6D6D6"></td>
        </tr>

        <tr>
            <td width="104" class="ct_write">
                상품상세정보 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
            </td>
            <td bgcolor="D6D6D6" width="1"></td>
            <td class="ct_write01">${ product.prodDetail}</td>
        </tr>
        <tr>
            <td height="1" colspan="3" bgcolor="D6D6D6"></td>
        </tr>

        <tr>
            <td width="104" class="ct_write">제조일자</td>
            <td bgcolor="D6D6D6" width="1"></td>
            <td class="ct_write01">${product.manuDate}</td>
        </tr>
        <tr>
            <td height="1" colspan="3" bgcolor="D6D6D6"></td>
        </tr>
        <tr>
            <td width="104" class="ct_write">가격</td>
            <td bgcolor="D6D6D6" width="1"></td>
            <td class="ct_write01">${product.price }</td>
        </tr>
        <td height="1" colspan="3" bgcolor="D6D6D6"></td>
        <tr>
            <td width="104" class="ct_write">등록일자</td>
            <td bgcolor="D6D6D6" width="1"></td>
            <td class="ct_write01">${ product.regDate}</td>
        </tr>

        <tr>
            <td height="1" colspan="3" bgcolor="D6D6D6"></td>
        </tr>
    </table>

    <table width="100%" border="0" cellspacing="0" style="margin-top:10px;">
        <tr>
            <td width="53%"></td>
            <td align="right">
                <table border="0" cellspacing="0">
           		 <c:if test="${param.menu == 'search' && user.role == 'user' && product.proTranCode == '0'}">
                <td width="30"></td>
                <td width="17" height="23">
                    <img src="/images/ct_btnbg01.gif" width="17" height="23" />
                </td>
                <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
                    구매
                </td>
                <td width="14" height="23">
                    <img src="/images/ct_btnbg03.gif" width="14" height="23" />
                </td>
            </c:if>
            <td width="30"></td>
            <td width="17" height="23">
                <img src="/images/ct_btnbg01.gif" width="17" height="23" />
            </td>
            <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
                이전
            </td>
            <td width="14" height="23">
                <img src="/images/ct_btnbg03.gif" width="14" height="23" />
            </td>
    </table>
    </td>
    </tr>
    </table>
	</form> --%>
</body>

</html>