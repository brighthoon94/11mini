<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Insert title here</title>
</head>

<body>

<form name="updatePurchase" action="/purchase/updatePurchaseView?tranNo=0" method="post">

������ ���� ���Ű� �Ǿ����ϴ�.

<table border=1>
	<tr>
		<td>��ǰ��ȣ</td>
		<td><%-- <%=purchase.getPurchaseProd().getProdNo() %> --%>${purchase.purchaseProd.prodNo}</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ھ��̵�</td>
		<td><%-- <%=purchase.getBuyer().getUserId()%> --%>${purchase.buyer.userId}</td>
		<td></td>
	</tr>
	<tr>
		<td>���Ź��</td>
		<td><%-- <%=purchase.getPaymentOption() %> --%>${purchase.paymentOption}</td>
		<td></td>
	</tr>
	<tr>
		<td>�������̸�</td>
		<td><%-- <%=purchase.getReceiverName() %> --%>${purchase.receiverName}</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ڿ���ó</td>
		<td><%-- <%=purchase.getReceiverPhone() %> --%>${purchase.receiverPhone}</td>
		<td></td>
	</tr>
	<tr>
		<td>�������ּ�</td>
		<td><%-- <%=purchase.getDivyAddr() %> --%>${purchase.divyAddr}</td>
		<td></td>
	</tr>
		<tr>
		<td>���ſ�û����</td>
		<td><%-- <%=purchase.getDivyRequest()%> --%>${purchase.divyRequest }</td>
		<td></td>
	</tr>
	<tr>
		<td>����������</td>
		<td><%-- <%=purchase.getDivyDate()%> --%>${purchase.divyDate }</td>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>