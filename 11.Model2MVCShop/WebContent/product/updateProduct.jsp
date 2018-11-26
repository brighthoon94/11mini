<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>

<head>
    <title>상품수정</title>

    <link rel="stylesheet" href="/css/admin.css" type="text/css">
 	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
    <script type="text/javascript">
        function fncUpdateProduct() {
            //Form 유효성 검증
            var name = $("input[name='prodName']").val();
            var detail = $("input[name='prodDetail']").val();
            var manuDate = $("input[name='manuDate']").val();
            var price = $("input[name='price']").val();

            if (name == null || name.length < 1) {
                alert("상품명은 반드시 입력하여야 합니다.");
                return;
            }
            if (detail == null || detail.length < 1) {
                alert("상품상세정보는 반드시 입력하여야 합니다.");
                return;
            }
            if (manuDate == null || manuDate.length < 1) {
                alert("제조일자는 반드시 입력하셔야 합니다.");
                return;
            }
            if (price == null || price.length < 1) {
                alert("가격은 반드시 입력하셔야 합니다.");
                return;
            }

            $("form").attr("method", "POST").attr("action", "/product/updateProduct").submit();
        }
        $(function() {
            $("td.ct_btn01:contains('취소')").on("click", function() {
                $("form")[0].reset();
            });
        });

        $(function() {
            $("td.ct_btn01:contains('수정')").on("click", function() {
                fncUpdateProduct();
            });
        });
    </script>
</head>

<body bgcolor="#ffffff" text="#000000">

    <form name="detailForm">

        <input type="hidden" name="prodNo" value="${product.prodNo}">
        <input type="hidden" name="menu" value="${param.menu }">

        <table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="15" height="37"><img src="/images/ct_ttl_img01.gif" width="15" height="37"></td>
                <td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="93%" class="ct_ttl01">상품수정</td>
                            <td width="20%" align="right">&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td width="12" height="37"><img src="/images/ct_ttl_img03.gif" width="12" height="37"></td>
            </tr>
        </table>

        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
            <tr>
                <td height="1" colspan="3" bgcolor="D6D6D6"></td>
            </tr>

            <tr>
                <td width="104" class="ct_write">상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
                </td>
                <td bgcolor="D6D6D6" width="1"></td>
                <td class="ct_write01"><input type="text" name="prodName" value="${product.prodName }" class="ct_input_g" style="width: 100px; height: 19px" maxLength="50"></td>
            </tr>
            <tr>
                <td height="1" colspan="3" bgcolor="D6D6D6"></td>
            </tr>

            <tr>
                <td width="104" class="ct_write">상품상세정보<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
                </td>
                <td bgcolor="D6D6D6" width="1"></td>
                <td class="ct_write01"><input type="text" name="prodDetail" value="${product.prodDetail }" class="ct_input_g" style="width: 370px; height: 19px" maxLength="100"></td>
            </tr>
            <tr>
                <td height="1" colspan="3" bgcolor="D6D6D6"></td>
            </tr>


            <tr>
                <td width="104" class="ct_write">제조일자<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
                </td>
                <td bgcolor="D6D6D6" width="1"></td>
                <td class="ct_write01"><input type="text" name="manuDate" value="${product.manuDate }" class="ct_input_g" style="width: 100px; height: 19px" maxLength="100"></td>
            </tr>
            <tr>
                <td height="1" colspan="3" bgcolor="D6D6D6"></td>
            </tr>

            <tr>
                <td width="104" class="ct_write">가격<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
                </td>
                <td bgcolor="D6D6D6" width="1"></td>
                <td class="ct_write01"><input type="text" name="price" value="${product.price}" class="ct_input_g" style="width: 100px; height: 19px" maxLength="100"></td>
            </tr>
            <tr>
                <td height="1" colspan="3" bgcolor="D6D6D6"></td>
            </tr>

            <tr>
                <td width="104" class="ct_write">상품이미지<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
                </td>
                <td bgcolor="D6D6D6" width="1"></td>
                <td class="ct_write01"><input type="text" name="fileName" value="${product.fileName }" class="ct_input_g" style="width: 100px; height: 19px" maxLength="100"></td>
            </tr>
            <tr>
                <td height="1" colspan="3" bgcolor="D6D6D6"></td>
            </tr>
        </table>

        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
            <tr>
                <td width="53%"></td>
                <td align="right">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23"></td>
                            <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
                                수정</td>
                            <td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23" /></td>
                            <td width="30"></td>
                            <td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23"></td>
                            <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
                                취소</td>
                            <td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>

</body>

</html>