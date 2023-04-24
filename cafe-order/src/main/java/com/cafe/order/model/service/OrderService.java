package com.cafe.order.model.service;

import java.util.List;

import com.cafe.order.model.Kind;
import com.cafe.order.model.Menu;

public interface OrderService {

	List<Kind> getKinds() throws Exception;

	List<Menu> menuList() throws Exception;

}
