package com.model2.mvc.web.purchase;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {

	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	public PurchaseRestController() {
		System.out.println(this.getClass());
	}
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="/json/addPurchase/{prodNo}", method=RequestMethod.GET)
	public Product addPurchase( @PathVariable String prodNo)throws Exception {
		
		Product product = productService.getProduct(Integer.parseInt(prodNo));
		
		return product;
	}
	
	@RequestMapping(value="/json/addPurchase", method=RequestMethod.POST)
	public void addPurchase(@RequestBody Purchase purchase ) throws Exception {
		
		System.out.println("/addPurchase");
		purchaseService.addPurchase(purchase);
		System.out.println("addPurchase ¿Ï·á");
	}
	
	@RequestMapping(value="json/getPurchase/{tranNo}", method=RequestMethod.GET)
	public Purchase getPurchase(@PathVariable int tranNo) throws Exception{
		
		System.out.println (getClass().getName());
		
		return purchaseService.getPurchase(tranNo);
	}
	
	@RequestMapping(value="json/updatePurchaseView", method=RequestMethod.GET)
	public Purchase updatePurchase( @PathVariable int tranNo) throws Exception{
		
		System.out.println (getClass().getName());
		
		return purchaseService.getPurchase(tranNo);
	}
	
	@RequestMapping(value="json/updatePurchase", method=RequestMethod.POST)
	public Map updatePurchase(@RequestBody Purchase purchase) throws Exception{
		System.out.println (getClass().getName());
		
		purchaseService.updatePurchase(purchase);
		purchase = purchaseService.getPurchase(purchase.getTranNo());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tranNo", purchase.getTranNo());
		map.put("purchase", purchase);
		return map;
	}

	@RequestMapping(value="json/updateTranCode/{prodNo}/{tranCode}", method=RequestMethod.GET)
	public Purchase updateTranCode( @PathVariable int prodNo,
																				@PathVariable String tranCode) throws Exception{
		
		System.out.println (getClass().getName()+prodNo+tranCode);
		
		Purchase purchase = purchaseService.getPurchase2(prodNo);
		purchase.setTranCode(tranCode);
		purchaseService.updateTranCode(purchase);
		purchase = purchaseService.getPurchase2(prodNo);
		return purchase;
	}
	
	@RequestMapping(value="json/updateTranCodeByProd/{prodNo}/{tranCode}", method=RequestMethod.GET)
	public Purchase updateTranCodeByProd( @PathVariable int prodNo,
																										@PathVariable String tranCode) throws Exception{
		
		System.out.println (getClass().getName()+prodNo+"tranCode"+tranCode);
		
		Purchase purchase = purchaseService.getPurchase2(prodNo);
		purchase.setTranCode(tranCode);
		purchaseService.updateTranCode(purchase);
		purchase = purchaseService.getPurchase2(prodNo);
		return purchase;
	}
	
	@RequestMapping(value="json/listPurchase", method=RequestMethod.POST)
	public Map listPurchase(@RequestBody Search search) throws Exception{
		
		System.out.println("json/listPurchase");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map=purchaseService.getPurchaseList(search, "user04");
		Page resultPage = new Page( search.getCurrentPage(),
																((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);

		map.put("list", map.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);
		
		return map;
	}
}
