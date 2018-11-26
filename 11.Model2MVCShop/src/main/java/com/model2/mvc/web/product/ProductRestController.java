package com.model2.mvc.web.product;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	///Constructor
	public ProductRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="json/addProduct", method=RequestMethod.POST)
	public void addProduct( @RequestBody Product product ) throws Exception {
		
		System.out.println("/addProduct : POST");
		//Business Logic
		System.out.println(product);
		product.setManuDate(product.getManuDate().replace("-", ""));
		productService.addProduct(product);
		
	}
	
	@RequestMapping(value="json/getProduct/{prodNo}", method=RequestMethod.GET)
	public Product getProduct( @PathVariable String prodNo ) throws Exception {
		
		System.out.println("/product/getProduct : GET");
		//Business Logic
		
		return productService.getProduct(Integer.parseInt(prodNo));
	}
	
	@RequestMapping(value="json/updateProductView/{prodNo}", method=RequestMethod.GET)
	public Product updateProductView( @PathVariable String prodNo) throws Exception {
		System.out.println("/product/updateProductView : GET");
		
		return productService.getProduct(Integer.parseInt(prodNo));
	}
	
	@RequestMapping(value="json/updateProduct", method=RequestMethod.POST)
	public Product updateProduct( @RequestBody Product product) throws Exception{

		System.out.println("updateProduct : POST");
		//Business Logic
		productService.updateProduct(product);
		
		return product;
	}
	
	@RequestMapping(value="json/listProductPOST")
	public Map listProductPOST( @RequestBody Search search) throws Exception{
		
		System.out.println("listProduct : GET/POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		//map.put("list", map.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);
		return map;
	}
	
	@RequestMapping(value="json/listProductGET")
	public Map listProductGET() throws Exception{
		
		System.out.println("listProduct : GET/POST");
		Search search = new Search();
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		//map.put("list", map.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);
		return map;
	}
}
