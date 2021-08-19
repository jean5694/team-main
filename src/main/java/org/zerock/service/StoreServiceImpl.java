package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.CartVO;
import org.zerock.domain.Order_detailVO;
import org.zerock.mapper.StoreMapper;

import lombok.Setter;

@Service
public class StoreServiceImpl implements StoreService {

	@Setter (onMethod_ = @Autowired)
	private StoreMapper mapper;
	
	@Override
	public void addCart(CartVO cart) {
		mapper.addCart(cart);	
	}

	@Override
	public List<CartVO> listCart(String userid) {
		return mapper.listCart(userid);
	}

	@Override
	public void cartdelete(Long cno) {
		mapper.cartdelete(cno);
	}

//	@Override
//	public void deleteCart(CartVO cart) {
//		mapper.deleteCart(cart);
//		
//	}
	
	@Override
	public void modifyCart(CartVO vo) {
		// TODO Auto-generated method stub
		mapper.modifyCart(vo);
	}

	@Override
	public int sumMoney(String userid) {
		// TODO Auto-generated method stub
		return mapper.sumMoney(userid);
	}

	/* 장바구니에 동일한 상품이 있는지 확인 */
	@Override
	public int countCart(long pno, String userid) {
		// TODO Auto-generated method stub
		return mapper.countCart(pno, userid);
	}

	/* 장바구니에 동일한 상품이 있는지 확인되면 수정 */
	@Override
	public void updateCart(CartVO vo) {
		mapper.updateCart(vo);

	}


	@Override
	public void orderDetail(Order_detailVO vo) {
		mapper.orderDetail(vo);
		
	}


		
	}
