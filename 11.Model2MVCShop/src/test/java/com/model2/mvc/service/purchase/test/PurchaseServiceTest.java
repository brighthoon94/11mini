package com.model2.mvc.service.purchase.test;

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
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/commonservice.xml" })
public class PurchaseServiceTest {
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	
	//@Test
	public void testAddPurchase() throws Exception{
		
		Purchase purchase = new Purchase();
		Product product = new Product();
		User user = new User();
		product.setProdNo(10040);
		user.setUserId("user04");
		
		purchase.setPurchaseProd(product);
		purchase.setBuyer(user);
		purchase.setPaymentOption("1  ");
		purchase.setReceiverName("강명훈");
		purchase.setReceiverPhone("01054349231");
		purchase.setDivyAddr("경기도시흥시신천동");
		purchase.setDivyRequest("현관문 앞에 놓아주세요");
		
		purchaseService.addPurchase(purchase);
		
		Assert.assertEquals(10040, purchase.getPurchaseProd().getProdNo());
		Assert.assertEquals("user04", purchase.getBuyer().getUserId());
		Assert.assertEquals("1  ", purchase.getPaymentOption());
		Assert.assertEquals("강명훈", purchase.getReceiverName());
		Assert.assertEquals("01054349231", purchase.getReceiverPhone());
		Assert.assertEquals("경기도시흥시신천동", purchase.getDivyAddr());
		Assert.assertEquals("현관문 앞에 놓아주세요", purchase.getDivyRequest());
		
	}
	
	//@Test
	public void testGetPurchase() throws Exception {
		
		Purchase purchase = new Purchase();

		purchase = purchaseService.getPurchase(10046);
		
		Assert.assertEquals(10046, purchase.getTranNo());
		Assert.assertEquals("user04", purchase.getBuyer().getUserId());
		Assert.assertEquals("1  ", purchase.getPaymentOption());
		Assert.assertEquals("강명훈", purchase.getReceiverName());
		Assert.assertEquals("01054349231", purchase.getReceiverPhone());
		Assert.assertEquals("경기도시흥시신천동", purchase.getDivyAddr());
		Assert.assertEquals("현관문 앞에 놓아주세요", purchase.getDivyRequest());
	}
	//@Test
	 public void testUpdatePurchase() throws Exception{
		 
		Purchase purchase = purchaseService.getPurchase(10047);
		Assert.assertNotNull(purchase);
		
		Assert.assertEquals(10047, purchase.getTranNo());

		purchase.setPaymentOption("2  ");
		purchase.setReceiverName("강성희");
		purchase.setReceiverPhone("01012341234");
		purchase.setDivyRequest("현관문 앞에 놓아주세요");
		purchase.setDivyDate("2018-11-05");
		
		purchaseService.updatePurchase(purchase); 
		
		purchase = purchaseService.getPurchase(10047);
		Assert.assertNotNull(purchase);
		
		//==> API 확인
		Assert.assertEquals(100467, purchase.getTranNo());
		Assert.assertEquals("강성희", purchase.getReceiverName());
		Assert.assertEquals("01012341234", purchase.getReceiverPhone());
		Assert.assertEquals("현관문 앞에 놓아주세요", purchase.getDivyRequest());
	 }	
	
	@Test
	 public void testUpdateTranCode() throws Exception{
		 
		Purchase purchase = purchaseService.getPurchase(10047);
		Product product = new Product();
		Assert.assertNotNull(purchase);
		
		product.setProdNo(10040);
		Assert.assertEquals(10040, product.getProdNo());
		
		purchase.setPurchaseProd(product);
		
		purchaseService.updateTranCode(purchase);
		System.out.println(purchase);
		Assert.assertNotNull(purchase);
		
		//==> API 확인
		Assert.assertEquals(10040,  purchase.getPurchaseProd().getProdNo());
	 }	
	
	//@Test
	public void testGetProductListAll() throws Exception{
		
		Search search = new Search();
		User user = new User();
		user.setUserId("user04");
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = purchaseService.getPurchaseList(search, user.getUserId());
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(9, list.size());
	 	
		//==> console 확인
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = purchaseService.getPurchaseList(search, user.getUserId());
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(9, list.size());
	 	
	 	//==> console 확인
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	}
}
