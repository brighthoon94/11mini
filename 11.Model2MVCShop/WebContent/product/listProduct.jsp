<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>

<head>
    <title>��ǰ �����ȸ</title>
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


    <!-- jQuery UI toolTip ��� CSS-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery UI toolTip ��� JS-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <style type="text/css">
        .image {
            height: 50px
        }
        body {
            padding-top : 50px;
        }
    </style>
    <!--���ѽ�ũ�� Ajax �κ� -->
    
   <script type="text/javascript">
   
   function fncGetPageList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu }").submit();
	}
   
   	var currentPage =  '${resultPage.currentPage}'-1;
    $(window).scroll(function() {
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
        $.ajax( 
				{
					url : "json/listProductPOST",
					method : "POST" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					data : JSON.stringify ({ 	
									currentPage : currentPage+1,
									searchCondition :	$("#searchCondition").val(),
									searchKeyword : $("#searchKeyword").val()
								}),	
					dataType : "json" ,
					success : function(JSONData , status) {
						var list = JSONData["list"];
        				currentPage++;
        				
        				$(function() {
  			        	  $("p > a:contains('�ڼ�������')").on("click", function() {
  			        		var prodNo = $(this).data("param");
  		        		    var prodTranCode = $(this).data("param1");
  		        		    var role = "";
  		                  if ("${user}" != null) {
  		                      role = "${user.role}";
  		                  };
  			        		  self.location = "/product/getProduct?prodNo=" +prodNo+ "&menu=${param.menu}"
  			        	  });
  			          });
        				
        				list.forEach(function(item, index, array){
        					var tranCode = item['proTranCode']=='0' ? "�Ǹ���" : "ǰ��";
        					var purchaseBtn = '<p><a class="btn btn-primary" role="button" data-param="'+item['prodNo']+'" data-param1="'+item['proTranCode']+'">�ڼ�������</a></p>'
        					
        					
        					$($(".col-sm-6.col-md-4").last()).after('<div class="col-sm-6 col-md-4"><div class="thumbnail"><img data-src="holder.js/100%x200" alt="100%x200" src="/images/uploadFiles/'+item['fileName']+'" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;">'
        					+' <div class="caption">'
        					+'<h3 id="thumbnail-label">'+item['prodName']+'<a class="anchorjs-link" href="#thumbnail-label"><span class="anchorjs-icon"></span></a></h3>'
        					+"<p>"+item['prodDetail']+"</p>"
        					+'<p> <strong>'+item['price']+'��</strong></p>'
        					+"<p align='left'>"+tranCode+"</p>"
        					+	purchaseBtn
        					+'</div></div>'
        			        +'</div>' );
        				})
					}//end of call back fuction
				}//end of option(key=value) 
			); // end of  $.ajax()
        }
    }); 
	//==============================���ݼ� ����===============================================
    $(function() {
		$(".ct_input_g").on('change', function() {
            $("#currentPage").val(currentPage)
            $("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${param.menu }").submit();
        });
    });
        //===========================�˻�======================================================
        $(function() {
            $(".ct_list_pop td:nth-child(3)").css("color", "red");
            $("h7").css("color", "red");
            $(".ct_list_pop:nth-child(4n+6)").css("background-color", "whitesmoke");

            $("#btn_search:contains('�˻�')").on("click", function() {
            	$("#currentPage").val(currentPage)
    			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu }").submit();
            });
        });
        //==============================�����ڿ�======================================
        	
          $(function() {
        	  $("a:contains('�ڼ�������')").on("click", function() {
        		  var prodNo = $(this).data("param");
        		  var prodTranCode = $(this).data("param1");
        		  var role = "";
                  if ("${user}" != null) {
                      role = "${user.role}";
                  };
        		  self.location = "/product/getProduct?prodNo=" + prodNo + "&menu=${param.menu}"
        	  });
          });
        //==============================�����ڿ�======================================
        $(function() {
            $("tbody td:nth-child(2)").on("click", function() {
                //Debug..
                //alert(  $( this ).text().trim() );
                var prodNo = $(this).data("param");
                var prodTranCode = $(this).data("param1");
                var role = "";
                if ("${user}" != null) {
                    role = "${user.role}";
                };

                console.log("${param.menu}");
                console.log("${prodTranCode}")
                if (${param.menu == 'search'} && role == 'admin') {
                    self.location = "/product/getProduct?prodNo=" + prodNo + "&menu=${param.menu}"
                    console.log("��ǰ���� ����");
                    console.log("${param.menu == 'search'}");
                }
                if (${param.menu == 'manage'} && prodTranCode == '0') {
                    self.location = "/product/updateProductView?prodNo=" + prodNo + "&menu=${param.menu}"
                    console.log("�ǸŻ�ǰ���� ����");
                };
           	  });
            });
        
           $(function() {
            $("#delivery").on("click", function() {
                alert("�ٲٷ�����.");
                var prodNo = $(this).data("param2");
                alert(prodNo);
                self.location = "/purchase/updateTranCodeByProd?prodNo=" + prodNo + "&tranCode=2"
            });
           });
    </script>
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	
	<div class="container">
		
		<div class="page-header text-info">
		<h3>${param.menu == 'manage' ? '��ǰ����':'��ǰ�����ȸ'}</h3>
		</div>
	<c:if test="${empty user.role || user.role == 'user'}">
		<div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    	   ${resultPage.totalCount } ���� ��ǰ�� �����մϴ�.
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" id="searchCondition">
						<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��</option>
                        <option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ����</option>
					</select>
				  </div>
					
					<div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" 
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  <button type="button" class="btn btn-default" id="btn_search">�˻�</button>
				   <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start ///////////////////////////////////////////-->
		<!-- �����ڿ� table Start ////////////////////////////////////////////-->
		
		
		<div class="bs-example" data-example-id="thumbnails-with-custom-content">
    <div class="row" id="thumbnails">
    <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
      <div class="col-sm-6 col-md-4">
        <div class="thumbnail">
          <img data-src="holder.js/100%x200" alt="100%x200" src="/images/uploadFiles/${product.fileName}" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;">
          <div class="caption">
            <h3 id="thumbnail-label">${product.prodName}<a class="anchorjs-link" href="#thumbnail-label"><span class="anchorjs-icon"></span></a></h3>
            <p data-value="${product.prodDetail}">${product.prodDetail }</p>
             <p> <strong>${product.price }��</strong></p>
              <c:if test="${product.proTranCode eq '0' && (empty user.role or user.role == 'user' or user.role == 'admin')}">
               <p align="left">�Ǹ���</p>
               </c:if>
               <c:if test="${ product.proTranCode != '0' && (user.role == 'user' || empty user.role) }">
               <p align="left">ǰ�� </p>
               </c:if>
            <p><a class="btn btn-primary" role="button" data-param="${product.prodNo }" data-param1="${product.proTranCode }">�ڼ�������</a></p>
          </div>
        </div>
      </div>  
      </c:forEach>
    </div>
  </div>
		</c:if>
		
		<!-- �����ڿ� table Start ////////////////////////////////////////////-->		
		<c:if test="${user.role == 'admin'}">	
		
		<div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" id="searchCondition">
						<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��</option>
                        <option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ����</option>
					</select>
				  </div>
					
					<div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" 
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  <button type="button" class="btn btn-default" id="btn_search">�˻�</button>
				   <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		
		<table class="table table-hover table-striped" >
      	
        <thead>
          <tr>
            <th align="center">��ǰ �̹���</th>
            <th align="left" >��ǰ��</th>
            <th align="left">����
            <select name="sortPrice" class="ct_input_g" style="width: 80px" >
                            <option value="2" ${ search.sortPrice==2? "selected" : "" }>���ݼ�</option>
                            <option value="0" ${ search.sortPrice==0 ? "selected" : "" }>�������ݼ�</option>
                            <option value="1" ${ search.sortPrice==1 ? "selected" : "" }>�������ݼ�</option>
                        </select></th>
            <th align="left">�����</th>
            <th align="left">�������</th>
          </tr>
        </thead>
        
        <tbody>
        <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center"><img src="/images/uploadFiles/${product.fileName}" class="image" /></td>
                        <td align="left" data-param="${product.prodNo }" data-param1="${product.proTranCode }">
                            ${product.prodName}
                        </td>
                        <td align="left">${ product.price}</td>
                        <td align="left">${ product.manuDate}</td>
                        <c:if test="${product.proTranCode eq '0' && (empty user.role or user.role == 'user' or user.role == 'admin')}">
                            <td align="left">�Ǹ���</td>
                        </c:if>
                        <c:if test="${product.proTranCode == '1  ' &&  param.menu == 'manage' && (!empty user.role && user.role != 'user')}">
                            <td align="left">���ſϷ� <span id="delivery" data-param2="${product.prodNo }">����ϱ�</span></td>
                        </c:if>
                        <c:if test="${product.proTranCode == '1  ' && param.menu == 'search' && (!empty user.role && user.role != 'user')}">
                            <td align="left">���ſϷ�</td>
                        </c:if>
                        <c:if test="${product.proTranCode == '2  ' && (!empty user.role && user.role != 'user')}">
                            <td align="left">�����</td>
                        </c:if>
                        <c:if test="${product.proTranCode == '3  ' && (!empty user.role && user.role != 'user')}">
                            <td align="left">��ۿϷ�</td>
                        </c:if>
                        <c:if test="${ product.proTranCode != '0' && (user.role == 'user' || empty user.role) }">
                            <td align="left">������ </td>
                        </c:if>
					</tr>
			</c:forEach>
        </tbody>
      </table>
     </div>  
           <!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	</c:if>
</body>

</html>
