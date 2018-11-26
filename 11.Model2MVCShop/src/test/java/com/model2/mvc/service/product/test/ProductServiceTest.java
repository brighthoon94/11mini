package com.model2.mvc.service.product.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/commonservice.xml" })
public class ProductServiceTest {

		@Autowired
		@Qualifier("productServiceImpl")
		private ProductService productService;

		//@Test
		public void testAddProduct() throws Exception{
			
			Product product = new Product();
			product.setProdName("∞≠∏Ì»∆¥‘¿ÃΩ√¥Ÿø‰");
			product.setProdDetail("¿˙∑≈¿Ã");
			product.setManuDate("2018");
			product.setPrice(10000);
			product.setFileName("aaa");
			
			productService.addProduct(product);
		
			product = productService.getProduct(10021);
			
			Assert.assertEquals("∞≠∏Ì»∆¥‘¿ÃΩ√¥Ÿø‰", product.getProdName());
			Assert.assertEquals("¿˙∑≈¿Ã", product.getProdDetail());
			Assert.assertEquals("2018", product.getManuDate());
			Assert.assertEquals(10000, product.getPrice());
			Assert.assertEquals("aaa", product.getFileName());
		}
		//@Test
		public void testGetProduct() throws Exception{
			
			Product product = new Product();
			product.setProdName("∞≠∏Ì»∆¥‘¿ÃΩ√¥Ÿø‰");
			product.setProdDetail("¿˙∑≈¿Ã");
			product.setManuDate("2018");
			product.setPrice(10000);
			product.setFileName("aaa");
			
			product = productService.getProduct(10021);
			
			Assert.assertEquals("∞≠∏Ì»∆¥‘¿ÃΩ√¥Ÿø‰", product.getProdName());
			Assert.assertEquals("¿˙∑≈¿Ã", product.getProdDetail());
			Assert.assertEquals("2018", product.getManuDate());
			Assert.assertEquals(10000, product.getPrice());
			Assert.assertEquals("aaa", product.getFileName());
			
			Assert.assertNotNull(productService.getProduct(10000));
			Assert.assertNotNull(productService.getProduct(10021));
		}
		//@Test
		 public void testUpdateProduct() throws Exception{
			 
			Product product = productService.getProduct(10021);
			Assert.assertNotNull(product);
			
			Assert.assertEquals("∞≠∏Ì»∆¥‘¿ÃΩ√¥Ÿø‰", product.getProdName());
			Assert.assertEquals("¿˙∑≈¿Ã", product.getProdDetail());
			Assert.assertEquals("2018", product.getManuDate());
			Assert.assertEquals(10000, product.getPrice());

			product.setProdName("change");
			product.setProdDetail("∫ÒΩŒπÃ");
			product.setManuDate("1994");
			product.setPrice(123456789);
			
			productService.updateProduct(product);
			
			product = productService.getProduct(10021);
			Assert.assertNotNull(product);
			
			//==> console »Æ¿Œ
			//System.out.println(user);
				
			//==> API »Æ¿Œ
			Assert.assertEquals("change", product.getProdName());
			Assert.assertEquals("∫ÒΩŒπÃ", product.getProdDetail());
			Assert.assertEquals("1994", product.getManuDate());
			Assert.assertEquals(123456789, product.getPrice());
		 }
		 
		@Test
		 public void testGetProductListAll() throws Exception{
			 
			 	Search search = new Search();
			 	search.setCurrentPage(1);
			 	search.setPageSize(3);
			 	Map<String,Object> map = productService.getProductList(search);
			 	
			 	List<Object> list = (List<Object>)map.get("list");
			 	Assert.assertEquals(3, list.size());
			 	
				//==> console »Æ¿Œ
			 	//System.out.println(list);
			 	
			 	Integer totalCount = (Integer)map.get("totalCount");
			 	System.out.println(totalCount);
			 	
			 	System.out.println("=======================================");
			 	
			 	search.setCurrentPage(1);
			 	search.setPageSize(3);
			 	search.setSearchCondition("0");
			 	search.setSearchKeyword("");
			 	map = productService.getProductList(search);
			 	
			 	list = (List<Object>)map.get("list");
			 	Assert.assertEquals(3, list.size());
			 	
			 	//==> console »Æ¿Œ
			 	System.out.println(list);
			 	
			 	totalCount = (Integer)map.get("totalCount");
			 	System.out.println(totalCount);
			 }
}
