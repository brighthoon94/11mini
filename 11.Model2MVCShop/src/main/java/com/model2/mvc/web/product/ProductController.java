package com.model2.mvc.web.product;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public ProductController(){
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
		
	@RequestMapping(value="addProduct", method=RequestMethod.POST)
	public String addProduct( @ModelAttribute("product") Product product,
															@RequestParam("fileData") MultipartFile mtfFile ) throws Exception {
		
		System.out.println("/addProduct : POST");
		String url = "C:\\workspace\\10.Model2MVCShop(Ajax)\\WebContent\\images\\uploadFiles\\";
		String fileData = mtfFile.getOriginalFilename();
		File file = new File(url, fileData);
		mtfFile.transferTo(file);
		System.out.println("filename :"+fileData);
		product.setFileName(fileData);
		product.setManuDate(product.getManuDate().replace("-", ""));
		productService.addProduct(product);
		
		return "forward:/product/confirmProduct.jsp";
	}
	
	@RequestMapping(value="getProduct", method=RequestMethod.GET)
	public String getProduct( @RequestParam("prodNo") int prodNo , Model model, HttpServletResponse response, HttpServletRequest request ) throws Exception {
		
		System.out.println("/product/getProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model �� View ����
		model.addAttribute("product", product);
		
		String history = null;
		Cookie[] cookies = request.getCookies();
		if (cookies!=null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if (cookie.getName().equals("history")) {
					history = cookie.getValue();
				}
			}
		}
		
		Cookie c = new Cookie("history", history + ","+prodNo);
		c.setPath("/");
		response.addCookie(c);
		return "forward:/product/getProduct.jsp";
	}
	
	@RequestMapping(value="updateProductView", method=RequestMethod.GET)
	public String updateProductView( @RequestParam("prodNo") int prodNo, Model model) throws Exception {
		System.out.println("updateProductView : GET");
		
		Product product = productService.getProduct(prodNo);
		System.out.println("123455"+product);
		model.addAttribute("product",product);
		
		return "forward:/product/updateProduct.jsp";
	}
	
	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product ,
																	@RequestParam("menu") String menu) throws Exception{

		System.out.println("updateProduct : POST");
		//Business Logic
		productService.updateProduct(product);
		
		return "redirect:/product/getProduct?prodNo="+product.getProdNo()+"&menu="+menu;
	}
	
	@RequestMapping(value="listProduct")
	public String listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request, @RequestParam("menu") String menu) throws Exception{
		
		System.out.println("listProduct : GET/POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("menu", menu);
		System.out.println(menu);
		return "forward:/product/listProduct.jsp";
	}
}
