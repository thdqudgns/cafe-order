package com.cafe.order.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cafe.order.model.Kind;
import com.cafe.order.model.Menu;
import com.cafe.order.model.dao.OrderDao;

@Service
public class OrderServiceImpl implements OrderService {
	
	private OrderDao orderDao;
	public OrderServiceImpl(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public List<Kind> getKinds() throws Exception {
		return orderDao.selectAllKind();
	}

	@Override
	public List<Menu> menuList() throws Exception {
		return orderDao.selectAllMenu();
	}
	

}
