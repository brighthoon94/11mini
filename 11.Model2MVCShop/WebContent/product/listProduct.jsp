<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>

<head>
    <title>상품 목록조회</title>
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

    <style type="text/css">
        .image {
            height: 50px
        }
        body {
            padding-top : 50px;
        }
    </style>
    <!--무한스크롤 Ajax 부분 -->
    
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
  			        	  $("p > a:contains('자세히보기')").on("click", function() {
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
        					var tranCode = item['proTranCode']=='0' ? "판매중" : "품절";
        					var purchaseBtn = '<p><a class="btn btn-primary" role="button" data-param="'+item['prodNo']+'" data-param1="'+item['proTranCode']+'">자세히보기</a></p>'
        					
        					
        					$($(".col-sm-6.col-md-4").last()).after('<div class="col-sm-6 col-md-4"><div class="thumbnail"><img data-src="holder.js/100%x200" alt="100%x200" src="/images/uploadFiles/'+item['fileName']+'" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;">'
        					+' <div class="caption">'
        					+'<h3 id="thumbnail-label">'+item['prodName']+'<a class="anchorjs-link" href="#thumbnail-label"><span class="anchorjs-icon"></span></a></h3>'
        					+"<p>"+item['prodDetail']+"</p>"
        					+'<p> <strong>'+item['price']+'원</strong></p>'
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
	//==============================가격순 정렬===============================================
    $(function() {
		$(".ct_input_g").on('change', function() {
            $("#currentPage").val(currentPage)
            $("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${param.menu }").submit();
        });
    });
        //===========================검색======================================================
            $("#btn_search:contains('검색')").on("click", function() {
            	$("#currentPage").val(currentPage)
    			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu }").submit();
            });
        });
        //==============================구매자용======================================
        	
          $(function() {
        	  $("a:contains('자세히보기')").on("click", function() {
        		  var prodNo = $(this).data("param");
        		  var prodTranCode = $(this).data("param1");
        		  var role = "";
                  if ("${user}" != null) {
                      role = "${user.role}";
                  };
        		  self.location = "/product/getProduct?prodNo=" + prodNo + "&menu=${param.menu}"
        	  });
          });
        //==============================관리자용======================================
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
                    console.log("상품관리 들어감요");
                    console.log("${param.menu == 'search'}");
                }
                if (${param.menu == 'manage'} && prodTranCode == '0') {
                    self.location = "/product/updateProductView?prodNo=" + prodNo + "&menu=${param.menu}"
                    console.log("판매상품관리 들어감요");
                };
           	  });
            });
        
           $(function() {
            $("#delivery").on("click", function() {
                //alert("바꾸러간다.");
                var prodNo = $(this).data("param2");
                //alert(prodNo);
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
		<h3>${param.menu == 'manage' ? '상품관리':'상품목록조회'}</h3>
		</div>
	<c:if test="${empty user.role || user.role == 'user'}">
		<div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    	   ${resultPage.totalCount } 개의 물품이 존재합니다.
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" id="searchCondition">
						<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품명</option>
                        <option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품가격</option>
					</select>
				  </div>
					
					<div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" 
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  <button type="button" class="btn btn-default" id="btn_search">검색</button>
				   <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start ///////////////////////////////////////////-->
		<!-- 구매자용 table Start ////////////////////////////////////////////-->
		
		
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
             <p> <strong>${product.price }원</strong></p>
              <c:if test="${product.proTranCode eq '0' && (empty user.role or user.role == 'user' or user.role == 'admin')}">
               <p align="left">판매중</p>
               </c:if>
               <c:if test="${ product.proTranCode != '0' && (user.role == 'user' || empty user.role) }">
               <p align="left">품절 </p>
               </c:if>
            <p><a class="btn btn-primary" role="button" data-param="${product.prodNo }" data-param1="${product.proTranCode }">자세히보기</a></p>
          </div>
        </div>
      </div>  
      </c:forEach>
    </div>
  </div>
		</c:if>
		
		<!-- 관리자용 table Start ////////////////////////////////////////////-->		
		<c:if test="${user.role == 'admin'}">	
		
		<div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" id="searchCondition">
						<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품명</option>
                        <option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품가격</option>
					</select>
				  </div>
					
					<div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" 
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  <button type="button" class="btn btn-default" id="btn_search">검색</button>
				   <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		
		<table class="table table-hover table-striped" >
      	
        <thead>
          <tr>
            <th align="center">상품 이미지</th>
            <th align="left" >상품명</th>
            <th align="left">가격
            <select name="sortPrice" class="ct_input_g" style="width: 80px" >
                            <option value="2" ${ search.sortPrice==2? "selected" : "" }>가격순</option>
                            <option value="0" ${ search.sortPrice==0 ? "selected" : "" }>높은가격순</option>
                            <option value="1" ${ search.sortPrice==1 ? "selected" : "" }>낮은가격순</option>
                        </select></th>
            <th align="left">등록일</th>
            <th align="left">현재상태</th>
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
                            <td align="left">판매중</td>
                        </c:if>
                        <c:if test="${product.proTranCode == '1  ' &&  param.menu == 'manage' && (!empty user.role && user.role != 'user')}">
                            <td align="left">구매완료 <span id="delivery" data-param2="${product.prodNo }">배송하기</span></td>
                        </c:if>
                        <c:if test="${product.proTranCode == '1  ' && param.menu == 'search' && (!empty user.role && user.role != 'user')}">
                            <td align="left">구매완료</td>
                        </c:if>
                        <c:if test="${product.proTranCode == '2  ' && (!empty user.role && user.role != 'user')}">
                            <td align="left">배송중</td>
                        </c:if>
                        <c:if test="${product.proTranCode == '3  ' && (!empty user.role && user.role != 'user')}">
                            <td align="left">배송완료</td>
                        </c:if>
                        <c:if test="${ product.proTranCode != '0' && (user.role == 'user' || empty user.role) }">
                            <td align="left">재고없음 </td>
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
