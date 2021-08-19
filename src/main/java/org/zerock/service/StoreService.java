package org.zerock.service;

import java.util.List;

import org.zerock.domain.CartVO;
import org.zerock.domain.Order_detailVO;


public interface StoreService {
	public void addCart(CartVO cart);
	
	public List<CartVO> listCart(String userid);
	
	public void cartdelete(Long cno);
//	public void deleteCart(CartVO cart);
	
	public void modifyCart(CartVO vo);

	public int sumMoney(String userid);

	/* 장바구니에 동일한 상품이 있는지 확인 */
	public int countCart(long pno, String userid);

	/* 장바구니에 동일한 상품이 있는지 확인되면 수정 */
	public void updateCart(CartVO vo);
	
	
	public void orderDetail(Order_detailVO vo);
	
	
}